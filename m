Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5D54E46A3
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 20:28:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8E410E012;
	Tue, 22 Mar 2022 19:27:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4442210E262
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 19:27:49 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id D749B1F38F;
 Tue, 22 Mar 2022 19:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647977267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ZcxhBA7fBkt/YkEvCwvcC6XST1/J+DCgRS5T0WruQU=;
 b=DBISKc3l+y6kGygptTLxXAxvEyRROtv+bT2UBB5udnUgmkcwBb/9uMHt4zSUvnqLyrRKwf
 kTiz+WTb2eflhTCHrlMI4sNDfN7twqsEj4GHLmYgc90Xha3CwLP7err7g9Fk2L5AWGjQKB
 ZagKbZECC8ImNA7EXZm65sYrkqndfn0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647977267;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9ZcxhBA7fBkt/YkEvCwvcC6XST1/J+DCgRS5T0WruQU=;
 b=ED5UXDTj3+6fXyK5taRImU5t4fSB1ebcWQbiQ7G8GtDZ67v0Fvsi8s9AXOQ9wR805LBbnY
 KYRNb6XzUr1+ydAg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9588713479;
 Tue, 22 Mar 2022 19:27:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id GJ91IzMjOmIZMAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 22 Mar 2022 19:27:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jani.nikula@linux.intel.com, lyude@redhat.com
Subject: [PATCH 7/8] drm/display: Move HDMI helpers into display-helper module
Date: Tue, 22 Mar 2022 20:27:42 +0100
Message-Id: <20220322192743.14414-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220322192743.14414-1-tzimmermann@suse.de>
References: <20220322192743.14414-1-tzimmermann@suse.de>
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

Move DRM's HMDI helpers into the display/ subdirectoy and add it
to DRM's display helpers. Update all affected drivers. No functional
changes.

The HDMI helpers were implemented in the EDID and connector code, but
are actually unrelated. With the move to the display-helper library, we
can remove the dependency on drm_edid.{c,h} in many driver's HDMI source
files.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/Kconfig                       |   9 +
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |   1 +
 drivers/gpu/drm/amd/amdgpu/dce_v11_0.c        |   1 +
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |   1 +
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |   1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   1 +
 drivers/gpu/drm/bridge/Kconfig                |   4 +
 drivers/gpu/drm/bridge/analogix/Kconfig       |   1 +
 .../drm/bridge/analogix/analogix-anx78xx.c    |   2 +-
 drivers/gpu/drm/bridge/sii902x.c              |   2 +-
 drivers/gpu/drm/bridge/sil-sii8620.c          |   2 +-
 drivers/gpu/drm/bridge/synopsys/Kconfig       |   1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     |   2 +-
 drivers/gpu/drm/display/Makefile              |   1 +
 drivers/gpu/drm/display/drm_hdmi_helper.c     | 463 ++++++++++++++++++
 drivers/gpu/drm/drm_connector.c               |  34 --
 drivers/gpu/drm/drm_edid.c                    | 438 +----------------
 drivers/gpu/drm/exynos/Kconfig                |   1 +
 drivers/gpu/drm/exynos/exynos_hdmi.c          |   2 +-
 drivers/gpu/drm/hdmi/Makefile                 |   4 +
 drivers/gpu/drm/i2c/Kconfig                   |   1 +
 drivers/gpu/drm/i2c/tda998x_drv.c             |   2 +-
 drivers/gpu/drm/i915/Kconfig                  |   1 +
 drivers/gpu/drm/i915/display/intel_dp.c       |   2 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |   1 +
 drivers/gpu/drm/i915/display/intel_lspcon.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_sdvo.c     |   1 +
 drivers/gpu/drm/mediatek/Kconfig              |   1 +
 drivers/gpu/drm/mediatek/mtk_hdmi.c           |   2 +-
 drivers/gpu/drm/msm/Kconfig                   |   1 +
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c        |   2 +
 drivers/gpu/drm/nouveau/Kconfig               |   1 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |   1 +
 drivers/gpu/drm/omapdrm/Kconfig               |   2 +
 drivers/gpu/drm/omapdrm/dss/hdmi4.c           |   1 +
 drivers/gpu/drm/radeon/radeon_audio.c         |   1 +
 drivers/gpu/drm/rockchip/Kconfig              |   2 +
 drivers/gpu/drm/rockchip/inno_hdmi.c          |   2 +-
 drivers/gpu/drm/rockchip/rk3066_hdmi.c        |   1 +
 drivers/gpu/drm/sti/Kconfig                   |   1 +
 drivers/gpu/drm/sti/sti_hdmi.c                |   2 +-
 drivers/gpu/drm/sun4i/Kconfig                 |   1 +
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c        |   2 +-
 drivers/gpu/drm/tegra/Kconfig                 |   1 +
 drivers/gpu/drm/tegra/hdmi.c                  |   1 +
 drivers/gpu/drm/tegra/sor.c                   |   1 +
 drivers/gpu/drm/vc4/Kconfig                   |   1 +
 drivers/gpu/drm/vc4/vc4_hdmi.c                |   2 +-
 include/drm/display/drm_hdmi_helper.h         |  36 ++
 include/drm/drm_connector.h                   |   2 -
 include/drm/drm_edid.h                        |  31 +-
 51 files changed, 572 insertions(+), 507 deletions(-)
 create mode 100644 drivers/gpu/drm/display/drm_hdmi_helper.c
 create mode 100644 drivers/gpu/drm/hdmi/Makefile
 create mode 100644 include/drm/display/drm_hdmi_helper.h

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 5cc5fc0d386d..c306a09aed81 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -102,6 +102,13 @@ config DRM_HDCP_HELPER
 	help
 	  DRM helpers for HDCP.
 
+config DRM_HDMI_HELPER
+	tristate
+	depends on DRM
+	select DRM_DISPLAY_HELPER
+	help
+	  DRM helpers for HDMI.
+
 config DRM_KMS_HELPER
 	tristate
 	depends on DRM
@@ -265,6 +272,7 @@ config DRM_RADEON
 	depends on AGP || !AGP
 	select FW_LOADER
 	select DRM_DP_HELPER
+	select DRM_HDMI_HELPER
         select DRM_KMS_HELPER
         select DRM_TTM
 	select DRM_TTM_HELPER
@@ -285,6 +293,7 @@ config DRM_AMDGPU
 	tristate "AMD GPU"
 	depends on DRM && PCI && MMU
 	select FW_LOADER
+	select DRM_HDMI_HELPER
 	select DRM_DP_HELPER
 	select DRM_KMS_HELPER
 	select DRM_SCHED
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
index 288fce7dc0ed..a7fe477a0aef 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v10_0.c
@@ -21,6 +21,7 @@
  *
  */
 
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
index cbe5250b31cb..67c284bbbb64 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v11_0.c
@@ -21,6 +21,7 @@
  *
  */
 
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
index 982855e6cf52..9b314d509676 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v6_0.c
@@ -23,6 +23,7 @@
 
 #include <linux/pci.h>
 
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
index 84440741c60b..198c59ad0d50 100644
--- a/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
+++ b/drivers/gpu/drm/amd/amdgpu/dce_v8_0.c
@@ -21,6 +21,7 @@
  *
  */
 
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index ca42b7274372..386a6a9af79f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -74,6 +74,7 @@
 #include <linux/component.h>
 
 #include <drm/display/drm_dp_mst_helper.h>
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_atomic_helper.h>
diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index 83768517d3b5..37a07f4fce87 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -103,6 +103,7 @@ config DRM_LONTIUM_LT9611
 	tristate "Lontium LT9611 DSI/HDMI bridge"
 	select SND_SOC_HDMI_CODEC if SND_SOC
 	depends on OF
+	select DRM_HDMI_HELPER
 	select DRM_PANEL_BRIDGE
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
@@ -130,6 +131,7 @@ config DRM_LONTIUM_LT9611UXC
 config DRM_ITE_IT66121
 	tristate "ITE IT66121 HDMI bridge"
 	depends on OF
+	select DRM_HDMI_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	help
@@ -204,6 +206,7 @@ config DRM_PARADE_PS8640
 config DRM_SIL_SII8620
 	tristate "Silicon Image SII8620 HDMI/MHL bridge"
 	depends on OF
+	select DRM_HDMI_HELPER
 	select DRM_KMS_HELPER
 	select EXTCON
 	depends on RC_CORE || !RC_CORE
@@ -213,6 +216,7 @@ config DRM_SIL_SII8620
 config DRM_SII902X
 	tristate "Silicon Image sii902x RGB/HDMI bridge"
 	depends on OF
+	select DRM_HDMI_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
 	select I2C_MUX
diff --git a/drivers/gpu/drm/bridge/analogix/Kconfig b/drivers/gpu/drm/bridge/analogix/Kconfig
index 47f6cd9109dc..c0b68cf82f32 100644
--- a/drivers/gpu/drm/bridge/analogix/Kconfig
+++ b/drivers/gpu/drm/bridge/analogix/Kconfig
@@ -15,6 +15,7 @@ config DRM_ANALOGIX_ANX6345
 config DRM_ANALOGIX_ANX78XX
 	tristate "Analogix ANX78XX bridge"
 	select DRM_ANALOGIX_DP
