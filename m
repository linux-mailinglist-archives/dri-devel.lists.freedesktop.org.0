Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D91B519F2
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 16:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C58610E2F3;
	Wed, 10 Sep 2025 14:46:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KW5pM2Fu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E33810E2F3;
 Wed, 10 Sep 2025 14:46:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B68BC601FA;
 Wed, 10 Sep 2025 14:46:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 316D6C4CEEB;
 Wed, 10 Sep 2025 14:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757515600;
 bh=84vkiPKqSEhuvDni8XCaT6y5jo/x6VM2Y2bOu716BLQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=KW5pM2FuSjJKYJW2gxcET8OcAb1Rldc9NmgcN9qu9VVRmQY8OImBUUUXcix8cQckW
 jSNVyqFL7amGmUf7wkuDldCw34x5vfC4fs3T9gVytGVRFENaEVt04KcarnAzlwVANz
 EZZVR3K9PvKcjR66/8+wda4Gbh22mxm1+1b02Io3rjhsYSpJ0yuZ6X2Mlh0Wlx9OKE
 UPYmMZFP2kT+2NusOrtQtR6VBmSZKiLAp0YARN/j0AEH/x1N4414csaGNJAQKkeTZS
 xVJ9pFYae9xPnC0wRLL3zV7z/6Tev21LW3sqB5+UN4uprUuhHM9oNAf6/Lx+6uGzIF
 Pjs15lLPM32qQ==
Date: Wed, 10 Sep 2025 09:46:38 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
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
 Eric Naim <dnaim@cachyos.org>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>
Subject: Re: [PATCH v7 06/12] PCI/PM: Split out code from
 pci_pm_suspend_noirq() into helper
Message-ID: <20250910144638.GA1535343@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909191619.2580169-7-superm1@kernel.org>
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

On Tue, Sep 09, 2025 at 02:16:13PM -0500, Mario Limonciello (AMD) wrote:
> In order to unify suspend and hibernate codepaths without code duplication
> the common code should be in common helpers.  Move it from
> pci_pm_suspend_noirq() into a helper.  No intended functional changes.
> 
> Tested-by: Eric Naim <dnaim@cachyos.org>
> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

If you have other reason to repost this, ...

> +	if (pci_dev->current_state == PCI_D0) {
> +		pci_dev->skip_bus_pm = true;

Add a blank line here.

> +		/*
> +		 * Per PCI PM r1.2, table 6-1, a bridge must be in D0 if any
> +		 * downstream device is in D0, so avoid changing the power state
> +		 * of the parent bridge by setting the skip_bus_pm flag for it.
> +		 */
> +		if (pci_dev->bus->self)
> +			pci_dev->bus->self->skip_bus_pm = true;
> +	}
