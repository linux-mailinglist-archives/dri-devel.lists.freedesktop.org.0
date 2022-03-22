Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CE94E46A7
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 20:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4272010E253;
	Tue, 22 Mar 2022 19:27:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B864010E1F2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Mar 2022 19:27:48 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5C3EC1F38D;
 Tue, 22 Mar 2022 19:27:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1647977267; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FV2zICZGfMkD6be7kCtHdn8l12QllrL0SHMbjZtpUaI=;
 b=UYnE+Tn961xrZLXu2GBkCQblJ8byvC1RdNziv1/FqiyiC8454uI8LIbKvpdc1jiK1uEPqj
 uLl/uURjLyaZuQykQ/0OX5bxsupsMY8w6od4KjQ7ImIAFtAtv8oaRMMQdW7/zfc1Q69lXv
 dx6uwtW0ie7O8v2nIreIZVyne2k2UTQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1647977267;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FV2zICZGfMkD6be7kCtHdn8l12QllrL0SHMbjZtpUaI=;
 b=mAF8fYcRPAKwHp8aJhxN/LYr83n4Mhf4G/gSlnD25qrDi3PiEVg4GCGbdZRv+WfZ01pBfj
 mHHKDkpp1P4m4NAw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2A6C813479;
 Tue, 22 Mar 2022 19:27:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 4PhPCTMjOmIZMAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 22 Mar 2022 19:27:47 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, jani.nikula@linux.intel.com, lyude@redhat.com
Subject: [PATCH 5/8] drm/display: Move DSC header and helpers into
 display-helper module
Date: Tue, 22 Mar 2022 20:27:40 +0100
Message-Id: <20220322192743.14414-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220322192743.14414-1-tzimmermann@suse.de>
References: <20220322192743.14414-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

DSC is the Display Stream Compression standard for DisplayPort. Move
the DSC code into display/ and split the header into files for protocol
core and DRM helpers. Adapt all users of the code. No functional
changes.

To avoid the proliferation of Kconfig options, DSC is part of DRM's
support for DisplayPort. If necessary, a new option could make DSC an
independent feature.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 Documentation/gpu/drm-kms-helpers.rst         |  6 +++---
 drivers/gpu/drm/Makefile                      |  2 +-
 .../gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c  |  2 ++
 .../gpu/drm/amd/display/dc/dcn20/dcn20_dsc.h  |  2 +-
 .../drm/amd/display/dc/dml/dsc/rc_calc_fpu.h  |  2 +-
 drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c   |  4 ++--
 .../gpu/drm/amd/display/dc/dsc/dscc_types.h   |  2 +-
 .../gpu/drm/amd/display/dc/dsc/rc_calc_dpi.c  |  2 +-
 drivers/gpu/drm/display/Makefile              |  3 ++-
 .../{drm_dsc.c => display/drm_dsc_helper.c}   |  2 +-
 drivers/gpu/drm/drm_mipi_dsi.c                |  6 +++---
 drivers/gpu/drm/i915/display/icl_dsi.c        |  1 +
 drivers/gpu/drm/i915/display/intel_bios.c     |  1 +
 .../drm/i915/display/intel_display_types.h    |  2 +-
 drivers/gpu/drm/i915/display/intel_dp.c       |  1 +
 .../gpu/drm/i915/display/intel_qp_tables.c    |  2 +-
 drivers/gpu/drm/i915/display/intel_vdsc.c     |  2 ++
 include/drm/{ => display}/drm_dsc.h           |  8 +-------
 include/drm/display/drm_dsc_helper.h          | 20 +++++++++++++++++++
 19 files changed, 46 insertions(+), 24 deletions(-)
 rename drivers/gpu/drm/{drm_dsc.c => display/drm_dsc_helper.c} (99%)
 rename include/drm/{ => display}/drm_dsc.h (97%)
 create mode 100644 include/drm/display/drm_dsc_helper.h

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index 09463ee99730..7af55fb4072c 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -326,13 +326,13 @@ MIPI DSI Helper Functions Reference
 Display Stream Compression Helper Functions Reference
 =====================================================
 