+	select DRM_HDMI_HELPER
 	select DRM_DP_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_I2C
diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
index d2fc8676fab6..391263572b78 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
@@ -19,10 +19,10 @@
 #include <linux/types.h>
 
 #include <drm/display/drm_dp_helper.h>
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_edid.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
index 65549fbfdc87..9e40bf704f68 100644
--- a/drivers/gpu/drm/bridge/sii902x.c
+++ b/drivers/gpu/drm/bridge/sii902x.c
@@ -20,10 +20,10 @@
 #include <linux/regulator/consumer.h>
 #include <linux/clk.h>
 
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_edid.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
index ec7745c31da0..2c1ed9909e4f 100644
--- a/drivers/gpu/drm/bridge/sil-sii8620.c
+++ b/drivers/gpu/drm/bridge/sil-sii8620.c
@@ -9,9 +9,9 @@
 #include <asm/unaligned.h>
 
 #include <drm/bridge/mhl.h>
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
 
 #include <linux/clk.h>
diff --git a/drivers/gpu/drm/bridge/synopsys/Kconfig b/drivers/gpu/drm/bridge/synopsys/Kconfig
index 21a1be3ced0f..774179026744 100644
--- a/drivers/gpu/drm/bridge/synopsys/Kconfig
+++ b/drivers/gpu/drm/bridge/synopsys/Kconfig
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config DRM_DW_HDMI
 	tristate
+	select DRM_HDMI_HELPER
 	select DRM_KMS_HELPER
 	select REGMAP_MMIO
 	select CEC_CORE if CEC_NOTIFIER
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index a563460f8d20..a06a2d51e77f 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -25,10 +25,10 @@
 #include <uapi/linux/videodev2.h>
 
 #include <drm/bridge/dw_hdmi.h>
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
-#include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
index e1f65f82cf8b..dfe21583afa0 100644
--- a/drivers/gpu/drm/display/Makefile
+++ b/drivers/gpu/drm/display/Makefile
@@ -8,5 +8,6 @@ drm_display_helper-$(CONFIG_DRM_DP_HELPER) := drm_dp_helper.o drm_dp_dual_mode_h
 drm_display_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
 drm_display_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
 drm_display_helper-$(CONFIG_DRM_HDCP_HELPER) += drm_hdcp_helper.o
+drm_display_helper-$(CONFIG_DRM_HDMI_HELPER) += drm_hdmi_helper.o
 
 obj-$(CONFIG_DRM_DISPLAY_HELPER) += drm_display_helper.o
