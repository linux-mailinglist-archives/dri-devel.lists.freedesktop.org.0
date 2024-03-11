Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E96877EC0
	for <lists+dri-devel@lfdr.de>; Mon, 11 Mar 2024 12:16:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80DF41124FA;
	Mon, 11 Mar 2024 11:16:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LI/8aF3n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C006A1124FA
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Mar 2024 11:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1710155786; x=1741691786;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7NZ5JWWdm6I+9XKLu3/I1pT0tymOZn1vFsghTrt6Zyc=;
 b=LI/8aF3nZrzXuA+AhKsfCUsV4Hqposc7n6PPauOJvN0m2Gzu/xZZcTMa
 uSszX4lzORDUCJ4L3vY1FC2AMah9gB8U3bwclNBdWhAONV96BYQ8joapN
 ZPT3xFib3QhoawFlubWVHN/LRnMKXa/tnhFmow2J9P/fSaX2cD259GO+x
 yFKpJBYFS/jJWhRZTnrhMpdY4o1fczP+Rl0s1dQ/kH5122AejW4mLetFh
 zOr9rZ4OeIetKmjEgr94siFU+0yI9jg7HdJ3lnH1jr1ENX4xSH340qyqA
 CSA02OfxR1bn5F/Dm+EhqJ59yVAfuqK9fNn752uxzvxoXtsllmaOA4nQN g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11009"; a="4947681"
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; 
   d="scan'208";a="4947681"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 04:16:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,116,1708416000"; d="scan'208";a="48601794"
Received: from tbeaumon-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.34.24])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Mar 2024 04:16:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Steven Price <steven.price@arm.com>
Subject: [PATCH] Revert "drm/panthor: Fix undefined
 panthor_device_suspend/resume symbol issue"
Date: Mon, 11 Mar 2024 13:16:19 +0200
Message-Id: <20240311111619.249776-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
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

This reverts commit 674dc7f61aefea81901c21402946074927e63f1a.

The commit causes a recursive dependency in kconfig:

drivers/iommu/Kconfig:14:error: recursive dependency detected!
drivers/iommu/Kconfig:14:	symbol IOMMU_SUPPORT is selected by DRM_PANTHOR
drivers/gpu/drm/panthor/Kconfig:3:	symbol DRM_PANTHOR depends on PM
kernel/power/Kconfig:183:	symbol PM is selected by PM_SLEEP
kernel/power/Kconfig:117:	symbol PM_SLEEP depends on HIBERNATE_CALLBACKS
kernel/power/Kconfig:35:	symbol HIBERNATE_CALLBACKS is selected by XEN_SAVE_RESTORE
arch/x86/xen/Kconfig:67:	symbol XEN_SAVE_RESTORE depends on XEN
arch/x86/xen/Kconfig:6:	symbol XEN depends on PARAVIRT
arch/x86/Kconfig:781:	symbol PARAVIRT is selected by HYPERV
drivers/hv/Kconfig:5:	symbol HYPERV depends on X86_LOCAL_APIC
arch/x86/Kconfig:1106:	symbol X86_LOCAL_APIC depends on X86_UP_APIC
arch/x86/Kconfig:1081:	symbol X86_UP_APIC prompt is visible depending on PCI_MSI
drivers/pci/Kconfig:39:	symbol PCI_MSI is selected by AMD_IOMMU
drivers/iommu/amd/Kconfig:3:	symbol AMD_IOMMU depends on IOMMU_SUPPORT
For a resolution refer to Documentation/kbuild/kconfig-language.rst
subsection "Kconfig recursive dependency limitations"

Fixes: 674dc7f61aef ("drm/panthor: Fix undefined panthor_device_suspend/resume symbol issue")
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Steven Price <steven.price@arm.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/panthor/Kconfig          | 1 -
 drivers/gpu/drm/panthor/panthor_device.c | 2 ++
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/Kconfig b/drivers/gpu/drm/panthor/Kconfig
index fdce7c1b2310..55b40ad07f3b 100644
--- a/drivers/gpu/drm/panthor/Kconfig
+++ b/drivers/gpu/drm/panthor/Kconfig
@@ -6,7 +6,6 @@ config DRM_PANTHOR
 	depends on ARM || ARM64 || COMPILE_TEST
 	depends on !GENERIC_ATOMIC64  # for IOMMU_IO_PGTABLE_LPAE
 	depends on MMU
-	depends on PM
 	select DEVFREQ_GOV_SIMPLE_ONDEMAND
 	select DRM_EXEC
 	select DRM_GEM_SHMEM_HELPER
diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
index 083888b48591..69deb8e17778 100644
--- a/drivers/gpu/drm/panthor/panthor_device.c
+++ b/drivers/gpu/drm/panthor/panthor_device.c
@@ -402,6 +402,7 @@ int panthor_device_mmap_io(struct panthor_device *ptdev, struct vm_area_struct *
 	return 0;
 }
 
+#ifdef CONFIG_PM
 int panthor_device_resume(struct device *dev)
 {
 	struct panthor_device *ptdev = dev_get_drvdata(dev);
@@ -546,3 +547,4 @@ int panthor_device_suspend(struct device *dev)
 	mutex_unlock(&ptdev->pm.mmio_lock);
 	return ret;
 }
+#endif
-- 
2.39.2

