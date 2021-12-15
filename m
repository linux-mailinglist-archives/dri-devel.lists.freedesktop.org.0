Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B69D4756C3
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 11:43:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE76F10E4A2;
	Wed, 15 Dec 2021 10:43:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515F910E419;
 Wed, 15 Dec 2021 10:43:24 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DF2CC1F3CA;
 Wed, 15 Dec 2021 10:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639565002; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UHVQrF0DrvdbTi2ewbDCJH7wUtscgyPd+xqtty8zivk=;
 b=dLSs5c5AKW+9jgb4G/5TZ112euYpcykDgKqxc5Yih6Z6iYCqcdflfw0AMWsYzjcXjH59cx
 Co0beEqC6BZ5j0Tt1mrBxiIYxrbvsHnmTPpi77HpRQrk7ZZoLBx4NltyIsH65O1pDzHsxd
 H1DI/yT7NX9Dpx6pY+cU2x1+w8LvTYY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639565002;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UHVQrF0DrvdbTi2ewbDCJH7wUtscgyPd+xqtty8zivk=;
 b=jiz9RaYx8ziWvTfRPOb2vfyWR8BITnlobfx1MxAzU199xBoZom7IBZwFZ+6UDcpreIzwIZ
 B04jo3lDveqp6ZCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9922513FC5;
 Wed, 15 Dec 2021 10:43:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id cMWCJMrGuWH1eAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Wed, 15 Dec 2021 10:43:22 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: mripard@kernel.org, maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch, jani.nikula@linux.intel.com
Subject: [PATCH v2 5/5] drm/dp: Move DisplayPort AUX bus helpers into dp/
Date: Wed, 15 Dec 2021 11:43:17 +0100
Message-Id: <20211215104318.18866-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211215104318.18866-1-tzimmermann@suse.de>
References: <20211215104318.18866-1-tzimmermann@suse.de>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>, nouveau@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move drm_dp_aux_bus.c and its header file into the DP subdirectory
and update all users. No functional changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
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
index d6a1adbe57d4..89ac4891459a 100644
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
index 74fcaa0150fd..ceda36c69446 100644
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