diff --git a/drivers/gpu/drm/display/drm_hdmi_helper.c b/drivers/gpu/drm/display/drm_hdmi_helper.c
new file mode 100644
index 000000000000..8f33ea9f8597
--- /dev/null
+++ b/drivers/gpu/drm/display/drm_hdmi_helper.c
@@ -0,0 +1,463 @@
+// SPDX-License-Identifier: MIT
+
+#include <linux/module.h>
+
+#include <drm/display/drm_hdmi_helper.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_print.h>
+#include <drm/drm_property.h>
+
+static bool is_hdmi2_sink(const struct drm_connector *connector)
+{
+	/*
+	 * FIXME: sil-sii8620 doesn't have a connector around when
+	 * we need one, so we have to be prepared for a NULL connector.
+	 */
+	if (!connector)
+		return true;
+
+	return connector->display_info.hdmi.scdc.supported ||
+		connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR420;
+}
+
+static inline bool is_eotf_supported(u8 output_eotf, u8 sink_eotf)
+{
+	return sink_eotf & BIT(output_eotf);
+}
+
+/**
+ * drm_hdmi_infoframe_set_hdr_metadata() - fill an HDMI DRM infoframe with
+ *                                         HDR metadata from userspace
+ * @frame: HDMI DRM infoframe
+ * @conn_state: Connector state containing HDR metadata
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int drm_hdmi_infoframe_set_hdr_metadata(struct hdmi_drm_infoframe *frame,
+					const struct drm_connector_state *conn_state)
+{
+	struct drm_connector *connector;
+	struct hdr_output_metadata *hdr_metadata;
+	int err;
+
+	if (!frame || !conn_state)
+		return -EINVAL;
+
+	connector = conn_state->connector;
+
+	if (!conn_state->hdr_output_metadata)
+		return -EINVAL;
+
+	hdr_metadata = conn_state->hdr_output_metadata->data;
+
+	if (!hdr_metadata || !connector)
+		return -EINVAL;
+
+	/* Sink EOTF is Bit map while infoframe is absolute values */
+	if (!is_eotf_supported(hdr_metadata->hdmi_metadata_type1.eotf,
+	    connector->hdr_sink_metadata.hdmi_type1.eotf)) {
+		DRM_DEBUG_KMS("EOTF Not Supported\n");
+		return -EINVAL;
+	}
+
+	err = hdmi_drm_infoframe_init(frame);
+	if (err < 0)
+		return err;
+
+	frame->eotf = hdr_metadata->hdmi_metadata_type1.eotf;
+	frame->metadata_type = hdr_metadata->hdmi_metadata_type1.metadata_type;
+
+	BUILD_BUG_ON(sizeof(frame->display_primaries) !=
+		     sizeof(hdr_metadata->hdmi_metadata_type1.display_primaries));
+	BUILD_BUG_ON(sizeof(frame->white_point) !=
+		     sizeof(hdr_metadata->hdmi_metadata_type1.white_point));
+
+	memcpy(&frame->display_primaries,
+	       &hdr_metadata->hdmi_metadata_type1.display_primaries,
+	       sizeof(frame->display_primaries));
+
+	memcpy(&frame->white_point,
+	       &hdr_metadata->hdmi_metadata_type1.white_point,
+	       sizeof(frame->white_point));
+
+	frame->max_display_mastering_luminance =
+		hdr_metadata->hdmi_metadata_type1.max_display_mastering_luminance;
+	frame->min_display_mastering_luminance =
+		hdr_metadata->hdmi_metadata_type1.min_display_mastering_luminance;
+	frame->max_fall = hdr_metadata->hdmi_metadata_type1.max_fall;
+	frame->max_cll = hdr_metadata->hdmi_metadata_type1.max_cll;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_hdmi_infoframe_set_hdr_metadata);
+
+static u8 drm_mode_hdmi_vic(const struct drm_connector *connector,
+			    const struct drm_display_mode *mode)
+{
+	bool has_hdmi_infoframe = connector ?
+		connector->display_info.has_hdmi_infoframe : false;
+
+	if (!has_hdmi_infoframe)
+		return 0;
+
+	/* No HDMI VIC when signalling 3D video format */
+	if (mode->flags & DRM_MODE_FLAG_3D_MASK)
+		return 0;
+
+	return drm_match_hdmi_mode(mode);
+}
+
+static u8 drm_mode_cea_vic(const struct drm_connector *connector,
+			   const struct drm_display_mode *mode)
+{
+	u8 vic;
+
+	/*
+	 * HDMI spec says if a mode is found in HDMI 1.4b 4K modes
+	 * we should send its VIC in vendor infoframes, else send the
+	 * VIC in AVI infoframes. Lets check if this mode is present in
+	 * HDMI 1.4b 4K modes
+	 */
+	if (drm_mode_hdmi_vic(connector, mode))
+		return 0;
+
+	vic = drm_match_cea_mode(mode);
+
+	/*
+	 * HDMI 1.4 VIC range: 1 <= VIC <= 64 (CEA-861-D) but
+	 * HDMI 2.0 VIC range: 1 <= VIC <= 107 (CEA-861-F). So we
+	 * have to make sure we dont break HDMI 1.4 sinks.
+	 */
+	if (!is_hdmi2_sink(connector) && vic > 64)
+		return 0;
+
+	return vic;
+}
+
+/**
+ * drm_hdmi_avi_infoframe_from_display_mode() - fill an HDMI AVI infoframe with
+ *                                              data from a DRM display mode
+ * @frame: HDMI AVI infoframe
+ * @connector: the connector
+ * @mode: DRM display mode
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infoframe *frame,
+					     const struct drm_connector *connector,
+					     const struct drm_display_mode *mode)
+{
+	enum hdmi_picture_aspect picture_aspect;
+	u8 vic, hdmi_vic;
+
+	if (!frame || !mode)
+		return -EINVAL;
+
+	hdmi_avi_infoframe_init(frame);
+
+	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
+		frame->pixel_repeat = 1;
+
+	vic = drm_mode_cea_vic(connector, mode);
+	hdmi_vic = drm_mode_hdmi_vic(connector, mode);
+
+	frame->picture_aspect = HDMI_PICTURE_ASPECT_NONE;
+
+	/*
+	 * As some drivers don't support atomic, we can't use connector state.
+	 * So just initialize the frame with default values, just the same way
+	 * as it's done with other properties here.
+	 */
+	frame->content_type = HDMI_CONTENT_TYPE_GRAPHICS;
+	frame->itc = 0;
+
+	/*
+	 * Populate picture aspect ratio from either
+	 * user input (if specified) or from the CEA/HDMI mode lists.
+	 */
+	picture_aspect = mode->picture_aspect_ratio;
+	if (picture_aspect == HDMI_PICTURE_ASPECT_NONE) {
+		if (vic)
+			picture_aspect = drm_get_cea_aspect_ratio(vic);
+		else if (hdmi_vic)
+			picture_aspect = drm_get_hdmi_aspect_ratio(hdmi_vic);
+	}
+
+	/*
+	 * The infoframe can't convey anything but none, 4:3
+	 * and 16:9, so if the user has asked for anything else
+	 * we can only satisfy it by specifying the right VIC.
+	 */
+	if (picture_aspect > HDMI_PICTURE_ASPECT_16_9) {
+		if (vic) {
+			if (picture_aspect != drm_get_cea_aspect_ratio(vic))
+				return -EINVAL;
+		} else if (hdmi_vic) {
+			if (picture_aspect != drm_get_hdmi_aspect_ratio(hdmi_vic))
+				return -EINVAL;
+		} else {
+			return -EINVAL;
+		}
+
+		picture_aspect = HDMI_PICTURE_ASPECT_NONE;
+	}
+
+	frame->video_code = vic;
+	frame->picture_aspect = picture_aspect;
+	frame->active_aspect = HDMI_ACTIVE_ASPECT_PICTURE;
+	frame->scan_mode = HDMI_SCAN_MODE_UNDERSCAN;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_hdmi_avi_infoframe_from_display_mode);
+
+/* HDMI Colorspace Spec Definitions */
+#define FULL_COLORIMETRY_MASK		0x1FF
+#define NORMAL_COLORIMETRY_MASK		0x3
+#define EXTENDED_COLORIMETRY_MASK	0x7
+#define EXTENDED_ACE_COLORIMETRY_MASK	0xF
+
+#define C(x) ((x) << 0)
+#define EC(x) ((x) << 2)
+#define ACE(x) ((x) << 5)
+
+#define HDMI_COLORIMETRY_NO_DATA		0x0
+#define HDMI_COLORIMETRY_SMPTE_170M_YCC		(C(1) | EC(0) | ACE(0))
+#define HDMI_COLORIMETRY_BT709_YCC		(C(2) | EC(0) | ACE(0))
+#define HDMI_COLORIMETRY_XVYCC_601		(C(3) | EC(0) | ACE(0))
+#define HDMI_COLORIMETRY_XVYCC_709		(C(3) | EC(1) | ACE(0))
+#define HDMI_COLORIMETRY_SYCC_601		(C(3) | EC(2) | ACE(0))
+#define HDMI_COLORIMETRY_OPYCC_601		(C(3) | EC(3) | ACE(0))
+#define HDMI_COLORIMETRY_OPRGB			(C(3) | EC(4) | ACE(0))
+#define HDMI_COLORIMETRY_BT2020_CYCC		(C(3) | EC(5) | ACE(0))
+#define HDMI_COLORIMETRY_BT2020_RGB		(C(3) | EC(6) | ACE(0))
+#define HDMI_COLORIMETRY_BT2020_YCC		(C(3) | EC(6) | ACE(0))
+#define HDMI_COLORIMETRY_DCI_P3_RGB_D65		(C(3) | EC(7) | ACE(0))
+#define HDMI_COLORIMETRY_DCI_P3_RGB_THEATER	(C(3) | EC(7) | ACE(1))
+
+static const u32 hdmi_colorimetry_val[] = {
+	[DRM_MODE_COLORIMETRY_NO_DATA] = HDMI_COLORIMETRY_NO_DATA,
+	[DRM_MODE_COLORIMETRY_SMPTE_170M_YCC] = HDMI_COLORIMETRY_SMPTE_170M_YCC,
+	[DRM_MODE_COLORIMETRY_BT709_YCC] = HDMI_COLORIMETRY_BT709_YCC,
+	[DRM_MODE_COLORIMETRY_XVYCC_601] = HDMI_COLORIMETRY_XVYCC_601,
+	[DRM_MODE_COLORIMETRY_XVYCC_709] = HDMI_COLORIMETRY_XVYCC_709,
+	[DRM_MODE_COLORIMETRY_SYCC_601] = HDMI_COLORIMETRY_SYCC_601,
+	[DRM_MODE_COLORIMETRY_OPYCC_601] = HDMI_COLORIMETRY_OPYCC_601,
+	[DRM_MODE_COLORIMETRY_OPRGB] = HDMI_COLORIMETRY_OPRGB,
+	[DRM_MODE_COLORIMETRY_BT2020_CYCC] = HDMI_COLORIMETRY_BT2020_CYCC,
+	[DRM_MODE_COLORIMETRY_BT2020_RGB] = HDMI_COLORIMETRY_BT2020_RGB,
+	[DRM_MODE_COLORIMETRY_BT2020_YCC] = HDMI_COLORIMETRY_BT2020_YCC,
+};
+
+#undef C
+#undef EC
+#undef ACE
+
+/**
+ * drm_hdmi_avi_infoframe_colorimetry() - fill the HDMI AVI infoframe
+ *                                       colorimetry information
+ * @frame: HDMI AVI infoframe
+ * @conn_state: connector state
+ */
+void drm_hdmi_avi_infoframe_colorimetry(struct hdmi_avi_infoframe *frame,
+					const struct drm_connector_state *conn_state)
+{
+	u32 colorimetry_val;
+	u32 colorimetry_index = conn_state->colorspace & FULL_COLORIMETRY_MASK;
+
+	if (colorimetry_index >= ARRAY_SIZE(hdmi_colorimetry_val))
+		colorimetry_val = HDMI_COLORIMETRY_NO_DATA;
+	else
+		colorimetry_val = hdmi_colorimetry_val[colorimetry_index];
+
+	frame->colorimetry = colorimetry_val & NORMAL_COLORIMETRY_MASK;
+	/*
+	 * ToDo: Extend it for ACE formats as well. Modify the infoframe
+	 * structure and extend it in drivers/video/hdmi
+	 */
+	frame->extended_colorimetry = (colorimetry_val >> 2) &
+					EXTENDED_COLORIMETRY_MASK;
+}
+EXPORT_SYMBOL(drm_hdmi_avi_infoframe_colorimetry);
+
+/**
+ * drm_hdmi_avi_infoframe_quant_range() - fill the HDMI AVI infoframe
+ *                                        quantization range information
+ * @frame: HDMI AVI infoframe
+ * @connector: the connector
+ * @mode: DRM display mode
+ * @rgb_quant_range: RGB quantization range (Q)
+ */
+void drm_hdmi_avi_infoframe_quant_range(struct hdmi_avi_infoframe *frame,
+					const struct drm_connector *connector,
+					const struct drm_display_mode *mode,
+					enum hdmi_quantization_range rgb_quant_range)
+{
+	const struct drm_display_info *info = &connector->display_info;
+
+	/*
+	 * CEA-861:
+	 * "A Source shall not send a non-zero Q value that does not correspond
+	 *  to the default RGB Quantization Range for the transmitted Picture
+	 *  unless the Sink indicates support for the Q bit in a Video
+	 *  Capabilities Data Block."
+	 *
+	 * HDMI 2.0 recommends sending non-zero Q when it does match the
+	 * default RGB quantization range for the mode, even when QS=0.
+	 */
+	if (info->rgb_quant_range_selectable ||
+	    rgb_quant_range == drm_default_rgb_quant_range(mode))
+		frame->quantization_range = rgb_quant_range;
+	else
+		frame->quantization_range = HDMI_QUANTIZATION_RANGE_DEFAULT;
+
+	/*
+	 * CEA-861-F:
+	 * "When transmitting any RGB colorimetry, the Source should set the
+	 *  YQ-field to match the RGB Quantization Range being transmitted
+	 *  (e.g., when Limited Range RGB, set YQ=0 or when Full Range RGB,
+	 *  set YQ=1) and the Sink shall ignore the YQ-field."
+	 *
+	 * Unfortunate certain sinks (eg. VIZ Model 67/E261VA) get confused
+	 * by non-zero YQ when receiving RGB. There doesn't seem to be any
+	 * good way to tell which version of CEA-861 the sink supports, so
+	 * we limit non-zero YQ to HDMI 2.0 sinks only as HDMI 2.0 is based
+	 * on on CEA-861-F.
+	 */
+	if (!is_hdmi2_sink(connector) ||
+	    rgb_quant_range == HDMI_QUANTIZATION_RANGE_LIMITED)
+		frame->ycc_quantization_range =
+			HDMI_YCC_QUANTIZATION_RANGE_LIMITED;
+	else
+		frame->ycc_quantization_range =
+			HDMI_YCC_QUANTIZATION_RANGE_FULL;
+}
+EXPORT_SYMBOL(drm_hdmi_avi_infoframe_quant_range);
+
+/**
+ * drm_hdmi_avi_infoframe_bars() - fill the HDMI AVI infoframe
+ *                                 bar information
+ * @frame: HDMI AVI infoframe
+ * @conn_state: connector state
+ */
+void drm_hdmi_avi_infoframe_bars(struct hdmi_avi_infoframe *frame,
+				 const struct drm_connector_state *conn_state)
+{
+	frame->right_bar = conn_state->tv.margins.right;
+	frame->left_bar = conn_state->tv.margins.left;
+	frame->top_bar = conn_state->tv.margins.top;
+	frame->bottom_bar = conn_state->tv.margins.bottom;
+}
+EXPORT_SYMBOL(drm_hdmi_avi_infoframe_bars);
+
+/**
+ * drm_hdmi_avi_infoframe_content_type() - fill the HDMI AVI infoframe
+ *                                         content type information, based
+ *                                         on correspondent DRM property.
+ * @frame: HDMI AVI infoframe
+ * @conn_state: DRM display connector state
+ *
+ */
+void drm_hdmi_avi_infoframe_content_type(struct hdmi_avi_infoframe *frame,
+					 const struct drm_connector_state *conn_state)
+{
+	switch (conn_state->content_type) {
+	case DRM_MODE_CONTENT_TYPE_GRAPHICS:
+		frame->content_type = HDMI_CONTENT_TYPE_GRAPHICS;
+		break;
+	case DRM_MODE_CONTENT_TYPE_CINEMA:
+		frame->content_type = HDMI_CONTENT_TYPE_CINEMA;
+		break;
+	case DRM_MODE_CONTENT_TYPE_GAME:
+		frame->content_type = HDMI_CONTENT_TYPE_GAME;
+		break;
+	case DRM_MODE_CONTENT_TYPE_PHOTO:
+		frame->content_type = HDMI_CONTENT_TYPE_PHOTO;
+		break;
+	default:
+		/* Graphics is the default(0) */
+		frame->content_type = HDMI_CONTENT_TYPE_GRAPHICS;
+	}
+
+	frame->itc = conn_state->content_type != DRM_MODE_CONTENT_TYPE_NO_DATA;
+}
+EXPORT_SYMBOL(drm_hdmi_avi_infoframe_content_type);
+
+static enum hdmi_3d_structure s3d_structure_from_display_mode(const struct drm_display_mode *mode)
+{
+	u32 layout = mode->flags & DRM_MODE_FLAG_3D_MASK;
+
+	switch (layout) {
+	case DRM_MODE_FLAG_3D_FRAME_PACKING:
+		return HDMI_3D_STRUCTURE_FRAME_PACKING;
+	case DRM_MODE_FLAG_3D_FIELD_ALTERNATIVE:
+		return HDMI_3D_STRUCTURE_FIELD_ALTERNATIVE;
+	case DRM_MODE_FLAG_3D_LINE_ALTERNATIVE:
+		return HDMI_3D_STRUCTURE_LINE_ALTERNATIVE;
+	case DRM_MODE_FLAG_3D_SIDE_BY_SIDE_FULL:
+		return HDMI_3D_STRUCTURE_SIDE_BY_SIDE_FULL;
+	case DRM_MODE_FLAG_3D_L_DEPTH:
+		return HDMI_3D_STRUCTURE_L_DEPTH;
+	case DRM_MODE_FLAG_3D_L_DEPTH_GFX_GFX_DEPTH:
+		return HDMI_3D_STRUCTURE_L_DEPTH_GFX_GFX_DEPTH;
+	case DRM_MODE_FLAG_3D_TOP_AND_BOTTOM:
+		return HDMI_3D_STRUCTURE_TOP_AND_BOTTOM;
+	case DRM_MODE_FLAG_3D_SIDE_BY_SIDE_HALF:
+		return HDMI_3D_STRUCTURE_SIDE_BY_SIDE_HALF;
+	default:
+		return HDMI_3D_STRUCTURE_INVALID;
+	}
+}
+
+/**
+ * drm_hdmi_vendor_infoframe_from_display_mode() - fill an HDMI infoframe with
+ * data from a DRM display mode
+ * @frame: HDMI vendor infoframe
+ * @connector: the connector
+ * @mode: DRM display mode
+ *
+ * Note that there's is a need to send HDMI vendor infoframes only when using a
+ * 4k or stereoscopic 3D mode. So when giving any other mode as input this
+ * function will return -EINVAL, error that can be safely ignored.
+ *
+ * Return: 0 on success or a negative error code on failure.
+ */
+int drm_hdmi_vendor_infoframe_from_display_mode(struct hdmi_vendor_infoframe *frame,
+						const struct drm_connector *connector,
+						const struct drm_display_mode *mode)
+{
+	/*
+	 * FIXME: sil-sii8620 doesn't have a connector around when
+	 * we need one, so we have to be prepared for a NULL connector.
+	 */
+	bool has_hdmi_infoframe = connector ?
+		connector->display_info.has_hdmi_infoframe : false;
+	int err;
+
+	if (!frame || !mode)
+		return -EINVAL;
+
+	if (!has_hdmi_infoframe)
+		return -EINVAL;
+
+	err = hdmi_vendor_infoframe_init(frame);
+	if (err < 0)
+		return err;
+
+	/*
+	 * Even if it's not absolutely necessary to send the infoframe
+	 * (ie.vic==0 and s3d_struct==0) we will still send it if we
+	 * know that the sink can handle it. This is based on a
+	 * suggestion in HDMI 2.0 Appendix F. Apparently some sinks
+	 * have trouble realizing that they should switch from 3D to 2D
+	 * mode if the source simply stops sending the infoframe when
+	 * it wants to switch from 3D to 2D.
+	 */
+	frame->vic = drm_mode_hdmi_vic(connector, mode);
+	frame->s3d_struct = s3d_structure_from_display_mode(mode);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_hdmi_vendor_infoframe_from_display_mode);
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 76a8c707c34b..1c48d162c77e 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -1486,40 +1486,6 @@ int drm_connector_attach_content_type_property(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_connector_attach_content_type_property);
 