-.. kernel-doc:: drivers/gpu/drm/drm_dsc.c
+.. kernel-doc:: drivers/gpu/drm/display/drm_dsc_helper.c
    :doc: dsc helpers
 
-.. kernel-doc:: include/drm/drm_dsc.h
+.. kernel-doc:: include/drm/display/drm_dsc.h
    :internal:
 
-.. kernel-doc:: drivers/gpu/drm/drm_dsc.c
+.. kernel-doc:: drivers/gpu/drm/display/drm_dsc_helper.c
    :export:
 
 Output Probing Helper Functions Reference
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 07f7a70a78ea..b8353af70152 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -58,7 +58,7 @@ obj-$(CONFIG_DRM_TTM_HELPER) += drm_ttm_helper.o
 #
 
 drm_kms_helper-y := drm_bridge_connector.o drm_crtc_helper.o \
-		drm_dsc.o drm_encoder_slave.o drm_flip_work.o drm_hdcp.o \
+		drm_encoder_slave.o drm_flip_work.o drm_hdcp.o \
 		drm_probe_helper.o \
 		drm_plane_helper.o drm_atomic_helper.o \
 		drm_kms_helper_common.o \
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c
index ef5c4c0f4d6c..6f24ceab97ad 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c
@@ -23,6 +23,8 @@
  *
  */
 
+#include <drm/display/drm_dsc_helper.h>
+
 #include "reg_helper.h"
 #include "dcn20_dsc.h"
 #include "dsc/dscc_types.h"
diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.h b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.h
index 1118e33aaa2c..c21ecedc4692 100644
--- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.h
+++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.h
@@ -26,7 +26,7 @@
 
 #include "dsc.h"
 #include "dsc/dscc_types.h"
-#include <drm/drm_dsc.h>
+#include <drm/display/drm_dsc.h>
 
 #define TO_DCN20_DSC(dsc)\
 	container_of(dsc, struct dcn20_dsc, base)
diff --git a/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.h b/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.h
index cad244c023cd..d7cd8cc24758 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.h
+++ b/drivers/gpu/drm/amd/display/dc/dml/dsc/rc_calc_fpu.h
@@ -27,7 +27,7 @@
 #define __RC_CALC_FPU_H__
 
 #include "os_types.h"
-#include <drm/drm_dsc.h>
+#include <drm/display/drm_dsc.h>
 
 #define QP_SET_SIZE 15
 
diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
index 411b79979e2e..8da28bcfac7e 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
+++ b/drivers/gpu/drm/amd/display/dc/dsc/dc_dsc.c
@@ -22,10 +22,10 @@
  * Author: AMD
  */
 
-#include <drm/drm_dsc.h>
+#include <drm/display/drm_dp_helper.h>
+#include <drm/display/drm_dsc_helper.h>
 #include "dc_hw_types.h"
 #include "dsc.h"
-#include <drm/display/drm_dp_helper.h>
 #include "dc.h"
 #include "rc_calc.h"
 #include "fixed31_32.h"
diff --git a/drivers/gpu/drm/amd/display/dc/dsc/dscc_types.h b/drivers/gpu/drm/amd/display/dc/dsc/dscc_types.h
index 9f70e87b3ecb..ad80bde9bc0f 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/dscc_types.h
+++ b/drivers/gpu/drm/amd/display/dc/dsc/dscc_types.h
@@ -26,7 +26,7 @@
 #ifndef __DSCC_TYPES_H__
 #define __DSCC_TYPES_H__
 
-#include <drm/drm_dsc.h>
+#include <drm/display/drm_dsc.h>
 
 #ifndef NUM_BUF_RANGES
 #define NUM_BUF_RANGES 15
