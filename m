Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C790B50991C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 09:31:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D55D10F5EA;
	Thu, 21 Apr 2022 07:31:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8164610F5E5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 07:31:13 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D87B1215FC;
 Thu, 21 Apr 2022 07:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1650526271; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iQTZVrlTC8e7Vcax4qsJdXjazW14YmQJEyyXMVw9keY=;
 b=1kXomGUPMXN+cRVG6TRrOfiNObOzMY0Yntvrp+9cdecRgcXeeQOnhlyJSF9vJXLvzUcnBB
 iD8JxxUtOwTAyYGmjKgbATeuBFtLdEWUMNsIjtlI9lxF34PT0kZtxbX5of+LDp6zoczEgK
 pS8QM64zGUapk5Z31aaiUHG/z6KnO/Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1650526271;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iQTZVrlTC8e7Vcax4qsJdXjazW14YmQJEyyXMVw9keY=;
 b=a4gPrK+c1aN/Y6SDjfVA7u3AeRuNY5AZe8xgiIATTYa6iG+UKt9TRAfdp7iLA4H+MRNH06
 iXr5RSotLOtmqQCA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9F1B413A84;
 Thu, 21 Apr 2022 07:31:11 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id eDv0JT8IYWIzDwAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 21 Apr 2022 07:31:11 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jani.nikula@linux.intel.com, lyude@redhat.com,
 javierm@redhat.com
Subject: [PATCH v3 6/8] drm/display: Move HDCP helpers into display-helper
 module
Date: Thu, 21 Apr 2022 09:31:06 +0200
Message-Id: <20220421073108.19226-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220421073108.19226-1-tzimmermann@suse.de>
References: <20220421073108.19226-1-tzimmermann@suse.de>
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

Move DRM's HDCP helper library into the display/ subdirectory and add
it to DRM's display helpers. Split the header file into core and helpers.
Update all affected drivers. No functional changes.

v3:
	* fix Kconfig dependencies
v2:
	* fix include statements (Jani, Javier)
	* update Kconfig symbols

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 Documentation/gpu/drm-kms-helpers.rst         |  2 +-
 drivers/gpu/drm/Makefile                      |  2 +-
 drivers/gpu/drm/amd/display/Kconfig           |  1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_hdcp.c    |  2 +-
 .../gpu/drm/amd/display/modules/hdcp/hdcp.h   |  2 +-
 drivers/gpu/drm/bridge/Kconfig                |  1 +
 drivers/gpu/drm/bridge/analogix/Kconfig       |  1 +
 drivers/gpu/drm/bridge/analogix/anx7625.c     |  2 +-
 drivers/gpu/drm/bridge/cadence/Kconfig        |  1 +
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   |  2 +-
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   |  2 +-
 drivers/gpu/drm/bridge/ite-it6505.c           |  2 +-
 drivers/gpu/drm/display/Kconfig               |  6 +++++
 drivers/gpu/drm/display/Makefile              |  1 +
 .../{drm_hdcp.c => display/drm_hdcp_helper.c} |  4 +---
 drivers/gpu/drm/i915/Kconfig                  |  1 +
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c  |  2 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     |  2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  2 +-
 drivers/misc/mei/hdcp/mei_hdcp.h              |  2 +-
 include/drm/{ => display}/drm_hdcp.h          | 14 ++----------
 include/drm/display/drm_hdcp_helper.h         | 22 +++++++++++++++++++
 include/drm/i915_mei_hdcp_interface.h         |  2 +-
 25 files changed, 52 insertions(+), 30 deletions(-)
 rename drivers/gpu/drm/{drm_hdcp.c => display/drm_hdcp_helper.c} (99%)
 rename include/drm/{ => display}/drm_hdcp.h (95%)
 create mode 100644 include/drm/display/drm_hdcp_helper.h

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index 7af55fb4072c..cfda5a092a48 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -226,7 +226,7 @@ Panel Self Refresh Helper Reference
 HDCP Helper Functions Reference
 ===============================
 
-.. kernel-doc:: drivers/gpu/drm/drm_hdcp.c
+.. kernel-doc:: drivers/gpu/drm/display/drm_hdcp_helper.c
    :export:
 
 Display Port Helper Functions Reference
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index b8353af70152..746a3a4953f3 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -58,7 +58,7 @@ obj-$(CONFIG_DRM_TTM_HELPER) += drm_ttm_helper.o
 #
 
 drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o \