-
-/**
- * drm_hdmi_avi_infoframe_content_type() - fill the HDMI AVI infoframe
- *                                         content type information, based
- *                                         on correspondent DRM property.
- * @frame: HDMI AVI infoframe
- * @conn_state: DRM display connector state
- *
- */
-void drm_hdmi_avi_infoframe_content_type(struct hdmi_avi_infoframe *frame,
-					 const struct drm_connector_state *conn_state)
-{
-	switch (conn_state->content_type) {
-	case DRM_MODE_CONTENT_TYPE_GRAPHICS:
-		frame->content_type = HDMI_CONTENT_TYPE_GRAPHICS;
-		break;
-	case DRM_MODE_CONTENT_TYPE_CINEMA:
-		frame->content_type = HDMI_CONTENT_TYPE_CINEMA;
-		break;
-	case DRM_MODE_CONTENT_TYPE_GAME:
-		frame->content_type = HDMI_CONTENT_TYPE_GAME;
-		break;
-	case DRM_MODE_CONTENT_TYPE_PHOTO:
-		frame->content_type = HDMI_CONTENT_TYPE_PHOTO;
-		break;
-	default:
-		/* Graphics is the default(0) */
-		frame->content_type = HDMI_CONTENT_TYPE_GRAPHICS;
-	}
-
-	frame->itc = conn_state->content_type != DRM_MODE_CONTENT_TYPE_NO_DATA;
-}
-EXPORT_SYMBOL(drm_hdmi_avi_infoframe_content_type);
-
 /**
  * drm_connector_attach_tv_margin_properties - attach TV connector margin
  * 	properties
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 561f53831e29..4d865ebcd623 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3541,7 +3541,7 @@ static bool drm_valid_cea_vic(u8 vic)
 	return cea_mode_for_vic(vic) != NULL;
 }
 
-static enum hdmi_picture_aspect drm_get_cea_aspect_ratio(const u8 video_code)
+enum hdmi_picture_aspect drm_get_cea_aspect_ratio(const u8 video_code)
 {
 	const struct drm_display_mode *mode = cea_mode_for_vic(video_code);
 
@@ -3550,11 +3550,13 @@ static enum hdmi_picture_aspect drm_get_cea_aspect_ratio(const u8 video_code)
 
 	return HDMI_PICTURE_ASPECT_NONE;
 }
+EXPORT_SYMBOL(drm_get_cea_aspect_ratio);
 
-static enum hdmi_picture_aspect drm_get_hdmi_aspect_ratio(const u8 video_code)
+enum hdmi_picture_aspect drm_get_hdmi_aspect_ratio(const u8 video_code)
 {
 	return edid_4k_modes[video_code].picture_aspect_ratio;
 }
+EXPORT_SYMBOL(drm_get_hdmi_aspect_ratio);
 
 /*
  * Calculate the alternate clock for HDMI modes (those from the HDMI vendor
@@ -3597,7 +3599,7 @@ static u8 drm_match_hdmi_mode_clock_tolerance(const struct drm_display_mode *to_
 	return 0;
 }
 
-/*
+/**
  * drm_match_hdmi_mode - look for a HDMI mode matching given mode
  * @to_match: display mode
  *
@@ -3605,7 +3607,7 @@ static u8 drm_match_hdmi_mode_clock_tolerance(const struct drm_display_mode *to_
  *
  * Returns the HDMI Video ID (VIC) of the mode or 0 if it isn't one.
  */
-static u8 drm_match_hdmi_mode(const struct drm_display_mode *to_match)
+u8 drm_match_hdmi_mode(const struct drm_display_mode *to_match)
 {
 	unsigned int match_flags = DRM_MODE_MATCH_TIMINGS | DRM_MODE_MATCH_FLAGS;
 	u8 vic;
@@ -3631,6 +3633,7 @@ static u8 drm_match_hdmi_mode(const struct drm_display_mode *to_match)
 	}
 	return 0;
 }