diff --git a/drivers/gpu/drm/amd/display/dc/dsc/rc_calc_dpi.c b/drivers/gpu/drm/amd/display/dc/dsc/rc_calc_dpi.c
index 7e306aa3e2b9..f0aea988fef0 100644
--- a/drivers/gpu/drm/amd/display/dc/dsc/rc_calc_dpi.c
+++ b/drivers/gpu/drm/amd/display/dc/dsc/rc_calc_dpi.c
@@ -22,7 +22,7 @@
  * Authors: AMD
  *
  */
-#include <drm/drm_dsc.h>
+#include <drm/display/drm_dsc_helper.h>
 #include "dscc_types.h"
 #include "rc_calc.h"
 
diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
index 90f12e9b4735..cb750af7d63f 100644
--- a/drivers/gpu/drm/display/Makefile
+++ b/drivers/gpu/drm/display/Makefile
@@ -3,7 +3,8 @@
 obj-$(CONFIG_DRM_DP_AUX_BUS) += drm_dp_aux_bus.o
 
 drm_display_helper-y := drm_display_helper_mod.o
-drm_display_helper-$(CONFIG_DRM_DP_HELPER) := drm_dp_helper.o drm_dp_dual_mode_helper.o drm_dp_mst_topology.o
+drm_display_helper-$(CONFIG_DRM_DP_HELPER) := drm_dp_helper.o drm_dp_dual_mode_helper.o \
+					      drm_dp_mst_topology.o drm_dsc_helper.o
 drm_display_helper-$(CONFIG_DRM_DP_AUX_CHARDEV) += drm_dp_aux_dev.o
 drm_display_helper-$(CONFIG_DRM_DP_CEC) += drm_dp_cec.o
 
diff --git a/drivers/gpu/drm/drm_dsc.c b/drivers/gpu/drm/display/drm_dsc_helper.c
similarity index 99%
rename from drivers/gpu/drm/drm_dsc.c
rename to drivers/gpu/drm/display/drm_dsc_helper.c
index 2428bdfc4c8f..c869c6e51e2b 100644
--- a/drivers/gpu/drm/drm_dsc.c
+++ b/drivers/gpu/drm/display/drm_dsc_helper.c
@@ -13,8 +13,8 @@
 #include <linux/byteorder/generic.h>
 
 #include <drm/display/drm_dp_helper.h>
+#include <drm/display/drm_dsc_helper.h>
 #include <drm/drm_print.h>
-#include <drm/drm_dsc.h>
 
 /**
  * DOC: dsc helpers
diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
index 18cef04df2f2..c40bde96cfdf 100644
--- a/drivers/gpu/drm/drm_mipi_dsi.c
+++ b/drivers/gpu/drm/drm_mipi_dsi.c
@@ -25,16 +25,16 @@
  * USE OR OTHER DEALINGS IN THE SOFTWARE.
  */
 
-#include <drm/drm_mipi_dsi.h>
-
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 
-#include <drm/drm_dsc.h>
+#include <drm/display/drm_dsc.h>
+#include <drm/drm_mipi_dsi.h>
 #include <drm/drm_print.h>
+
 #include <video/mipi_display.h>
 
 /**
diff --git a/drivers/gpu/drm/i915/display/icl_dsi.c b/drivers/gpu/drm/i915/display/icl_dsi.c
index 00cae5d26637..146cbaae2ede 100644
--- a/drivers/gpu/drm/i915/display/icl_dsi.c
+++ b/drivers/gpu/drm/i915/display/icl_dsi.c
@@ -25,6 +25,7 @@
  *   Jani Nikula <jani.nikula@intel.com>
  */
 
+#include <drm/display/drm_dsc_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_mipi_dsi.h>
 
diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 3a990918eab7..b300cd1f557d 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -26,6 +26,7 @@
  */
 
 #include <drm/display/drm_dp_helper.h>
