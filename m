Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E17B9F44F3
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 08:19:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A332710E867;
	Tue, 17 Dec 2024 07:19:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q49rcR8q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 271EA10E862;
 Tue, 17 Dec 2024 07:19:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C4F845C6233;
 Tue, 17 Dec 2024 07:18:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6B6EC4CEE1;
 Tue, 17 Dec 2024 07:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734419938;
 bh=L5T8LbxEketIWtOM1IHY40+VcEiXBuxm2FKTjehvk1s=;
 h=From:To:Cc:Subject:Date:From;
 b=Q49rcR8qzY2+ZW2Dn7t0P3mPZD3oxT4iY2ItJtbsdP3NspkKVmlDT3JcmLxlVoP8g
 u/9lGxq62lxqQ/i33bvjt/FJ3eaYLK0POsz2JbI6tBqITDYcGfY8/olzofCF+A64s9
 /be9FmrpqHF23paiRiabq9iSqOK5kbm3bk0zXNdhcI7nbzeK9JcsYwhNfZFf3Y+Mia
 fwgT1cTgHmY+C+HrHInTDetmqdWtRkpXzBiw/X7/E0RrrpK/Yka4GOsh9E4vlB99M4
 OOQdH6tPwcs/UaNo5psz7futweq8Z/90h31X8cobwULrZwXEvo6ce5vm88MxqKeS6V
 EC0dXFPRTpDTA==
From: Arnd Bergmann <arnd@kernel.org>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 "David E. Box" <david.e.box@linux.intel.com>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "Michael J. Ruhl" <michael.j.ruhl@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Jani Nikula <jani.nikula@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Hans de Goede <hdegoede@redhat.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/xe/vsec: enforce CONFIG_INTEL_VSEC dependency
Date: Tue, 17 Dec 2024 08:18:44 +0100
Message-Id: <20241217071852.2261858-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
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

From: Arnd Bergmann <arnd@arndb.de>

When INTEL_VSEC is in a loadable module, XE cannot be built-in any more:

x86_64-linux-ld: vmlinux.o: in function `xe_vsec_init':
(.text+0x19861bf): undefined reference to `intel_vsec_register'

This could be enforced using a 'depends on INTEL_VSEC || !INTEL_VSEC'
style dependency to allow building with VSEC completely disabled.
My impression here is that this was not actually intended, and that
continuing to support that combination would lead to more build bugs.

Instead, make it a hard dependency as all other INTEL_VSEC users are,
and remove the inline stub alternative. This leads to a dependency
on CONFIG_X86_PLATFORM_DEVICES, so the 'select' has to be removed
to avoid a circular dependency.

Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/xe/Kconfig | 2 +-
 include/linux/intel_vsec.h | 7 -------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 6c5b665d9384..217b51468497 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -2,6 +2,7 @@
 config DRM_XE
 	tristate "Intel Xe Graphics"
 	depends on DRM && PCI && MMU && (m || (y && KUNIT=y))
+	depends on INTEL_VSEC
 	select INTERVAL_TREE
 	# we need shmfs for the swappable backing store, and in particular
 	# the shmem_readpage() which depends upon tmpfs
@@ -28,7 +29,6 @@ config DRM_XE
 	select INPUT if ACPI
 	select ACPI_VIDEO if X86 && ACPI
 	select ACPI_BUTTON if ACPI
-	select X86_PLATFORM_DEVICES if X86 && ACPI
 	select ACPI_WMI if X86 && ACPI
 	select SYNC_FILE
 	select IOSF_MBI
diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
index b94beab64610..f2d55e686476 100644
--- a/include/linux/intel_vsec.h
+++ b/include/linux/intel_vsec.h
@@ -138,13 +138,6 @@ static inline struct intel_vsec_device *auxdev_to_ivdev(struct auxiliary_device
 	return container_of(auxdev, struct intel_vsec_device, auxdev);
 }
 
-#if IS_ENABLED(CONFIG_INTEL_VSEC)
 void intel_vsec_register(struct pci_dev *pdev,
 			 struct intel_vsec_platform_info *info);
-#else
-static inline void intel_vsec_register(struct pci_dev *pdev,
-				       struct intel_vsec_platform_info *info)
-{
-}
-#endif
 #endif
-- 
2.39.5