+EXPORT_SYMBOL(drm_match_hdmi_mode);
 
 static bool drm_valid_hdmi_vic(u8 vic)
 {
@@ -5677,433 +5680,6 @@ void drm_set_preferred_mode(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_set_preferred_mode);
 
-static bool is_hdmi2_sink(const struct drm_connector *connector)
-{
-	/*
-	 * FIXME: sil-sii8620 doesn't have a connector around when
-	 * we need one, so we have to be prepared for a NULL connector.
-	 */
-	if (!connector)
-		return true;
-
-	return connector->display_info.hdmi.scdc.supported ||
-		connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR420;
-}
-
-static inline bool is_eotf_supported(u8 output_eotf, u8 sink_eotf)
-{
-	return sink_eotf & BIT(output_eotf);
-}
-
-/**
- * drm_hdmi_infoframe_set_hdr_metadata() - fill an HDMI DRM infoframe with
- *                                         HDR metadata from userspace
- * @frame: HDMI DRM infoframe
- * @conn_state: Connector state containing HDR metadata
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int
-drm_hdmi_infoframe_set_hdr_metadata(struct hdmi_drm_infoframe *frame,
-				    const struct drm_connector_state *conn_state)
-{
-	struct drm_connector *connector;
-	struct hdr_output_metadata *hdr_metadata;
-	int err;
-
-	if (!frame || !conn_state)
-		return -EINVAL;
-
-	connector = conn_state->connector;
-
-	if (!conn_state->hdr_output_metadata)
-		return -EINVAL;
-
-	hdr_metadata = conn_state->hdr_output_metadata->data;
-
-	if (!hdr_metadata || !connector)
-		return -EINVAL;
-
-	/* Sink EOTF is Bit map while infoframe is absolute values */
-	if (!is_eotf_supported(hdr_metadata->hdmi_metadata_type1.eotf,
-	    connector->hdr_sink_metadata.hdmi_type1.eotf)) {
-		DRM_DEBUG_KMS("EOTF Not Supported\n");
-		return -EINVAL;
-	}
-
-	err = hdmi_drm_infoframe_init(frame);
-	if (err < 0)
-		return err;
-
-	frame->eotf = hdr_metadata->hdmi_metadata_type1.eotf;
-	frame->metadata_type = hdr_metadata->hdmi_metadata_type1.metadata_type;
-
-	BUILD_BUG_ON(sizeof(frame->display_primaries) !=
-		     sizeof(hdr_metadata->hdmi_metadata_type1.display_primaries));
-	BUILD_BUG_ON(sizeof(frame->white_point) !=
-		     sizeof(hdr_metadata->hdmi_metadata_type1.white_point));
-
-	memcpy(&frame->display_primaries,
-	       &hdr_metadata->hdmi_metadata_type1.display_primaries,
-	       sizeof(frame->display_primaries));
-
-	memcpy(&frame->white_point,
-	       &hdr_metadata->hdmi_metadata_type1.white_point,
-	       sizeof(frame->white_point));
-
-	frame->max_display_mastering_luminance =
-		hdr_metadata->hdmi_metadata_type1.max_display_mastering_luminance;
-	frame->min_display_mastering_luminance =
-		hdr_metadata->hdmi_metadata_type1.min_display_mastering_luminance;
-	frame->max_fall = hdr_metadata->hdmi_metadata_type1.max_fall;
-	frame->max_cll = hdr_metadata->hdmi_metadata_type1.max_cll;
-
-	return 0;
-}
-EXPORT_SYMBOL(drm_hdmi_infoframe_set_hdr_metadata);
-
-static u8 drm_mode_hdmi_vic(const struct drm_connector *connector,
-			    const struct drm_display_mode *mode)
-{
-	bool has_hdmi_infoframe = connector ?
-		connector->display_info.has_hdmi_infoframe : false;
-
-	if (!has_hdmi_infoframe)
-		return 0;
-
-	/* No HDMI VIC when signalling 3D video format */
-	if (mode->flags & DRM_MODE_FLAG_3D_MASK)
-		return 0;
-
-	return drm_match_hdmi_mode(mode);
-}
-
-static u8 drm_mode_cea_vic(const struct drm_connector *connector,
-			   const struct drm_display_mode *mode)
-{
-	u8 vic;
-
-	/*
-	 * HDMI spec says if a mode is found in HDMI 1.4b 4K modes
-	 * we should send its VIC in vendor infoframes, else send the
-	 * VIC in AVI infoframes. Lets check if this mode is present in
-	 * HDMI 1.4b 4K modes
-	 */
-	if (drm_mode_hdmi_vic(connector, mode))
-		return 0;
-
-	vic = drm_match_cea_mode(mode);
-
-	/*
-	 * HDMI 1.4 VIC range: 1 <= VIC <= 64 (CEA-861-D) but
-	 * HDMI 2.0 VIC range: 1 <= VIC <= 107 (CEA-861-F). So we
-	 * have to make sure we dont break HDMI 1.4 sinks.
-	 */
-	if (!is_hdmi2_sink(connector) && vic > 64)
-		return 0;
-
-	return vic;
-}
-
-/**
- * drm_hdmi_avi_infoframe_from_display_mode() - fill an HDMI AVI infoframe with
- *                                              data from a DRM display mode
- * @frame: HDMI AVI infoframe
- * @connector: the connector
- * @mode: DRM display mode
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int
-drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infoframe *frame,
-					 const struct drm_connector *connector,
-					 const struct drm_display_mode *mode)
-{
-	enum hdmi_picture_aspect picture_aspect;
-	u8 vic, hdmi_vic;
-
-	if (!frame || !mode)
-		return -EINVAL;
-
-	hdmi_avi_infoframe_init(frame);
-
-	if (mode->flags & DRM_MODE_FLAG_DBLCLK)
-		frame->pixel_repeat = 1;
-
-	vic = drm_mode_cea_vic(connector, mode);
-	hdmi_vic = drm_mode_hdmi_vic(connector, mode);
-
-	frame->picture_aspect = HDMI_PICTURE_ASPECT_NONE;
-
-	/*
-	 * As some drivers don't support atomic, we can't use connector state.
-	 * So just initialize the frame with default values, just the same way
-	 * as it's done with other properties here.
-	 */
-	frame->content_type = HDMI_CONTENT_TYPE_GRAPHICS;
-	frame->itc = 0;
-
-	/*
-	 * Populate picture aspect ratio from either
-	 * user input (if specified) or from the CEA/HDMI mode lists.
-	 */
-	picture_aspect = mode->picture_aspect_ratio;
-	if (picture_aspect == HDMI_PICTURE_ASPECT_NONE) {
-		if (vic)
-			picture_aspect = drm_get_cea_aspect_ratio(vic);
-		else if (hdmi_vic)
-			picture_aspect = drm_get_hdmi_aspect_ratio(hdmi_vic);
-	}
-
-	/*
-	 * The infoframe can't convey anything but none, 4:3
-	 * and 16:9, so if the user has asked for anything else
-	 * we can only satisfy it by specifying the right VIC.
-	 */
-	if (picture_aspect > HDMI_PICTURE_ASPECT_16_9) {
-		if (vic) {
-			if (picture_aspect != drm_get_cea_aspect_ratio(vic))
-				return -EINVAL;
-		} else if (hdmi_vic) {
-			if (picture_aspect != drm_get_hdmi_aspect_ratio(hdmi_vic))
-				return -EINVAL;
-		} else {
-			return -EINVAL;
-		}
-
-		picture_aspect = HDMI_PICTURE_ASPECT_NONE;
-	}
-
-	frame->video_code = vic;
-	frame->picture_aspect = picture_aspect;
-	frame->active_aspect = HDMI_ACTIVE_ASPECT_PICTURE;
-	frame->scan_mode = HDMI_SCAN_MODE_UNDERSCAN;
-
-	return 0;
-}
-EXPORT_SYMBOL(drm_hdmi_avi_infoframe_from_display_mode);
-
-/* HDMI Colorspace Spec Definitions */
-#define FULL_COLORIMETRY_MASK		0x1FF
-#define NORMAL_COLORIMETRY_MASK		0x3
-#define EXTENDED_COLORIMETRY_MASK	0x7
-#define EXTENDED_ACE_COLORIMETRY_MASK	0xF
-
-#define C(x) ((x) << 0)
-#define EC(x) ((x) << 2)
-#define ACE(x) ((x) << 5)
-
-#define HDMI_COLORIMETRY_NO_DATA		0x0
-#define HDMI_COLORIMETRY_SMPTE_170M_YCC		(C(1) | EC(0) | ACE(0))
-#define HDMI_COLORIMETRY_BT709_YCC		(C(2) | EC(0) | ACE(0))
-#define HDMI_COLORIMETRY_XVYCC_601		(C(3) | EC(0) | ACE(0))
-#define HDMI_COLORIMETRY_XVYCC_709		(C(3) | EC(1) | ACE(0))
-#define HDMI_COLORIMETRY_SYCC_601		(C(3) | EC(2) | ACE(0))
-#define HDMI_COLORIMETRY_OPYCC_601		(C(3) | EC(3) | ACE(0))
-#define HDMI_COLORIMETRY_OPRGB			(C(3) | EC(4) | ACE(0))
-#define HDMI_COLORIMETRY_BT2020_CYCC		(C(3) | EC(5) | ACE(0))
-#define HDMI_COLORIMETRY_BT2020_RGB		(C(3) | EC(6) | ACE(0))
-#define HDMI_COLORIMETRY_BT2020_YCC		(C(3) | EC(6) | ACE(0))
-#define HDMI_COLORIMETRY_DCI_P3_RGB_D65		(C(3) | EC(7) | ACE(0))
-#define HDMI_COLORIMETRY_DCI_P3_RGB_THEATER	(C(3) | EC(7) | ACE(1))
-
-static const u32 hdmi_colorimetry_val[] = {
-	[DRM_MODE_COLORIMETRY_NO_DATA] = HDMI_COLORIMETRY_NO_DATA,
-	[DRM_MODE_COLORIMETRY_SMPTE_170M_YCC] = HDMI_COLORIMETRY_SMPTE_170M_YCC,
-	[DRM_MODE_COLORIMETRY_BT709_YCC] = HDMI_COLORIMETRY_BT709_YCC,
-	[DRM_MODE_COLORIMETRY_XVYCC_601] = HDMI_COLORIMETRY_XVYCC_601,
-	[DRM_MODE_COLORIMETRY_XVYCC_709] = HDMI_COLORIMETRY_XVYCC_709,
-	[DRM_MODE_COLORIMETRY_SYCC_601] = HDMI_COLORIMETRY_SYCC_601,
-	[DRM_MODE_COLORIMETRY_OPYCC_601] = HDMI_COLORIMETRY_OPYCC_601,
-	[DRM_MODE_COLORIMETRY_OPRGB] = HDMI_COLORIMETRY_OPRGB,
-	[DRM_MODE_COLORIMETRY_BT2020_CYCC] = HDMI_COLORIMETRY_BT2020_CYCC,
-	[DRM_MODE_COLORIMETRY_BT2020_RGB] = HDMI_COLORIMETRY_BT2020_RGB,
-	[DRM_MODE_COLORIMETRY_BT2020_YCC] = HDMI_COLORIMETRY_BT2020_YCC,
-};
-
-#undef C
-#undef EC
-#undef ACE
-
-/**
- * drm_hdmi_avi_infoframe_colorimetry() - fill the HDMI AVI infoframe
- *                                       colorimetry information
- * @frame: HDMI AVI infoframe
- * @conn_state: connector state
- */
-void
-drm_hdmi_avi_infoframe_colorimetry(struct hdmi_avi_infoframe *frame,
-				  const struct drm_connector_state *conn_state)
-{
-	u32 colorimetry_val;
-	u32 colorimetry_index = conn_state->colorspace & FULL_COLORIMETRY_MASK;
-
-	if (colorimetry_index >= ARRAY_SIZE(hdmi_colorimetry_val))
-		colorimetry_val = HDMI_COLORIMETRY_NO_DATA;
-	else
-		colorimetry_val = hdmi_colorimetry_val[colorimetry_index];
-
-	frame->colorimetry = colorimetry_val & NORMAL_COLORIMETRY_MASK;
-	/*
-	 * ToDo: Extend it for ACE formats as well. Modify the infoframe
-	 * structure and extend it in drivers/video/hdmi
-	 */
-	frame->extended_colorimetry = (colorimetry_val >> 2) &
-					EXTENDED_COLORIMETRY_MASK;
-}
-EXPORT_SYMBOL(drm_hdmi_avi_infoframe_colorimetry);
-
-/**
- * drm_hdmi_avi_infoframe_quant_range() - fill the HDMI AVI infoframe
- *                                        quantization range information
- * @frame: HDMI AVI infoframe
- * @connector: the connector
- * @mode: DRM display mode
- * @rgb_quant_range: RGB quantization range (Q)
- */
-void
-drm_hdmi_avi_infoframe_quant_range(struct hdmi_avi_infoframe *frame,
-				   const struct drm_connector *connector,
-				   const struct drm_display_mode *mode,
-				   enum hdmi_quantization_range rgb_quant_range)
-{
-	const struct drm_display_info *info = &connector->display_info;
-
-	/*
-	 * CEA-861:
-	 * "A Source shall not send a non-zero Q value that does not correspond
-	 *  to the default RGB Quantization Range for the transmitted Picture
-	 *  unless the Sink indicates support for the Q bit in a Video
-	 *  Capabilities Data Block."
-	 *
-	 * HDMI 2.0 recommends sending non-zero Q when it does match the
-	 * default RGB quantization range for the mode, even when QS=0.
-	 */
-	if (info->rgb_quant_range_selectable ||
-	    rgb_quant_range == drm_default_rgb_quant_range(mode))
-		frame->quantization_range = rgb_quant_range;
-	else
-		frame->quantization_range = HDMI_QUANTIZATION_RANGE_DEFAULT;
-
-	/*
-	 * CEA-861-F:
-	 * "When transmitting any RGB colorimetry, the Source should set the
-	 *  YQ-field to match the RGB Quantization Range being transmitted
-	 *  (e.g., when Limited Range RGB, set YQ=0 or when Full Range RGB,
-	 *  set YQ=1) and the Sink shall ignore the YQ-field."
-	 *
-	 * Unfortunate certain sinks (eg. VIZ Model 67/E261VA) get confused
-	 * by non-zero YQ when receiving RGB. There doesn't seem to be any
-	 * good way to tell which version of CEA-861 the sink supports, so
-	 * we limit non-zero YQ to HDMI 2.0 sinks only as HDMI 2.0 is based
-	 * on on CEA-861-F.
-	 */
-	if (!is_hdmi2_sink(connector) ||
-	    rgb_quant_range == HDMI_QUANTIZATION_RANGE_LIMITED)
-		frame->ycc_quantization_range =
-			HDMI_YCC_QUANTIZATION_RANGE_LIMITED;
-	else
-		frame->ycc_quantization_range =
-			HDMI_YCC_QUANTIZATION_RANGE_FULL;
-}
-EXPORT_SYMBOL(drm_hdmi_avi_infoframe_quant_range);
-
-/**
- * drm_hdmi_avi_infoframe_bars() - fill the HDMI AVI infoframe
- *                                 bar information
- * @frame: HDMI AVI infoframe
- * @conn_state: connector state
- */
-void
-drm_hdmi_avi_infoframe_bars(struct hdmi_avi_infoframe *frame,
-			    const struct drm_connector_state *conn_state)
-{
-	frame->right_bar = conn_state->tv.margins.right;
-	frame->left_bar = conn_state->tv.margins.left;
-	frame->top_bar = conn_state->tv.margins.top;
-	frame->bottom_bar = conn_state->tv.margins.bottom;
-}
-EXPORT_SYMBOL(drm_hdmi_avi_infoframe_bars);
-
-static enum hdmi_3d_structure
-s3d_structure_from_display_mode(const struct drm_display_mode *mode)
-{
-	u32 layout = mode->flags & DRM_MODE_FLAG_3D_MASK;
-
-	switch (layout) {
-	case DRM_MODE_FLAG_3D_FRAME_PACKING:
-		return HDMI_3D_STRUCTURE_FRAME_PACKING;
-	case DRM_MODE_FLAG_3D_FIELD_ALTERNATIVE:
-		return HDMI_3D_STRUCTURE_FIELD_ALTERNATIVE;
-	case DRM_MODE_FLAG_3D_LINE_ALTERNATIVE:
-		return HDMI_3D_STRUCTURE_LINE_ALTERNATIVE;
-	case DRM_MODE_FLAG_3D_SIDE_BY_SIDE_FULL:
-		return HDMI_3D_STRUCTURE_SIDE_BY_SIDE_FULL;
-	case DRM_MODE_FLAG_3D_L_DEPTH:
-		return HDMI_3D_STRUCTURE_L_DEPTH;
-	case DRM_MODE_FLAG_3D_L_DEPTH_GFX_GFX_DEPTH:
-		return HDMI_3D_STRUCTURE_L_DEPTH_GFX_GFX_DEPTH;
-	case DRM_MODE_FLAG_3D_TOP_AND_BOTTOM:
-		return HDMI_3D_STRUCTURE_TOP_AND_BOTTOM;
-	case DRM_MODE_FLAG_3D_SIDE_BY_SIDE_HALF:
-		return HDMI_3D_STRUCTURE_SIDE_BY_SIDE_HALF;
-	default:
-		return HDMI_3D_STRUCTURE_INVALID;
-	}
-}
-
-/**
- * drm_hdmi_vendor_infoframe_from_display_mode() - fill an HDMI infoframe with
- * data from a DRM display mode
- * @frame: HDMI vendor infoframe
- * @connector: the connector
- * @mode: DRM display mode
- *
- * Note that there's is a need to send HDMI vendor infoframes only when using a
- * 4k or stereoscopic 3D mode. So when giving any other mode as input this
- * function will return -EINVAL, error that can be safely ignored.
- *
- * Return: 0 on success or a negative error code on failure.
- */
-int
-drm_hdmi_vendor_infoframe_from_display_mode(struct hdmi_vendor_infoframe *frame,
-					    const struct drm_connector *connector,
-					    const struct drm_display_mode *mode)
-{
-	/*
-	 * FIXME: sil-sii8620 doesn't have a connector around when
-	 * we need one, so we have to be prepared for a NULL connector.
-	 */
-	bool has_hdmi_infoframe = connector ?
-		connector->display_info.has_hdmi_infoframe : false;
-	int err;
-
-	if (!frame || !mode)
-		return -EINVAL;
-
-	if (!has_hdmi_infoframe)
-		return -EINVAL;
-
-	err = hdmi_vendor_infoframe_init(frame);
-	if (err < 0)
-		return err;
-
-	/*
-	 * Even if it's not absolutely necessary to send the infoframe
-	 * (ie.vic==0 and s3d_struct==0) we will still send it if we
-	 * know that the sink can handle it. This is based on a
-	 * suggestion in HDMI 2.0 Appendix F. Apparently some sinks
-	 * have trouble realizing that they should switch from 3D to 2D
-	 * mode if the source simply stops sending the infoframe when
-	 * it wants to switch from 3D to 2D.
-	 */
-	frame->vic = drm_mode_hdmi_vic(connector, mode);
-	frame->s3d_struct = s3d_structure_from_display_mode(mode);
-
-	return 0;
-}
-EXPORT_SYMBOL(drm_hdmi_vendor_infoframe_from_display_mode);
-
 static void drm_parse_tiled_block(struct drm_connector *connector,
 				  const struct displayid_block *block)
 {
diff --git a/drivers/gpu/drm/exynos/Kconfig b/drivers/gpu/drm/exynos/Kconfig
index f27cfd2a9726..69e0055abf0a 100644
--- a/drivers/gpu/drm/exynos/Kconfig
+++ b/drivers/gpu/drm/exynos/Kconfig
@@ -76,6 +76,7 @@ config DRM_EXYNOS_HDMI
 	bool "HDMI"
 	depends on DRM_EXYNOS_MIXER || DRM_EXYNOS5433_DECON
 	select CEC_CORE if CEC_NOTIFIER
+	select DRM_HDMI_HELPER
 	help
 	  Choose this option if you want to use Exynos HDMI for DRM.
 
diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
index 7655142a4651..49e33b02dd88 100644
--- a/drivers/gpu/drm/exynos/exynos_hdmi.c
+++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
@@ -33,9 +33,9 @@
 #include <sound/hdmi-codec.h>
 #include <media/cec-notifier.h>
 
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
-#include <drm/drm_edid.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
diff --git a/drivers/gpu/drm/hdmi/Makefile b/drivers/gpu/drm/hdmi/Makefile
new file mode 100644
index 000000000000..650f4930ccca
--- /dev/null
+++ b/drivers/gpu/drm/hdmi/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: MIT
+
+drm_hdmi_helper-y := drm_hdmi.o
+obj-$(CONFIG_DRM_HDMI_HELPER) += drm_hdmi_helper.o
diff --git a/drivers/gpu/drm/i2c/Kconfig b/drivers/gpu/drm/i2c/Kconfig
index 6f19e1c35e30..67581ed337d0 100644
--- a/drivers/gpu/drm/i2c/Kconfig
+++ b/drivers/gpu/drm/i2c/Kconfig
@@ -23,6 +23,7 @@ config DRM_I2C_SIL164
 config DRM_I2C_NXP_TDA998X
 	tristate "NXP Semiconductors TDA998X HDMI encoder"
 	default m if DRM_TILCDC
+	select DRM_HDMI_HELPER
 	select CEC_CORE if CEC_NOTIFIER
 	select SND_SOC_HDMI_CODEC if SND_SOC
 	help
diff --git a/drivers/gpu/drm/i2c/tda998x_drv.c b/drivers/gpu/drm/i2c/tda998x_drv.c
index b7ec6c374fbd..94fb0b602f32 100644
--- a/drivers/gpu/drm/i2c/tda998x_drv.c
+++ b/drivers/gpu/drm/i2c/tda998x_drv.c
@@ -13,9 +13,9 @@
 #include <sound/asoundef.h>
 #include <sound/hdmi-codec.h>
 
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
-#include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index dc65717ad7c0..63c746499c24 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -11,6 +11,7 @@ config DRM_I915
 	select SHMEM
 	select TMPFS
 	select DRM_HDCP_HELPER
+	select DRM_HDMI_HELPER
 	select DRM_DP_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index cad8cba93ba8..afd46fec6a8f 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -37,9 +37,9 @@
 
 #include <drm/display/drm_dp_helper.h>
 #include <drm/display/drm_dsc_helper.h>
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
 
 #include "g4x_dp.h"
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index c713cebc63fe..ce47ae5bab20 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -33,6 +33,7 @@
 #include <linux/string_helpers.h>
 
 #include <drm/display/drm_hdcp_helper.h>
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
diff --git a/drivers/gpu/drm/i915/display/intel_lspcon.c b/drivers/gpu/drm/i915/display/intel_lspcon.c
index be0b1010b304..7fbc8031a5aa 100644
--- a/drivers/gpu/drm/i915/display/intel_lspcon.c
+++ b/drivers/gpu/drm/i915/display/intel_lspcon.c
@@ -24,8 +24,8 @@
  */
 
 #include <drm/display/drm_dp_dual_mode_helper.h>
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_edid.h>
 
 #include "intel_de.h"
 #include "intel_display_types.h"
diff --git a/drivers/gpu/drm/i915/display/intel_sdvo.c b/drivers/gpu/drm/i915/display/intel_sdvo.c
index 158e750e5b4d..1ba01e4b39af 100644
--- a/drivers/gpu/drm/i915/display/intel_sdvo.c
+++ b/drivers/gpu/drm/i915/display/intel_sdvo.c
@@ -31,6 +31,7 @@
 #include <linux/i2c.h>
 #include <linux/slab.h>
 
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index 2976d21e9a34..e360f32b493a 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -24,6 +24,7 @@ config DRM_MEDIATEK
 config DRM_MEDIATEK_HDMI
 	tristate "DRM HDMI Support for Mediatek SoCs"
 	depends on DRM_MEDIATEK
+	select DRM_HDMI_HELPER
 	select SND_SOC_HDMI_CODEC if SND_SOC
 	select PHY_MTK_HDMI
 	help
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 3196189429bc..c6916753de10 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -24,10 +24,10 @@
 
 #include <sound/hdmi-codec.h>
 
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_edid.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index c79502525963..1453d842cf3d 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -13,6 +13,7 @@ config DRM_MSM
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
 	select DRM_DP_HELPER
+	select DRM_HDMI_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL
 	select DRM_BRIDGE
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 10ebe2089cb6..fa830d5aab38 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -5,6 +5,8 @@
  */
 
 #include <linux/delay.h>
+
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_bridge_connector.h>
 
 #include "msm_kms.h"
diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index 3ec690b6f0b4..74a6d4a44608 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -5,6 +5,7 @@ config DRM_NOUVEAU
 	select IOMMU_API
 	select FW_LOADER
 	select DRM_DP_HELPER
+	select DRM_HDMI_HELPER
 	select DRM_KMS_HELPER
 	select DRM_TTM
 	select DRM_TTM_HELPER
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 45db61ac2bfe..86d0ac1d50c6 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -34,6 +34,7 @@
 #include <linux/iopoll.h>
 
 #include <drm/display/drm_dp_helper.h>
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
diff --git a/drivers/gpu/drm/omapdrm/Kconfig b/drivers/gpu/drm/omapdrm/Kconfig
index 455e1a91f0e5..bfa90fe5dd9c 100644
--- a/drivers/gpu/drm/omapdrm/Kconfig
+++ b/drivers/gpu/drm/omapdrm/Kconfig
@@ -58,6 +58,7 @@ config OMAP2_DSS_HDMI_COMMON
 config OMAP4_DSS_HDMI
 	bool "HDMI support for OMAP4"
 	default y
+	select DRM_HDMI_HELPER
 	select OMAP2_DSS_HDMI_COMMON
 	help
 	  HDMI support for OMAP4 based SoCs.
@@ -73,6 +74,7 @@ config OMAP4_DSS_HDMI_CEC
 config OMAP5_DSS_HDMI
 	bool "HDMI support for OMAP5"
 	default n
+	select DRM_HDMI_HELPER
 	select OMAP2_DSS_HDMI_COMMON
 	help
 	  HDMI Interface for OMAP5 and similar cores. This adds the High
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index 35b750cebaeb..01992ea0fe43 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -27,6 +27,7 @@
 #include <sound/omap-hdmi-audio.h>
 #include <media/cec.h>
 
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_state_helper.h>
 
diff --git a/drivers/gpu/drm/radeon/radeon_audio.c b/drivers/gpu/drm/radeon/radeon_audio.c
index 7c5e80d03fc9..2308f9af0666 100644
--- a/drivers/gpu/drm/radeon/radeon_audio.c
+++ b/drivers/gpu/drm/radeon/radeon_audio.c
@@ -24,6 +24,7 @@
 
 #include <linux/gcd.h>
 
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_crtc.h>
 #include "dce6_afmt.h"
 #include "evergreen_hdmi.h"
diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index fa5cfda4e90e..55e14ce8d75b 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -58,6 +58,7 @@ config ROCKCHIP_DW_MIPI_DSI
 
 config ROCKCHIP_INNO_HDMI
 	bool "Rockchip specific extensions for Innosilicon HDMI"
+	select DRM_HDMI_HELPER
 	help
 	  This selects support for Rockchip SoC specific extensions
 	  for the Innosilicon HDMI driver. If you want to enable
@@ -86,6 +87,7 @@ config ROCKCHIP_RGB
 config ROCKCHIP_RK3066_HDMI
 	bool "Rockchip specific extensions for RK3066 HDMI"
 	depends on DRM_ROCKCHIP
+	select DRM_HDMI_HELPER
 	help
 	  This selects support for Rockchip SoC specific extensions
 	  for the RK3066 HDMI driver. If you want to enable
diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index 046e8ec2a71c..cf8f9ee0b7cb 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -15,8 +15,8 @@
 #include <linux/mutex.h>
 #include <linux/of_device.h>
 
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
diff --git a/drivers/gpu/drm/rockchip/rk3066_hdmi.c b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
index 1c546c3a8998..473cd31cc424 100644
--- a/drivers/gpu/drm/rockchip/rk3066_hdmi.c
+++ b/drivers/gpu/drm/rockchip/rk3066_hdmi.c
@@ -4,6 +4,7 @@
  *    Zheng Yang <zhengyang@rock-chips.com>
  */
 
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_of.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
diff --git a/drivers/gpu/drm/sti/Kconfig b/drivers/gpu/drm/sti/Kconfig
index 246a94afbe74..23c8a19316b7 100644
--- a/drivers/gpu/drm/sti/Kconfig
+++ b/drivers/gpu/drm/sti/Kconfig
@@ -3,6 +3,7 @@ config DRM_STI
 	tristate "DRM Support for STMicroelectronics SoC stiH4xx Series"
 	depends on OF && DRM && (ARCH_STI || ARCH_MULTIPLATFORM)
 	select RESET_CONTROLLER
+	select DRM_HDMI_HELPER
 	select DRM_KMS_HELPER
 	select DRM_GEM_CMA_HELPER
 	select DRM_PANEL
diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index f3ace11209dd..08cf2b860287 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -13,11 +13,11 @@
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_edid.h>
 #include <drm/drm_file.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kconfig
index befc5a80222d..1897e9478cb0 100644
--- a/drivers/gpu/drm/sun4i/Kconfig
+++ b/drivers/gpu/drm/sun4i/Kconfig
@@ -18,6 +18,7 @@ if DRM_SUN4I
 config DRM_SUN4I_HDMI
 	tristate "Allwinner A10 HDMI Controller Support"
 	default DRM_SUN4I
+	select DRM_HDMI_HELPER
 	help
 	  Choose this option if you have an Allwinner SoC with an HDMI
 	  controller.
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index 3799a745b7dd..01fc363afabf 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -15,8 +15,8 @@
 #include <linux/regmap.h>
 #include <linux/reset.h>
 
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_edid.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index 6ed55ebaec8c..5791812d9836 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -7,6 +7,7 @@ config DRM_TEGRA
 	depends on OF
 	select DRM_DP_AUX_BUS
 	select DRM_DP_HELPER
+	select DRM_HDMI_HELPER
 	select DRM_KMS_HELPER
 	select DRM_MIPI_DSI
 	select DRM_PANEL
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index bf240767dad9..4ac07e3db7c4 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -19,6 +19,7 @@
 #include <soc/tegra/common.h>
 #include <sound/hdmi-codec.h>
 
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_debugfs.h>
diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index 47b6c8e190cc..2b1b2f76d1fc 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -17,6 +17,7 @@
 #include <soc/tegra/pmc.h>
 
 #include <drm/display/drm_dp_helper.h>
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_file.h>
diff --git a/drivers/gpu/drm/vc4/Kconfig b/drivers/gpu/drm/vc4/Kconfig
index de3424fed2fc..9c87396ed40c 100644
--- a/drivers/gpu/drm/vc4/Kconfig
+++ b/drivers/gpu/drm/vc4/Kconfig
@@ -5,6 +5,7 @@ config DRM_VC4
 	depends on DRM
 	depends on SND && SND_SOC
 	depends on COMMON_CLK
+	select DRM_HDMI_HELPER
 	select DRM_KMS_HELPER
 	select DRM_GEM_CMA_HELPER
 	select DRM_PANEL_BRIDGE
diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 6c58b0fd13fb..8d760dd69060 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -31,8 +31,8 @@
  * encoder block has CEC support.
  */
 
+#include <drm/display/drm_hdmi_helper.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_edid.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_scdc_helper.h>
diff --git a/include/drm/display/drm_hdmi_helper.h b/include/drm/display/drm_hdmi_helper.h
new file mode 100644
index 000000000000..0a4ad9bbae9d
--- /dev/null
+++ b/include/drm/display/drm_hdmi_helper.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef DRM_HDMI_HELPER
+#define DRM_HDMI_HELPER
+
+#include <linux/hdmi.h>
+
+struct drm_connector;
+struct drm_connector_state;
+struct drm_display_mode;
+
+int drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infoframe *frame,
+					     const struct drm_connector *connector,
+					     const struct drm_display_mode *mode);
+int drm_hdmi_vendor_infoframe_from_display_mode(struct hdmi_vendor_infoframe *frame,
+						const struct drm_connector *connector,
+						const struct drm_display_mode *mode);
+
+void drm_hdmi_avi_infoframe_colorimetry(struct hdmi_avi_infoframe *frame,
+					const struct drm_connector_state *conn_state);
+
+void drm_hdmi_avi_infoframe_bars(struct hdmi_avi_infoframe *frame,
+				 const struct drm_connector_state *conn_state);
+
+void drm_hdmi_avi_infoframe_content_type(struct hdmi_avi_infoframe *frame,
+					 const struct drm_connector_state *conn_state);
+
+void drm_hdmi_avi_infoframe_quant_range(struct hdmi_avi_infoframe *frame,
+					const struct drm_connector *connector,
+					const struct drm_display_mode *mode,
+					enum hdmi_quantization_range rgb_quant_range);
+
+int drm_hdmi_infoframe_set_hdr_metadata(struct hdmi_drm_infoframe *frame,
+					const struct drm_connector_state *conn_state);
+
+#endif
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 5166186146f4..81598b923003 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1784,8 +1784,6 @@ int drm_mode_create_aspect_ratio_property(struct drm_device *dev);
 int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector);
 int drm_mode_create_dp_colorspace_property(struct drm_connector *connector);
 int drm_mode_create_content_type_property(struct drm_device *dev);
