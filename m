Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F8D877F42
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 12:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477A51129B8;
	Mon, 11 Mar 2024 11:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="g3q/Az+W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F7201129B8
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 11:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710157596;
 bh=PUCbu9tK7CJZRuZi/vdRcbe1B2co6GVLYCh3CRNRrKw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=g3q/Az+WZBQwx+qVz7JU0Ny0esOyr/yD5wEFP8guJhYIkPr2fKU3rC6QCMPpsxcGv
 6qY5A0Q3SUoo4Oe8G1Tcij+Cn0JJNYfwDdaD+oVREKpl2mrLswa+npSp/tosnr5Mbh
 oEEXDX8fPGbj/TO09JE1HMDBP2DE/Mn39tAs23+LoJCKUDr+wlakovRhDp+5cEBOCB
 tUtX8t9BLWg6Cx4mRbQV+DFGP0763s79DF2PonexxIf1HCMK3t/WjsTM54lQrMJg0O
 aR9oR7VUOn2ok9RsRgQb6vncJK2Ggxq4DsIFp9rCIM7n7OpwueSvJkstEamjjhviNW
 7B0V5X4zFgKSQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1444E37809D1;
 Mon, 11 Mar 2024 11:46:36 +0000 (UTC)
Date: Mon, 11 Mar 2024 12:46:34 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com, kernel test robot
 <lkp@intel.com>
Subject: Re: [PATCH 3/3] drm/panthor: Fix undefined
 panthor_device_suspend/resume symbol issue
Message-ID: <20240311124634.2ee63052@collabora.com>
In-Reply-To: <87il1tt4f6.fsf@intel.com>
References: <20240304090812.3941084-1-boris.brezillon@collabora.com>
 <20240304090812.3941084-4-boris.brezillon@collabora.com>
 <87il1tt4f6.fsf@intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 11 Mar 2024 13:05:01 +0200
Jani Nikula <jani.nikula@linux.intel.com> wrote:

> This breaks the config for me:
> 
>   SYNC    include/config/auto.conf.cmd
>   GEN     Makefile
> drivers/iommu/Kconfig:14:error: recursive dependency detected!
> drivers/iommu/Kconfig:14:	symbol IOMMU_SUPPORT is selected by DRM_PANTHOR
> drivers/gpu/drm/panthor/Kconfig:3:	symbol DRM_PANTHOR depends on PM
> kernel/power/Kconfig:183:	symbol PM is selected by PM_SLEEP
> kernel/power/Kconfig:117:	symbol PM_SLEEP depends on HIBERNATE_CALLBACKS
> kernel/power/Kconfig:35:	symbol HIBERNATE_CALLBACKS is selected by XEN_SAVE_RESTORE
> arch/x86/xen/Kconfig:67:	symbol XEN_SAVE_RESTORE depends on XEN
> arch/x86/xen/Kconfig:6:	symbol XEN depends on PARAVIRT
> arch/x86/Kconfig:781:	symbol PARAVIRT is selected by HYPERV
> drivers/hv/Kconfig:5:	symbol HYPERV depends on X86_LOCAL_APIC
> arch/x86/Kconfig:1106:	symbol X86_LOCAL_APIC depends on X86_UP_APIC
> arch/x86/Kconfig:1081:	symbol X86_UP_APIC prompt is visible depending on PCI_MSI
> drivers/pci/Kconfig:39:	symbol PCI_MSI is selected by AMD_IOMMU
> drivers/iommu/amd/Kconfig:3:	symbol AMD_IOMMU depends on IOMMU_SUPPORT

Uh, I guess we want a "depends on IOMMU_SUPPORT" instead of "select
IOMMU_SUPPORT" in panthor then.

> For a resolution refer to Documentation/kbuild/kconfig-language.rst
> subsection "Kconfig recursive dependency limitations"
