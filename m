Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D44C348E964
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 12:46:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C6010E382;
	Fri, 14 Jan 2022 11:45:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F56610E1C8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 11:45:45 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C555A1F3D4;
 Fri, 14 Jan 2022 11:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1642160743; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G+bCx3pSAKvmv9+2O5g9/CAC/JNrKeB5uw1u5+qp6LI=;
 b=v1Z9bDzRFXOAR43NVzv3WPjv8P+JPWQDiobKDeOnOT6EctOs+Y81Zu6pK6vH8mCbWfMw4v
 TQoWvbkdjJwuY7wNLVmaP8EuICR6Q+yP98SvJcBfIoECpKihu58tq8MNE7mRHuUnRjGf2h
 GZPcvUC6RdHPan1jjus4k3AhNF8KPqc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1642160743;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G+bCx3pSAKvmv9+2O5g9/CAC/JNrKeB5uw1u5+qp6LI=;
 b=VJlEmkQcaInJkahelGtsfgD5RjOJ4RN8DImRQ2HWRYqvNW0dcBglQRPS4m4kYstvpVYmgy
 flgs3UVb1cD47vDA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9BD4513ED7;
 Fri, 14 Jan 2022 11:45:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id KOEmJWdi4WH9VAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Fri, 14 Jan 2022 11:45:43 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mripard@kernel.org, maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch, jani.nikula@linux.intel.com
Subject: [PATCH v3 5/5] drm/dp: Move DisplayPort AUX bus helpers into dp/
Date: Fri, 14 Jan 2022 12:45:35 +0100
Message-Id: <20220114114535.29157-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220114114535.29157-1-tzimmermann@suse.de>
References: <20220114114535.29157-1-tzimmermann@suse.de>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move drm_dp_aux_bus.c and its header file into the DP subdirectory
and update all users. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/Makefile                         | 2 --
 drivers/gpu/drm/bridge/parade-ps8640.c           | 2 +-
 drivers/gpu/drm/bridge/ti-sn65dsi86.c            | 2 +-
 drivers/gpu/drm/dp/Makefile                      | 2 ++
 drivers/gpu/drm/{ => dp}/drm_dp_aux_bus.c        | 2 +-
 drivers/gpu/drm/panel/panel-edp.c                | 2 +-
 drivers/gpu/drm/panel/panel-samsung-atna33xc20.c | 2 +-
 include/drm/{ => dp}/drm_dp_aux_bus.h            | 0
 8 files changed, 7 insertions(+), 7 deletions(-)
 rename drivers/gpu/drm/{ => dp}/drm_dp_aux_bus.c (99%)
 rename include/drm/{ => dp}/drm_dp_aux_bus.h (100%)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 69be80ef1d31..700abeb4945e 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -31,8 +31,6 @@ drm-$(CONFIG_DEBUG_FS) += drm_debugfs.o drm_debugfs_crc.o
 drm-$(CONFIG_DRM_LOAD_EDID_FIRMWARE) += drm_edid_load.o
 drm-$(CONFIG_DRM_PRIVACY_SCREEN) += drm_privacy_screen.o drm_privacy_screen_x86.o
 
-obj-$(CONFIG_DRM_DP_AUX_BUS) += drm_dp_aux_bus.o
-
 obj-$(CONFIG_DRM_NOMODESET) += drm_nomodeset.o
 
 drm_cma_helper-y := drm_gem_cma_helper.o
diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index 3e0c7436f407..3f17337ee389 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -14,7 +14,7 @@
 #include <linux/regulator/consumer.h>
 
 #include <drm/drm_bridge.h>
-#include <drm/drm_dp_aux_bus.h>
+#include <drm/dp/drm_dp_aux_bus.h>
 #include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 65d25ce30ce5..ba136a188be7 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -26,7 +26,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
-#include <drm/drm_dp_aux_bus.h>
+#include <drm/dp/drm_dp_aux_bus.h>
 #include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
diff --git a/drivers/gpu/drm/dp/Makefile b/drivers/gpu/drm/dp/Makefile
index 5b892aeff5ab..75faffc706b1 100644
--- a/drivers/gpu/drm/dp/Makefile
+++ b/drivers/gpu/drm/dp/Makefile
@@ -1,5 +1,7 @@
 # SPDX-License-Identifier: MIT
 
+obj-$(CONFIG_DRM_DP_AUX_BUS) += drm_dp_aux_bus.o
+
 drm_dp_helper-y := drm_dp.o drm_dp_dual_mode_helper.o drm_dp_helper_mod.o drm_dp_mst_topology.o
 drm_dp_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
 drm_dp_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
diff --git a/drivers/gpu/drm/drm_dp_aux_bus.c b/drivers/gpu/drm/dp/drm_dp_aux_bus.c
similarity index 99%
rename from drivers/gpu/drm/drm_dp_aux_bus.c
rename to drivers/gpu/drm/dp/drm_dp_aux_bus.c
index 565edf6b1732..415afce3cf96 100644
--- a/drivers/gpu/drm/drm_dp_aux_bus.c
+++ b/drivers/gpu/drm/dp/drm_dp_aux_bus.c
@@ -19,7 +19,7 @@
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 
-#include <drm/drm_dp_aux_bus.h>
+#include <drm/dp/drm_dp_aux_bus.h>
 #include <drm/dp/drm_dp_helper.h>
 
 /**
diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 6a6ca891ee2e..99ca1bd0091c 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -36,7 +36,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
-#include <drm/drm_dp_aux_bus.h>
+#include <drm/dp/drm_dp_aux_bus.h>
 #include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_panel.h>
 
diff --git a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
index bffeadaaf9a2..20666b6217e7 100644
--- a/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
+++ b/drivers/gpu/drm/panel/panel-samsung-atna33xc20.c
@@ -14,7 +14,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 
-#include <drm/drm_dp_aux_bus.h>
+#include <drm/dp/drm_dp_aux_bus.h>
 #include <drm/dp/drm_dp_helper.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_panel.h>
diff --git a/include/drm/drm_dp_aux_bus.h b/include/drm/dp/drm_dp_aux_bus.h
similarity index 100%
rename from include/drm/drm_dp_aux_bus.h
rename to include/drm/dp/drm_dp_aux_bus.h
-- 
2.34.1