-void drm_hdmi_avi_infoframe_content_type(struct hdmi_avi_infoframe *frame,
-					 const struct drm_connector_state *conn_state);
 
 int drm_mode_create_suggested_offset_properties(struct drm_device *dev);
 
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 144c495b99c4..e6e9e4557067 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -391,33 +391,6 @@ drm_load_edid_firmware(struct drm_connector *connector)
 
 bool drm_edid_are_equal(const struct edid *edid1, const struct edid *edid2);
 
-int
-drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infoframe *frame,
-					 const struct drm_connector *connector,
-					 const struct drm_display_mode *mode);
-int
-drm_hdmi_vendor_infoframe_from_display_mode(struct hdmi_vendor_infoframe *frame,
-					    const struct drm_connector *connector,
-					    const struct drm_display_mode *mode);
-
-void
-drm_hdmi_avi_infoframe_colorimetry(struct hdmi_avi_infoframe *frame,
-				   const struct drm_connector_state *conn_state);
-
-void
-drm_hdmi_avi_infoframe_bars(struct hdmi_avi_infoframe *frame,
-			    const struct drm_connector_state *conn_state);
-
-void
-drm_hdmi_avi_infoframe_quant_range(struct hdmi_avi_infoframe *frame,
-				   const struct drm_connector *connector,
-				   const struct drm_display_mode *mode,
-				   enum hdmi_quantization_range rgb_quant_range);
-
-int
-drm_hdmi_infoframe_set_hdr_metadata(struct hdmi_drm_infoframe *frame,
-				    const struct drm_connector_state *conn_state);
-
 /**
  * drm_eld_mnl - Get ELD monitor name length in bytes.
  * @eld: pointer to an eld memory structure with mnl set
@@ -587,6 +560,10 @@ void drm_edid_get_monitor_name(struct edid *edid, char *name,
 struct drm_display_mode *drm_mode_find_dmt(struct drm_device *dev,
 					   int hsize, int vsize, int fresh,
 					   bool rb);
+
+u8 drm_match_hdmi_mode(const struct drm_display_mode *to_match);
+enum hdmi_picture_aspect drm_get_cea_aspect_ratio(const u8 video_code);
+enum hdmi_picture_aspect drm_get_hdmi_aspect_ratio(const u8 video_code);
 struct drm_display_mode *
 drm_display_mode_from_cea_vic(struct drm_device *dev,
 			      u8 video_code);
-- 
2.35.1