+#include <drm/display/drm_dsc_helper.h>
 
 #include "display/intel_display.h"
 #include "display/intel_display_types.h"
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index d3b5d1325d49..b924fc5de83a 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -33,9 +33,9 @@
 
 #include <drm/display/drm_dp_dual_mode_helper.h>
 #include <drm/display/drm_dp_mst_helper.h>
+#include <drm/display/drm_dsc.h>
 #include <drm/drm_atomic.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_dsc.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 9477479d8449..cad8cba93ba8 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -36,6 +36,7 @@
 #include <asm/byteorder.h>
 
 #include <drm/display/drm_dp_helper.h>
+#include <drm/display/drm_dsc_helper.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
diff --git a/drivers/gpu/drm/i915/display/intel_qp_tables.c b/drivers/gpu/drm/i915/display/intel_qp_tables.c
index c626a24fe98f..6f8e4ec5c0fb 100644
--- a/drivers/gpu/drm/i915/display/intel_qp_tables.c
+++ b/drivers/gpu/drm/i915/display/intel_qp_tables.c
@@ -3,7 +3,7 @@
  * Copyright © 2021 Intel Corporation
  */
 
-#include <drm/drm_dsc.h>
+#include <drm/display/drm_dsc.h>
 
 #include "i915_utils.h"
 #include "intel_qp_tables.h"
diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index e59c29ab1300..43e1bbc1e303 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -7,6 +7,8 @@
  */
 #include <linux/limits.h>
 
+#include <drm/display/drm_dsc_helper.h>
+
 #include "i915_drv.h"
 #include "intel_crtc.h"
 #include "intel_de.h"
diff --git a/include/drm/drm_dsc.h b/include/drm/display/drm_dsc.h
similarity index 97%
rename from include/drm/drm_dsc.h
rename to include/drm/display/drm_dsc.h
index 84e3d11cc1bb..bc90273d06a6 100644
--- a/include/drm/drm_dsc.h
+++ b/include/drm/display/drm_dsc.h
@@ -8,7 +8,7 @@
 #ifndef DRM_DSC_H_
 #define DRM_DSC_H_
 
-#include <drm/display/drm_dp_helper.h>
+#include <drm/display/drm_dp.h>
 
 /* VESA Display Stream Compression DSC 1.2 constants */
 #define DSC_NUM_BUF_RANGES			15
@@ -602,10 +602,4 @@ struct drm_dsc_pps_infoframe {
 	struct drm_dsc_picture_parameter_set pps_payload;
 } __packed;
 
-void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);
-int drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 rc_buffer_size);
-void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_sdp,
-				const struct drm_dsc_config *dsc_cfg);
-int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
-
 #endif /* _DRM_DSC_H_ */
diff --git a/include/drm/display/drm_dsc_helper.h b/include/drm/display/drm_dsc_helper.h
new file mode 100644
index 000000000000..6da3716f9f39
--- /dev/null
+++ b/include/drm/display/drm_dsc_helper.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: MIT
+ * Copyright (C) 2018 Intel Corp.
+ *
+ * Authors:
+ * Manasi Navare <manasi.d.navare@intel.com>
+ */
+
+#ifndef DRM_DSC_HELPER_H_
+#define DRM_DSC_HELPER_H_
+
+#include <drm/display/drm_dsc.h>
+
+void drm_dsc_dp_pps_header_init(struct dp_sdp_header *pps_header);
+int drm_dsc_dp_rc_buffer_size(u8 rc_buffer_block_size, u8 rc_buffer_size);
+void drm_dsc_pps_payload_pack(struct drm_dsc_picture_parameter_set *pps_sdp,
+				const struct drm_dsc_config *dsc_cfg);
+int drm_dsc_compute_rc_parameters(struct drm_dsc_config *vdsc_cfg);
+
+#endif /* _DRM_DSC_HELPER_H_ */
+
-- 
2.35.1

