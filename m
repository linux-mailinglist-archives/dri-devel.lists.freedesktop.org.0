Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E668877F50
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 12:48:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B330710EC94;
	Mon, 11 Mar 2024 11:48:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="ujoNZTPT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D809110EC94
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 11:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1710157707;
 bh=YiRFrSJMHVLkvzmYgvkSHVuFpIxMD5kaMGiBsOj/O8k=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ujoNZTPTx1qxrFjGGWyY36A52dqTpTwAuKdi0t5+ewPD9SMXbakFGQhTG/VAKwk6W
 esE9eFkqtiroPN+Rbf76x8o4doZb8Stjf6o0hQp7knguO4jRZlxfRLUospM8X+2mMC
 pbK3XDGKsEYVBSe4NI47cBxM6ip2ExZ7xYnPRJz90Y/GnuYdvVsP92rHvvNnSXewIC
 nbcj8Q6T2O67YhEsPUXc0S8adQIdPk2KUx5jvu9Wk8RJ5dhsozm+ZroMISQx2yCzYN
 EGCPudBm1LCrgs1/Ey+o0XtUG6hSG/Qi+sIQEgq0yKBthTjc3EinkxrLeCTNK7ssC1
 MPRTTMtrRhKMg==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5E2AD37809D1;
 Mon, 11 Mar 2024 11:48:27 +0000 (UTC)
Date: Mon, 11 Mar 2024 12:48:26 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Jani Nikula <jani.nikula@intel.com>
Cc: dri-devel@lists.freedesktop.org, Liviu Dudau <liviu.dudau@arm.com>,
 Steven Price <steven.price@arm.com>
Subject: Re: [PATCH] Revert "drm/panthor: Fix undefined
 panthor_device_suspend/resume symbol issue"
Message-ID: <20240311124826.44cc69ba@collabora.com>
In-Reply-To: <20240311111619.249776-1-jani.nikula@intel.com>
References: <20240311111619.249776-1-jani.nikula@intel.com>
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

On Mon, 11 Mar 2024 13:16:19 +0200
Jani Nikula <jani.nikula@intel.com> wrote:

> This reverts commit 674dc7f61aefea81901c21402946074927e63f1a.
> 
> The commit causes a recursive dependency in kconfig:
> 
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
> For a resolution refer to Documentation/kbuild/kconfig-language.rst
> subsection "Kconfig recursive dependency limitations"
> 
> Fixes: 674dc7f61aef ("drm/panthor: Fix undefined panthor_device_suspend/resume symbol issue")
> Cc: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Steven Price <steven.price@arm.com>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

Acked-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panthor/Kconfig          | 1 -
>  drivers/gpu/drm/panthor/panthor_device.c | 2 ++
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/Kconfig b/drivers/gpu/drm/panthor/Kconfig
> index fdce7c1b2310..55b40ad07f3b 100644
> --- a/drivers/gpu/drm/panthor/Kconfig
> +++ b/drivers/gpu/drm/panthor/Kconfig
> @@ -6,7 +6,6 @@ config DRM_PANTHOR
>  	depends on ARM || ARM64 || COMPILE_TEST
>  	depends on !GENERIC_ATOMIC64  # for IOMMU_IO_PGTABLE_LPAE
>  	depends on MMU
> -	depends on PM
>  	select DEVFREQ_GOV_SIMPLE_ONDEMAND
>  	select DRM_EXEC
>  	select DRM_GEM_SHMEM_HELPER
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 083888b48591..69deb8e17778 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -402,6 +402,7 @@ int panthor_device_mmap_io(struct panthor_device *ptdev, struct vm_area_struct *
>  	return 0;
>  }
>  
> +#ifdef CONFIG_PM
>  int panthor_device_resume(struct device *dev)
>  {
>  	struct panthor_device *ptdev = dev_get_drvdata(dev);
> @@ -546,3 +547,4 @@ int panthor_device_suspend(struct device *dev)
>  	mutex_unlock(&ptdev->pm.mmio_lock);
>  	return ret;
>  }
> +#endif