-		drm_encoder_slave.o drm_flip_work.o drm_hdcp.o \
+		drm_encoder_slave.o drm_flip_work.o \
 		drm_probe_helper.o \
 		drm_plane_helper.o drm_atomic_helper.o \
 		drm_kms_helper_common.o \
diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index 127667e549c1..b4029c0d5d8c 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -20,6 +20,7 @@ config DRM_AMD_DC_DCN
 config DRM_AMD_DC_HDCP
 	bool "Enable HDCP support in DC"
 	depends on DRM_AMD_DC
+	select DRM_DISPLAY_HDCP_HELPER
 	help
 	  Choose this option if you want to support HDCP authentication.
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 2c69a6c2e6cb..b602ffbc1e58 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -48,7 +48,7 @@
 #include "amdgpu_dm.h"
 #ifdef CONFIG_DRM_AMD_DC_HDCP
 #include "amdgpu_dm_hdcp.h"
-#include <drm/drm_hdcp.h>
+#include <drm/display/drm_hdcp_helper.h>
 #endif
 #include "amdgpu_pm.h"
 #include "amdgpu_atombios.h"
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
index bf0d50277f8f..15c0e3f2a9c3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_hdcp.c
@@ -27,7 +27,7 @@
 #include "amdgpu.h"
 #include "amdgpu_dm.h"
 #include "dm_helpers.h"
