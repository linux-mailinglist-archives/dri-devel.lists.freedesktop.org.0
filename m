Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB97BBAECF7
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 01:57:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A36010E144;
	Tue, 30 Sep 2025 23:57:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="djGOmCxz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AC4A10E144
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Sep 2025 23:57:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 22CCB45912;
 Tue, 30 Sep 2025 23:57:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7727EC4CEF0;
 Tue, 30 Sep 2025 23:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759276629;
 bh=OBKvZVqMt11LmTPFDfHF+9VmRuyfhuvsdZDN4FvWrQc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=djGOmCxzirz8fo5frCB3tJ/H1lE0+oOt4d4vKcleLbyVtEgYgAfZHmvjx3YBqPX++
 W1uiMUEkTmPDnNOPYvgwsalRTa11zy+I9CZPClvxnLnrbPqWqi/Gwf5ABGiY731IlC
 Q7q8fPHynKo/dNaM9gtjvTRCpxQ2MCK6iCjOkZq68O9sAitbuUZOwNGCL9WJIT2kJ8
 L6Tjk7L6UXYNIpNZKH4NaXDNONxpplFdJVCc5n5zIGdqh2UI0V9KDKubS3Dr8U4c/e
 WCLc5e8hVWAAZqw5rqTNu2mz5dJukUkoK4GX7WG4Khud9IHWx2s67uBFzuGGIDoqqe
 lQD8tIr/OLTag==
Date: Tue, 30 Sep 2025 23:57:07 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Mukesh Rathor <mrathor@linux.microsoft.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-hyperv@vger.kernel.org,
 netdev@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-arch@vger.kernel.org, virtualization@lists.linux.dev,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 jikos@kernel.org, bentiss@kernel.org, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 dmitry.torokhov@gmail.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, bhelgaas@google.com,
 James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
 gregkh@linuxfoundation.org, deller@gmx.de, arnd@arndb.de,
 sgarzare@redhat.com, horms@kernel.org
Subject: Re: [PATCH v1 0/2] Fix CONFIG_HYPERV and vmbus related anamoly
Message-ID: <aNxuU6VI3dQVPYF7@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
References: <20250906010952.2145389-1-mrathor@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250906010952.2145389-1-mrathor@linux.microsoft.com>
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

On Fri, Sep 05, 2025 at 06:09:50PM -0700, Mukesh Rathor wrote:
> At present, drivers/Makefile will subst =m to =y for CONFIG_HYPERV
> for hv subdir. Also, drivers/hv/Makefile replaces =m to =y to build in
> hv_common.c that is needed for the drivers. Moreover, vmbus driver is
> built if CONFIG_HYPER is set, either loadable or builtin.
> 
> This is not a good approach. CONFIG_HYPERV is really an umbrella
> config that encompasses builtin code and various other things and not
> a dedicated config option for VMBus. VMBus should really have a config
> option just like CONFIG_HYPERV_BALLOON etc. This small series introduces
> CONFIG_HYPERV_VMBUS to build VMBus driver and make that distinction
> explicit. With that CONFIG_HYPERV could be changed to bool.
> 
> For now, hv_common.c is left as is to reduce conflicts for upcoming
> patches, but once merges are mostly done, that and some others should
> be moved to virt/hyperv directory.
> 
> V1:
>  o Change subject from hyper-v to "Drivers: hv:"
>  o Rewrite commit messages paying attention to VMBus and not vmbus
>  o Change some wordings in Kconfig
>  o Make new VMBUS config option default to HYPERV option for a smoother
>    transition
> 
> Mukesh Rathor (2):
>   Driver: hv: Add CONFIG_HYPERV_VMBUS option
>   Drivers: hv: Make CONFIG_HYPERV bool
> 

Applied. Thanks.
