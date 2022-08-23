Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8DB59CCB2
	for <lists+dri-devel@lfdr.de>; Tue, 23 Aug 2022 02:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FE0DA742B;
	Tue, 23 Aug 2022 00:01:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22326A73F4
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Aug 2022 00:01:19 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 27N01CNv080249;
 Mon, 22 Aug 2022 19:01:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1661212872;
 bh=6gL8GX1okldRhQ3vdUKlxXXVejTWjDezNq+uH1iQOhI=;
 h=From:To:CC:Subject:Date;
 b=aU0jfePkxeDtbFrgl9rrImPnBbVH2+5duKpj9GceIhLOxVoz17c7ERjEFgx65Oy/3
 a0OF1g044RrhtybnYwvhAg9F4wqDeIkiMsS266x4kt6eeN8Smb5O9JAH6mm1ntTV3V
 Z48lEtrVOxe+Oa2VQxnaVS9xQ+w7sPIOSohZzUDk=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 27N01CgS038656
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 22 Aug 2022 19:01:12 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 22
 Aug 2022 19:01:12 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 22 Aug 2022 19:01:12 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 27N01B8h089285;
 Mon, 22 Aug 2022 19:01:12 -0500
From: Andrew Davis <afd@ti.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm: Move radeon and amdgpu Kconfig options into their
 directories
Date: Mon, 22 Aug 2022 19:01:11 -0500
Message-ID: <20220823000111.9765-1-afd@ti.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: Andrew Davis <afd@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Most Kconfig options to enable a driver are in the Kconfig file
inside the relevant directory, move these two to the same.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 drivers/gpu/drm/Kconfig            | 42 ------------------------------
 drivers/gpu/drm/amd/amdgpu/Kconfig | 22 ++++++++++++++++
 drivers/gpu/drm/radeon/Kconfig     | 22 ++++++++++++++++
 3 files changed, 44 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 6c2256e8474b..24fa9ccd92a4 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -234,50 +234,8 @@ source "drivers/gpu/drm/i2c/Kconfig"
 
 source "drivers/gpu/drm/arm/Kconfig"
 
-config DRM_RADEON
-	tristate "ATI Radeon"
-	depends on DRM && PCI && MMU
-	depends on AGP || !AGP
-	select FW_LOADER
-	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HELPER
-        select DRM_KMS_HELPER
-        select DRM_TTM
-	select DRM_TTM_HELPER
-	select POWER_SUPPLY
-	select HWMON
-	select BACKLIGHT_CLASS_DEVICE
-	select INTERVAL_TREE
-	help
-	  Choose this option if you have an ATI Radeon graphics card.  There
-	  are both PCI and AGP versions.  You don't need to choose this to
-	  run the Radeon in plain VGA mode.
-
-	  If M is selected, the module will be called radeon.
-
 source "drivers/gpu/drm/radeon/Kconfig"
 
-config DRM_AMDGPU
-	tristate "AMD GPU"
-	depends on DRM && PCI && MMU
-	select FW_LOADER
-	select DRM_DISPLAY_DP_HELPER
-	select DRM_DISPLAY_HDMI_HELPER
-	select DRM_DISPLAY_HELPER
-	select DRM_KMS_HELPER
-	select DRM_SCHED
-	select DRM_TTM
-	select DRM_TTM_HELPER
-	select POWER_SUPPLY
-	select HWMON
-	select BACKLIGHT_CLASS_DEVICE
-	select INTERVAL_TREE
-	select DRM_BUDDY
-	help
-	  Choose this option if you have a recent AMD Radeon graphics card.
-
-	  If M is selected, the module will be called amdgpu.
-
 source "drivers/gpu/drm/amd/amdgpu/Kconfig"
 
 source "drivers/gpu/drm/nouveau/Kconfig"
diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
index 7777d55275de..36b1206124cf 100644
--- a/drivers/gpu/drm/amd/amdgpu/Kconfig
+++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
@@ -1,4 +1,26 @@
 # SPDX-License-Identifier: MIT
+
+config DRM_AMDGPU
+	tristate "AMD GPU"
+	depends on DRM && PCI && MMU
+	select FW_LOADER
+	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HDMI_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_KMS_HELPER
+	select DRM_SCHED
+	select DRM_TTM
+	select DRM_TTM_HELPER
+	select POWER_SUPPLY
+	select HWMON
+	select BACKLIGHT_CLASS_DEVICE
+	select INTERVAL_TREE
+	select DRM_BUDDY
+	help
+	  Choose this option if you have a recent AMD Radeon graphics card.
+
+	  If M is selected, the module will be called amdgpu.
+
 config DRM_AMDGPU_SI
 	bool "Enable amdgpu support for SI parts"
 	depends on DRM_AMDGPU
diff --git a/drivers/gpu/drm/radeon/Kconfig b/drivers/gpu/drm/radeon/Kconfig
index 52819e7f1fca..3248d12c562d 100644
--- a/drivers/gpu/drm/radeon/Kconfig
+++ b/drivers/gpu/drm/radeon/Kconfig
@@ -1,4 +1,26 @@
 # SPDX-License-Identifier: MIT
+
+config DRM_RADEON
+	tristate "ATI Radeon"
+	depends on DRM && PCI && MMU
+	depends on AGP || !AGP
+	select FW_LOADER
+	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HELPER
+        select DRM_KMS_HELPER
+        select DRM_TTM
+	select DRM_TTM_HELPER
+	select POWER_SUPPLY
+	select HWMON
+	select BACKLIGHT_CLASS_DEVICE
+	select INTERVAL_TREE
+	help
+	  Choose this option if you have an ATI Radeon graphics card.  There
+	  are both PCI and AGP versions.  You don't need to choose this to
+	  run the Radeon in plain VGA mode.
+
+	  If M is selected, the module will be called radeon.
+
 config DRM_RADEON_USERPTR
 	bool "Always enable userptr support"
 	depends on DRM_RADEON
-- 
2.36.1