-#include <drm/drm_hdcp.h>
+#include <drm/display/drm_hdcp_helper.h>
 #include "hdcp_psp.h"
 
 /*
diff --git a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h
index 6e88705e22f7..392c0c03365a 100644
--- a/drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h
+++ b/drivers/gpu/drm/amd/display/modules/hdcp/hdcp.h
@@ -30,7 +30,7 @@
 #include "hdcp_log.h"
 
 #include <drm/display/drm_dp_helper.h>
-#include <drm/drm_hdcp.h>
+#include <drm/display/drm_hdcp_helper.h>
 
 enum mod_hdcp_trans_input_result {
 	UNKNOWN = 0,
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index a9b83577e86c..1145bdd96dd4 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -79,6 +79,7 @@ config DRM_ITE_IT6505
         tristate "ITE IT6505 DisplayPort bridge"
         depends on OF
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HELPER
         select DRM_KMS_HELPER
         select EXTCON
diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
index 5570322dc528..173dada218ec 100644
--- a/drivers/gpu/drm/bridge/analogix/Kconfig
+++ b/drivers/gpu/drm/bridge/analogix/Kconfig
@@ -35,6 +35,7 @@ config DRM_ANALOGIX_ANX7625
 	depends on DRM
 	depends on OF
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HELPER
 	select DRM_DP_AUX_BUS
 	select DRM_MIPI_DSI
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 740135c7f6c5..cee9ba40c0d4 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -23,11 +23,11 @@
 
 #include <drm/display/drm_dp_aux_bus.h>
 #include <drm/display/drm_dp_helper.h>
+#include <drm/display/drm_hdcp_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_edid.h>
-#include <drm/drm_hdcp.h>
 #include <drm/drm_mipi_dsi.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
index 0f9e46c6de9b..1d06182bea71 100644
--- a/drivers/gpu/drm/bridge/cadence/Kconfig
+++ b/drivers/gpu/drm/bridge/cadence/Kconfig
@@ -2,6 +2,7 @@
 config DRM_CDNS_MHDP8546
 	tristate "Cadence DPI/DP bridge"
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL_BRIDGE
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index dec93a6d14c7..67f0f444b4e8 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -36,13 +36,13 @@
 #include <linux/wait.h>
 
 #include <drm/display/drm_dp_helper.h>
+#include <drm/display/drm_hdcp_helper.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_crtc_helper.h>
-#include <drm/drm_hdcp.h>
 #include <drm/drm_modeset_helper_vtables.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
index fccd6fbcc257..946212a95598 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
@@ -11,7 +11,7 @@
 
 #include <asm/unaligned.h>
 
-#include <drm/drm_hdcp.h>
+#include <drm/display/drm_hdcp_helper.h>
 
 #include "cdns-mhdp8546-hdcp.h"
 
diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 85cffc108278..8fed30df08b0 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -22,12 +22,12 @@
 #include <crypto/hash.h>
 
 #include <drm/display/drm_dp_helper.h>
+#include <drm/display/drm_hdcp_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_edid.h>
-#include <drm/drm_hdcp.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
index fcd9ffd39f26..4406af5cc8bb 100644
--- a/drivers/gpu/drm/display/Kconfig
+++ b/drivers/gpu/drm/display/Kconfig
@@ -17,6 +17,12 @@ config DRM_DISPLAY_DP_HELPER
 	help
 	  DRM display helpers for DisplayPort.
 
+config DRM_DISPLAY_HDCP_HELPER
+	bool
+	depends on DRM_DISPLAY_HELPER
+	help
+	  DRM display helpers for HDCP.
+
 config DRM_DP_AUX_CHARDEV
 	bool "DRM DP AUX Interface"
 	depends on DRM
diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
index 4f4e35034960..abeb5ad8c351 100644
--- a/drivers/gpu/drm/display/Makefile
+++ b/drivers/gpu/drm/display/Makefile
@@ -7,6 +7,7 @@ drm_display_helper-$(CONFIG_DRM_DISPLAY_DP_HELPER) += drm_dp_dual_mode_helper.o
 						      drm_dp_helper.o \
 						      drm_dp_mst_topology.o \
 						      drm_dsc_helper.o
+drm_display_helper-$(CONFIG_DRM_DISPLAY_HDCP_HELPER) += drm_hdcp_helper.o
 drm_display_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
 drm_display_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
 
diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/display/drm_hdcp_helper.c
similarity index 99%
rename from drivers/gpu/drm/drm_hdcp.c
rename to drivers/gpu/drm/display/drm_hdcp_helper.c
index ca9b8f697202..e78999c72bd7 100644
--- a/drivers/gpu/drm/drm_hdcp.c
+++ b/drivers/gpu/drm/display/drm_hdcp_helper.c
@@ -13,7 +13,7 @@
 #include <linux/slab.h>
 #include <linux/firmware.h>
 
-#include <drm/drm_hdcp.h>
+#include <drm/display/drm_hdcp_helper.h>
 #include <drm/drm_sysfs.h>
 #include <drm/drm_print.h>
 #include <drm/drm_device.h>
@@ -21,8 +21,6 @@
 #include <drm/drm_mode_object.h>
 #include <drm/drm_connector.h>
 
-#include "drm_internal.h"
-
 static inline void drm_hdcp_print_ksv(const u8 *ksv)
 {
 	DRM_DEBUG("\t%#02x, %#02x, %#02x, %#02x, %#02x\n",
diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 75777da5c915..af7aee58a467 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -11,6 +11,7 @@ config DRM_I915
 	select SHMEM
 	select TMPFS
 	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HDCP_HELPER
 	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL
diff --git a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
index 598cad09d499..a7640dbcf00e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_hdcp.c
@@ -8,7 +8,7 @@
 
 #include <drm/display/drm_dp_helper.h>
 #include <drm/display/drm_dp_mst_helper.h>
-#include <drm/drm_hdcp.h>
+#include <drm/display/drm_hdcp_helper.h>
 #include <drm/drm_print.h>
 
 #include "intel_ddi.h"
diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index 21281a7bdc17..a6ba7fb72339 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -31,7 +31,7 @@
 #include <linux/i2c-algo-bit.h>
 #include <linux/i2c.h>
 
-#include <drm/drm_hdcp.h>
+#include <drm/display/drm_hdcp_helper.h>
 
 #include "i915_drv.h"
 #include "intel_de.h"
diff --git a/drivers/gpu/drm/i915/display/intel_hdcp.c b/drivers/gpu/drm/i915/display/intel_hdcp.c
index 4de4c174a987..44ac0cee8b77 100644
--- a/drivers/gpu/drm/i915/display/intel_hdcp.c
+++ b/drivers/gpu/drm/i915/display/intel_hdcp.c
@@ -12,7 +12,7 @@
 #include <linux/i2c.h>
 #include <linux/random.h>
 
-#include <drm/drm_hdcp.h>
+#include <drm/display/drm_hdcp_helper.h>
 #include <drm/i915_component.h>
 
 #include "i915_drv.h"
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index a4a6f8bd2841..c713cebc63fe 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -32,10 +32,10 @@
 #include <linux/slab.h>
 #include <linux/string_helpers.h>
 
+#include <drm/display/drm_hdcp_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
-#include <drm/drm_hdcp.h>
 #include <drm/drm_scdc_helper.h>
 #include <drm/intel_lpe_audio.h>
 
diff --git a/drivers/misc/mei/hdcp/mei_hdcp.h b/drivers/misc/mei/hdcp/mei_hdcp.h
index 834757f5e072..ca09c8f83d6b 100644
--- a/drivers/misc/mei/hdcp/mei_hdcp.h
+++ b/drivers/misc/mei/hdcp/mei_hdcp.h
@@ -9,7 +9,7 @@
 #ifndef __MEI_HDCP_H__
 #define __MEI_HDCP_H__
 
-#include <drm/drm_hdcp.h>
+#include <drm/display/drm_hdcp.h>
 
 /* me_hdcp_status: Enumeration of all HDCP Status Codes */
 enum me_hdcp_status {
diff --git a/include/drm/drm_hdcp.h b/include/drm/display/drm_hdcp.h
similarity index 95%
rename from include/drm/drm_hdcp.h
rename to include/drm/display/drm_hdcp.h
index 0b1111e3228e..96a99b1377c0 100644
--- a/include/drm/drm_hdcp.h
+++ b/include/drm/display/drm_hdcp.h
@@ -6,8 +6,8 @@
  * Sean Paul <seanpaul@chromium.org>
  */
 
-#ifndef _DRM_HDCP_H_INCLUDED_
-#define _DRM_HDCP_H_INCLUDED_
+#ifndef _DRM_HDCP_H_
+#define _DRM_HDCP_H_
 
 #include <linux/types.h>
 
@@ -291,16 +291,6 @@ struct hdcp_srm_header {
 	u8 srm_gen_no;
 } __packed;
 
-struct drm_device;
-struct drm_connector;
-
-int drm_hdcp_check_ksvs_revoked(struct drm_device *dev,
-				u8 *ksvs, u32 ksv_count);
-int drm_connector_attach_content_protection_property(
-		struct drm_connector *connector, bool hdcp_content_type);
-void drm_hdcp_update_content_protection(struct drm_connector *connector,
-					u64 val);
-
 /* Content Type classification for HDCP2.2 vs others */
 #define DRM_MODE_HDCP_CONTENT_TYPE0		0
 #define DRM_MODE_HDCP_CONTENT_TYPE1		1
diff --git a/include/drm/display/drm_hdcp_helper.h b/include/drm/display/drm_hdcp_helper.h
new file mode 100644
index 000000000000..8aaf87bf2735
--- /dev/null
+++ b/include/drm/display/drm_hdcp_helper.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (C) 2017 Google, Inc.
+ *
+ * Authors:
+ * Sean Paul <seanpaul@chromium.org>
+ */
+
+#ifndef _DRM_HDCP_HELPER_H_INCLUDED_
+#define _DRM_HDCP_HELPER_H_INCLUDED_
+
+#include <drm/display/drm_hdcp.h>
+
+struct drm_device;
+struct drm_connector;
+
+int drm_hdcp_check_ksvs_revoked(struct drm_device *dev, u8 *ksvs, u32 ksv_count);
+int drm_connector_attach_content_protection_property(struct drm_connector *connector,
+						     bool hdcp_content_type);
+void drm_hdcp_update_content_protection(struct drm_connector *connector, u64 val);
+
+#endif
diff --git a/include/drm/i915_mei_hdcp_interface.h b/include/drm/i915_mei_hdcp_interface.h
index 702f613243bb..f441cbcd95a4 100644
--- a/include/drm/i915_mei_hdcp_interface.h
+++ b/include/drm/i915_mei_hdcp_interface.h
@@ -11,7 +11,7 @@
 
 #include <linux/mutex.h>
 #include <linux/device.h>
-#include <drm/drm_hdcp.h>
+#include <drm/display/drm_hdcp.h>
 
 /**
  * enum hdcp_port_type - HDCP port implementation type defined by ME FW
-- 
2.35.1

