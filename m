Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25430B48825
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 11:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C20210E49F;
	Mon,  8 Sep 2025 09:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fcWN17ce";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63CA110E49F;
 Mon,  8 Sep 2025 09:19:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 20E7D60052;
 Mon,  8 Sep 2025 09:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 403A1C4CEF1;
 Mon,  8 Sep 2025 09:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1757323174;
 bh=djpAvoW8u0704b3oCV7FoPkRvtuc1IaqNChDWkioAgU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fcWN17ceIcjLaoFIMu7BW8j7N6aCbAyD0tzxQ2/zL9QllPAU+C2j0edPPXXeYF9wD
 j05L9/lmUombWtgzQys5J0K7QYXMbupcLWWyciQ3NwOznXntp/DvdmvEn8laqFKnB1
 eAzUFOIGG7fAuEN3pmIdQqI77eMV6TvrYvVKPa40=
Date: Mon, 8 Sep 2025 11:19:31 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 "open list:HIBERNATION (aka Software Suspend,
 aka swsusp)" <linux-pm@vger.kernel.org>, 
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:SCSI SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 "open list:TRACING" <linux-trace-kernel@vger.kernel.org>,
 AceLan Kao <acelan.kao@canonical.com>, Kai-Heng Feng <kaihengf@nvidia.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 Merthan =?utf-8?Q?Karaka=C5=9F?= <m3rthn.k@gmail.com>,
 Eric Naim <dnaim@cachyos.org>
Subject: Re: [PATCH v6 RESEND 00/11] Improvements to S5 power consumption
Message-ID: <2025090852-coma-tycoon-9f37@gregkh>
References: <20250906143642.2590808-1-superm1@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250906143642.2590808-1-superm1@kernel.org>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Sep 06, 2025 at 09:36:31AM -0500, Mario Limonciello (AMD) wrote:
> A variety of issues both in function and in power consumption have been
> raised as a result of devices not being put into a low power state when
> the system is powered off.
> 
> There have been some localized changes[1] to PCI core to help these issues,
> but they have had various downsides.
> 
> This series instead tries to use the S4 flow when the system is being
> powered off.  This lines up the behavior with what other operating systems
> do as well.  If for some reason that fails or is not supported, run their
> shutdown() callbacks.
> 
> Cc: AceLan Kao <acelan.kao@canonical.com>
> Cc: Kai-Heng Feng <kaihengf@nvidia.com>
> Cc: Mark Pearson <mpearson-lenovo@squebb.ca>
> Cc: Merthan Karakaş <m3rthn.k@gmail.com>
> Cc: Eric Naim <dnaim@cachyos.org>
> ---
> v6 RESEND:
>  * Resent because Greg said he was ignoring it and would like the whole
>    series to be able to review.

Messy, but wow, I'll trust you all that this actually works properly.
No objections from me, but I don't want my ack on this as I don't know
how to maintain it :)

thanks,

greg k-h
