Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FFAB49C5D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 23:50:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93AF910E5ED;
	Mon,  8 Sep 2025 21:50:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c1U2iAqi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17FCB10E0C0;
 Mon,  8 Sep 2025 21:50:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2605B60140;
 Mon,  8 Sep 2025 21:50:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F129C4CEF1;
 Mon,  8 Sep 2025 21:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757368232;
 bh=KefSjzm73w2HbGHRtz1VsVIvbTeN+FJ2LIqeCoIeTSc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=c1U2iAqiQ03ZBi7PkxMTtfTBrrIm9wa75r9F5SolN9ABm7e2yC6NE5h6dBxrON9i6
 B1O70eYbU45+B+WhRb1m+aIG16ZZ7mRPvqrMDfn4f3gZDnUALUgUQ5Q0g51V6YACoQ
 YSZOijLUVgEWBRH6ZijmctH07Zz03fuK8kh8lyrtZar8wBD7Tre6Jm7phkd88VMlsH
 PAUbo3ahvKTlQPBi7k9VONHmMvvQCK2K4E1eMalH79ioMxkARTAUuKNkQO2ndEK4mk
 gUg+lgFGH4xNDy5Jx6VQM2c+UsoxFK5NycrlIix2NP7vu+OwaPtxOIH/29ffj0Bj7I
 eVx5lNo/LKArQ==
Date: Mon, 8 Sep 2025 16:50:31 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
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
 Eric Naim <dnaim@cachyos.org>, Denis Benato <benato.denis96@gmail.com>
Subject: Re: [PATCH v6 09/11] PCI: Put PCIe bridges with downstream devices
 into D3 at hibernate
Message-ID: <20250908215031.GA1467002@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250818020101.3619237-10-superm1@kernel.org>
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

On Sun, Aug 17, 2025 at 09:00:59PM -0500, Mario Limonciello (AMD) wrote:
> For the suspend flow PCIe bridges that have downstream devices are put into
> the appropriate low power state (D3hot or D3cold depending upon specific
> devices). For the hibernate flow, PCIe bridges with downstream devices
> stay in D0 however. This can lead to PCIe bridges that are remained
> powered on needlessly during hibernate.

s/are remained/remain/ I guess?

> Adjust the pci_pm_poweroff_noirq() to follow the same flow as
> pci_pm_suspend_noirq() by using pci_pm_suspend_noirq_common().
> 
> This introduces a functional change that the hibernate flow will now
> call pci_save_state() and unless bus PM is skipped will also set
> the PCIe device into an unknown state.
