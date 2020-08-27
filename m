Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FB725553E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 09:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E306EB57;
	Fri, 28 Aug 2020 07:29:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6D5E6E459
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Aug 2020 21:18:04 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1598563084; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=LLKV1YoCI3eTg41AHlZwHW5Q6G10DzKvQ18GW6uJ1cQ=;
 b=UrY/MJneMOlBW5fQwI2q3OYs2aLsV1tZe02Mvw269wLUAqNKqLUYTuRINE76fuBpVDsyJhLV
 0eSH3lhnwOfIqxyx8M3XHK3ljYcoP+T/wqAI7hQ+7+QrtyVxYmiNRtX9QLFlHVU1V4e+6j9N
 +RcHeezaDClJDD2oxZz8jK46pZQ=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f48230c0c264e6b00e7324b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 27 Aug 2020 21:18:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id EABDCC4344C; Thu, 27 Aug 2020 21:18:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from linuxdisplay-lab-04.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: tanmay)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 82B07C43387;
 Thu, 27 Aug 2020 21:17:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 82B07C43387
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=tanmay@codeaurora.org
From: Tanmay Shah <tanmay@codeaurora.org>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v12 2/5] drm/msm/dp: add displayPort driver support
Date: Thu, 27 Aug 2020 14:16:55 -0700
Message-Id: <20200827211658.27479-3-tanmay@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200827211658.27479-1-tanmay@codeaurora.org>
References: <20200827211658.27479-1-tanmay@codeaurora.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 28 Aug 2020 07:29:10 +0000
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, swboyd@chromium.org,
 khsieh@codeaurora.org, seanpaul@chromium.org,
 Tanmay Shah <tanmay@codeaurora.org>, Guenter Roeck <groeck@chromium.org>,
 Vara Reddy <varar@codeaurora.org>, aravindh@codeaurora.org,
 Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chandan Uddaraju <chandanu@codeaurora.org>

Add the needed displayPort files to enable DP driver
on msm target.

"dp_display" module is the main module that calls into
other sub-modules. "dp_drm" file represents the interface
between DRM framework and DP driver.

Changes in v12:

-- Add support of pm ops in display port driver
-- Clear bpp depth bits before writing to MISC register
-- Fix edid read

Previous Change log:
https://lkml.kernel.org/lkml/20200818051137.21478-3-tanmay@codeaurora.org/

Signed-off-by: Chandan Uddaraju <chandanu@codeaurora.org>
Signed-off-by: Vara Reddy <varar@codeaurora.org>
Signed-off-by: Tanmay Shah <tanmay@codeaurora.org>
Co-developed-by: Abhinav Kumar <abhinavk@codeaurora.org>
Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
Co-developed-by: Kuogee Hsieh <khsieh@codeaurora.org>
Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
Co-developed-by: Guenter Roeck <groeck@chromium.org>
Signed-off-by: Guenter Roeck <groeck@chromium.org>
Co-developed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/Kconfig                   |    8 +
 drivers/gpu/drm/msm/Makefile                  |   12 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   19 +
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |    8 +
 drivers/gpu/drm/msm/dp/dp_aux.c               |  535 ++++++
 drivers/gpu/drm/msm/dp/dp_aux.h               |   30 +
 drivers/gpu/drm/msm/dp/dp_catalog.c           | 1019 ++++++++++
 drivers/gpu/drm/msm/dp/dp_catalog.h           |  102 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c              | 1694 +++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h              |   35 +
 drivers/gpu/drm/msm/dp/dp_display.c           |  936 +++++++++
 drivers/gpu/drm/msm/dp/dp_display.h           |   28 +
 drivers/gpu/drm/msm/dp/dp_drm.c               |  168 ++
 drivers/gpu/drm/msm/dp/dp_drm.h               |   18 +
 drivers/gpu/drm/msm/dp/dp_hpd.c               |   69 +
 drivers/gpu/drm/msm/dp/dp_hpd.h               |   79 +
 drivers/gpu/drm/msm/dp/dp_link.c              | 1214 ++++++++++++
 drivers/gpu/drm/msm/dp/dp_link.h              |  132 ++
 drivers/gpu/drm/msm/dp/dp_panel.c             |  486 +++++
 drivers/gpu/drm/msm/dp/dp_panel.h             |   95 +
 drivers/gpu/drm/msm/dp/dp_parser.c            |  265 +++
 drivers/gpu/drm/msm/dp/dp_parser.h            |  139 ++
 drivers/gpu/drm/msm/dp/dp_power.c             |  363 ++++
 drivers/gpu/drm/msm/dp/dp_power.h             |   65 +
 drivers/gpu/drm/msm/dp/dp_reg.h               |  490 +++++
 drivers/gpu/drm/msm/msm_drv.c                 |    2 +
 drivers/gpu/drm/msm/msm_drv.h                 |   53 +-
 27 files changed, 8061 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dp/dp_aux.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_aux.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_catalog.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_catalog.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_ctrl.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_ctrl.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_display.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_display.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_drm.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_drm.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_hpd.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_link.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_link.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_panel.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_panel.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_parser.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_parser.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_power.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_power.h
 create mode 100644 drivers/gpu/drm/msm/dp/dp_reg.h

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 6deaa7d01654..0b59e4f184fb 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -57,6 +57,14 @@ config DRM_MSM_HDMI_HDCP
 	help
 	  Choose this option to enable HDCP state machine
 
+config DRM_MSM_DP
+	bool "Enable DisplayPort support in MSM DRM driver"
+	depends on DRM_MSM
+	help
+	  Compile in support for DP driver in MSM DRM driver. DP external
+	  display support is enabled through this config option. It can
+	  be primary or secondary display on device.
+
 config DRM_MSM_DSI
 	bool "Enable DSI support in MSM DRM driver"
 	depends on DRM_MSM
diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index 42f8aae28b31..af868e791210 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -2,6 +2,7 @@
 ccflags-y := -I $(srctree)/$(src)
 ccflags-y += -I $(srctree)/$(src)/disp/dpu1
 ccflags-$(CONFIG_DRM_MSM_DSI) += -I $(srctree)/$(src)/dsi
+ccflags-$(CONFIG_DRM_MSM_DP) += -I $(srctree)/$(src)/dp
 
 msm-y := \
 	adreno/adreno_device.o \
@@ -99,6 +100,17 @@ msm-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o
 
 msm-$(CONFIG_DRM_MSM_GPU_STATE)	+= adreno/a6xx_gpu_state.o
 
+msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
+	dp/dp_catalog.o \
+	dp/dp_ctrl.o \
+	dp/dp_display.o \
+	dp/dp_drm.o \
+	dp/dp_hpd.o \
+	dp/dp_link.o \
+	dp/dp_panel.o \
+	dp/dp_parser.o \
+	dp/dp_power.o
+
 msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
 msm-$(CONFIG_COMMON_CLK) += disp/mdp4/mdp4_lvds_pll.o
 msm-$(CONFIG_COMMON_CLK) += hdmi/hdmi_pll_8960.o
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index a97f6d2e5a08..8b14d7c42f37 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -995,6 +995,9 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 
 	trace_dpu_enc_mode_set(DRMID(drm_enc));
 
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp)
+		msm_dp_display_mode_set(priv->dp, drm_enc, mode, adj_mode);
+
 	list_for_each_entry(conn_iter, connector_list, head)
 		if (conn_iter->encoder == drm_enc)
 			conn = conn_iter;
@@ -1140,6 +1143,7 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	int ret = 0;
+	struct msm_drm_private *priv;
 	struct drm_display_mode *cur_mode = NULL;
 
 	if (!drm_enc) {
@@ -1150,6 +1154,7 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
 
 	mutex_lock(&dpu_enc->enc_lock);
 	cur_mode = &dpu_enc->base.crtc->state->adjusted_mode;
+	priv = drm_enc->dev->dev_private;
 
 	trace_dpu_enc_enable(DRMID(drm_enc), cur_mode->hdisplay,
 			     cur_mode->vdisplay);
@@ -1170,6 +1175,15 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
 
 	_dpu_encoder_virt_enable_helper(drm_enc);
 
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp) {
+		ret = msm_dp_display_enable(priv->dp,
+						drm_enc);
+		if (ret) {
+			DPU_ERROR_ENC(dpu_enc, "dp display enable failed: %d\n",
+				ret);
+			goto out;
+		}
+	}
 	dpu_enc->enabled = true;
 
 out:
@@ -1232,6 +1246,11 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 
 	dpu_rm_release(global_state, drm_enc);
 
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp) {
+		if (msm_dp_display_disable(priv->dp, drm_enc))
+			DPU_ERROR_ENC(dpu_enc, "dp display disable failed\n");
+	}
+
 	mutex_unlock(&dpu_enc->enc_lock);
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index b5a49050d131..be11a0c5e60c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -100,6 +100,14 @@ static void drm_mode_to_intf_timing_params(
 	 * display_v_end -= mode->hsync_start - mode->hdisplay;
 	 * }
 	 */
+	/* for DP/EDP, Shift timings to align it to bottom right */
+	if ((phys_enc->hw_intf->cap->type == INTF_DP) ||
+		(phys_enc->hw_intf->cap->type == INTF_EDP)) {
+		timing->h_back_porch += timing->h_front_porch;
+		timing->h_front_porch = 0;
+		timing->v_back_porch += timing->v_front_porch;
+		timing->v_front_porch = 0;
+	}
 }
 
 static u32 get_horizontal_total(const struct intf_timing_params *timing)
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.c b/drivers/gpu/drm/msm/dp/dp_aux.c
new file mode 100644
index 000000000000..6bf3a5712968
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_aux.c
@@ -0,0 +1,535 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/delay.h>
+
+#include "dp_reg.h"
+#include "dp_aux.h"
+
+#define DP_AUX_ENUM_STR(x)		#x
+
+struct dp_aux_private {
+	struct device *dev;
+	struct dp_catalog *catalog;
+
+	struct mutex mutex;
+	struct completion comp;
+
+	u32 aux_error_num;
+	u32 retry_cnt;
+	bool cmd_busy;
+	bool native;
+	bool read;
+	bool no_send_addr;
+	bool no_send_stop;
+	u32 offset;
+	u32 segment;
+	u32 isr;
+
+	struct drm_dp_aux dp_aux;
+};
+
+static const char *dp_aux_get_error(u32 aux_error)
+{
+	switch (aux_error) {
+	case DP_AUX_ERR_NONE:
+		return DP_AUX_ENUM_STR(DP_AUX_ERR_NONE);
+	case DP_AUX_ERR_ADDR:
+		return DP_AUX_ENUM_STR(DP_AUX_ERR_ADDR);
+	case DP_AUX_ERR_TOUT:
+		return DP_AUX_ENUM_STR(DP_AUX_ERR_TOUT);
+	case DP_AUX_ERR_NACK:
+		return DP_AUX_ENUM_STR(DP_AUX_ERR_NACK);
+	case DP_AUX_ERR_DEFER:
+		return DP_AUX_ENUM_STR(DP_AUX_ERR_DEFER);
+	case DP_AUX_ERR_NACK_DEFER:
+		return DP_AUX_ENUM_STR(DP_AUX_ERR_NACK_DEFER);
+	default:
+		return "unknown";
+	}
+}
+
+static u32 dp_aux_write(struct dp_aux_private *aux,
+			struct drm_dp_aux_msg *msg)
+{
+	u32 data[4], reg, len;
+	u8 *msgdata = msg->buffer;
+	int const AUX_CMD_FIFO_LEN = 128;
+	int i = 0;
+
+	if (aux->read)
+		len = 4;
+	else
+		len = msg->size + 4;
+
+	/*
+	 * cmd fifo only has depth of 144 bytes
+	 * limit buf length to 128 bytes here
+	 */
+	if (len > AUX_CMD_FIFO_LEN) {
+		DRM_ERROR("buf size greater than allowed size of 128 bytes\n");
+		return 0;
+	}
+
+	/* Pack cmd and write to HW */
+	data[0] = (msg->address >> 16) & 0xf; /* addr[19:16] */
+	if (aux->read)
+		data[0] |=  BIT(4); /* R/W */
+
+	data[1] = (msg->address >> 8) & 0xff;	/* addr[15:8] */
+	data[2] = msg->address & 0xff;		/* addr[7:0] */
+	data[3] = (msg->size - 1) & 0xff;	/* len[7:0] */
+
+	for (i = 0; i < len; i++) {
+		reg = (i < 4) ? data[i] : msgdata[i - 4];
+		/* index = 0, write */
+		reg = (((reg) << DP_AUX_DATA_OFFSET)
+		       & DP_AUX_DATA_MASK) | DP_AUX_DATA_WRITE;
+		if (i == 0)
+			reg |= DP_AUX_DATA_INDEX_WRITE;
+		aux->catalog->aux_data = reg;
+		dp_catalog_aux_write_data(aux->catalog);
+	}
+
+	dp_catalog_aux_clear_trans(aux->catalog, false);
+	dp_catalog_aux_clear_hw_interrupts(aux->catalog);
+
+	reg = 0; /* Transaction number == 1 */
+	if (!aux->native) { /* i2c */
+		reg |= DP_AUX_TRANS_CTRL_I2C;
+
+		if (aux->no_send_addr)
+			reg |= DP_AUX_TRANS_CTRL_NO_SEND_ADDR;
+
+		if (aux->no_send_stop)
+			reg |= DP_AUX_TRANS_CTRL_NO_SEND_STOP;
+	}
+
+	reg |= DP_AUX_TRANS_CTRL_GO;
+	aux->catalog->aux_data = reg;
+	dp_catalog_aux_write_trans(aux->catalog);
+
+	return len;
+}
+
+static int dp_aux_cmd_fifo_tx(struct dp_aux_private *aux,
+			      struct drm_dp_aux_msg *msg)
+{
+	u32 ret, len, timeout;
+	int aux_timeout_ms = HZ/4;
+
+	reinit_completion(&aux->comp);
+
+	len = dp_aux_write(aux, msg);
+	if (len == 0) {
+		DRM_ERROR("DP AUX write failed\n");
+		return -EINVAL;
+	}
+
+	timeout = wait_for_completion_timeout(&aux->comp, aux_timeout_ms);
+	if (!timeout) {
+		DRM_ERROR("aux %s timeout\n", (aux->read ? "read" : "write"));
+		return -ETIMEDOUT;
+	}
+
+	if (aux->aux_error_num == DP_AUX_ERR_NONE) {
+		ret = len;
+	} else {
+		DRM_ERROR_RATELIMITED("aux err: %s\n",
+			dp_aux_get_error(aux->aux_error_num));
+
+		ret = -EINVAL;
+	}
+
+	return ret;
+}
+
+static void dp_aux_cmd_fifo_rx(struct dp_aux_private *aux,
+		struct drm_dp_aux_msg *msg)
+{
+	u32 data;
+	u8 *dp;
+	u32 i, actual_i;
+	u32 len = msg->size;
+
+	dp_catalog_aux_clear_trans(aux->catalog, true);
+
+	data = DP_AUX_DATA_INDEX_WRITE; /* INDEX_WRITE */
+	data |= DP_AUX_DATA_READ;  /* read */
+
+	aux->catalog->aux_data = data;
+	dp_catalog_aux_write_data(aux->catalog);
+
+	dp = msg->buffer;
+
+	/* discard first byte */
+	data = dp_catalog_aux_read_data(aux->catalog);
+
+	for (i = 0; i < len; i++) {
+		data = dp_catalog_aux_read_data(aux->catalog);
+		*dp++ = (u8)((data >> DP_AUX_DATA_OFFSET) & 0xff);
+
+		actual_i = (data >> DP_AUX_DATA_INDEX_OFFSET) & 0xFF;
+		if (i != actual_i)
+			DRM_ERROR("Index mismatch: expected %d, found %d\n",
+				i, actual_i);
+	}
+}
+
+static void dp_aux_native_handler(struct dp_aux_private *aux)
+{
+	u32 isr = aux->isr;
+
+	if (isr & DP_INTR_AUX_I2C_DONE)
+		aux->aux_error_num = DP_AUX_ERR_NONE;
+	else if (isr & DP_INTR_WRONG_ADDR)
+		aux->aux_error_num = DP_AUX_ERR_ADDR;
+	else if (isr & DP_INTR_TIMEOUT)
+		aux->aux_error_num = DP_AUX_ERR_TOUT;
+	if (isr & DP_INTR_NACK_DEFER)
+		aux->aux_error_num = DP_AUX_ERR_NACK;
+	if (isr & DP_INTR_AUX_ERROR) {
+		aux->aux_error_num = DP_AUX_ERR_PHY;
+		dp_catalog_aux_clear_hw_interrupts(aux->catalog);
+	}
+
+	complete(&aux->comp);
+}
+
+static void dp_aux_i2c_handler(struct dp_aux_private *aux)
+{
+	u32 isr = aux->isr;
+
+	if (isr & DP_INTR_AUX_I2C_DONE) {
+		if (isr & (DP_INTR_I2C_NACK | DP_INTR_I2C_DEFER))
+			aux->aux_error_num = DP_AUX_ERR_NACK;
+		else
+			aux->aux_error_num = DP_AUX_ERR_NONE;
+	} else {
+		if (isr & DP_INTR_WRONG_ADDR)
+			aux->aux_error_num = DP_AUX_ERR_ADDR;
+		else if (isr & DP_INTR_TIMEOUT)
+			aux->aux_error_num = DP_AUX_ERR_TOUT;
+		if (isr & DP_INTR_NACK_DEFER)
+			aux->aux_error_num = DP_AUX_ERR_NACK_DEFER;
+		if (isr & DP_INTR_I2C_NACK)
+			aux->aux_error_num = DP_AUX_ERR_NACK;
+		if (isr & DP_INTR_I2C_DEFER)
+			aux->aux_error_num = DP_AUX_ERR_DEFER;
+		if (isr & DP_INTR_AUX_ERROR) {
+			aux->aux_error_num = DP_AUX_ERR_PHY;
+			dp_catalog_aux_clear_hw_interrupts(aux->catalog);
+		}
+	}
+
+	complete(&aux->comp);
+}
+
+static void dp_aux_update_offset_and_segment(struct dp_aux_private *aux,
+					     struct drm_dp_aux_msg *input_msg)
+{
+	u32 edid_address = 0x50;
+	u32 segment_address = 0x30;
+	bool i2c_read = input_msg->request &
+		(DP_AUX_I2C_READ & DP_AUX_NATIVE_READ);
+	u8 *data;
+
+	if (aux->native || i2c_read || ((input_msg->address != edid_address) &&
+		(input_msg->address != segment_address)))
+		return;
+
+
+	data = input_msg->buffer;
+	if (input_msg->address == segment_address)
+		aux->segment = *data;
+	else
+		aux->offset = *data;
+}
+
+/**
+ * dp_aux_transfer_helper() - helper function for EDID read transactions
+ *
+ * @aux: DP AUX private structure
+ * @input_msg: input message from DRM upstream APIs
+ * @send_seg: send the segment to sink
+ *
+ * return: void
+ *
+ * This helper function is used to fix EDID reads for non-compliant
+ * sinks that do not handle the i2c middle-of-transaction flag correctly.
+ */
+static void dp_aux_transfer_helper(struct dp_aux_private *aux,
+				   struct drm_dp_aux_msg *input_msg,
+				   bool send_seg)
+{
+	struct drm_dp_aux_msg helper_msg;
+	u32 message_size = 0x10;
+	u32 segment_address = 0x30;
+	u32 const edid_block_length = 0x80;
+	bool i2c_mot = input_msg->request & DP_AUX_I2C_MOT;
+	bool i2c_read = input_msg->request &
+		(DP_AUX_I2C_READ & DP_AUX_NATIVE_READ);
+
+	if (!i2c_mot || !i2c_read || (input_msg->size == 0))
+		return;
+
+	/*
+	 * Sending the segment value and EDID offset will be performed
+	 * from the DRM upstream EDID driver for each block. Avoid
+	 * duplicate AUX transactions related to this while reading the
+	 * first 16 bytes of each block.
+	 */
+	if (!(aux->offset % edid_block_length) || !send_seg)
+		goto end;
+
+	aux->read = false;
+	aux->cmd_busy = true;
+	aux->no_send_addr = true;
+	aux->no_send_stop = true;
+
+	/*
+	 * Send the segment address for every i2c read in which the
+	 * middle-of-tranaction flag is set. This is required to support EDID
+	 * reads of more than 2 blocks as the segment address is reset to 0
+	 * since we are overriding the middle-of-transaction flag for read
+	 * transactions.
+	 */
+
+	if (aux->segment) {
+		memset(&helper_msg, 0, sizeof(helper_msg));
+		helper_msg.address = segment_address;
+		helper_msg.buffer = &aux->segment;
+		helper_msg.size = 1;
+		dp_aux_cmd_fifo_tx(aux, &helper_msg);
+	}
+
+	/*
+	 * Send the offset address for every i2c read in which the
+	 * middle-of-transaction flag is set. This will ensure that the sink
+	 * will update its read pointer and return the correct portion of the
+	 * EDID buffer in the subsequent i2c read trasntion triggered in the
+	 * native AUX transfer function.
+	 */
+	memset(&helper_msg, 0, sizeof(helper_msg));
+	helper_msg.address = input_msg->address;
+	helper_msg.buffer = &aux->offset;
+	helper_msg.size = 1;
+	dp_aux_cmd_fifo_tx(aux, &helper_msg);
+
+end:
+	aux->offset += message_size;
+	if (aux->offset == 0x80 || aux->offset == 0x100)
+		aux->segment = 0x0; /* reset segment at end of block */
+}
+
+/*
+ * This function does the real job to process an AUX transaction.
+ * It will call aux_reset() function to reset the AUX channel,
+ * if the waiting is timeout.
+ */
+static ssize_t dp_aux_transfer(struct drm_dp_aux *dp_aux,
+			       struct drm_dp_aux_msg *msg)
+{
+	ssize_t ret;
+	int const aux_cmd_native_max = 16;
+	int const aux_cmd_i2c_max = 128;
+	int const retry_count = 5;
+	struct dp_aux_private *aux = container_of(dp_aux,
+		struct dp_aux_private, dp_aux);
+
+	mutex_lock(&aux->mutex);
+
+	aux->native = msg->request & (DP_AUX_NATIVE_WRITE & DP_AUX_NATIVE_READ);
+
+	/* Ignore address only message */
+	if ((msg->size == 0) || (msg->buffer == NULL)) {
+		msg->reply = aux->native ?
+			DP_AUX_NATIVE_REPLY_ACK : DP_AUX_I2C_REPLY_ACK;
+		ret = msg->size;
+		goto unlock_exit;
+	}
+
+	/* msg sanity check */
+	if ((aux->native && (msg->size > aux_cmd_native_max)) ||
+		(msg->size > aux_cmd_i2c_max)) {
+		DRM_ERROR("%s: invalid msg: size(%zu), request(%x)\n",
+			__func__, msg->size, msg->request);
+		ret = -EINVAL;
+		goto unlock_exit;
+	}
+
+	dp_aux_update_offset_and_segment(aux, msg);
+	dp_aux_transfer_helper(aux, msg, true);
+
+	aux->read = msg->request & (DP_AUX_I2C_READ & DP_AUX_NATIVE_READ);
+	aux->cmd_busy = true;
+
+	if (aux->read) {
+		aux->no_send_addr = true;
+		aux->no_send_stop = false;
+	} else {
+		aux->no_send_addr = true;
+		aux->no_send_stop = true;
+	}
+
+	ret = dp_aux_cmd_fifo_tx(aux, msg);
+
+	if (ret < 0) {
+		if (aux->native) {
+			aux->retry_cnt++;
+			if (!(aux->retry_cnt % retry_count))
+				dp_catalog_aux_update_cfg(aux->catalog,
+					PHY_AUX_CFG1);
+			dp_catalog_aux_reset(aux->catalog);
+		}
+		goto unlock_exit;
+	}
+
+	if (aux->aux_error_num == DP_AUX_ERR_NONE) {
+		if (aux->read)
+			dp_aux_cmd_fifo_rx(aux, msg);
+
+		msg->reply = aux->native ?
+			DP_AUX_NATIVE_REPLY_ACK : DP_AUX_I2C_REPLY_ACK;
+	} else {
+		/* Reply defer to retry */
+		msg->reply = aux->native ?
+			DP_AUX_NATIVE_REPLY_DEFER : DP_AUX_I2C_REPLY_DEFER;
+	}
+
+	/* Return requested size for success or retry */
+	ret = msg->size;
+	aux->retry_cnt = 0;
+
+unlock_exit:
+	aux->cmd_busy = false;
+	mutex_unlock(&aux->mutex);
+	return ret;
+}
+
+void dp_aux_isr(struct drm_dp_aux *dp_aux)
+{
+	struct dp_aux_private *aux;
+
+	if (!dp_aux) {
+		DRM_ERROR("invalid input\n");
+		return;
+	}
+
+	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
+
+	aux->isr = dp_catalog_aux_get_irq(aux->catalog);
+
+	if (!aux->cmd_busy)
+		return;
+
+	if (aux->native)
+		dp_aux_native_handler(aux);
+	else
+		dp_aux_i2c_handler(aux);
+}
+
+void dp_aux_reconfig(struct drm_dp_aux *dp_aux)
+{
+	struct dp_aux_private *aux;
+
+	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
+
+	dp_catalog_aux_update_cfg(aux->catalog, PHY_AUX_CFG1);
+	dp_catalog_aux_reset(aux->catalog);
+}
+
+void dp_aux_init(struct drm_dp_aux *dp_aux)
+{
+	struct dp_aux_private *aux;
+
+	if (!dp_aux) {
+		DRM_ERROR("invalid input\n");
+		return;
+	}
+
+	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
+
+	dp_catalog_aux_setup(aux->catalog);
+	dp_catalog_aux_enable(aux->catalog, true);
+	aux->retry_cnt = 0;
+}
+
+void dp_aux_deinit(struct drm_dp_aux *dp_aux)
+{
+	struct dp_aux_private *aux;
+
+	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
+
+	dp_catalog_aux_enable(aux->catalog, false);
+}
+
+int dp_aux_register(struct drm_dp_aux *dp_aux)
+{
+	struct dp_aux_private *aux;
+	int ret;
+
+	if (!dp_aux) {
+		DRM_ERROR("invalid input\n");
+		return -EINVAL;
+	}
+
+	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
+
+	aux->dp_aux.name = "dpu_dp_aux";
+	aux->dp_aux.dev = aux->dev;
+	aux->dp_aux.transfer = dp_aux_transfer;
+	ret = drm_dp_aux_register(&aux->dp_aux);
+	if (ret) {
+		DRM_ERROR("%s: failed to register drm aux: %d\n", __func__,
+				ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+void dp_aux_unregister(struct drm_dp_aux *dp_aux)
+{
+	drm_dp_aux_unregister(dp_aux);
+}
+
+struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog)
+{
+	struct dp_aux_private *aux;
+
+	if (!catalog) {
+		DRM_ERROR("invalid input\n");
+		return ERR_PTR(-ENODEV);
+	}
+
+	aux = devm_kzalloc(dev, sizeof(*aux), GFP_KERNEL);
+	if (!aux)
+		return ERR_PTR(-ENOMEM);
+
+	init_completion(&aux->comp);
+	aux->cmd_busy = false;
+	mutex_init(&aux->mutex);
+
+	aux->dev = dev;
+	aux->catalog = catalog;
+	aux->retry_cnt = 0;
+
+	return &aux->dp_aux;
+}
+
+void dp_aux_put(struct drm_dp_aux *dp_aux)
+{
+	struct dp_aux_private *aux;
+
+	if (!dp_aux)
+		return;
+
+	aux = container_of(dp_aux, struct dp_aux_private, dp_aux);
+
+	mutex_destroy(&aux->mutex);
+
+	devm_kfree(aux->dev, aux);
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_aux.h b/drivers/gpu/drm/msm/dp/dp_aux.h
new file mode 100644
index 000000000000..f8b8ba919465
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_aux.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DP_AUX_H_
+#define _DP_AUX_H_
+
+#include "dp_catalog.h"
+#include <drm/drm_dp_helper.h>
+
+#define DP_AUX_ERR_NONE		0
+#define DP_AUX_ERR_ADDR		-1
+#define DP_AUX_ERR_TOUT		-2
+#define DP_AUX_ERR_NACK		-3
+#define DP_AUX_ERR_DEFER	-4
+#define DP_AUX_ERR_NACK_DEFER	-5
+#define DP_AUX_ERR_PHY		-6
+
+int dp_aux_register(struct drm_dp_aux *dp_aux);
+void dp_aux_unregister(struct drm_dp_aux *dp_aux);
+void dp_aux_isr(struct drm_dp_aux *dp_aux);
+void dp_aux_init(struct drm_dp_aux *dp_aux);
+void dp_aux_deinit(struct drm_dp_aux *dp_aux);
+void dp_aux_reconfig(struct drm_dp_aux *dp_aux);
+
+struct drm_dp_aux *dp_aux_get(struct device *dev, struct dp_catalog *catalog);
+void dp_aux_put(struct drm_dp_aux *aux);
+
+#endif /*__DP_AUX_H_*/
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
new file mode 100644
index 000000000000..0ffde1a74852
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -0,0 +1,1019 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
+ */
+
+#define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
+
+#include <linux/delay.h>
+#include <linux/iopoll.h>
+#include <linux/rational.h>
+#include <drm/drm_dp_helper.h>
+
+#include "dp_catalog.h"
+#include "dp_reg.h"
+
+#define POLLING_SLEEP_US			1000
+#define POLLING_TIMEOUT_US			10000
+
+#define REFTIMER_DEFAULT_VALUE			0x20000
+#define SCRAMBLER_RESET_COUNT_VALUE		0xFC
+
+#define DP_INTERRUPT_STATUS_ACK_SHIFT	1
+#define DP_INTERRUPT_STATUS_MASK_SHIFT	2
+
+#define MSM_DP_CONTROLLER_AHB_OFFSET	0x0000
+#define MSM_DP_CONTROLLER_AHB_SIZE	0x0200
+#define MSM_DP_CONTROLLER_AUX_OFFSET	0x0200
+#define MSM_DP_CONTROLLER_AUX_SIZE	0x0200
+#define MSM_DP_CONTROLLER_LINK_OFFSET	0x0400
+#define MSM_DP_CONTROLLER_LINK_SIZE	0x0C00
+#define MSM_DP_CONTROLLER_P0_OFFSET	0x1000
+#define MSM_DP_CONTROLLER_P0_SIZE	0x0400
+
+#define DP_INTERRUPT_STATUS1 \
+	(DP_INTR_AUX_I2C_DONE| \
+	DP_INTR_WRONG_ADDR | DP_INTR_TIMEOUT | \
+	DP_INTR_NACK_DEFER | DP_INTR_WRONG_DATA_CNT | \
+	DP_INTR_I2C_NACK | DP_INTR_I2C_DEFER | \
+	DP_INTR_PLL_UNLOCKED | DP_INTR_AUX_ERROR)
+
+#define DP_INTERRUPT_STATUS1_ACK \
+	(DP_INTERRUPT_STATUS1 << DP_INTERRUPT_STATUS_ACK_SHIFT)
+#define DP_INTERRUPT_STATUS1_MASK \
+	(DP_INTERRUPT_STATUS1 << DP_INTERRUPT_STATUS_MASK_SHIFT)
+
+#define DP_INTERRUPT_STATUS2 \
+	(DP_INTR_READY_FOR_VIDEO | DP_INTR_IDLE_PATTERN_SENT | \
+	DP_INTR_FRAME_END | DP_INTR_CRC_UPDATED)
+
+#define DP_INTERRUPT_STATUS2_ACK \
+	(DP_INTERRUPT_STATUS2 << DP_INTERRUPT_STATUS_ACK_SHIFT)
+#define DP_INTERRUPT_STATUS2_MASK \
+	(DP_INTERRUPT_STATUS2 << DP_INTERRUPT_STATUS_MASK_SHIFT)
+
+static u8 const vm_pre_emphasis_hbr_rbr[4][4] = {
+	{0x00, 0x0C, 0x14, 0x19},
+	{0x00, 0x0B, 0x12, 0xFF},
+	{0x00, 0x0B, 0xFF, 0xFF},
+	{0x04, 0xFF, 0xFF, 0xFF}
+};
+
+static u8 const vm_voltage_swing_hbr_rbr[4][4] = {
+	{0x08, 0x0F, 0x16, 0x1F},
+	{0x11, 0x1E, 0x1F, 0xFF},
+	{0x19, 0x1F, 0xFF, 0xFF},
+	{0x1F, 0xFF, 0xFF, 0xFF}
+};
+
+/* AUX look-up-table configurations
+ * Pair of offset and config values for each LUT
+ */
+static u8 const aux_lut_offset[] = {
+	0x20, 0x24, 0x28, 0x2C, 0x30, 0x34, 0x38, 0x3C, 0x40, 0x44
+};
+
+static u8 const
+aux_lut_value[PHY_AUX_CFG_MAX][DP_AUX_CFG_MAX_VALUE_CNT] = {
+	{ 0x00, 0x00, 0x00, },
+	{ 0x13, 0x23, 0x1d, },
+	{ 0x24, 0x00, 0x00, },
+	{ 0x00, 0x00, 0x00, },
+	{ 0x0A, 0x00, 0x00, },
+	{ 0x26, 0x00, 0x00, },
+	{ 0x0A, 0x00, 0x00, },
+	{ 0x03, 0x00, 0x00, },
+	{ 0xBB, 0x00, 0x00, },
+	{ 0x03, 0x00, 0x00, }
+};
+
+struct dp_catalog_private {
+	struct device *dev;
+	struct dp_io *io;
+	struct dp_catalog dp_catalog;
+	u8 aux_lut_cfg_index[PHY_AUX_CFG_MAX];
+};
+
+static inline u32 dp_read_aux(struct dp_catalog_private *catalog, u32 offset)
+{
+	offset += MSM_DP_CONTROLLER_AUX_OFFSET;
+	return readl_relaxed(catalog->io->dp_controller.base + offset);
+}
+
+static inline void dp_write_aux(struct dp_catalog_private *catalog,
+			       u32 offset, u32 data)
+{
+	offset += MSM_DP_CONTROLLER_AUX_OFFSET;
+	/*
+	 * To make sure aux reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, catalog->io->dp_controller.base + offset);
+}
+
+static inline u32 dp_read_ahb(struct dp_catalog_private *catalog, u32 offset)
+{
+	offset += MSM_DP_CONTROLLER_AHB_OFFSET;
+	return readl_relaxed(catalog->io->dp_controller.base + offset);
+}
+
+static inline void dp_write_ahb(struct dp_catalog_private *catalog,
+			       u32 offset, u32 data)
+{
+	offset += MSM_DP_CONTROLLER_AHB_OFFSET;
+	/*
+	 * To make sure phy reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, catalog->io->dp_controller.base + offset);
+}
+
+static inline void dp_write_phy(struct dp_catalog_private *catalog,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure phy reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, catalog->io->phy_io.base + offset);
+}
+
+static inline u32 dp_read_phy(struct dp_catalog_private *catalog,
+			       u32 offset)
+{
+	/*
+	 * To make sure phy reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	return readl_relaxed(catalog->io->phy_io.base + offset);
+}
+
+static inline void dp_write_pll(struct dp_catalog_private *catalog,
+			       u32 offset, u32 data)
+{
+	writel_relaxed(data, catalog->io->dp_pll_io.base + offset);
+}
+
+static inline void dp_write_ln_tx0(struct dp_catalog_private *catalog,
+			       u32 offset, u32 data)
+{
+	writel_relaxed(data, catalog->io->ln_tx0_io.base + offset);
+}
+
+static inline void dp_write_ln_tx1(struct dp_catalog_private *catalog,
+			       u32 offset, u32 data)
+{
+	writel_relaxed(data, catalog->io->ln_tx1_io.base + offset);
+}
+
+static inline u32 dp_read_ln_tx0(struct dp_catalog_private *catalog,
+			       u32 offset)
+{
+	return readl_relaxed(catalog->io->ln_tx0_io.base + offset);
+}
+
+static inline u32 dp_read_ln_tx1(struct dp_catalog_private *catalog,
+			       u32 offset)
+{
+	return readl_relaxed(catalog->io->ln_tx1_io.base + offset);
+}
+
+static inline void dp_write_usb_cm(struct dp_catalog_private *catalog,
+			       u32 offset, u32 data)
+{
+	/*
+	 * To make sure usb reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, catalog->io->usb3_dp_com.base + offset);
+}
+
+static inline u32 dp_read_usb_cm(struct dp_catalog_private *catalog,
+			       u32 offset)
+{
+	/*
+	 * To make sure usb reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	return readl_relaxed(catalog->io->usb3_dp_com.base + offset);
+}
+
+static inline void dp_write_p0(struct dp_catalog_private *catalog,
+			       u32 offset, u32 data)
+{
+	offset += MSM_DP_CONTROLLER_P0_OFFSET;
+	/*
+	 * To make sure interface reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, catalog->io->dp_controller.base + offset);
+}
+
+static inline u32 dp_read_p0(struct dp_catalog_private *catalog,
+			       u32 offset)
+{
+	offset += MSM_DP_CONTROLLER_P0_OFFSET;
+	/*
+	 * To make sure interface reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	return readl_relaxed(catalog->io->dp_controller.base + offset);
+}
+
+static inline u32 dp_read_link(struct dp_catalog_private *catalog, u32 offset)
+{
+	offset += MSM_DP_CONTROLLER_LINK_OFFSET;
+	return readl_relaxed(catalog->io->dp_controller.base + offset);
+}
+
+static inline void dp_write_link(struct dp_catalog_private *catalog,
+			       u32 offset, u32 data)
+{
+	offset += MSM_DP_CONTROLLER_LINK_OFFSET;
+	/*
+	 * To make sure link reg writes happens before any other operation,
+	 * this function uses writel() instread of writel_relaxed()
+	 */
+	writel(data, catalog->io->dp_controller.base + offset);
+}
+
+/* aux related catalog functions */
+u32 dp_catalog_aux_read_data(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	return dp_read_aux(catalog, REG_DP_AUX_DATA);
+}
+
+int dp_catalog_aux_write_data(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	dp_write_aux(catalog, REG_DP_AUX_DATA, dp_catalog->aux_data);
+	return 0;
+}
+
+int dp_catalog_aux_write_trans(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	dp_write_aux(catalog, REG_DP_AUX_TRANS_CTRL, dp_catalog->aux_data);
+	return 0;
+}
+
+int dp_catalog_aux_clear_trans(struct dp_catalog *dp_catalog, bool read)
+{
+	u32 data;
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	if (read) {
+		data = dp_read_aux(catalog, REG_DP_AUX_TRANS_CTRL);
+		data &= ~DP_AUX_TRANS_CTRL_GO;
+		dp_write_aux(catalog, REG_DP_AUX_TRANS_CTRL, data);
+	} else {
+		dp_write_aux(catalog, REG_DP_AUX_TRANS_CTRL, 0);
+	}
+	return 0;
+}
+
+int dp_catalog_aux_clear_hw_interrupts(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	dp_read_aux(catalog, REG_DP_PHY_AUX_INTERRUPT_STATUS);
+	dp_write_aux(catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x1f);
+	dp_write_aux(catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0x9f);
+	dp_write_aux(catalog, REG_DP_PHY_AUX_INTERRUPT_CLEAR, 0);
+	return 0;
+}
+
+void dp_catalog_aux_reset(struct dp_catalog *dp_catalog)
+{
+	u32 aux_ctrl;
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	aux_ctrl = dp_read_aux(catalog, REG_DP_AUX_CTRL);
+
+	aux_ctrl |= DP_AUX_CTRL_RESET;
+	dp_write_aux(catalog, REG_DP_AUX_CTRL, aux_ctrl);
+	usleep_range(1000, 1100); /* h/w recommended delay */
+
+	aux_ctrl &= ~DP_AUX_CTRL_RESET;
+	dp_write_aux(catalog, REG_DP_AUX_CTRL, aux_ctrl);
+}
+
+void dp_catalog_aux_enable(struct dp_catalog *dp_catalog, bool enable)
+{
+	u32 aux_ctrl;
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	aux_ctrl = dp_read_aux(catalog, REG_DP_AUX_CTRL);
+
+	if (enable) {
+		dp_write_aux(catalog, REG_DP_TIMEOUT_COUNT, 0xffff);
+		dp_write_aux(catalog, REG_DP_AUX_LIMITS, 0xffff);
+		aux_ctrl |= DP_AUX_CTRL_ENABLE;
+	} else {
+		aux_ctrl &= ~DP_AUX_CTRL_ENABLE;
+	}
+
+	dp_write_aux(catalog, REG_DP_AUX_CTRL, aux_ctrl);
+}
+
+void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog,
+		enum dp_phy_aux_config_type type)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+	u32 new_index = 0, current_index = 0;
+
+	if (type >= PHY_AUX_CFG_MAX) {
+		DRM_ERROR("invalid input\n");
+		return;
+	}
+
+	current_index = catalog->aux_lut_cfg_index[type];
+	new_index = (current_index + 1) % DP_AUX_CFG_MAX_VALUE_CNT;
+	DRM_DEBUG_DP("Updating PHY_AUX_CFG%d from 0x%08x to 0x%08x\n",
+			type, aux_lut_value[type][current_index],
+			aux_lut_value[type][new_index]);
+
+	dp_write_phy(catalog, aux_lut_offset[type],
+			aux_lut_value[type][new_index]);
+	catalog->aux_lut_cfg_index[type] = new_index;
+}
+
+static void dump_regs(void __iomem *base, int len)
+{
+	int i;
+	u32 x0, x4, x8, xc;
+	u32 addr_off = 0;
+
+	len = DIV_ROUND_UP(len, 16);
+	for (i = 0; i < len; i++) {
+		x0 = readl_relaxed(base + addr_off);
+		x4 = readl_relaxed(base + addr_off + 0x04);
+		x8 = readl_relaxed(base + addr_off + 0x08);
+		xc = readl_relaxed(base + addr_off + 0x0c);
+
+		pr_info("%08x: %08x %08x %08x %08x", addr_off, x0, x4, x8, xc);
+		addr_off += 16;
+	}
+}
+
+void dp_catalog_dump_regs(struct dp_catalog *dp_catalog)
+{
+	u32 offset, len;
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+		struct dp_catalog_private, dp_catalog);
+
+	pr_info("AHB regs\n");
+	offset = MSM_DP_CONTROLLER_AHB_OFFSET;
+	len = MSM_DP_CONTROLLER_AHB_SIZE;
+	dump_regs(catalog->io->dp_controller.base + offset, len);
+
+	pr_info("AUXCLK regs\n");
+	offset = MSM_DP_CONTROLLER_AUX_OFFSET;
+	len = MSM_DP_CONTROLLER_AUX_SIZE;
+	dump_regs(catalog->io->dp_controller.base + offset, len);
+
+	pr_info("LCLK regs\n");
+	offset = MSM_DP_CONTROLLER_LINK_OFFSET;
+	len = MSM_DP_CONTROLLER_LINK_SIZE;
+	dump_regs(catalog->io->dp_controller.base + offset, len);
+
+	pr_info("P0CLK regs\n");
+	offset = MSM_DP_CONTROLLER_P0_OFFSET;
+	len = MSM_DP_CONTROLLER_P0_SIZE;
+	dump_regs(catalog->io->dp_controller.base + offset, len);
+
+	pr_info("USB3 DP COM regs\n");
+	dump_regs(catalog->io->usb3_dp_com.base, catalog->io->usb3_dp_com.len);
+
+	pr_info("LN TX0 regs\n");
+	dump_regs(catalog->io->ln_tx0_io.base, catalog->io->ln_tx0_io.len);
+
+	pr_info("LN TX1 regs\n");
+	dump_regs(catalog->io->ln_tx1_io.base, catalog->io->ln_tx1_io.len);
+
+	pr_info("DP PHY regs\n");
+	dump_regs(catalog->io->phy_io.base, catalog->io->phy_io.len);
+}
+
+void dp_catalog_aux_setup(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+	int i = 0;
+
+	dp_write_phy(catalog, REG_DP_PHY_PD_CTL, DP_PHY_PD_CTL_PWRDN |
+		DP_PHY_PD_CTL_AUX_PWRDN | DP_PHY_PD_CTL_PLL_PWRDN |
+		DP_PHY_PD_CTL_DP_CLAMP_EN);
+
+	/* Turn on BIAS current for PHY/PLL */
+	dp_write_pll(catalog,
+		QSERDES_COM_BIAS_EN_CLKBUFLR_EN, QSERDES_COM_BIAS_EN |
+		QSERDES_COM_BIAS_EN_MUX | QSERDES_COM_CLKBUF_L_EN |
+		QSERDES_COM_EN_SYSCLK_TX_SEL);
+
+	dp_write_phy(catalog, REG_DP_PHY_PD_CTL, DP_PHY_PD_CTL_PSR_PWRDN);
+
+	dp_write_phy(catalog, REG_DP_PHY_PD_CTL, DP_PHY_PD_CTL_PWRDN |
+		DP_PHY_PD_CTL_AUX_PWRDN | DP_PHY_PD_CTL_LANE_0_1_PWRDN
+		| DP_PHY_PD_CTL_LANE_2_3_PWRDN | DP_PHY_PD_CTL_PLL_PWRDN
+		| DP_PHY_PD_CTL_DP_CLAMP_EN);
+
+	dp_write_pll(catalog,
+		QSERDES_COM_BIAS_EN_CLKBUFLR_EN, QSERDES_COM_BIAS_EN |
+		QSERDES_COM_BIAS_EN_MUX | QSERDES_COM_CLKBUF_R_EN |
+		QSERDES_COM_CLKBUF_L_EN | QSERDES_COM_EN_SYSCLK_TX_SEL |
+		QSERDES_COM_CLKBUF_RX_DRIVE_L);
+
+	/* DP AUX CFG register programming */
+	for (i = 0; i < PHY_AUX_CFG_MAX; i++) {
+		DRM_DEBUG_DP("PHY_AUX_CFG%ds: offset=0x%08x, value=0x%08x\n",
+			i, aux_lut_offset[i], aux_lut_value[i][0]);
+		dp_write_phy(catalog, aux_lut_offset[i],
+				     aux_lut_value[i][0]);
+	}
+
+	dp_write_phy(catalog, REG_DP_PHY_AUX_INTERRUPT_MASK,
+			PHY_AUX_STOP_ERR_MASK |	PHY_AUX_DEC_ERR_MASK |
+			PHY_AUX_SYNC_ERR_MASK |	PHY_AUX_ALIGN_ERR_MASK |
+			PHY_AUX_REQ_ERR_MASK);
+}
+
+int dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+	u32 intr, intr_ack;
+
+	intr = dp_read_ahb(catalog, REG_DP_INTR_STATUS);
+	intr &= ~DP_INTERRUPT_STATUS1_MASK;
+	intr_ack = (intr & DP_INTERRUPT_STATUS1)
+			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
+	dp_write_ahb(catalog, REG_DP_INTR_STATUS, intr_ack |
+			DP_INTERRUPT_STATUS1_MASK);
+
+	return intr;
+
+}
+
+/* controller related catalog functions */
+void dp_catalog_ctrl_update_transfer_unit(struct dp_catalog *dp_catalog,
+				u32 dp_tu, u32 valid_boundary,
+				u32 valid_boundary2)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	dp_write_link(catalog, REG_DP_VALID_BOUNDARY, valid_boundary);
+	dp_write_link(catalog, REG_DP_TU, dp_tu);
+	dp_write_link(catalog, REG_DP_VALID_BOUNDARY_2, valid_boundary2);
+}
+
+void dp_catalog_ctrl_state_ctrl(struct dp_catalog *dp_catalog, u32 state)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	dp_write_link(catalog, REG_DP_STATE_CTRL, state);
+}
+
+void dp_catalog_ctrl_config_ctrl(struct dp_catalog *dp_catalog, u32 cfg)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	DRM_DEBUG_DP("DP_CONFIGURATION_CTRL=0x%x\n", cfg);
+
+	dp_write_link(catalog, REG_DP_CONFIGURATION_CTRL, cfg);
+}
+
+void dp_catalog_ctrl_lane_mapping(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+	u32 ln_0 = 0, ln_1 = 1, ln_2 = 2, ln_3 = 3; /* One-to-One mapping */
+	u32 ln_mapping;
+
+	ln_mapping = ln_0 << LANE0_MAPPING_SHIFT;
+	ln_mapping |= ln_1 << LANE1_MAPPING_SHIFT;
+	ln_mapping |= ln_2 << LANE2_MAPPING_SHIFT;
+	ln_mapping |= ln_3 << LANE3_MAPPING_SHIFT;
+
+	dp_write_link(catalog, REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING,
+			ln_mapping);
+}
+
+void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog,
+						bool enable)
+{
+	u32 mainlink_ctrl;
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	if (enable) {
+		/*
+		 * To make sure link reg writes happens before other operation,
+		 * dp_write_link() function uses writel()
+		 */
+		dp_write_link(catalog, REG_DP_MAINLINK_CTRL,
+				DP_MAINLINK_FB_BOUNDARY_SEL);
+		dp_write_link(catalog, REG_DP_MAINLINK_CTRL,
+					DP_MAINLINK_FB_BOUNDARY_SEL |
+					DP_MAINLINK_CTRL_RESET);
+		dp_write_link(catalog, REG_DP_MAINLINK_CTRL,
+					DP_MAINLINK_FB_BOUNDARY_SEL);
+		dp_write_link(catalog, REG_DP_MAINLINK_CTRL,
+					DP_MAINLINK_FB_BOUNDARY_SEL |
+					DP_MAINLINK_CTRL_ENABLE);
+	} else {
+		mainlink_ctrl = dp_read_link(catalog, REG_DP_MAINLINK_CTRL);
+		mainlink_ctrl &= ~DP_MAINLINK_CTRL_ENABLE;
+		dp_write_link(catalog, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
+	}
+}
+
+void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog,
+					u32 colorimetry_cfg,
+					u32 test_bits_depth)
+{
+	u32 misc_val;
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	misc_val = dp_read_link(catalog, REG_DP_MISC1_MISC0);
+
+	/* clear bpp bits */
+	misc_val &= ~(0x07 << DP_MISC0_TEST_BITS_DEPTH_SHIFT);
+	misc_val |= colorimetry_cfg << DP_MISC0_COLORIMETRY_CFG_SHIFT;
+	misc_val |= test_bits_depth << DP_MISC0_TEST_BITS_DEPTH_SHIFT;
+	/* Configure clock to synchronous mode */
+	misc_val |= DP_MISC0_SYNCHRONOUS_CLK;
+
+	DRM_DEBUG_DP("misc settings = 0x%x\n", misc_val);
+	dp_write_link(catalog, REG_DP_MISC1_MISC0, misc_val);
+}
+
+void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog,
+					u32 rate, u32 stream_rate_khz,
+					bool fixed_nvid)
+{
+	u32 pixel_m, pixel_n;
+	u32 mvid, nvid, div, pixel_div = 0, dispcc_input_rate;
+	u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
+	u32 const link_rate_hbr2 = 540000;
+	u32 const link_rate_hbr3 = 810000;
+	unsigned long den, num;
+
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	div = dp_read_phy(catalog, REG_DP_PHY_VCO_DIV);
+	div &= 0x03;
+
+	if (div == 0)
+		pixel_div = 6;
+	else if (div == 1)
+		pixel_div = 2;
+	else if (div == 2)
+		pixel_div = 4;
+	else
+		DRM_ERROR("Invalid pixel mux divider\n");
+
+	dispcc_input_rate = (rate * 10) / pixel_div;
+
+	rational_best_approximation(dispcc_input_rate, stream_rate_khz,
+			(unsigned long)(1 << 16) - 1,
+			(unsigned long)(1 << 16) - 1, &den, &num);
+
+	den = ~(den - num);
+	den = den & 0xFFFF;
+	pixel_m = num;
+	pixel_n = den;
+
+	mvid = (pixel_m & 0xFFFF) * 5;
+	nvid = (0xFFFF & (~pixel_n)) + (pixel_m & 0xFFFF);
+
+	if (nvid < nvid_fixed) {
+		u32 temp;
+
+		temp = (nvid_fixed / nvid) * nvid;
+		mvid = (nvid_fixed / nvid) * mvid;
+		nvid = temp;
+	}
+
+	if (link_rate_hbr2 == rate)
+		nvid *= 2;
+
+	if (link_rate_hbr3 == rate)
+		nvid *= 3;
+
+	DRM_DEBUG_DP("mvid=0x%x, nvid=0x%x\n", mvid, nvid);
+	dp_write_link(catalog, REG_DP_SOFTWARE_MVID, mvid);
+	dp_write_link(catalog, REG_DP_SOFTWARE_NVID, nvid);
+	dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
+}
+
+int dp_catalog_ctrl_set_pattern(struct dp_catalog *dp_catalog,
+					u32 pattern)
+{
+	int bit, ret;
+	u32 data;
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	bit = BIT(pattern - 1);
+	DRM_DEBUG_DP("hw: bit=%d train=%d\n", bit, pattern);
+	dp_write_link(catalog, REG_DP_STATE_CTRL, bit);
+
+	bit = BIT(pattern - 1) << DP_MAINLINK_READY_LINK_TRAINING_SHIFT;
+
+	/* Poll for mainlink ready status */
+	ret = readx_poll_timeout(readl, catalog->io->dp_controller.base +
+					MSM_DP_CONTROLLER_LINK_OFFSET +
+					REG_DP_MAINLINK_READY,
+					data, data & bit,
+					POLLING_SLEEP_US, POLLING_TIMEOUT_US);
+	if (ret < 0) {
+		DRM_ERROR("set pattern for link_train=%d failed\n", pattern);
+		return ret;
+	}
+	return 0;
+}
+
+void dp_catalog_ctrl_usb_reset(struct dp_catalog *dp_catalog, bool flip)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+	u32 typec_ctrl;
+
+	dp_write_usb_cm(catalog, REG_USB3_DP_COM_RESET_OVRD_CTRL,
+			USB3_DP_COM_OVRD_CTRL_SW_DPPHY_RESET_MUX |
+			USB3_DP_COM_OVRD_CTRL_SW_USB3PHY_RESET_MUX);
+	dp_write_usb_cm(catalog, REG_USB3_DP_COM_PHY_MODE_CTRL,
+						USB3_DP_COM_PHY_MODE_DP);
+	dp_write_usb_cm(catalog, REG_USB3_DP_COM_SW_RESET,
+						USB3_DP_COM_SW_RESET_SET);
+
+	/* Default configuration i.e CC1 */
+	typec_ctrl = USB3_DP_COM_TYPEC_CTRL_PORTSEL_MUX;
+	if (flip)
+		typec_ctrl |= USB3_DP_COM_TYPEC_CTRL_PORTSEL;
+
+	dp_write_usb_cm(catalog, REG_USB3_DP_COM_TYPEC_CTRL, typec_ctrl);
+
+	dp_write_usb_cm(catalog, REG_USB3_DP_COM_SWI_CTRL, 0x00);
+	dp_write_usb_cm(catalog, REG_USB3_DP_COM_SW_RESET, 0x00);
+
+	dp_write_usb_cm(catalog, REG_USB3_DP_COM_POWER_DOWN_CTRL,
+					USB3_DP_COM_POWER_DOWN_CTRL_SW_PWRDN);
+	dp_write_usb_cm(catalog, REG_USB3_DP_COM_RESET_OVRD_CTRL, 0x00);
+
+}
+
+void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog)
+{
+	u32 sw_reset;
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	sw_reset = dp_read_ahb(catalog, REG_DP_SW_RESET);
+
+	sw_reset |= DP_SW_RESET;
+	dp_write_ahb(catalog, REG_DP_SW_RESET, sw_reset);
+	usleep_range(1000, 1100); /* h/w recommended delay */
+
+	sw_reset &= ~DP_SW_RESET;
+	dp_write_ahb(catalog, REG_DP_SW_RESET, sw_reset);
+}
+
+bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog)
+{
+	u32 data;
+	int ret;
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	/* Poll for mainlink ready status */
+	ret = readl_poll_timeout(catalog->io->dp_controller.base +
+				MSM_DP_CONTROLLER_LINK_OFFSET +
+				REG_DP_MAINLINK_READY,
+				data, data & DP_MAINLINK_READY_FOR_VIDEO,
+				POLLING_SLEEP_US, POLLING_TIMEOUT_US);
+	if (ret < 0) {
+		DRM_ERROR("mainlink not ready\n");
+		return false;
+	}
+
+	return true;
+}
+
+void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog,
+						bool enable)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	if (enable) {
+		dp_write_ahb(catalog, REG_DP_INTR_STATUS,
+				DP_INTERRUPT_STATUS1_MASK);
+		dp_write_ahb(catalog, REG_DP_INTR_STATUS2,
+				DP_INTERRUPT_STATUS2_MASK);
+	} else {
+		dp_write_ahb(catalog, REG_DP_INTR_STATUS, 0x00);
+		dp_write_ahb(catalog, REG_DP_INTR_STATUS2, 0x00);
+	}
+}
+
+void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog, bool en)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	if (en) {
+		u32 reftimer = dp_read_aux(catalog, REG_DP_DP_HPD_REFTIMER);
+
+		dp_write_aux(catalog, REG_DP_DP_HPD_INT_ACK,
+				DP_DP_HPD_PLUG_INT_ACK |
+				DP_DP_IRQ_HPD_INT_ACK |
+				DP_DP_HPD_REPLUG_INT_ACK |
+				DP_DP_HPD_UNPLUG_INT_ACK);
+		dp_write_aux(catalog, REG_DP_DP_HPD_INT_MASK,
+				DP_DP_HPD_PLUG_INT_MASK |
+				DP_DP_IRQ_HPD_INT_MASK |
+				DP_DP_HPD_REPLUG_INT_MASK |
+				DP_DP_HPD_UNPLUG_INT_MASK);
+
+		/* Configure REFTIMER */
+		reftimer |= REFTIMER_DEFAULT_VALUE;
+		dp_write_aux(catalog, REG_DP_DP_HPD_REFTIMER, reftimer);
+		/* Enable HPD */
+		dp_write_aux(catalog, REG_DP_DP_HPD_CTRL,
+				DP_DP_HPD_CTRL_HPD_EN);
+	} else {
+		/* Disable HPD */
+		dp_write_aux(catalog, REG_DP_DP_HPD_CTRL, 0x0);
+	}
+}
+
+int dp_catalog_ctrl_get_interrupt(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+	u32 intr, intr_ack;
+
+	intr = dp_read_ahb(catalog, REG_DP_INTR_STATUS2);
+	intr &= ~DP_INTERRUPT_STATUS2_MASK;
+	intr_ack = (intr & DP_INTERRUPT_STATUS2)
+			<< DP_INTERRUPT_STATUS_ACK_SHIFT;
+	dp_write_ahb(catalog, REG_DP_INTR_STATUS2,
+			intr_ack | DP_INTERRUPT_STATUS2_MASK);
+
+	return intr;
+}
+
+void dp_catalog_ctrl_phy_reset(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	dp_write_ahb(catalog, REG_DP_PHY_CTRL,
+			DP_PHY_CTRL_SW_RESET_PLL | DP_PHY_CTRL_SW_RESET);
+	usleep_range(1000, 1100); /* h/w recommended delay */
+	dp_write_ahb(catalog, REG_DP_PHY_CTRL, 0x0);
+}
+
+void dp_catalog_ctrl_phy_lane_cfg(struct dp_catalog *dp_catalog,
+		bool flipped, u8 ln_cnt)
+{
+	u32 info;
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+	u8 orientation = BIT(!!flipped);
+
+	info = ln_cnt & DP_PHY_SPARE0_MASK;
+	info |= (orientation & DP_PHY_SPARE0_MASK)
+			<< DP_PHY_SPARE0_ORIENTATION_INFO_SHIFT;
+	DRM_DEBUG_DP("Shared Info = 0x%x\n", info);
+
+	dp_write_phy(catalog, REG_DP_PHY_SPARE0, info);
+}
+
+int dp_catalog_ctrl_update_vx_px(struct dp_catalog *dp_catalog,
+		u8 v_level, u8 p_level)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+	u8 voltage_swing_cfg, pre_emphasis_cfg;
+
+	DRM_DEBUG_DP("hw: v=%d p=%d\n", v_level, p_level);
+
+	voltage_swing_cfg = vm_voltage_swing_hbr_rbr[v_level][p_level];
+	pre_emphasis_cfg = vm_pre_emphasis_hbr_rbr[v_level][p_level];
+
+	if (voltage_swing_cfg == 0xFF && pre_emphasis_cfg == 0xFF) {
+		DRM_ERROR("invalid vx (0x%x=0x%x), px (0x%x=0x%x\n",
+			v_level, voltage_swing_cfg, p_level, pre_emphasis_cfg);
+		return -EINVAL;
+	}
+
+	/* Enable MUX to use Cursor values from these registers */
+	voltage_swing_cfg |= DP_PHY_TXn_TX_DRV_LVL_MUX_EN;
+	pre_emphasis_cfg |= DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN;
+
+	/* Configure host and panel only if both values are allowed */
+	dp_write_ln_tx0(catalog, REG_DP_PHY_TXn_TX_DRV_LVL, voltage_swing_cfg);
+	dp_write_ln_tx1(catalog, REG_DP_PHY_TXn_TX_DRV_LVL, voltage_swing_cfg);
+	dp_write_ln_tx0(catalog, REG_DP_PHY_TXn_TX_EMP_POST1_LVL,
+					pre_emphasis_cfg);
+	dp_write_ln_tx1(catalog, REG_DP_PHY_TXn_TX_EMP_POST1_LVL,
+					pre_emphasis_cfg);
+	DRM_DEBUG_DP("hw: vx_value=0x%x px_value=0x%x\n",
+			voltage_swing_cfg, pre_emphasis_cfg);
+
+	return 0;
+}
+
+void dp_catalog_ctrl_send_phy_pattern(struct dp_catalog *dp_catalog,
+			u32 pattern)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+	u32 value = 0x0;
+
+	/* Make sure to clear the current pattern before starting a new one */
+	dp_write_link(catalog, REG_DP_STATE_CTRL, 0x0);
+
+	switch (pattern) {
+	case DP_LINK_QUAL_PATTERN_D10_2:
+		dp_write_link(catalog, REG_DP_STATE_CTRL,
+				DP_STATE_CTRL_LINK_TRAINING_PATTERN1);
+		return;
+	case DP_LINK_QUAL_PATTERN_PRBS7:
+		dp_write_link(catalog, REG_DP_STATE_CTRL,
+				DP_STATE_CTRL_LINK_PRBS7);
+		return;
+	case DP_LINK_QUAL_PATTERN_80BIT_CUSTOM:
+		dp_write_link(catalog, REG_DP_STATE_CTRL,
+				DP_STATE_CTRL_LINK_TEST_CUSTOM_PATTERN);
+		/* 00111110000011111000001111100000 */
+		dp_write_link(catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG0,
+				0x3E0F83E0);
+		/* 00001111100000111110000011111000 */
+		dp_write_link(catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG1,
+				0x0F83E0F8);
+		/* 1111100000111110 */
+		dp_write_link(catalog, REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG2,
+				0x0000F83E);
+		return;
+	case DP_LINK_QUAL_PATTERN_HBR2_EYE:
+	case DP_LINK_QUAL_PATTERN_ERROR_RATE:
+		value &= ~DP_HBR2_ERM_PATTERN;
+		if (pattern == DP_LINK_QUAL_PATTERN_HBR2_EYE)
+			value = DP_HBR2_ERM_PATTERN;
+		dp_write_link(catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+					value);
+		value |= SCRAMBLER_RESET_COUNT_VALUE;
+		dp_write_link(catalog, REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET,
+					value);
+		dp_write_link(catalog, REG_DP_MAINLINK_LEVELS,
+					DP_MAINLINK_SAFE_TO_EXIT_LEVEL_2);
+		dp_write_link(catalog, REG_DP_STATE_CTRL,
+					DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE);
+		return;
+	default:
+		DRM_DEBUG_DP("No valid test pattern requested:0x%x\n", pattern);
+		return;
+	}
+}
+
+u32 dp_catalog_ctrl_read_phy_pattern(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	return dp_read_link(catalog, REG_DP_MAINLINK_READY);
+}
+
+/* panel related catalog functions */
+int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	dp_write_link(catalog, REG_DP_TOTAL_HOR_VER,
+				dp_catalog->total);
+	dp_write_link(catalog, REG_DP_START_HOR_VER_FROM_SYNC,
+				dp_catalog->sync_start);
+	dp_write_link(catalog, REG_DP_HSYNC_VSYNC_WIDTH_POLARITY,
+				dp_catalog->width_blanking);
+	dp_write_link(catalog, REG_DP_ACTIVE_HOR_VER, dp_catalog->dp_active);
+	return 0;
+}
+
+void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
+				struct drm_display_mode *drm_mode)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+	u32 hsync_period, vsync_period;
+	u32 display_v_start, display_v_end;
+	u32 hsync_start_x, hsync_end_x;
+	u32 v_sync_width;
+	u32 hsync_ctl;
+	u32 display_hctl;
+
+	/* TPG config parameters*/
+	hsync_period = drm_mode->htotal;
+	vsync_period = drm_mode->vtotal;
+
+	display_v_start = ((drm_mode->vtotal - drm_mode->vsync_start) *
+					hsync_period);
+	display_v_end = ((vsync_period - (drm_mode->vsync_start -
+					drm_mode->vdisplay))
+					* hsync_period) - 1;
+
+	display_v_start += drm_mode->htotal - drm_mode->hsync_start;
+	display_v_end -= (drm_mode->hsync_start - drm_mode->hdisplay);
+
+	hsync_start_x = drm_mode->htotal - drm_mode->hsync_start;
+	hsync_end_x = hsync_period - (drm_mode->hsync_start -
+					drm_mode->hdisplay) - 1;
+
+	v_sync_width = drm_mode->vsync_end - drm_mode->vsync_start;
+
+	hsync_ctl = (hsync_period << 16) |
+			(drm_mode->hsync_end - drm_mode->hsync_start);
+	display_hctl = (hsync_end_x << 16) | hsync_start_x;
+
+
+	dp_write_p0(catalog, MMSS_DP_INTF_CONFIG, 0x0);
+	dp_write_p0(catalog, MMSS_DP_INTF_HSYNC_CTL, hsync_ctl);
+	dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PERIOD_F0, vsync_period *
+			hsync_period);
+	dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F0, v_sync_width *
+			hsync_period);
+	dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PERIOD_F1, 0);
+	dp_write_p0(catalog, MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F1, 0);
+	dp_write_p0(catalog, MMSS_DP_INTF_DISPLAY_HCTL, display_hctl);
+	dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_HCTL, 0);
+	dp_write_p0(catalog, MMSS_INTF_DISPLAY_V_START_F0, display_v_start);
+	dp_write_p0(catalog, MMSS_DP_INTF_DISPLAY_V_END_F0, display_v_end);
+	dp_write_p0(catalog, MMSS_INTF_DISPLAY_V_START_F1, 0);
+	dp_write_p0(catalog, MMSS_DP_INTF_DISPLAY_V_END_F1, 0);
+	dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_START_F0, 0);
+	dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_END_F0, 0);
+	dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_START_F1, 0);
+	dp_write_p0(catalog, MMSS_DP_INTF_ACTIVE_V_END_F1, 0);
+	dp_write_p0(catalog, MMSS_DP_INTF_POLARITY_CTL, 0);
+
+	dp_write_p0(catalog, MMSS_DP_TPG_MAIN_CONTROL,
+				DP_TPG_CHECKERED_RECT_PATTERN);
+	dp_write_p0(catalog, MMSS_DP_TPG_VIDEO_CONFIG,
+				DP_TPG_VIDEO_CONFIG_BPP_8BIT |
+				DP_TPG_VIDEO_CONFIG_RGB);
+	dp_write_p0(catalog, MMSS_DP_BIST_ENABLE,
+				DP_BIST_ENABLE_DPBIST_EN);
+	dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN,
+				DP_TIMING_ENGINE_EN_EN);
+	DRM_DEBUG_DP("%s: enabled tpg\n", __func__);
+}
+
+void dp_catalog_panel_tpg_disable(struct dp_catalog *dp_catalog)
+{
+	struct dp_catalog_private *catalog = container_of(dp_catalog,
+				struct dp_catalog_private, dp_catalog);
+
+	dp_write_p0(catalog, MMSS_DP_TPG_MAIN_CONTROL, 0x0);
+	dp_write_p0(catalog, MMSS_DP_BIST_ENABLE, 0x0);
+	dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN, 0x0);
+}
+
+struct dp_catalog *dp_catalog_get(struct device *dev, struct dp_io *io)
+{
+	struct dp_catalog_private *catalog;
+
+	if (!io) {
+		DRM_ERROR("invalid input\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	catalog  = devm_kzalloc(dev, sizeof(*catalog), GFP_KERNEL);
+	if (!catalog)
+		return ERR_PTR(-ENOMEM);
+
+	catalog->dev = dev;
+	catalog->io = io;
+
+	return &catalog->dp_catalog;
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
new file mode 100644
index 000000000000..012570be1635
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -0,0 +1,102 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DP_CATALOG_H_
+#define _DP_CATALOG_H_
+
+#include "dp_parser.h"
+
+/* interrupts */
+#define DP_INTR_HPD		BIT(0)
+#define DP_INTR_AUX_I2C_DONE	BIT(3)
+#define DP_INTR_WRONG_ADDR	BIT(6)
+#define DP_INTR_TIMEOUT		BIT(9)
+#define DP_INTR_NACK_DEFER	BIT(12)
+#define DP_INTR_WRONG_DATA_CNT	BIT(15)
+#define DP_INTR_I2C_NACK	BIT(18)
+#define DP_INTR_I2C_DEFER	BIT(21)
+#define DP_INTR_PLL_UNLOCKED	BIT(24)
+#define DP_INTR_AUX_ERROR	BIT(27)
+
+#define DP_INTR_READY_FOR_VIDEO		BIT(0)
+#define DP_INTR_IDLE_PATTERN_SENT	BIT(3)
+#define DP_INTR_FRAME_END		BIT(6)
+#define DP_INTR_CRC_UPDATED		BIT(9)
+
+#define DP_AUX_CFG_MAX_VALUE_CNT 3
+
+/* PHY AUX config registers */
+enum dp_phy_aux_config_type {
+	PHY_AUX_CFG0,
+	PHY_AUX_CFG1,
+	PHY_AUX_CFG2,
+	PHY_AUX_CFG3,
+	PHY_AUX_CFG4,
+	PHY_AUX_CFG5,
+	PHY_AUX_CFG6,
+	PHY_AUX_CFG7,
+	PHY_AUX_CFG8,
+	PHY_AUX_CFG9,
+	PHY_AUX_CFG_MAX,
+};
+
+struct dp_catalog {
+	u32 aux_data;
+	u32 total;
+	u32 sync_start;
+	u32 width_blanking;
+	u32 dp_active;
+};
+
+/* AUX APIs */
+u32 dp_catalog_aux_read_data(struct dp_catalog *dp_catalog);
+int dp_catalog_aux_write_data(struct dp_catalog *dp_catalog);
+int dp_catalog_aux_write_trans(struct dp_catalog *dp_catalog);
+int dp_catalog_aux_clear_trans(struct dp_catalog *dp_catalog, bool read);
+int dp_catalog_aux_clear_hw_interrupts(struct dp_catalog *dp_catalog);
+void dp_catalog_aux_reset(struct dp_catalog *dp_catalog);
+void dp_catalog_aux_enable(struct dp_catalog *dp_catalog, bool enable);
+void dp_catalog_aux_update_cfg(struct dp_catalog *dp_catalog,
+			enum dp_phy_aux_config_type type);
+void dp_catalog_aux_setup(struct dp_catalog *dp_catalog);
+int dp_catalog_aux_get_irq(struct dp_catalog *dp_catalog);
+
+/* DP Controller APIs */
+void dp_catalog_ctrl_state_ctrl(struct dp_catalog *dp_catalog, u32 state);
+void dp_catalog_ctrl_config_ctrl(struct dp_catalog *dp_catalog, u32 config);
+void dp_catalog_ctrl_lane_mapping(struct dp_catalog *dp_catalog);
+void dp_catalog_ctrl_mainlink_ctrl(struct dp_catalog *dp_catalog, bool enable);
+void dp_catalog_ctrl_config_misc(struct dp_catalog *dp_catalog, u32 cc, u32 tb);
+void dp_catalog_ctrl_config_msa(struct dp_catalog *dp_catalog, u32 rate,
+				u32 stream_rate_khz, bool fixed_nvid);
+int dp_catalog_ctrl_set_pattern(struct dp_catalog *dp_catalog, u32 pattern);
+void dp_catalog_ctrl_reset(struct dp_catalog *dp_catalog);
+void dp_catalog_ctrl_usb_reset(struct dp_catalog *dp_catalog, bool flip);
+bool dp_catalog_ctrl_mainlink_ready(struct dp_catalog *dp_catalog);
+void dp_catalog_ctrl_enable_irq(struct dp_catalog *dp_catalog, bool enable);
+void dp_catalog_ctrl_hpd_config(struct dp_catalog *dp_catalog, bool enable);
+void dp_catalog_ctrl_phy_reset(struct dp_catalog *dp_catalog);
+void dp_catalog_ctrl_phy_lane_cfg(struct dp_catalog *dp_catalog, bool flipped,
+				u8 lane_cnt);
+int dp_catalog_ctrl_update_vx_px(struct dp_catalog *dp_catalog, u8 v_level,
+				u8 p_level);
+int dp_catalog_ctrl_get_interrupt(struct dp_catalog *dp_catalog);
+void dp_catalog_ctrl_update_transfer_unit(struct dp_catalog *dp_catalog,
+				u32 dp_tu, u32 valid_boundary,
+				u32 valid_boundary2);
+void dp_catalog_ctrl_send_phy_pattern(struct dp_catalog *dp_catalog,
+				u32 pattern);
+u32 dp_catalog_ctrl_read_phy_pattern(struct dp_catalog *dp_catalog);
+
+/* DP Panel APIs */
+int dp_catalog_panel_timing_cfg(struct dp_catalog *dp_catalog);
+void dp_catalog_dump_regs(struct dp_catalog *dp_catalog);
+void dp_catalog_panel_tpg_enable(struct dp_catalog *dp_catalog,
+				struct drm_display_mode *drm_mode);
+void dp_catalog_panel_tpg_disable(struct dp_catalog *dp_catalog);
+
+struct dp_catalog *dp_catalog_get(struct device *dev, struct dp_io *io);
+
+#endif /* _DP_CATALOG_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
new file mode 100644
index 000000000000..9a06cbf40af1
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -0,0 +1,1694 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
+ */
+
+#define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
+
+#include <linux/types.h>
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <drm/drm_fixed.h>
+#include <drm/drm_dp_helper.h>
+
+#include "dp_reg.h"
+#include "dp_ctrl.h"
+#include "dp_link.h"
+
+#define DP_KHZ_TO_HZ 1000
+#define IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES	(30 * HZ / 1000) /* 30 ms */
+#define WAIT_FOR_VIDEO_READY_TIMEOUT_JIFFIES (HZ / 2)
+
+#define DP_CTRL_INTR_READY_FOR_VIDEO     BIT(0)
+#define DP_CTRL_INTR_IDLE_PATTERN_SENT  BIT(3)
+
+#define MR_LINK_TRAINING1  0x8
+#define MR_LINK_SYMBOL_ERM 0x80
+#define MR_LINK_PRBS7 0x100
+#define MR_LINK_CUSTOM80 0x200
+
+struct dp_tu_calc_input {
+	u64 lclk;        /* 162, 270, 540 and 810 */
+	u64 pclk_khz;    /* in KHz */
+	u64 hactive;     /* active h-width */
+	u64 hporch;      /* bp + fp + pulse */
+	int nlanes;      /* no.of.lanes */
+	int bpp;         /* bits */
+	int pixel_enc;   /* 444, 420, 422 */
+	int dsc_en;     /* dsc on/off */
+	int async_en;   /* async mode */
+	int fec_en;     /* fec */
+	int compress_ratio; /* 2:1 = 200, 3:1 = 300, 3.75:1 = 375 */
+	int num_of_dsc_slices; /* number of slices per line */
+};
+
+struct dp_vc_tu_mapping_table {
+	u32 vic;
+	u8 lanes;
+	u8 lrate; /* DP_LINK_RATE -> 162(6), 270(10), 540(20), 810 (30) */
+	u8 bpp;
+	u8 valid_boundary_link;
+	u16 delay_start_link;
+	bool boundary_moderation_en;
+	u8 valid_lower_boundary_link;
+	u8 upper_boundary_count;
+	u8 lower_boundary_count;
+	u8 tu_size_minus1;
+};
+
+struct dp_ctrl_private {
+	struct dp_ctrl dp_ctrl;
+
+	struct device *dev;
+	struct drm_dp_aux *aux;
+	struct dp_panel *panel;
+	struct dp_link *link;
+	struct dp_power *power;
+	struct dp_parser *parser;
+	struct dp_catalog *catalog;
+
+	struct completion idle_comp;
+	struct mutex push_idle_mutex;
+	struct completion video_comp;
+};
+
+static int dp_aux_link_configure(struct drm_dp_aux *aux,
+					struct dp_link_info *link)
+{
+	u8 values[2];
+	int err;
+
+	values[0] = drm_dp_link_rate_to_bw_code(link->rate);
+	values[1] = link->num_lanes;
+
+	if (link->capabilities & DP_LINK_CAP_ENHANCED_FRAMING)
+		values[1] |= DP_LANE_COUNT_ENHANCED_FRAME_EN;
+
+	err = drm_dp_dpcd_write(aux, DP_LINK_BW_SET, values, sizeof(values));
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
+void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl)
+{
+	struct dp_ctrl_private *ctrl;
+
+	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+
+	mutex_lock(&ctrl->push_idle_mutex);
+
+	reinit_completion(&ctrl->idle_comp);
+	dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_PUSH_IDLE);
+
+	if (!wait_for_completion_timeout(&ctrl->idle_comp,
+			IDLE_PATTERN_COMPLETION_TIMEOUT_JIFFIES))
+		pr_warn("PUSH_IDLE pattern timedout\n");
+
+	mutex_unlock(&ctrl->push_idle_mutex);
+	pr_debug("mainlink off done\n");
+}
+
+static void dp_ctrl_config_ctrl(struct dp_ctrl_private *ctrl)
+{
+	u32 config = 0, tbd;
+	u8 *dpcd = ctrl->panel->dpcd;
+
+	/* Default-> LSCLK DIV: 1/4 LCLK  */
+	config |= (2 << DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT);
+
+	/* Scrambler reset enable */
+	if (dpcd[DP_EDP_CONFIGURATION_CAP] & DP_ALTERNATE_SCRAMBLER_RESET_CAP)
+		config |= DP_CONFIGURATION_CTRL_ASSR;
+
+	tbd = dp_link_get_test_bits_depth(ctrl->link,
+			ctrl->panel->dp_mode.bpp);
+
+	if (tbd == DP_TEST_BIT_DEPTH_UNKNOWN) {
+		pr_debug("BIT_DEPTH not set. Configure default\n");
+		tbd = DP_TEST_BIT_DEPTH_8;
+	}
+
+	config |= tbd << DP_CONFIGURATION_CTRL_BPC_SHIFT;
+
+	/* Num of Lanes */
+	config |= ((ctrl->link->link_params.num_lanes - 1)
+			<< DP_CONFIGURATION_CTRL_NUM_OF_LANES_SHIFT);
+
+	if (drm_dp_enhanced_frame_cap(dpcd))
+		config |= DP_CONFIGURATION_CTRL_ENHANCED_FRAMING;
+
+	config |= DP_CONFIGURATION_CTRL_P_INTERLACED; /* progressive video */
+
+	/* sync clock & static Mvid */
+	config |= DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN;
+	config |= DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK;
+
+	dp_catalog_ctrl_config_ctrl(ctrl->catalog, config);
+}
+
+static void dp_ctrl_configure_source_params(struct dp_ctrl_private *ctrl)
+{
+	u32 cc, tb;
+
+	dp_catalog_ctrl_lane_mapping(ctrl->catalog);
+	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, true);
+
+	dp_ctrl_config_ctrl(ctrl);
+
+	tb = dp_link_get_test_bits_depth(ctrl->link,
+		ctrl->panel->dp_mode.bpp);
+	cc = dp_link_get_colorimetry_config(ctrl->link);
+	dp_catalog_ctrl_config_misc(ctrl->catalog, cc, tb);
+	dp_panel_timing_cfg(ctrl->panel);
+}
+
+/*
+ * The structure and few functions present below are IP/Hardware
+ * specific implementation. Most of the implementation will not
+ * have coding comments
+ */
+struct tu_algo_data {
+	s64 lclk_fp;
+	s64 pclk_fp;
+	s64 lwidth;
+	s64 lwidth_fp;
+	s64 hbp_relative_to_pclk;
+	s64 hbp_relative_to_pclk_fp;
+	int nlanes;
+	int bpp;
+	int pixelEnc;
+	int dsc_en;
+	int async_en;
+	int bpc;
+
+	uint delay_start_link_extra_pixclk;
+	int extra_buffer_margin;
+	s64 ratio_fp;
+	s64 original_ratio_fp;
+
+	s64 err_fp;
+	s64 n_err_fp;
+	s64 n_n_err_fp;
+	int tu_size;
+	int tu_size_desired;
+	int tu_size_minus1;
+
+	int valid_boundary_link;
+	s64 resulting_valid_fp;
+	s64 total_valid_fp;
+	s64 effective_valid_fp;
+	s64 effective_valid_recorded_fp;
+	int n_tus;
+	int n_tus_per_lane;
+	int paired_tus;
+	int remainder_tus;
+	int remainder_tus_upper;
+	int remainder_tus_lower;
+	int extra_bytes;
+	int filler_size;
+	int delay_start_link;
+
+	int extra_pclk_cycles;
+	int extra_pclk_cycles_in_link_clk;
+	s64 ratio_by_tu_fp;
+	s64 average_valid2_fp;
+	int new_valid_boundary_link;
+	int remainder_symbols_exist;
+	int n_symbols;
+	s64 n_remainder_symbols_per_lane_fp;
+	s64 last_partial_tu_fp;
+	s64 TU_ratio_err_fp;
+
+	int n_tus_incl_last_incomplete_tu;
+	int extra_pclk_cycles_tmp;
+	int extra_pclk_cycles_in_link_clk_tmp;
+	int extra_required_bytes_new_tmp;
+	int filler_size_tmp;
+	int lower_filler_size_tmp;
+	int delay_start_link_tmp;
+
+	bool boundary_moderation_en;
+	int boundary_mod_lower_err;
+	int upper_boundary_count;
+	int lower_boundary_count;
+	int i_upper_boundary_count;
+	int i_lower_boundary_count;
+	int valid_lower_boundary_link;
+	int even_distribution_BF;
+	int even_distribution_legacy;
+	int even_distribution;
+	int min_hblank_violated;
+	s64 delay_start_time_fp;
+	s64 hbp_time_fp;
+	s64 hactive_time_fp;
+	s64 diff_abs_fp;
+
+	s64 ratio;
+};
+
+static int _tu_param_compare(s64 a, s64 b)
+{
+	u32 a_sign;
+	u32 b_sign;
+	s64 a_temp, b_temp, minus_1;
+
+	if (a == b)
+		return 0;
+
+	minus_1 = drm_fixp_from_fraction(-1, 1);
+
+	a_sign = (a >> 32) & 0x80000000 ? 1 : 0;
+
+	b_sign = (b >> 32) & 0x80000000 ? 1 : 0;
+
+	if (a_sign > b_sign)
+		return 2;
+	else if (b_sign > a_sign)
+		return 1;
+
+	if (!a_sign && !b_sign) { /* positive */
+		if (a > b)
+			return 1;
+		else
+			return 2;
+	} else { /* negative */
+		a_temp = drm_fixp_mul(a, minus_1);
+		b_temp = drm_fixp_mul(b, minus_1);
+
+		if (a_temp > b_temp)
+			return 2;
+		else
+			return 1;
+	}
+}
+
+static void dp_panel_update_tu_timings(struct dp_tu_calc_input *in,
+					struct tu_algo_data *tu)
+{
+	int nlanes = in->nlanes;
+	int dsc_num_slices = in->num_of_dsc_slices;
+	int dsc_num_bytes  = 0;
+	int numerator;
+	s64 pclk_dsc_fp;
+	s64 dwidth_dsc_fp;
+	s64 hbp_dsc_fp;
+
+	int tot_num_eoc_symbols = 0;
+	int tot_num_hor_bytes   = 0;
+	int tot_num_dummy_bytes = 0;
+	int dwidth_dsc_bytes    = 0;
+	int  eoc_bytes           = 0;
+
+	s64 temp1_fp, temp2_fp, temp3_fp;
+
+	tu->lclk_fp              = drm_fixp_from_fraction(in->lclk, 1);
+	tu->pclk_fp              = drm_fixp_from_fraction(in->pclk_khz, 1000);
+	tu->lwidth               = in->hactive;
+	tu->hbp_relative_to_pclk = in->hporch;
+	tu->nlanes               = in->nlanes;
+	tu->bpp                  = in->bpp;
+	tu->pixelEnc             = in->pixel_enc;
+	tu->dsc_en               = in->dsc_en;
+	tu->async_en             = in->async_en;
+	tu->lwidth_fp            = drm_fixp_from_fraction(in->hactive, 1);
+	tu->hbp_relative_to_pclk_fp = drm_fixp_from_fraction(in->hporch, 1);
+
+	if (tu->pixelEnc == 420) {
+		temp1_fp = drm_fixp_from_fraction(2, 1);
+		tu->pclk_fp = drm_fixp_div(tu->pclk_fp, temp1_fp);
+		tu->lwidth_fp = drm_fixp_div(tu->lwidth_fp, temp1_fp);
+		tu->hbp_relative_to_pclk_fp =
+				drm_fixp_div(tu->hbp_relative_to_pclk_fp, 2);
+	}
+
+	if (tu->pixelEnc == 422) {
+		switch (tu->bpp) {
+		case 24:
+			tu->bpp = 16;
+			tu->bpc = 8;
+			break;
+		case 30:
+			tu->bpp = 20;
+			tu->bpc = 10;
+			break;
+		default:
+			tu->bpp = 16;
+			tu->bpc = 8;
+			break;
+		}
+	} else {
+		tu->bpc = tu->bpp/3;
+	}
+
+	if (!in->dsc_en)
+		goto fec_check;
+
+	temp1_fp = drm_fixp_from_fraction(in->compress_ratio, 100);
+	temp2_fp = drm_fixp_from_fraction(in->bpp, 1);
+	temp3_fp = drm_fixp_div(temp2_fp, temp1_fp);
+	temp2_fp = drm_fixp_mul(tu->lwidth_fp, temp3_fp);
+
+	temp1_fp = drm_fixp_from_fraction(8, 1);
+	temp3_fp = drm_fixp_div(temp2_fp, temp1_fp);
+
+	numerator = drm_fixp2int(temp3_fp);
+
+	dsc_num_bytes  = numerator / dsc_num_slices;
+	eoc_bytes           = dsc_num_bytes % nlanes;
+	tot_num_eoc_symbols = nlanes * dsc_num_slices;
+	tot_num_hor_bytes   = dsc_num_bytes * dsc_num_slices;
+	tot_num_dummy_bytes = (nlanes - eoc_bytes) * dsc_num_slices;
+
+	if (dsc_num_bytes == 0)
+		pr_info("incorrect no of bytes per slice=%d\n", dsc_num_bytes);
+
+	dwidth_dsc_bytes = (tot_num_hor_bytes +
+				tot_num_eoc_symbols +
+				(eoc_bytes == 0 ? 0 : tot_num_dummy_bytes));
+
+	dwidth_dsc_fp = drm_fixp_from_fraction(dwidth_dsc_bytes, 3);
+
+	temp2_fp = drm_fixp_mul(tu->pclk_fp, dwidth_dsc_fp);
+	temp1_fp = drm_fixp_div(temp2_fp, tu->lwidth_fp);
+	pclk_dsc_fp = temp1_fp;
+
+	temp1_fp = drm_fixp_div(pclk_dsc_fp, tu->pclk_fp);
+	temp2_fp = drm_fixp_mul(tu->hbp_relative_to_pclk_fp, temp1_fp);
+	hbp_dsc_fp = temp2_fp;
+
+	/* output */
+	tu->pclk_fp = pclk_dsc_fp;
+	tu->lwidth_fp = dwidth_dsc_fp;
+	tu->hbp_relative_to_pclk_fp = hbp_dsc_fp;
+
+fec_check:
+	if (in->fec_en) {
+		temp1_fp = drm_fixp_from_fraction(976, 1000); /* 0.976 */
+		tu->lclk_fp = drm_fixp_mul(tu->lclk_fp, temp1_fp);
+	}
+}
+
+static void _tu_valid_boundary_calc(struct tu_algo_data *tu)
+{
+	s64 temp1_fp, temp2_fp, temp, temp1, temp2;
+	int compare_result_1, compare_result_2, compare_result_3;
+
+	temp1_fp = drm_fixp_from_fraction(tu->tu_size, 1);
+	temp2_fp = drm_fixp_mul(tu->ratio_fp, temp1_fp);
+
+	tu->new_valid_boundary_link = drm_fixp2int_ceil(temp2_fp);
+
+	temp = (tu->i_upper_boundary_count *
+				tu->new_valid_boundary_link +
+				tu->i_lower_boundary_count *
+				(tu->new_valid_boundary_link-1));
+	tu->average_valid2_fp = drm_fixp_from_fraction(temp,
+					(tu->i_upper_boundary_count +
+					tu->i_lower_boundary_count));
+
+	temp1_fp = drm_fixp_from_fraction(tu->bpp, 8);
+	temp2_fp = tu->lwidth_fp;
+	temp1_fp = drm_fixp_mul(temp2_fp, temp1_fp);
+	temp2_fp = drm_fixp_div(temp1_fp, tu->average_valid2_fp);
+	tu->n_tus = drm_fixp2int(temp2_fp);
+	if ((temp2_fp & 0xFFFFFFFF) > 0xFFFFF000)
+		tu->n_tus += 1;
+
+	temp1_fp = drm_fixp_from_fraction(tu->n_tus, 1);
+	temp2_fp = drm_fixp_mul(temp1_fp, tu->average_valid2_fp);
+	temp1_fp = drm_fixp_from_fraction(tu->n_symbols, 1);
+	temp2_fp = temp1_fp - temp2_fp;
+	temp1_fp = drm_fixp_from_fraction(tu->nlanes, 1);
+	temp2_fp = drm_fixp_div(temp2_fp, temp1_fp);
+	tu->n_remainder_symbols_per_lane_fp = temp2_fp;
+
+	temp1_fp = drm_fixp_from_fraction(tu->tu_size, 1);
+	tu->last_partial_tu_fp =
+			drm_fixp_div(tu->n_remainder_symbols_per_lane_fp,
+					temp1_fp);
+
+	if (tu->n_remainder_symbols_per_lane_fp != 0)
+		tu->remainder_symbols_exist = 1;
+	else
+		tu->remainder_symbols_exist = 0;
+
+	temp1_fp = drm_fixp_from_fraction(tu->n_tus, tu->nlanes);
+	tu->n_tus_per_lane = drm_fixp2int(temp1_fp);
+
+	tu->paired_tus = (int)((tu->n_tus_per_lane) /
+					(tu->i_upper_boundary_count +
+					 tu->i_lower_boundary_count));
+
+	tu->remainder_tus = tu->n_tus_per_lane - tu->paired_tus *
+						(tu->i_upper_boundary_count +
+						tu->i_lower_boundary_count);
+
+	if ((tu->remainder_tus - tu->i_upper_boundary_count) > 0) {
+		tu->remainder_tus_upper = tu->i_upper_boundary_count;
+		tu->remainder_tus_lower = tu->remainder_tus -
+						tu->i_upper_boundary_count;
+	} else {
+		tu->remainder_tus_upper = tu->remainder_tus;
+		tu->remainder_tus_lower = 0;
+	}
+
+	temp = tu->paired_tus * (tu->i_upper_boundary_count *
+				tu->new_valid_boundary_link +
+				tu->i_lower_boundary_count *
+				(tu->new_valid_boundary_link - 1)) +
+				(tu->remainder_tus_upper *
+				 tu->new_valid_boundary_link) +
+				(tu->remainder_tus_lower *
+				(tu->new_valid_boundary_link - 1));
+	tu->total_valid_fp = drm_fixp_from_fraction(temp, 1);
+
+	if (tu->remainder_symbols_exist) {
+		temp1_fp = tu->total_valid_fp +
+				tu->n_remainder_symbols_per_lane_fp;
+		temp2_fp = drm_fixp_from_fraction(tu->n_tus_per_lane, 1);
+		temp2_fp = temp2_fp + tu->last_partial_tu_fp;
+		temp1_fp = drm_fixp_div(temp1_fp, temp2_fp);
+	} else {
+		temp2_fp = drm_fixp_from_fraction(tu->n_tus_per_lane, 1);
+		temp1_fp = drm_fixp_div(tu->total_valid_fp, temp2_fp);
+	}
+	tu->effective_valid_fp = temp1_fp;
+
+	temp1_fp = drm_fixp_from_fraction(tu->tu_size, 1);
+	temp2_fp = drm_fixp_mul(tu->ratio_fp, temp1_fp);
+	tu->n_n_err_fp = tu->effective_valid_fp - temp2_fp;
+
+	temp1_fp = drm_fixp_from_fraction(tu->tu_size, 1);
+	temp2_fp = drm_fixp_mul(tu->ratio_fp, temp1_fp);
+	tu->n_err_fp = tu->average_valid2_fp - temp2_fp;
+
+	tu->even_distribution = tu->n_tus % tu->nlanes == 0 ? 1 : 0;
+
+	temp1_fp = drm_fixp_from_fraction(tu->bpp, 8);
+	temp2_fp = tu->lwidth_fp;
+	temp1_fp = drm_fixp_mul(temp2_fp, temp1_fp);
+	temp2_fp = drm_fixp_div(temp1_fp, tu->average_valid2_fp);
+
+	if (temp2_fp)
+		tu->n_tus_incl_last_incomplete_tu = drm_fixp2int_ceil(temp2_fp);
+	else
+		tu->n_tus_incl_last_incomplete_tu = 0;
+
+	temp1 = 0;
+	temp1_fp = drm_fixp_from_fraction(tu->tu_size, 1);
+	temp2_fp = drm_fixp_mul(tu->original_ratio_fp, temp1_fp);
+	temp1_fp = tu->average_valid2_fp - temp2_fp;
+	temp2_fp = drm_fixp_from_fraction(tu->n_tus_incl_last_incomplete_tu, 1);
+	temp1_fp = drm_fixp_mul(temp2_fp, temp1_fp);
+
+	if (temp1_fp)
+		temp1 = drm_fixp2int_ceil(temp1_fp);
+
+	temp = tu->i_upper_boundary_count * tu->nlanes;
+	temp1_fp = drm_fixp_from_fraction(tu->tu_size, 1);
+	temp2_fp = drm_fixp_mul(tu->original_ratio_fp, temp1_fp);
+	temp1_fp = drm_fixp_from_fraction(tu->new_valid_boundary_link, 1);
+	temp2_fp = temp1_fp - temp2_fp;
+	temp1_fp = drm_fixp_from_fraction(temp, 1);
+	temp2_fp = drm_fixp_mul(temp1_fp, temp2_fp);
+
+	if (temp2_fp)
+		temp2 = drm_fixp2int_ceil(temp2_fp);
+	else
+		temp2 = 0;
+	tu->extra_required_bytes_new_tmp = (int)(temp1 + temp2);
+
+	temp1_fp = drm_fixp_from_fraction(8, tu->bpp);
+	temp2_fp = drm_fixp_from_fraction(
+	tu->extra_required_bytes_new_tmp, 1);
+	temp1_fp = drm_fixp_mul(temp2_fp, temp1_fp);
+
+	if (temp1_fp)
+		tu->extra_pclk_cycles_tmp = drm_fixp2int_ceil(temp1_fp);
+	else
+		tu->extra_pclk_cycles_tmp = 0;
+
+	temp1_fp = drm_fixp_from_fraction(tu->extra_pclk_cycles_tmp, 1);
+	temp2_fp = drm_fixp_div(tu->lclk_fp, tu->pclk_fp);
+	temp1_fp = drm_fixp_mul(temp1_fp, temp2_fp);
+
+	if (temp1_fp)
+		tu->extra_pclk_cycles_in_link_clk_tmp =
+						drm_fixp2int_ceil(temp1_fp);
+	else
+		tu->extra_pclk_cycles_in_link_clk_tmp = 0;
+
+	tu->filler_size_tmp = tu->tu_size - tu->new_valid_boundary_link;
+
+	tu->lower_filler_size_tmp = tu->filler_size_tmp + 1;
+
+	tu->delay_start_link_tmp = tu->extra_pclk_cycles_in_link_clk_tmp +
+					tu->lower_filler_size_tmp +
+					tu->extra_buffer_margin;
+
+	temp1_fp = drm_fixp_from_fraction(tu->delay_start_link_tmp, 1);
+	tu->delay_start_time_fp = drm_fixp_div(temp1_fp, tu->lclk_fp);
+
+	compare_result_1 = _tu_param_compare(tu->n_n_err_fp, tu->diff_abs_fp);
+	if (compare_result_1 == 2)
+		compare_result_1 = 1;
+	else
+		compare_result_1 = 0;
+
+	compare_result_2 = _tu_param_compare(tu->n_n_err_fp, tu->err_fp);
+	if (compare_result_2 == 2)
+		compare_result_2 = 1;
+	else
+		compare_result_2 = 0;
+
+	compare_result_3 = _tu_param_compare(tu->hbp_time_fp,
+					tu->delay_start_time_fp);
+	if (compare_result_3 == 2)
+		compare_result_3 = 0;
+	else
+		compare_result_3 = 1;
+
+	if (((tu->even_distribution == 1) ||
+			((tu->even_distribution_BF == 0) &&
+			(tu->even_distribution_legacy == 0))) &&
+			tu->n_err_fp >= 0 && tu->n_n_err_fp >= 0 &&
+			compare_result_2 &&
+			(compare_result_1 || (tu->min_hblank_violated == 1)) &&
+			(tu->new_valid_boundary_link - 1) > 0 &&
+			compare_result_3 &&
+			(tu->delay_start_link_tmp <= 1023)) {
+		tu->upper_boundary_count = tu->i_upper_boundary_count;
+		tu->lower_boundary_count = tu->i_lower_boundary_count;
+		tu->err_fp = tu->n_n_err_fp;
+		tu->boundary_moderation_en = true;
+		tu->tu_size_desired = tu->tu_size;
+		tu->valid_boundary_link = tu->new_valid_boundary_link;
+		tu->effective_valid_recorded_fp = tu->effective_valid_fp;
+		tu->even_distribution_BF = 1;
+		tu->delay_start_link = tu->delay_start_link_tmp;
+	} else if (tu->boundary_mod_lower_err == 0) {
+		compare_result_1 = _tu_param_compare(tu->n_n_err_fp,
+							tu->diff_abs_fp);
+		if (compare_result_1 == 2)
+			tu->boundary_mod_lower_err = 1;
+	}
+}
+
+static void _dp_ctrl_calc_tu(struct dp_tu_calc_input *in,
+				   struct dp_vc_tu_mapping_table *tu_table)
+{
+	struct tu_algo_data tu;
+	int compare_result_1, compare_result_2;
+	u64 temp = 0;
+	s64 temp_fp = 0, temp1_fp = 0, temp2_fp = 0;
+
+	s64 LCLK_FAST_SKEW_fp = drm_fixp_from_fraction(6, 10000); /* 0.0006 */
+	s64 const_p49_fp = drm_fixp_from_fraction(49, 100); /* 0.49 */
+	s64 const_p56_fp = drm_fixp_from_fraction(56, 100); /* 0.56 */
+	s64 RATIO_SCALE_fp = drm_fixp_from_fraction(1001, 1000);
+
+	u8 DP_BRUTE_FORCE = 1;
+	s64 BRUTE_FORCE_THRESHOLD_fp = drm_fixp_from_fraction(1, 10); /* 0.1 */
+	uint EXTRA_PIXCLK_CYCLE_DELAY = 4;
+	uint HBLANK_MARGIN = 4;
+
+	memset(&tu, 0, sizeof(tu));
+
+	dp_panel_update_tu_timings(in, &tu);
+
+	tu.err_fp = drm_fixp_from_fraction(1000, 1); /* 1000 */
+
+	temp1_fp = drm_fixp_from_fraction(4, 1);
+	temp2_fp = drm_fixp_mul(temp1_fp, tu.lclk_fp);
+	temp_fp = drm_fixp_div(temp2_fp, tu.pclk_fp);
+	tu.extra_buffer_margin = drm_fixp2int_ceil(temp_fp);
+
+	temp1_fp = drm_fixp_from_fraction(tu.bpp, 8);
+	temp2_fp = drm_fixp_mul(tu.pclk_fp, temp1_fp);
+	temp1_fp = drm_fixp_from_fraction(tu.nlanes, 1);
+	temp2_fp = drm_fixp_div(temp2_fp, temp1_fp);
+	tu.ratio_fp = drm_fixp_div(temp2_fp, tu.lclk_fp);
+
+	tu.original_ratio_fp = tu.ratio_fp;
+	tu.boundary_moderation_en = false;
+	tu.upper_boundary_count = 0;
+	tu.lower_boundary_count = 0;
+	tu.i_upper_boundary_count = 0;
+	tu.i_lower_boundary_count = 0;
+	tu.valid_lower_boundary_link = 0;
+	tu.even_distribution_BF = 0;
+	tu.even_distribution_legacy = 0;
+	tu.even_distribution = 0;
+	tu.delay_start_time_fp = 0;
+
+	tu.err_fp = drm_fixp_from_fraction(1000, 1);
+	tu.n_err_fp = 0;
+	tu.n_n_err_fp = 0;
+
+	tu.ratio = drm_fixp2int(tu.ratio_fp);
+	temp1_fp = drm_fixp_from_fraction(tu.nlanes, 1);
+	div64_u64_rem(tu.lwidth_fp, temp1_fp, &temp2_fp);
+	if (temp2_fp != 0 &&
+			!tu.ratio && tu.dsc_en == 0) {
+		tu.ratio_fp = drm_fixp_mul(tu.ratio_fp, RATIO_SCALE_fp);
+		tu.ratio = drm_fixp2int(tu.ratio_fp);
+		if (tu.ratio)
+			tu.ratio_fp = drm_fixp_from_fraction(1, 1);
+	}
+
+	if (tu.ratio > 1)
+		tu.ratio = 1;
+
+	if (tu.ratio == 1)
+		goto tu_size_calc;
+
+	compare_result_1 = _tu_param_compare(tu.ratio_fp, const_p49_fp);
+	if (!compare_result_1 || compare_result_1 == 1)
+		compare_result_1 = 1;
+	else
+		compare_result_1 = 0;
+
+	compare_result_2 = _tu_param_compare(tu.ratio_fp, const_p56_fp);
+	if (!compare_result_2 || compare_result_2 == 2)
+		compare_result_2 = 1;
+	else
+		compare_result_2 = 0;
+
+	if (tu.dsc_en && compare_result_1 && compare_result_2) {
+		HBLANK_MARGIN += 4;
+		DRM_DEBUG_DP("Info: increase HBLANK_MARGIN to %d\n",
+				HBLANK_MARGIN);
+	}
+
+tu_size_calc:
+	for (tu.tu_size = 32; tu.tu_size <= 64; tu.tu_size++) {
+		temp1_fp = drm_fixp_from_fraction(tu.tu_size, 1);
+		temp2_fp = drm_fixp_mul(tu.ratio_fp, temp1_fp);
+		temp = drm_fixp2int_ceil(temp2_fp);
+		temp1_fp = drm_fixp_from_fraction(temp, 1);
+		tu.n_err_fp = temp1_fp - temp2_fp;
+
+		if (tu.n_err_fp < tu.err_fp) {
+			tu.err_fp = tu.n_err_fp;
+			tu.tu_size_desired = tu.tu_size;
+		}
+	}
+
+	tu.tu_size_minus1 = tu.tu_size_desired - 1;
+
+	temp1_fp = drm_fixp_from_fraction(tu.tu_size_desired, 1);
+	temp2_fp = drm_fixp_mul(tu.ratio_fp, temp1_fp);
+	tu.valid_boundary_link = drm_fixp2int_ceil(temp2_fp);
+
+	temp1_fp = drm_fixp_from_fraction(tu.bpp, 8);
+	temp2_fp = tu.lwidth_fp;
+	temp2_fp = drm_fixp_mul(temp2_fp, temp1_fp);
+
+	temp1_fp = drm_fixp_from_fraction(tu.valid_boundary_link, 1);
+	temp2_fp = drm_fixp_div(temp2_fp, temp1_fp);
+	tu.n_tus = drm_fixp2int(temp2_fp);
+	if ((temp2_fp & 0xFFFFFFFF) > 0xFFFFF000)
+		tu.n_tus += 1;
+
+	tu.even_distribution_legacy = tu.n_tus % tu.nlanes == 0 ? 1 : 0;
+	DRM_DEBUG_DP("Info: n_sym = %d, num_of_tus = %d\n",
+		tu.valid_boundary_link, tu.n_tus);
+
+	temp1_fp = drm_fixp_from_fraction(tu.tu_size_desired, 1);
+	temp2_fp = drm_fixp_mul(tu.original_ratio_fp, temp1_fp);
+	temp1_fp = drm_fixp_from_fraction(tu.valid_boundary_link, 1);
+	temp2_fp = temp1_fp - temp2_fp;
+	temp1_fp = drm_fixp_from_fraction(tu.n_tus + 1, 1);
+	temp2_fp = drm_fixp_mul(temp1_fp, temp2_fp);
+
+	temp = drm_fixp2int(temp2_fp);
+	if (temp && temp2_fp)
+		tu.extra_bytes = drm_fixp2int_ceil(temp2_fp);
+	else
+		tu.extra_bytes = 0;
+
+	temp1_fp = drm_fixp_from_fraction(tu.extra_bytes, 1);
+	temp2_fp = drm_fixp_from_fraction(8, tu.bpp);
+	temp1_fp = drm_fixp_mul(temp1_fp, temp2_fp);
+
+	if (temp && temp1_fp)
+		tu.extra_pclk_cycles = drm_fixp2int_ceil(temp1_fp);
+	else
+		tu.extra_pclk_cycles = drm_fixp2int(temp1_fp);
+
+	temp1_fp = drm_fixp_div(tu.lclk_fp, tu.pclk_fp);
+	temp2_fp = drm_fixp_from_fraction(tu.extra_pclk_cycles, 1);
+	temp1_fp = drm_fixp_mul(temp2_fp, temp1_fp);
+
+	if (temp1_fp)
+		tu.extra_pclk_cycles_in_link_clk = drm_fixp2int_ceil(temp1_fp);
+	else
+		tu.extra_pclk_cycles_in_link_clk = drm_fixp2int(temp1_fp);
+
+	tu.filler_size = tu.tu_size_desired - tu.valid_boundary_link;
+
+	temp1_fp = drm_fixp_from_fraction(tu.tu_size_desired, 1);
+	tu.ratio_by_tu_fp = drm_fixp_mul(tu.ratio_fp, temp1_fp);
+
+	tu.delay_start_link = tu.extra_pclk_cycles_in_link_clk +
+				tu.filler_size + tu.extra_buffer_margin;
+
+	tu.resulting_valid_fp =
+			drm_fixp_from_fraction(tu.valid_boundary_link, 1);
+
+	temp1_fp = drm_fixp_from_fraction(tu.tu_size_desired, 1);
+	temp2_fp = drm_fixp_div(tu.resulting_valid_fp, temp1_fp);
+	tu.TU_ratio_err_fp = temp2_fp - tu.original_ratio_fp;
+
+	temp1_fp = drm_fixp_from_fraction(HBLANK_MARGIN, 1);
+	temp1_fp = tu.hbp_relative_to_pclk_fp - temp1_fp;
+	tu.hbp_time_fp = drm_fixp_div(temp1_fp, tu.pclk_fp);
+
+	temp1_fp = drm_fixp_from_fraction(tu.delay_start_link, 1);
+	tu.delay_start_time_fp = drm_fixp_div(temp1_fp, tu.lclk_fp);
+
+	compare_result_1 = _tu_param_compare(tu.hbp_time_fp,
+					tu.delay_start_time_fp);
+	if (compare_result_1 == 2) /* if (hbp_time_fp < delay_start_time_fp) */
+		tu.min_hblank_violated = 1;
+
+	tu.hactive_time_fp = drm_fixp_div(tu.lwidth_fp, tu.pclk_fp);
+
+	compare_result_2 = _tu_param_compare(tu.hactive_time_fp,
+						tu.delay_start_time_fp);
+	if (compare_result_2 == 2)
+		tu.min_hblank_violated = 1;
+
+	tu.delay_start_time_fp = 0;
+
+	/* brute force */
+
+	tu.delay_start_link_extra_pixclk = EXTRA_PIXCLK_CYCLE_DELAY;
+	tu.diff_abs_fp = tu.resulting_valid_fp - tu.ratio_by_tu_fp;
+
+	temp = drm_fixp2int(tu.diff_abs_fp);
+	if (!temp && tu.diff_abs_fp <= 0xffff)
+		tu.diff_abs_fp = 0;
+
+	/* if(diff_abs < 0) diff_abs *= -1 */
+	if (tu.diff_abs_fp < 0)
+		tu.diff_abs_fp = drm_fixp_mul(tu.diff_abs_fp, -1);
+
+	tu.boundary_mod_lower_err = 0;
+	if ((tu.diff_abs_fp != 0 &&
+			((tu.diff_abs_fp > BRUTE_FORCE_THRESHOLD_fp) ||
+			 (tu.even_distribution_legacy == 0) ||
+			 (DP_BRUTE_FORCE == 1))) ||
+			(tu.min_hblank_violated == 1)) {
+		do {
+			tu.err_fp = drm_fixp_from_fraction(1000, 1);
+
+			temp1_fp = drm_fixp_div(tu.lclk_fp, tu.pclk_fp);
+			temp2_fp = drm_fixp_from_fraction(
+					tu.delay_start_link_extra_pixclk, 1);
+			temp1_fp = drm_fixp_mul(temp2_fp, temp1_fp);
+
+			if (temp1_fp)
+				tu.extra_buffer_margin =
+					drm_fixp2int_ceil(temp1_fp);
+			else
+				tu.extra_buffer_margin = 0;
+
+			temp1_fp = drm_fixp_from_fraction(tu.bpp, 8);
+			temp1_fp = drm_fixp_mul(tu.lwidth_fp, temp1_fp);
+
+			if (temp1_fp)
+				tu.n_symbols = drm_fixp2int_ceil(temp1_fp);
+			else
+				tu.n_symbols = 0;
+
+			for (tu.tu_size = 32; tu.tu_size <= 64; tu.tu_size++) {
+				for (tu.i_upper_boundary_count = 1;
+					tu.i_upper_boundary_count <= 15;
+					tu.i_upper_boundary_count++) {
+					for (tu.i_lower_boundary_count = 1;
+						tu.i_lower_boundary_count <= 15;
+						tu.i_lower_boundary_count++) {
+						_tu_valid_boundary_calc(&tu);
+					}
+				}
+			}
+			tu.delay_start_link_extra_pixclk--;
+		} while (tu.boundary_moderation_en != true &&
+			tu.boundary_mod_lower_err == 1 &&
+			tu.delay_start_link_extra_pixclk != 0);
+
+		if (tu.boundary_moderation_en == true) {
+			temp1_fp = drm_fixp_from_fraction(
+					(tu.upper_boundary_count *
+					tu.valid_boundary_link +
+					tu.lower_boundary_count *
+					(tu.valid_boundary_link - 1)), 1);
+			temp2_fp = drm_fixp_from_fraction(
+					(tu.upper_boundary_count +
+					tu.lower_boundary_count), 1);
+			tu.resulting_valid_fp =
+					drm_fixp_div(temp1_fp, temp2_fp);
+
+			temp1_fp = drm_fixp_from_fraction(
+					tu.tu_size_desired, 1);
+			tu.ratio_by_tu_fp =
+				drm_fixp_mul(tu.original_ratio_fp, temp1_fp);
+
+			tu.valid_lower_boundary_link =
+				tu.valid_boundary_link - 1;
+
+			temp1_fp = drm_fixp_from_fraction(tu.bpp, 8);
+			temp1_fp = drm_fixp_mul(tu.lwidth_fp, temp1_fp);
+			temp2_fp = drm_fixp_div(temp1_fp,
+						tu.resulting_valid_fp);
+			tu.n_tus = drm_fixp2int(temp2_fp);
+
+			tu.tu_size_minus1 = tu.tu_size_desired - 1;
+			tu.even_distribution_BF = 1;
+
+			temp1_fp =
+				drm_fixp_from_fraction(tu.tu_size_desired, 1);
+			temp2_fp =
+				drm_fixp_div(tu.resulting_valid_fp, temp1_fp);
+			tu.TU_ratio_err_fp = temp2_fp - tu.original_ratio_fp;
+		}
+	}
+
+	temp2_fp = drm_fixp_mul(LCLK_FAST_SKEW_fp, tu.lwidth_fp);
+
+	if (temp2_fp)
+		temp = drm_fixp2int_ceil(temp2_fp);
+	else
+		temp = 0;
+
+	temp1_fp = drm_fixp_from_fraction(tu.nlanes, 1);
+	temp2_fp = drm_fixp_mul(tu.original_ratio_fp, temp1_fp);
+	temp1_fp = drm_fixp_from_fraction(tu.bpp, 8);
+	temp2_fp = drm_fixp_div(temp1_fp, temp2_fp);
+	temp1_fp = drm_fixp_from_fraction(temp, 1);
+	temp2_fp = drm_fixp_mul(temp1_fp, temp2_fp);
+	temp = drm_fixp2int(temp2_fp);
+
+	if (tu.async_en)
+		tu.delay_start_link += (int)temp;
+
+	temp1_fp = drm_fixp_from_fraction(tu.delay_start_link, 1);
+	tu.delay_start_time_fp = drm_fixp_div(temp1_fp, tu.lclk_fp);
+
+	/* OUTPUTS */
+	tu_table->valid_boundary_link       = tu.valid_boundary_link;
+	tu_table->delay_start_link          = tu.delay_start_link;
+	tu_table->boundary_moderation_en    = tu.boundary_moderation_en;
+	tu_table->valid_lower_boundary_link = tu.valid_lower_boundary_link;
+	tu_table->upper_boundary_count      = tu.upper_boundary_count;
+	tu_table->lower_boundary_count      = tu.lower_boundary_count;
+	tu_table->tu_size_minus1            = tu.tu_size_minus1;
+
+	DRM_DEBUG_DP("TU: valid_boundary_link: %d\n",
+				tu_table->valid_boundary_link);
+	DRM_DEBUG_DP("TU: delay_start_link: %d\n",
+				tu_table->delay_start_link);
+	DRM_DEBUG_DP("TU: boundary_moderation_en: %d\n",
+			tu_table->boundary_moderation_en);
+	DRM_DEBUG_DP("TU: valid_lower_boundary_link: %d\n",
+			tu_table->valid_lower_boundary_link);
+	DRM_DEBUG_DP("TU: upper_boundary_count: %d\n",
+			tu_table->upper_boundary_count);
+	DRM_DEBUG_DP("TU: lower_boundary_count: %d\n",
+			tu_table->lower_boundary_count);
+	DRM_DEBUG_DP("TU: tu_size_minus1: %d\n", tu_table->tu_size_minus1);
+}
+
+static void dp_ctrl_calc_tu_parameters(struct dp_ctrl_private *ctrl,
+		struct dp_vc_tu_mapping_table *tu_table)
+{
+	struct dp_tu_calc_input in;
+	struct drm_display_mode *drm_mode;
+
+	drm_mode = &ctrl->panel->dp_mode.drm_mode;
+
+	in.lclk = ctrl->link->link_params.rate / 1000;
+	in.pclk_khz = drm_mode->clock;
+	in.hactive = drm_mode->hdisplay;
+	in.hporch = drm_mode->htotal - drm_mode->hdisplay;
+	in.nlanes = ctrl->link->link_params.num_lanes;
+	in.bpp = ctrl->panel->dp_mode.bpp;
+	in.pixel_enc = 444;
+	in.dsc_en = 0;
+	in.async_en = 0;
+	in.fec_en = 0;
+	in.num_of_dsc_slices = 0;
+	in.compress_ratio = 100;
+
+	_dp_ctrl_calc_tu(&in, tu_table);
+}
+
+static void dp_ctrl_setup_tr_unit(struct dp_ctrl_private *ctrl)
+{
+	u32 dp_tu = 0x0;
+	u32 valid_boundary = 0x0;
+	u32 valid_boundary2 = 0x0;
+	struct dp_vc_tu_mapping_table tu_calc_table;
+
+	dp_ctrl_calc_tu_parameters(ctrl, &tu_calc_table);
+
+	dp_tu |= tu_calc_table.tu_size_minus1;
+	valid_boundary |= tu_calc_table.valid_boundary_link;
+	valid_boundary |= (tu_calc_table.delay_start_link << 16);
+
+	valid_boundary2 |= (tu_calc_table.valid_lower_boundary_link << 1);
+	valid_boundary2 |= (tu_calc_table.upper_boundary_count << 16);
+	valid_boundary2 |= (tu_calc_table.lower_boundary_count << 20);
+
+	if (tu_calc_table.boundary_moderation_en)
+		valid_boundary2 |= BIT(0);
+
+	pr_debug("dp_tu=0x%x, valid_boundary=0x%x, valid_boundary2=0x%x\n",
+			dp_tu, valid_boundary, valid_boundary2);
+
+	dp_catalog_ctrl_update_transfer_unit(ctrl->catalog,
+				dp_tu, valid_boundary, valid_boundary2);
+}
+
+static int dp_ctrl_wait4video_ready(struct dp_ctrl_private *ctrl)
+{
+	int ret = 0;
+
+	if (!wait_for_completion_timeout(&ctrl->video_comp,
+				WAIT_FOR_VIDEO_READY_TIMEOUT_JIFFIES)) {
+		DRM_ERROR("Link Train timedout\n");
+		ret = -ETIMEDOUT;
+	}
+	return ret;
+}
+
+static int dp_ctrl_update_vx_px(struct dp_ctrl_private *ctrl)
+{
+	struct dp_link *link = ctrl->link;
+	int ret = 0, lane, lane_cnt;
+	u8 buf[4];
+	u32 max_level_reached = 0;
+	u32 voltage_swing_level = link->phy_params.v_level;
+	u32 pre_emphasis_level = link->phy_params.p_level;
+
+	ret = dp_catalog_ctrl_update_vx_px(ctrl->catalog,
+		voltage_swing_level, pre_emphasis_level);
+
+	if (ret)
+		return ret;
+
+	if (voltage_swing_level > DP_TRAIN_VOLTAGE_SWING_MAX) {
+		DRM_DEBUG_DP("max. voltage swing level reached %d\n",
+				voltage_swing_level);
+		max_level_reached |= DP_TRAIN_MAX_SWING_REACHED;
+	}
+
+	if (pre_emphasis_level == DP_TRAIN_PRE_EMPHASIS_MAX) {
+		DRM_DEBUG_DP("max. pre-emphasis level reached %d\n",
+				pre_emphasis_level);
+		max_level_reached  |= DP_TRAIN_MAX_PRE_EMPHASIS_REACHED;
+	}
+
+	pre_emphasis_level <<= DP_TRAIN_PRE_EMPHASIS_SHIFT;
+
+	lane_cnt = ctrl->link->link_params.num_lanes;
+	for (lane = 0; lane < lane_cnt; lane++)
+		buf[lane] = voltage_swing_level | pre_emphasis_level
+				| max_level_reached;
+
+	DRM_DEBUG_DP("sink: p|v=0x%x\n", voltage_swing_level
+					| pre_emphasis_level);
+	ret = drm_dp_dpcd_write(ctrl->aux, DP_TRAINING_LANE0_SET,
+					buf, lane_cnt);
+	if (ret == lane_cnt)
+		ret = 0;
+
+	return ret;
+}
+
+static bool dp_ctrl_train_pattern_set(struct dp_ctrl_private *ctrl,
+		u8 pattern)
+{
+	u8 buf;
+	int ret = 0;
+
+	DRM_DEBUG_DP("sink: pattern=%x\n", pattern);
+
+	buf = pattern;
+	ret = drm_dp_dpcd_writeb(ctrl->aux,
+					DP_TRAINING_PATTERN_SET, buf);
+	return ret == 1;
+}
+
+static int dp_ctrl_read_link_status(struct dp_ctrl_private *ctrl,
+				    u8 *link_status)
+{
+	int len = 0;
+	u32 const offset = DP_LANE_ALIGN_STATUS_UPDATED - DP_LANE0_1_STATUS;
+	u32 link_status_read_max_retries = 100;
+
+	while (--link_status_read_max_retries) {
+		len = drm_dp_dpcd_read_link_status(ctrl->aux,
+			link_status);
+		if (len != DP_LINK_STATUS_SIZE) {
+			DRM_ERROR("DP link status read failed, err: %d\n", len);
+			return len;
+		}
+
+		if (!(link_status[offset] & DP_LINK_STATUS_UPDATED))
+			return 0;
+	}
+
+	return -ETIMEDOUT;
+}
+
+static int dp_ctrl_link_train_1(struct dp_ctrl_private *ctrl)
+{
+	int tries, old_v_level, ret = 0;
+	u8 link_status[DP_LINK_STATUS_SIZE];
+	int const maximum_retries = 5;
+
+	dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
+
+	ret = dp_catalog_ctrl_set_pattern(ctrl->catalog, DP_TRAINING_PATTERN_1);
+	if (ret)
+		return ret;
+	dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_1 |
+		DP_LINK_SCRAMBLING_DISABLE);
+	ret = dp_ctrl_update_vx_px(ctrl);
+	if (ret)
+		return ret;
+
+	tries = 0;
+	old_v_level = ctrl->link->phy_params.v_level;
+	for (tries = 0; tries < maximum_retries; tries++) {
+		drm_dp_link_train_clock_recovery_delay(ctrl->panel->dpcd);
+
+		ret = dp_ctrl_read_link_status(ctrl, link_status);
+		if (ret)
+			return ret;
+
+		if (drm_dp_clock_recovery_ok(link_status,
+			ctrl->link->link_params.num_lanes)) {
+			return ret;
+		}
+
+		if (ctrl->link->phy_params.v_level >
+			DP_TRAIN_VOLTAGE_SWING_MAX) {
+			DRM_ERROR_RATELIMITED("max v_level reached\n");
+			return -EAGAIN;
+		}
+
+		if (old_v_level != ctrl->link->phy_params.v_level) {
+			tries = 0;
+			old_v_level = ctrl->link->phy_params.v_level;
+		}
+
+		DRM_DEBUG_DP("clock recovery not done, adjusting vx px\n");
+
+		dp_link_adjust_levels(ctrl->link, link_status);
+		ret = dp_ctrl_update_vx_px(ctrl);
+		if (ret)
+			return ret;
+	}
+
+	DRM_ERROR("max tries reached\n");
+	return -ETIMEDOUT;
+}
+
+static void dp_ctrl_link_rate_down_shift(struct dp_ctrl_private *ctrl)
+{
+	switch (ctrl->link->link_params.rate) {
+	case 810000:
+		ctrl->link->link_params.rate = 540000;
+		break;
+	case 540000:
+		ctrl->link->link_params.rate = 270000;
+		break;
+	case 270000:
+	case 162000:
+	default:
+		ctrl->link->link_params.rate = 162000;
+		break;
+	};
+
+	DRM_DEBUG_DP("new rate=0x%x\n", ctrl->link->link_params.rate);
+}
+
+static void dp_ctrl_clear_training_pattern(struct dp_ctrl_private *ctrl)
+{
+	dp_ctrl_train_pattern_set(ctrl, DP_TRAINING_PATTERN_DISABLE);
+	drm_dp_link_train_channel_eq_delay(ctrl->panel->dpcd);
+}
+
+static int dp_ctrl_link_training_2(struct dp_ctrl_private *ctrl)
+{
+	int tries = 0, ret = 0;
+	char pattern;
+	int const maximum_retries = 5;
+	u8 link_status[DP_LINK_STATUS_SIZE];
+
+	dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
+
+	if (drm_dp_tps3_supported(ctrl->panel->dpcd))
+		pattern = DP_TRAINING_PATTERN_3;
+	else
+		pattern = DP_TRAINING_PATTERN_2;
+
+	ret = dp_ctrl_update_vx_px(ctrl);
+	if (ret)
+		return ret;
+
+	ret = dp_catalog_ctrl_set_pattern(ctrl->catalog, pattern);
+	if (ret)
+		return ret;
+
+	dp_ctrl_train_pattern_set(ctrl, pattern | DP_RECOVERED_CLOCK_OUT_EN);
+
+	for (tries = 0; tries <= maximum_retries; tries++) {
+		drm_dp_link_train_channel_eq_delay(ctrl->panel->dpcd);
+
+		ret = dp_ctrl_read_link_status(ctrl, link_status);
+		if (ret)
+			return ret;
+
+		if (drm_dp_channel_eq_ok(link_status,
+			ctrl->link->link_params.num_lanes))
+			return ret;
+
+		dp_link_adjust_levels(ctrl->link, link_status);
+		ret = dp_ctrl_update_vx_px(ctrl);
+		if (ret)
+			return ret;
+
+	}
+
+	return -ETIMEDOUT;
+}
+
+static int dp_ctrl_link_train(struct dp_ctrl_private *ctrl)
+{
+	int ret = 0;
+	u8 encoding = DP_SET_ANSI_8B10B;
+	struct dp_link_info link_info = {0};
+
+	ctrl->link->phy_params.p_level = 0;
+	ctrl->link->phy_params.v_level = 0;
+
+	dp_ctrl_config_ctrl(ctrl);
+
+	link_info.num_lanes = ctrl->link->link_params.num_lanes;
+	link_info.rate = ctrl->link->link_params.rate;
+	link_info.capabilities = DP_LINK_CAP_ENHANCED_FRAMING;
+
+	dp_aux_link_configure(ctrl->aux, &link_info);
+	drm_dp_dpcd_write(ctrl->aux, DP_MAIN_LINK_CHANNEL_CODING_SET,
+				&encoding, 1);
+
+	ret = dp_ctrl_link_train_1(ctrl);
+	if (ret) {
+		DRM_ERROR("link training #1 failed. ret=%d\n", ret);
+		goto end;
+	}
+
+	/* print success info as this is a result of user initiated action */
+	DRM_DEBUG_DP("link training #1 successful\n");
+
+	ret = dp_ctrl_link_training_2(ctrl);
+	if (ret) {
+		DRM_ERROR("link training #2 failed. ret=%d\n", ret);
+		goto end;
+	}
+
+	/* print success info as this is a result of user initiated action */
+	DRM_DEBUG_DP("link training #2 successful\n");
+
+end:
+	dp_catalog_ctrl_state_ctrl(ctrl->catalog, 0);
+
+	dp_ctrl_clear_training_pattern(ctrl);
+	return ret;
+}
+
+static int dp_ctrl_setup_main_link(struct dp_ctrl_private *ctrl, bool train)
+{
+	bool mainlink_ready = false;
+	int ret = 0;
+
+	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, true);
+
+	ret = dp_link_psm_config(ctrl->link, &ctrl->panel->link_info, false);
+	if (ret)
+		return ret;
+
+	if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN)
+		return ret;
+
+	if (train) {
+		/*
+		 * As part of previous calls, DP controller state might have
+		 * transitioned to PUSH_IDLE. In order to start transmitting
+		 * a link training pattern, we have to first do soft reset.
+		 */
+		dp_catalog_ctrl_reset(ctrl->catalog);
+
+		ret = dp_ctrl_link_train(ctrl);
+		if (ret)
+			return ret;
+	}
+
+	/*
+	 * Set up transfer unit values and set controller state to send
+	 * video.
+	 */
+	dp_ctrl_setup_tr_unit(ctrl);
+	dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);
+
+	ret = dp_ctrl_wait4video_ready(ctrl);
+	if (ret)
+		return ret;
+
+	mainlink_ready = dp_catalog_ctrl_mainlink_ready(ctrl->catalog);
+	DRM_DEBUG_DP("mainlink %s\n", mainlink_ready ? "READY" : "NOT READY");
+	return ret;
+}
+
+static void dp_ctrl_set_clock_rate(struct dp_ctrl_private *ctrl,
+				   char *name, u32 rate)
+{
+	u32 num = ctrl->parser->mp[DP_CTRL_PM].num_clk;
+	struct dss_clk *cfg = ctrl->parser->mp[DP_CTRL_PM].clk_config;
+
+	while (num && strcmp(cfg->clk_name, name)) {
+		num--;
+		cfg++;
+	}
+
+	DRM_DEBUG_DP("setting rate=%d on clk=%s\n", rate, name);
+
+	if (num)
+		cfg->rate = rate;
+	else
+		DRM_ERROR("%s clock doesn't exit to set rate %d\n",
+				name, rate);
+}
+
+static int dp_ctrl_enable_mainlink_clocks(struct dp_ctrl_private *ctrl)
+{
+	int ret = 0;
+
+	dp_power_set_link_clk_parent(ctrl->power);
+
+	dp_ctrl_set_clock_rate(ctrl, "ctrl_link",
+					ctrl->link->link_params.rate);
+
+	dp_ctrl_set_clock_rate(ctrl, "stream_pixel",
+					ctrl->dp_ctrl.pixel_rate);
+
+	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, true);
+	if (ret)
+		DRM_ERROR("Unable to start link clocks. ret=%d\n", ret);
+
+	return ret;
+}
+
+int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip)
+{
+	struct dp_ctrl_private *ctrl;
+
+	if (!dp_ctrl) {
+		DRM_ERROR("Invalid input data\n");
+		return -EINVAL;
+	}
+
+	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+
+	ctrl->dp_ctrl.orientation = flip;
+
+	dp_catalog_ctrl_usb_reset(ctrl->catalog, flip);
+	dp_catalog_ctrl_phy_reset(ctrl->catalog);
+	dp_catalog_ctrl_enable_irq(ctrl->catalog, true);
+
+	return 0;
+}
+
+/**
+ * dp_ctrl_host_deinit() - Uninitialize DP controller
+ * @dp_ctrl: Display Port Driver data
+ *
+ * Perform required steps to uninitialize DP controller
+ * and its resources.
+ */
+void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl)
+{
+	struct dp_ctrl_private *ctrl;
+
+	if (!dp_ctrl) {
+		DRM_ERROR("Invalid input data\n");
+		return;
+	}
+
+	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+
+	dp_catalog_ctrl_enable_irq(ctrl->catalog, false);
+
+	DRM_DEBUG_DP("Host deinitialized successfully\n");
+}
+
+static bool dp_ctrl_use_fixed_nvid(struct dp_ctrl_private *ctrl)
+{
+	u8 *dpcd = ctrl->panel->dpcd;
+	u32 edid_quirks = 0;
+
+	edid_quirks = drm_dp_get_edid_quirks(ctrl->panel->edid);
+	/*
+	 * For better interop experience, used a fixed NVID=0x8000
+	 * whenever connected to a VGA dongle downstream.
+	 */
+	if (drm_dp_is_branch(dpcd))
+		return (drm_dp_has_quirk(&ctrl->panel->desc, edid_quirks,
+				DP_DPCD_QUIRK_CONSTANT_N));
+
+	return false;
+}
+
+static int dp_ctrl_reinitialize_mainlink(struct dp_ctrl_private *ctrl)
+{
+	int ret = 0;
+
+	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
+	dp_catalog_ctrl_phy_lane_cfg(ctrl->catalog,
+		ctrl->dp_ctrl.orientation, ctrl->link->link_params.num_lanes);
+	/*
+	 * Disable and re-enable the mainlink clock since the
+	 * link clock might have been adjusted as part of the
+	 * link maintenance.
+	 */
+	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
+	if (ret) {
+		DRM_ERROR("Failed to disable clocks. ret=%d\n", ret);
+		return ret;
+	}
+	/* hw recommended delay before re-enabling clocks */
+	msleep(20);
+
+	ret = dp_ctrl_enable_mainlink_clocks(ctrl);
+	if (ret) {
+		DRM_ERROR("Failed to enable mainlink clks. ret=%d\n", ret);
+		return ret;
+	}
+
+	dp_ctrl_configure_source_params(ctrl);
+	dp_catalog_ctrl_config_msa(ctrl->catalog,
+		ctrl->link->link_params.rate,
+		ctrl->dp_ctrl.pixel_rate, dp_ctrl_use_fixed_nvid(ctrl));
+	reinit_completion(&ctrl->idle_comp);
+
+	return ret;
+}
+
+static int dp_ctrl_link_maintenance(struct dp_ctrl_private *ctrl)
+{
+	int ret = 0;
+	int tries;
+
+	dp_ctrl_push_idle(&ctrl->dp_ctrl);
+	dp_catalog_ctrl_reset(ctrl->catalog);
+
+	ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
+
+	for (tries = 0; tries < 10; tries++) {
+		ret = dp_ctrl_reinitialize_mainlink(ctrl);
+		if (ret) {
+			DRM_ERROR("Failed to reinitialize mainlink. ret=%d\n",
+					ret);
+			break;
+		}
+
+		ret = dp_ctrl_setup_main_link(ctrl, true);
+		if (ret == -EAGAIN) /* try with lower link rate */
+			dp_ctrl_link_rate_down_shift(ctrl);
+	}
+	return ret;
+}
+
+static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
+{
+	int ret = 0;
+
+	if (!ctrl->link->phy_params.phy_test_pattern_sel) {
+		DRM_DEBUG_DP("no test pattern selected by sink\n");
+		return ret;
+	}
+
+	dp_ctrl_push_idle(&ctrl->dp_ctrl);
+	/*
+	 * The global reset will need DP link related clocks to be
+	 * running. Add the global reset just before disabling the
+	 * link clocks and core clocks.
+	 */
+	dp_catalog_ctrl_reset(ctrl->catalog);
+	ret = dp_ctrl_off(&ctrl->dp_ctrl);
+	if (ret) {
+		DRM_ERROR("failed to disable DP controller\n");
+		return ret;
+	}
+
+	ret = dp_ctrl_on(&ctrl->dp_ctrl);
+	if (ret)
+		DRM_ERROR("failed to enable DP controller\n");
+
+	return ret;
+}
+
+static bool dp_ctrl_send_phy_test_pattern(struct dp_ctrl_private *ctrl)
+{
+	bool success = false;
+	u32 pattern_sent = 0x0;
+	u32 pattern_requested = ctrl->link->phy_params.phy_test_pattern_sel;
+
+	DRM_DEBUG_DP("request: 0x%x\n", pattern_requested);
+
+	if (dp_catalog_ctrl_update_vx_px(ctrl->catalog,
+			ctrl->link->phy_params.v_level,
+			ctrl->link->phy_params.p_level)) {
+		DRM_ERROR("Failed to set v/p levels\n");
+		return false;
+	}
+	dp_catalog_ctrl_send_phy_pattern(ctrl->catalog, pattern_requested);
+	dp_link_send_test_response(ctrl->link);
+
+	pattern_sent = dp_catalog_ctrl_read_phy_pattern(ctrl->catalog);
+
+	switch (pattern_sent) {
+	case MR_LINK_TRAINING1:
+		success = pattern_requested ==
+				DP_LINK_QUAL_PATTERN_D10_2;
+		break;
+	case MR_LINK_SYMBOL_ERM:
+		success = (pattern_requested ==
+				DP_LINK_QUAL_PATTERN_ERROR_RATE)
+			|| (pattern_requested ==
+				DP_LINK_QUAL_PATTERN_HBR2_EYE);
+		break;
+	case MR_LINK_PRBS7:
+		success = pattern_requested == DP_LINK_QUAL_PATTERN_PRBS7;
+		break;
+	case MR_LINK_CUSTOM80:
+		success = pattern_requested ==
+				DP_LINK_QUAL_PATTERN_80BIT_CUSTOM;
+		break;
+	default:
+		success = false;
+	}
+
+	DRM_DEBUG_DP("%s: test->0x%x\n", success ? "success" : "failed",
+						pattern_requested);
+	return success;
+}
+
+void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl)
+{
+	struct dp_ctrl_private *ctrl;
+	u32 sink_request = 0x0;
+
+	if (!dp_ctrl) {
+		DRM_ERROR("invalid input\n");
+		return;
+	}
+
+	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+	sink_request = ctrl->link->sink_request;
+
+	if (sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
+		DRM_DEBUG_DP("PHY_TEST_PATTERN request\n");
+		if (dp_ctrl_process_phy_test_request(ctrl)) {
+			DRM_ERROR("process phy_test_req failed\n");
+			return;
+		}
+	}
+
+	if (sink_request & DP_LINK_STATUS_UPDATED)
+		if (dp_ctrl_link_maintenance(ctrl)) {
+			DRM_ERROR("LM failed: STATUS_UPDATED\n");
+			return;
+		}
+
+
+	if (sink_request & DP_TEST_LINK_TRAINING) {
+		dp_link_send_test_response(ctrl->link);
+		if (dp_ctrl_link_maintenance(ctrl)) {
+			DRM_ERROR("LM failed: TEST_LINK_TRAINING\n");
+			return;
+		}
+	}
+}
+
+int dp_ctrl_on(struct dp_ctrl *dp_ctrl)
+{
+	int rc = 0;
+	struct dp_ctrl_private *ctrl;
+	u32 rate = 0;
+	u32 link_train_max_retries = 10;
+	u32 const phy_cts_pixel_clk_khz = 148500;
+
+	if (!dp_ctrl)
+		return -EINVAL;
+
+	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+
+	rate = ctrl->panel->link_info.rate;
+
+	dp_power_clk_enable(ctrl->power, DP_CORE_PM, true);
+	dp_catalog_ctrl_hpd_config(ctrl->catalog, true);
+
+	if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
+		DRM_DEBUG_DP("using phy test link parameters\n");
+		if (!ctrl->panel->dp_mode.drm_mode.clock)
+			ctrl->dp_ctrl.pixel_rate = phy_cts_pixel_clk_khz;
+	} else {
+		ctrl->link->link_params.rate = rate;
+		ctrl->link->link_params.num_lanes =
+			ctrl->panel->link_info.num_lanes;
+		ctrl->dp_ctrl.pixel_rate = ctrl->panel->dp_mode.drm_mode.clock;
+	}
+
+	DRM_DEBUG_DP("rate=%d, num_lanes=%d, pixel_rate=%d\n",
+		ctrl->link->link_params.rate,
+		ctrl->link->link_params.num_lanes, ctrl->dp_ctrl.pixel_rate);
+
+	dp_catalog_ctrl_phy_lane_cfg(ctrl->catalog,
+			ctrl->dp_ctrl.orientation,
+			ctrl->link->link_params.num_lanes);
+
+	rc = dp_ctrl_enable_mainlink_clocks(ctrl);
+	if (rc)
+		return rc;
+
+	while (--link_train_max_retries &&
+		!atomic_read(&ctrl->dp_ctrl.aborted)) {
+		rc = dp_ctrl_reinitialize_mainlink(ctrl);
+		if (rc) {
+			DRM_ERROR("Failed to reinitialize mainlink. rc=%d\n",
+					rc);
+			break;
+		}
+		rc = dp_ctrl_setup_main_link(ctrl, true);
+		if (!rc)
+			break;
+		/* try with lower link rate */
+		dp_ctrl_link_rate_down_shift(ctrl);
+	}
+
+	if (ctrl->link->sink_request & DP_TEST_LINK_PHY_TEST_PATTERN)
+		dp_ctrl_send_phy_test_pattern(ctrl);
+
+	return rc;
+}
+
+int dp_ctrl_off(struct dp_ctrl *dp_ctrl)
+{
+	struct dp_ctrl_private *ctrl;
+	int ret = 0;
+
+	if (!dp_ctrl)
+		return -EINVAL;
+
+	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+
+	dp_catalog_ctrl_mainlink_ctrl(ctrl->catalog, false);
+	dp_catalog_ctrl_reset(ctrl->catalog);
+	ret = dp_power_clk_enable(ctrl->power, DP_CTRL_PM, false);
+	if (ret) {
+		DRM_ERROR("Failed to disable clocks. ret=%d\n", ret);
+		return ret;
+	}
+
+	DRM_DEBUG_DP("DP off done\n");
+	return ret;
+}
+
+void dp_ctrl_isr(struct dp_ctrl *dp_ctrl)
+{
+	struct dp_ctrl_private *ctrl;
+	u32 isr;
+
+	if (!dp_ctrl)
+		return;
+
+	ctrl = container_of(dp_ctrl, struct dp_ctrl_private, dp_ctrl);
+
+	isr = dp_catalog_ctrl_get_interrupt(ctrl->catalog);
+
+	if (isr & DP_CTRL_INTR_READY_FOR_VIDEO) {
+		DRM_DEBUG_DP("dp_video_ready\n");
+		complete(&ctrl->video_comp);
+	}
+
+	if (isr & DP_CTRL_INTR_IDLE_PATTERN_SENT) {
+		DRM_DEBUG_DP("idle_patterns_sent\n");
+		complete(&ctrl->idle_comp);
+	}
+}
+
+struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
+			struct dp_panel *panel,	struct drm_dp_aux *aux,
+			struct dp_power *power, struct dp_catalog *catalog,
+			struct dp_parser *parser)
+{
+	struct dp_ctrl_private *ctrl;
+
+	if (!dev || !panel || !aux ||
+	    !link || !catalog) {
+		DRM_ERROR("invalid input\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
+	if (!ctrl) {
+		DRM_ERROR("Mem allocation failure\n");
+		return ERR_PTR(-ENOMEM);
+	}
+
+	init_completion(&ctrl->idle_comp);
+	init_completion(&ctrl->video_comp);
+	mutex_init(&ctrl->push_idle_mutex);
+
+	/* in parameters */
+	ctrl->parser   = parser;
+	ctrl->panel    = panel;
+	ctrl->power    = power;
+	ctrl->aux      = aux;
+	ctrl->link     = link;
+	ctrl->catalog  = catalog;
+	ctrl->dev      = dev;
+
+	return &ctrl->dp_ctrl;
+}
+
+void dp_ctrl_put(struct dp_ctrl *dp_ctrl)
+{
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
new file mode 100644
index 000000000000..94713a0daff0
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DP_CTRL_H_
+#define _DP_CTRL_H_
+
+#include "dp_aux.h"
+#include "dp_panel.h"
+#include "dp_link.h"
+#include "dp_parser.h"
+#include "dp_power.h"
+#include "dp_catalog.h"
+
+struct dp_ctrl {
+	bool orientation;
+	atomic_t aborted;
+	u32 pixel_rate;
+};
+
+int dp_ctrl_host_init(struct dp_ctrl *dp_ctrl, bool flip);
+void dp_ctrl_host_deinit(struct dp_ctrl *dp_ctrl);
+int dp_ctrl_on(struct dp_ctrl *dp_ctrl);
+int dp_ctrl_off(struct dp_ctrl *dp_ctrl);
+void dp_ctrl_push_idle(struct dp_ctrl *dp_ctrl);
+void dp_ctrl_isr(struct dp_ctrl *dp_ctrl);
+void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl);
+struct dp_ctrl *dp_ctrl_get(struct device *dev, struct dp_link *link,
+			struct dp_panel *panel,	struct drm_dp_aux *aux,
+			struct dp_power *power, struct dp_catalog *catalog,
+			struct dp_parser *parser);
+void dp_ctrl_put(struct dp_ctrl *dp_ctrl);
+
+#endif /* _DP_CTRL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
new file mode 100644
index 000000000000..ff381807e350
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -0,0 +1,936 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/uaccess.h>
+#include <linux/debugfs.h>
+#include <linux/component.h>
+#include <linux/of_irq.h>
+
+#include "msm_drv.h"
+#include "msm_kms.h"
+#include "dp_hpd.h"
+#include "dp_parser.h"
+#include "dp_power.h"
+#include "dp_catalog.h"
+#include "dp_aux.h"
+#include "dp_link.h"
+#include "dp_panel.h"
+#include "dp_ctrl.h"
+#include "dp_display.h"
+#include "dp_drm.h"
+
+static struct msm_dp *g_dp_display;
+#define HPD_STRING_SIZE 30
+
+struct dp_display_private {
+	char *name;
+	int irq;
+
+	/* state variables */
+	bool core_initialized;
+	bool power_on;
+	bool hpd_irq_on;
+	bool audio_supported;
+
+	struct platform_device *pdev;
+	struct dentry *root;
+	struct completion notification_comp;
+
+	struct dp_usbpd   *usbpd;
+	struct dp_parser  *parser;
+	struct dp_power   *power;
+	struct dp_catalog *catalog;
+	struct drm_dp_aux *aux;
+	struct dp_link    *link;
+	struct dp_panel   *panel;
+	struct dp_ctrl    *ctrl;
+
+	struct dp_usbpd_cb usbpd_cb;
+	struct dp_display_mode dp_mode;
+	struct msm_dp dp_display;
+};
+
+static const struct of_device_id dp_dt_match[] = {
+	{.compatible = "qcom,sc7180-dp"},
+	{}
+};
+
+static irqreturn_t dp_display_irq(int irq, void *dev_id)
+{
+	struct dp_display_private *dp = dev_id;
+
+	/* DP controller isr */
+	dp_ctrl_isr(dp->ctrl);
+
+	/* DP aux isr */
+	dp_aux_isr(dp->aux);
+
+	return IRQ_HANDLED;
+}
+
+static int dp_display_bind(struct device *dev, struct device *master,
+			   void *data)
+{
+	int rc = 0;
+	struct dp_display_private *dp;
+	struct drm_device *drm;
+	struct msm_drm_private *priv;
+	struct platform_device *pdev = to_platform_device(dev);
+
+	drm = dev_get_drvdata(master);
+
+	dp = platform_get_drvdata(pdev);
+	if (!dp) {
+		DRM_ERROR("DP driver bind failed. Invalid driver data\n");
+		return -EINVAL;
+	}
+
+	dp->dp_display.drm_dev = drm;
+	priv = drm->dev_private;
+	priv->dp = &(dp->dp_display);
+
+	rc = dp->parser->parse(dp->parser);
+	if (rc) {
+		DRM_ERROR("device tree parsing failed\n");
+		goto end;
+	}
+
+	rc = dp_aux_register(dp->aux);
+	if (rc) {
+		DRM_ERROR("DRM DP AUX register failed\n");
+		goto end;
+	}
+
+	rc = dp_power_client_init(dp->power);
+	if (rc) {
+		DRM_ERROR("Power client create failed\n");
+		goto end;
+	}
+
+end:
+	return rc;
+}
+
+static void dp_display_unbind(struct device *dev, struct device *master,
+			      void *data)
+{
+	struct dp_display_private *dp;
+	struct platform_device *pdev = to_platform_device(dev);
+	struct drm_device *drm = dev_get_drvdata(master);
+	struct msm_drm_private *priv = drm->dev_private;
+
+	dp = platform_get_drvdata(pdev);
+	if (!dp) {
+		DRM_ERROR("Invalid DP driver data\n");
+		return;
+	}
+
+	dp_power_client_deinit(dp->power);
+	dp_aux_unregister(dp->aux);
+	priv->dp = NULL;
+}
+
+static const struct component_ops dp_display_comp_ops = {
+	.bind = dp_display_bind,
+	.unbind = dp_display_unbind,
+};
+
+static bool dp_display_is_ds_bridge(struct dp_panel *panel)
+{
+	return (panel->dpcd[DP_DOWNSTREAMPORT_PRESENT] &
+		DP_DWN_STRM_PORT_PRESENT);
+}
+
+static bool dp_display_is_sink_count_zero(struct dp_display_private *dp)
+{
+	return dp_display_is_ds_bridge(dp->panel) &&
+		(dp->link->sink_count == 0);
+}
+
+static void dp_display_send_hpd_event(struct msm_dp *dp_display)
+{
+	struct dp_display_private *dp;
+	struct drm_connector *connector;
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+
+	connector = dp->dp_display.connector;
+	drm_helper_hpd_irq_event(connector->dev);
+}
+
+static int dp_display_send_hpd_notification(struct dp_display_private *dp,
+					    bool hpd)
+{
+	static bool encoder_mode_set;
+	struct msm_drm_private *priv = dp->dp_display.drm_dev->dev_private;
+	struct msm_kms *kms = priv->kms;
+
+	mutex_lock(&dp->dp_display.connect_mutex);
+	if ((hpd && dp->dp_display.is_connected) ||
+			(!hpd && !dp->dp_display.is_connected)) {
+		DRM_DEBUG_DP("HPD already %s\n", (hpd ? "on" : "off"));
+		mutex_unlock(&dp->dp_display.connect_mutex);
+		return 0;
+	}
+
+	/* reset video pattern flag on disconnect */
+	if (!hpd)
+		dp->panel->video_test = false;
+
+	dp->dp_display.is_connected = hpd;
+	reinit_completion(&dp->notification_comp);
+
+	if (dp->dp_display.is_connected && dp->dp_display.encoder
+				&& !encoder_mode_set
+				&& kms->funcs->set_encoder_mode) {
+		kms->funcs->set_encoder_mode(kms,
+				dp->dp_display.encoder, false);
+		DRM_DEBUG_DP("set_encoder_mode() Completed\n");
+		encoder_mode_set = true;
+	}
+
+	dp_display_send_hpd_event(&dp->dp_display);
+
+	if (!wait_for_completion_timeout(&dp->notification_comp, HZ * 2)) {
+		pr_warn("%s timeout\n", hpd ? "connect" : "disconnect");
+		mutex_unlock(&dp->dp_display.connect_mutex);
+		return -EINVAL;
+	}
+
+	mutex_unlock(&dp->dp_display.connect_mutex);
+	return 0;
+}
+
+static int dp_display_process_hpd_high(struct dp_display_private *dp)
+{
+	int rc = 0;
+	struct edid *edid;
+
+	dp_aux_init(dp->aux);
+
+	if (dp->link->psm_enabled)
+		goto notify;
+
+	dp->panel->max_dp_lanes = dp->parser->max_dp_lanes;
+
+	rc = dp_panel_read_sink_caps(dp->panel, dp->dp_display.connector);
+	if (rc)
+		goto notify;
+
+	dp_link_process_request(dp->link);
+
+	if (dp_display_is_sink_count_zero(dp)) {
+		DRM_DEBUG_DP("no downstream devices connected\n");
+		rc = -EINVAL;
+		goto end;
+	}
+
+	edid = dp->panel->edid;
+
+	dp->audio_supported = drm_detect_monitor_audio(edid);
+
+	dp_panel_handle_sink_request(dp->panel);
+
+	dp->dp_display.max_pclk_khz = DP_MAX_PIXEL_CLK_KHZ;
+	dp->dp_display.max_dp_lanes = dp->parser->max_dp_lanes;
+notify:
+	dp_display_send_hpd_notification(dp, true);
+
+end:
+	return rc;
+}
+
+static void dp_display_host_init(struct dp_display_private *dp)
+{
+	bool flip = false;
+
+	if (dp->core_initialized) {
+		DRM_DEBUG_DP("DP core already initialized\n");
+		return;
+	}
+
+	if (dp->usbpd->orientation == ORIENTATION_CC2)
+		flip = true;
+
+	dp_power_init(dp->power, flip);
+	dp_ctrl_host_init(dp->ctrl, flip);
+	dp_aux_init(dp->aux);
+	dp->core_initialized = true;
+}
+
+static void dp_display_host_deinit(struct dp_display_private *dp)
+{
+	if (!dp->core_initialized) {
+		DRM_DEBUG_DP("DP core already off\n");
+		return;
+	}
+
+	dp_ctrl_host_deinit(dp->ctrl);
+	dp_aux_deinit(dp->aux);
+	dp_power_deinit(dp->power);
+	disable_irq(dp->irq);
+	dp->core_initialized = false;
+}
+
+static void dp_display_process_hpd_low(struct dp_display_private *dp)
+{
+	dp_display_send_hpd_notification(dp, false);
+
+	dp_aux_deinit(dp->aux);
+}
+
+static int dp_display_usbpd_configure_cb(struct device *dev)
+{
+	int rc = 0;
+	struct dp_display_private *dp;
+
+	if (!dev) {
+		DRM_ERROR("invalid dev\n");
+		rc = -EINVAL;
+		goto end;
+	}
+
+	dp = dev_get_drvdata(dev);
+	if (!dp) {
+		DRM_ERROR("no driver data found\n");
+		rc = -ENODEV;
+		goto end;
+	}
+
+	dp_display_host_init(dp);
+
+	if (dp->usbpd->hpd_high)
+		dp_display_process_hpd_high(dp);
+end:
+	return rc;
+}
+
+static void dp_display_clean(struct dp_display_private *dp)
+{
+	dp_ctrl_push_idle(dp->ctrl);
+	dp_ctrl_off(dp->ctrl);
+}
+
+static int dp_display_usbpd_disconnect_cb(struct device *dev)
+{
+	int rc = 0;
+	struct dp_display_private *dp;
+
+	dp = dev_get_drvdata(dev);
+
+	rc = dp_display_send_hpd_notification(dp, false);
+
+	/* if cable is disconnected, reset psm_enabled flag */
+	if (!dp->usbpd->alt_mode_cfg_done)
+		dp->link->psm_enabled = false;
+
+	if ((rc < 0) && dp->power_on)
+		dp_display_clean(dp);
+
+	dp_display_host_deinit(dp);
+	return rc;
+}
+
+static void dp_display_handle_video_request(struct dp_display_private *dp)
+{
+	if (dp->link->sink_request & DP_TEST_LINK_VIDEO_PATTERN) {
+		/* force disconnect followed by connect */
+		dp->usbpd->connect(dp->usbpd, false);
+		dp->panel->video_test = true;
+		dp->usbpd->connect(dp->usbpd, true);
+		dp_link_send_test_response(dp->link);
+	}
+}
+
+static int dp_display_handle_hpd_irq(struct dp_display_private *dp)
+{
+	if (dp->link->sink_request & DS_PORT_STATUS_CHANGED) {
+		dp_display_send_hpd_notification(dp, false);
+
+		if (dp_display_is_sink_count_zero(dp)) {
+			DRM_DEBUG_DP("sink count is zero, nothing to do\n");
+			return 0;
+		}
+
+		return dp_display_process_hpd_high(dp);
+	}
+
+	dp_ctrl_handle_sink_request(dp->ctrl);
+
+	dp_display_handle_video_request(dp);
+
+	return 0;
+}
+
+static int dp_display_usbpd_attention_cb(struct device *dev)
+{
+	int rc = 0;
+	struct dp_display_private *dp;
+
+	if (!dev) {
+		DRM_ERROR("invalid dev\n");
+		return -EINVAL;
+	}
+
+	dp = dev_get_drvdata(dev);
+	if (!dp) {
+		DRM_ERROR("no driver data found\n");
+		return -ENODEV;
+	}
+
+	if (dp->usbpd->hpd_irq) {
+		dp->hpd_irq_on = true;
+
+		rc = dp_link_process_request(dp->link);
+		/* check for any test request issued by sink */
+		if (!rc)
+			dp_display_handle_hpd_irq(dp);
+
+		dp->hpd_irq_on = false;
+		goto end;
+	}
+
+	if (!dp->usbpd->hpd_high) {
+		dp_display_process_hpd_low(dp);
+		goto end;
+	}
+
+	if (dp->usbpd->alt_mode_cfg_done)
+		dp_display_process_hpd_high(dp);
+end:
+	return rc;
+}
+
+static void dp_display_deinit_sub_modules(struct dp_display_private *dp)
+{
+	dp_ctrl_put(dp->ctrl);
+	dp_panel_put(dp->panel);
+	dp_aux_put(dp->aux);
+}
+
+static int dp_init_sub_modules(struct dp_display_private *dp)
+{
+	int rc = 0;
+	struct device *dev = &dp->pdev->dev;
+	struct dp_usbpd_cb *cb = &dp->usbpd_cb;
+	struct dp_panel_in panel_in = {
+		.dev = dev,
+	};
+
+	/* Callback APIs used for cable status change event */
+	cb->configure  = dp_display_usbpd_configure_cb;
+	cb->disconnect = dp_display_usbpd_disconnect_cb;
+	cb->attention  = dp_display_usbpd_attention_cb;
+
+	dp->usbpd = dp_hpd_get(dev, cb);
+	if (IS_ERR(dp->usbpd)) {
+		rc = PTR_ERR(dp->usbpd);
+		DRM_ERROR("failed to initialize hpd, rc = %d\n", rc);
+		dp->usbpd = NULL;
+		goto error;
+	}
+
+	dp->parser = dp_parser_get(dp->pdev);
+	if (IS_ERR(dp->parser)) {
+		rc = PTR_ERR(dp->parser);
+		DRM_ERROR("failed to initialize parser, rc = %d\n", rc);
+		dp->parser = NULL;
+		goto error;
+	}
+
+	dp->catalog = dp_catalog_get(dev, &dp->parser->io);
+	if (IS_ERR(dp->catalog)) {
+		rc = PTR_ERR(dp->catalog);
+		DRM_ERROR("failed to initialize catalog, rc = %d\n", rc);
+		dp->catalog = NULL;
+		goto error;
+	}
+
+	dp->power = dp_power_get(dp->parser);
+	if (IS_ERR(dp->power)) {
+		rc = PTR_ERR(dp->power);
+		DRM_ERROR("failed to initialize power, rc = %d\n", rc);
+		dp->power = NULL;
+		goto error;
+	}
+
+	dp->aux = dp_aux_get(dev, dp->catalog);
+	if (IS_ERR(dp->aux)) {
+		rc = PTR_ERR(dp->aux);
+		DRM_ERROR("failed to initialize aux, rc = %d\n", rc);
+		dp->aux = NULL;
+		goto error;
+	}
+
+	dp->link = dp_link_get(dev, dp->aux);
+	if (IS_ERR(dp->link)) {
+		rc = PTR_ERR(dp->link);
+		DRM_ERROR("failed to initialize link, rc = %d\n", rc);
+		dp->link = NULL;
+		goto error_link;
+	}
+
+	panel_in.aux = dp->aux;
+	panel_in.catalog = dp->catalog;
+	panel_in.link = dp->link;
+
+	dp->panel = dp_panel_get(&panel_in);
+	if (IS_ERR(dp->panel)) {
+		rc = PTR_ERR(dp->panel);
+		DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
+		dp->panel = NULL;
+		goto error_link;
+	}
+
+	dp->ctrl = dp_ctrl_get(dev, dp->link, dp->panel, dp->aux,
+			       dp->power, dp->catalog, dp->parser);
+	if (IS_ERR(dp->ctrl)) {
+		rc = PTR_ERR(dp->ctrl);
+		DRM_ERROR("failed to initialize ctrl, rc = %d\n", rc);
+		dp->ctrl = NULL;
+		goto error_ctrl;
+	}
+
+	return rc;
+error_ctrl:
+	dp_panel_put(dp->panel);
+error_link:
+	dp_aux_put(dp->aux);
+error:
+	return rc;
+}
+
+static int dp_display_set_mode(struct msm_dp *dp_display,
+			       struct dp_display_mode *mode)
+{
+	struct dp_display_private *dp;
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+
+	dp->panel->dp_mode.drm_mode = mode->drm_mode;
+	dp->panel->dp_mode.bpp = mode->bpp;
+	dp->panel->dp_mode.capabilities = mode->capabilities;
+	dp_panel_init_panel_info(dp->panel);
+	return 0;
+}
+
+static int dp_display_prepare(struct msm_dp *dp)
+{
+	return 0;
+}
+
+static void dp_display_dump(struct msm_dp *dp_display)
+{
+	struct dp_display_private *dp;
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+
+	dp_panel_dump_regs(dp->panel);
+}
+
+static int dp_display_enable(struct msm_dp *dp_display)
+{
+	int rc = 0;
+	struct dp_display_private *dp;
+	bool dump_dp = false;
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+
+	if (dp->power_on) {
+		DRM_DEBUG_DP("Link already setup, return\n");
+		return 0;
+	}
+
+	rc = dp_ctrl_on(dp->ctrl);
+	if (!rc)
+		dp->power_on = true;
+
+	if (dump_dp != false)
+		dp_display_dump(dp_display);
+
+	return rc;
+}
+
+static int dp_display_post_enable(struct msm_dp *dp_display)
+{
+	struct dp_display_private *dp;
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+
+	complete_all(&dp->notification_comp);
+	return 0;
+}
+
+static int dp_display_pre_disable(struct msm_dp *dp_display)
+{
+	struct dp_display_private *dp;
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+
+	if (dp->usbpd->alt_mode_cfg_done)
+		dp_link_psm_config(dp->link, &dp->panel->link_info, true);
+
+	dp_ctrl_push_idle(dp->ctrl);
+	return 0;
+}
+
+static int dp_display_disable(struct msm_dp *dp_display)
+{
+	struct dp_display_private *dp;
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+
+	if (!dp->power_on || !dp->core_initialized)
+		return -EINVAL;
+
+	dp_ctrl_off(dp->ctrl);
+
+	dp->power_on = false;
+
+	complete_all(&dp->notification_comp);
+	return 0;
+}
+
+int dp_display_request_irq(struct msm_dp *dp_display)
+{
+	int rc = 0;
+	struct dp_display_private *dp;
+
+	if (!dp_display) {
+		DRM_ERROR("invalid input\n");
+		return -EINVAL;
+	}
+
+	dp = container_of(dp_display, struct dp_display_private, dp_display);
+
+	dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);
+	if (dp->irq < 0) {
+		rc = dp->irq;
+		DRM_ERROR("failed to get irq: %d\n", rc);
+		return rc;
+	}
+
+	rc = devm_request_irq(&dp->pdev->dev, dp->irq, dp_display_irq,
+		IRQF_TRIGGER_HIGH, "dp_display_isr", dp);
+	if (rc < 0) {
+		DRM_ERROR("failed to request IRQ%u: %d\n",
+				dp->irq, rc);
+		return rc;
+	}
+	disable_irq(dp->irq);
+
+	return 0;
+}
+
+static int dp_display_unprepare(struct msm_dp *dp)
+{
+	return 0;
+}
+
+int dp_display_validate_mode(struct msm_dp *dp, u32 mode_pclk_khz)
+{
+	const u32 num_components = 3, default_bpp = 24;
+	struct dp_display_private *dp_display;
+	struct dp_link_info *link_info;
+	u32 mode_rate_khz = 0, supported_rate_khz = 0, mode_bpp = 0;
+
+	if (!dp || !mode_pclk_khz || !dp->connector) {
+		DRM_ERROR("invalid params\n");
+		return -EINVAL;
+	}
+
+	dp_display = container_of(dp, struct dp_display_private, dp_display);
+	link_info = &dp_display->panel->link_info;
+
+	mode_bpp = dp->connector->display_info.bpc * num_components;
+	if (!mode_bpp)
+		mode_bpp = default_bpp;
+
+	mode_bpp = dp_panel_get_mode_bpp(dp_display->panel,
+			mode_bpp, mode_pclk_khz);
+
+	mode_rate_khz = mode_pclk_khz * mode_bpp;
+	supported_rate_khz = link_info->num_lanes * link_info->rate * 8;
+
+	if (mode_rate_khz > supported_rate_khz)
+		return MODE_BAD;
+
+	return MODE_OK;
+}
+
+int dp_display_get_modes(struct msm_dp *dp,
+				struct dp_display_mode *dp_mode)
+{
+	struct dp_display_private *dp_display;
+	int ret = 0;
+
+	if (!dp) {
+		DRM_ERROR("invalid params\n");
+		return 0;
+	}
+
+	dp_display = container_of(dp, struct dp_display_private, dp_display);
+
+	ret = dp_panel_get_modes(dp_display->panel,
+		dp->connector, dp_mode);
+	if (dp_mode->drm_mode.clock)
+		dp->max_pclk_khz = dp_mode->drm_mode.clock;
+	return ret;
+}
+
+bool dp_display_check_video_test(struct msm_dp *dp)
+{
+	struct dp_display_private *dp_display;
+
+	dp_display = container_of(dp, struct dp_display_private, dp_display);
+
+	return dp_display->panel->video_test;
+}
+
+int dp_display_get_test_bpp(struct msm_dp *dp)
+{
+	struct dp_display_private *dp_display;
+
+	if (!dp) {
+		DRM_ERROR("invalid params\n");
+		return 0;
+	}
+
+	dp_display = container_of(dp, struct dp_display_private, dp_display);
+
+	return dp_link_bit_depth_to_bpp(
+		dp_display->link->test_video.test_bit_depth);
+}
+
+static int dp_display_probe(struct platform_device *pdev)
+{
+	int rc = 0;
+	struct dp_display_private *dp;
+
+	if (!pdev || !pdev->dev.of_node) {
+		DRM_ERROR("pdev not found\n");
+		return -ENODEV;
+	}
+
+	dp = devm_kzalloc(&pdev->dev, sizeof(*dp), GFP_KERNEL);
+	if (!dp)
+		return -ENOMEM;
+
+	init_completion(&dp->notification_comp);
+
+	dp->pdev = pdev;
+	dp->name = "drm_dp";
+
+	rc = dp_init_sub_modules(dp);
+	if (rc) {
+		DRM_ERROR("init sub module failed\n");
+		return -EPROBE_DEFER;
+	}
+
+	platform_set_drvdata(pdev, dp);
+
+	mutex_init(&dp->dp_display.connect_mutex);
+	g_dp_display = &dp->dp_display;
+
+	rc = component_add(&pdev->dev, &dp_display_comp_ops);
+	if (rc) {
+		DRM_ERROR("component add failed, rc=%d\n", rc);
+		dp_display_deinit_sub_modules(dp);
+	}
+
+	return rc;
+}
+
+static int dp_display_remove(struct platform_device *pdev)
+{
+	struct dp_display_private *dp;
+
+	dp = platform_get_drvdata(pdev);
+
+	dp_display_deinit_sub_modules(dp);
+
+	component_del(&pdev->dev, &dp_display_comp_ops);
+	platform_set_drvdata(pdev, NULL);
+
+	return 0;
+}
+
+static int dp_pm_resume(struct device *dev)
+{
+	return 0;
+}
+
+static int dp_pm_suspend(struct device *dev)
+{
+	return 0;
+}
+
+static int dp_pm_prepare(struct device *dev)
+{
+	return 0;
+}
+
+static void dp_pm_complete(struct device *dev)
+{
+
+}
+
+static const struct dev_pm_ops dp_pm_ops = {
+	.suspend = dp_pm_suspend,
+	.resume =  dp_pm_resume,
+	.prepare = dp_pm_prepare,
+	.complete = dp_pm_complete,
+};
+
+static struct platform_driver dp_display_driver = {
+	.probe  = dp_display_probe,
+	.remove = dp_display_remove,
+	.driver = {
+		.name = "msm-dp-display",
+		.of_match_table = dp_dt_match,
+		.suppress_bind_attrs = true,
+		.pm = &dp_pm_ops,
+	},
+};
+
+int __init msm_dp_register(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&dp_display_driver);
+	if (ret)
+		DRM_ERROR("Dp display driver register failed");
+
+	return ret;
+}
+
+void __exit msm_dp_unregister(void)
+{
+	platform_driver_unregister(&dp_display_driver);
+}
+
+int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
+			struct drm_encoder *encoder)
+{
+	struct msm_drm_private *priv;
+	int ret;
+
+	if (WARN_ON(!encoder) || WARN_ON(!dp_display) || WARN_ON(!dev))
+		return -EINVAL;
+
+	priv = dev->dev_private;
+	dp_display->drm_dev = dev;
+
+	ret = dp_display_request_irq(dp_display);
+	if (ret) {
+		DRM_ERROR("request_irq failed, ret=%d\n", ret);
+		return ret;
+	}
+
+	dp_display->encoder = encoder;
+
+	dp_display->connector = dp_drm_connector_init(dp_display);
+	if (IS_ERR(dp_display->connector)) {
+		ret = PTR_ERR(dp_display->connector);
+		DRM_DEV_ERROR(dev->dev,
+			"failed to create dp connector: %d\n", ret);
+		dp_display->connector = NULL;
+		return ret;
+	}
+
+	priv->connectors[priv->num_connectors++] = dp_display->connector;
+	return 0;
+}
+
+int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder)
+{
+	int rc = 0;
+	struct dp_display_private *dp_display;
+
+	dp_display = container_of(dp, struct dp_display_private, dp_display);
+	if (!dp_display->dp_mode.drm_mode.clock) {
+		DRM_ERROR("invalid params\n");
+		return -EINVAL;
+	}
+
+	rc = dp_display_set_mode(dp, &dp_display->dp_mode);
+	if (rc) {
+		DRM_ERROR("Failed to perform a mode set, rc=%d\n", rc);
+		return rc;
+	}
+
+	rc = dp_display_prepare(dp);
+	if (rc) {
+		DRM_ERROR("DP display prepare failed, rc=%d\n", rc);
+		return rc;
+	}
+
+	rc = dp_display_enable(dp);
+	if (rc) {
+		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
+		dp_display_unprepare(dp);
+		return rc;
+	}
+
+	rc = dp_display_post_enable(dp);
+	if (rc) {
+		DRM_ERROR("DP display post enable failed, rc=%d\n", rc);
+		dp_display_disable(dp);
+		dp_display_unprepare(dp);
+	}
+	return rc;
+}
+
+int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder)
+{
+	int rc = 0;
+
+	rc = dp_display_pre_disable(dp);
+	if (rc) {
+		DRM_ERROR("DP display pre disable failed, rc=%d\n", rc);
+		return rc;
+	}
+
+	rc = dp_display_disable(dp);
+	if (rc) {
+		DRM_ERROR("DP display disable failed, rc=%d\n", rc);
+		return rc;
+	}
+
+	rc = dp_display_unprepare(dp);
+	if (rc)
+		DRM_ERROR("DP display unprepare failed, rc=%d\n", rc);
+
+	return rc;
+}
+
+void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
+				struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode)
+{
+	struct dp_display_private *dp_display;
+
+	dp_display = container_of(dp, struct dp_display_private, dp_display);
+
+	memset(&dp_display->dp_mode, 0x0, sizeof(struct dp_display_mode));
+
+	if (dp_display_check_video_test(dp))
+		dp_display->dp_mode.bpp = dp_display_get_test_bpp(dp);
+	else /* Default num_components per pixel = 3 */
+		dp_display->dp_mode.bpp = dp->connector->display_info.bpc * 3;
+
+	if (!dp_display->dp_mode.bpp)
+		dp_display->dp_mode.bpp = 24; /* Default bpp */
+
+	drm_mode_copy(&dp_display->dp_mode.drm_mode, adjusted_mode);
+
+	dp_display->dp_mode.v_active_low =
+		!!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NVSYNC);
+
+	dp_display->dp_mode.h_active_low =
+		!!(dp_display->dp_mode.drm_mode.flags & DRM_MODE_FLAG_NHSYNC);
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
new file mode 100644
index 000000000000..dad8610685a6
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_display.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DP_DISPLAY_H_
+#define _DP_DISPLAY_H_
+
+#include "dp_panel.h"
+
+struct msm_dp {
+	struct drm_device *drm_dev;
+	struct drm_connector *connector;
+	struct drm_encoder *encoder;
+	bool is_connected;
+	struct mutex connect_mutex;
+	u32 max_pclk_khz;
+	u32 max_dp_lanes;
+};
+
+int dp_display_validate_mode(struct msm_dp *dp_display, u32 mode_pclk_khz);
+int dp_display_get_modes(struct msm_dp *dp_display,
+		struct dp_display_mode *dp_mode);
+int dp_display_request_irq(struct msm_dp *dp_display);
+bool dp_display_check_video_test(struct msm_dp *dp_display);
+int dp_display_get_test_bpp(struct msm_dp *dp_display);
+
+#endif /* _DP_DISPLAY_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
new file mode 100644
index 000000000000..e58906f4ae1e
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -0,0 +1,168 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_atomic.h>
+#include <drm/drm_crtc.h>
+
+#include "msm_drv.h"
+#include "msm_kms.h"
+#include "dp_drm.h"
+
+struct dp_connector {
+	struct drm_connector base;
+	struct msm_dp *dp_display;
+};
+#define to_dp_connector(x) container_of(x, struct dp_connector, base)
+
+/**
+ * dp_connector_detect - callback to determine if connector is connected
+ * @conn: Pointer to drm connector structure
+ * @force: Force detect setting from drm framework
+ * Returns: Connector 'is connected' status
+ */
+static enum drm_connector_status dp_connector_detect(struct drm_connector *conn,
+		bool force)
+{
+	struct msm_dp *dp;
+
+	dp = to_dp_connector(conn)->dp_display;
+
+	DRM_DEBUG_DP("is_connected = %s\n",
+		(dp->is_connected) ? "true" : "false");
+
+	return (dp->is_connected) ? connector_status_connected :
+					connector_status_disconnected;
+}
+
+/**
+ * dp_connector_get_modes - callback to add drm modes via drm_mode_probed_add()
+ * @connector: Pointer to drm connector structure
+ * Returns: Number of modes added
+ */
+static int dp_connector_get_modes(struct drm_connector *connector)
+{
+	int rc = 0;
+	struct msm_dp *dp;
+	struct dp_display_mode *dp_mode = NULL;
+	struct drm_display_mode *m, drm_mode;
+
+	if (!connector)
+		return 0;
+
+	dp = to_dp_connector(connector)->dp_display;
+
+	dp_mode = kzalloc(sizeof(*dp_mode),  GFP_KERNEL);
+	if (!dp_mode)
+		return 0;
+
+	mutex_lock(&dp->connect_mutex);
+	/* pluggable case assumes EDID is read when HPD */
+	if (dp->is_connected) {
+		/*
+		 *The get_modes() function might return one mode that is stored
+		 * in dp_mode when compliance test is in progress. If not, the
+		 * return value is equal to the total number of modes supported
+		 * by the sink
+		 */
+		rc = dp_display_get_modes(dp, dp_mode);
+		if (rc <= 0) {
+			DRM_ERROR("failed to get DP sink modes, rc=%d\n", rc);
+			kfree(dp_mode);
+			mutex_unlock(&dp->connect_mutex);
+			return rc;
+		}
+		if (dp_mode->drm_mode.clock) { /* valid DP mode */
+			memset(&drm_mode, 0x0, sizeof(drm_mode));
+			drm_mode_copy(&drm_mode, &dp_mode->drm_mode);
+			m = drm_mode_duplicate(connector->dev, &drm_mode);
+			if (!m) {
+				DRM_ERROR("failed to add mode %ux%u\n",
+				       drm_mode.hdisplay,
+				       drm_mode.vdisplay);
+				kfree(dp_mode);
+				mutex_unlock(&dp->connect_mutex);
+				return 0;
+			}
+			drm_mode_probed_add(connector, m);
+		}
+	} else {
+		DRM_DEBUG_DP("No sink connected\n");
+	}
+	mutex_unlock(&dp->connect_mutex);
+	kfree(dp_mode);
+	return rc;
+}
+
+/**
+ * dp_connector_mode_valid - callback to determine if specified mode is valid
+ * @connector: Pointer to drm connector structure
+ * @mode: Pointer to drm mode structure
+ * Returns: Validity status for specified mode
+ */
+static enum drm_mode_status dp_connector_mode_valid(
+		struct drm_connector *connector,
+		struct drm_display_mode *mode)
+{
+	struct msm_dp *dp_disp;
+
+	dp_disp = to_dp_connector(connector)->dp_display;
+
+	if ((dp_disp->max_pclk_khz <= 0) ||
+			(dp_disp->max_pclk_khz > DP_MAX_PIXEL_CLK_KHZ) ||
+			(mode->clock > dp_disp->max_pclk_khz))
+		return MODE_BAD;
+
+	return dp_display_validate_mode(dp_disp, mode->clock);
+}
+
+static const struct drm_connector_funcs dp_connector_funcs = {
+	.detect = dp_connector_detect,
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static const struct drm_connector_helper_funcs dp_connector_helper_funcs = {
+	.get_modes = dp_connector_get_modes,
+	.mode_valid = dp_connector_mode_valid,
+};
+
+/* connector initialization */
+struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display)
+{
+	struct drm_connector *connector = NULL;
+	struct dp_connector *dp_connector;
+	int ret;
+
+	dp_connector = devm_kzalloc(dp_display->drm_dev->dev,
+					sizeof(*dp_connector),
+					GFP_KERNEL);
+	if (!dp_connector)
+		return ERR_PTR(-ENOMEM);
+
+	dp_connector->dp_display = dp_display;
+
+	connector = &dp_connector->base;
+
+	ret = drm_connector_init(dp_display->drm_dev, connector,
+			&dp_connector_funcs,
+			DRM_MODE_CONNECTOR_DisplayPort);
+	if (ret)
+		return ERR_PTR(ret);
+
+	drm_connector_helper_add(connector, &dp_connector_helper_funcs);
+
+	/*
+	 * Enable HPD to let hpd event is handled when cable is connected.
+	 */
+	connector->polled = DRM_CONNECTOR_POLL_HPD;
+
+	drm_connector_attach_encoder(connector, dp_display->encoder);
+
+	return connector;
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
new file mode 100644
index 000000000000..c27bfceefdf0
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DP_DRM_H_
+#define _DP_DRM_H_
+
+#include <linux/types.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+
+#include "msm_drv.h"
+#include "dp_display.h"
+
+struct drm_connector *dp_drm_connector_init(struct msm_dp *dp_display);
+
+#endif /* _DP_DRM_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.c b/drivers/gpu/drm/msm/dp/dp_hpd.c
new file mode 100644
index 000000000000..5b08ce580702
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_hpd.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
+ */
+
+#define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
+
+#include <linux/slab.h>
+#include <linux/device.h>
+
+#include "dp_hpd.h"
+
+/* DP specific VDM commands */
+#define DP_USBPD_VDM_STATUS	0x10
+#define DP_USBPD_VDM_CONFIGURE	0x11
+
+/* USBPD-TypeC specific Macros */
+#define VDM_VERSION		0x0
+#define USB_C_DP_SID		0xFF01
+
+struct dp_hpd_private {
+	struct device *dev;
+	struct dp_usbpd_cb *dp_cb;
+	struct dp_usbpd dp_usbpd;
+};
+
+static int dp_hpd_connect(struct dp_usbpd *dp_usbpd, bool hpd)
+{
+	int rc = 0;
+	struct dp_hpd_private *hpd_priv;
+
+	hpd_priv = container_of(dp_usbpd, struct dp_hpd_private,
+					dp_usbpd);
+
+	dp_usbpd->hpd_high = hpd;
+
+	if (!hpd_priv->dp_cb && !hpd_priv->dp_cb->configure
+				&& !hpd_priv->dp_cb->disconnect) {
+		pr_err("hpd dp_cb not initialized\n");
+		return -EINVAL;
+	}
+	if (hpd)
+		hpd_priv->dp_cb->configure(hpd_priv->dev);
+	else
+		hpd_priv->dp_cb->disconnect(hpd_priv->dev);
+
+	return rc;
+}
+
+struct dp_usbpd *dp_hpd_get(struct device *dev, struct dp_usbpd_cb *cb)
+{
+	struct dp_hpd_private *dp_hpd;
+
+	if (!cb) {
+		pr_err("invalid cb data\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	dp_hpd = devm_kzalloc(dev, sizeof(*dp_hpd), GFP_KERNEL);
+	if (!dp_hpd)
+		return ERR_PTR(-ENOMEM);
+
+	dp_hpd->dev = dev;
+	dp_hpd->dp_cb = cb;
+
+	dp_hpd->dp_usbpd.connect = dp_hpd_connect;
+
+	return &dp_hpd->dp_usbpd;
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_hpd.h b/drivers/gpu/drm/msm/dp/dp_hpd.h
new file mode 100644
index 000000000000..c0178524bec7
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_hpd.h
@@ -0,0 +1,79 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DP_HPD_H_
+#define _DP_HPD_H_
+
+//#include <linux/usb/usbpd.h>
+
+#include <linux/types.h>
+#include <linux/device.h>
+
+enum plug_orientation {
+	ORIENTATION_NONE,
+	ORIENTATION_CC1,
+	ORIENTATION_CC2,
+};
+
+/**
+ * struct dp_usbpd - DisplayPort status
+ *
+ * @orientation: plug orientation configuration
+ * @low_pow_st: low power state
+ * @adaptor_dp_en: adaptor functionality enabled
+ * @multi_func: multi-function preferred
+ * @usb_config_req: request to switch to usb
+ * @exit_dp_mode: request exit from displayport mode
+ * @hpd_high: Hot Plug Detect signal is high.
+ * @hpd_irq: Change in the status since last message
+ * @alt_mode_cfg_done: bool to specify alt mode status
+ * @debug_en: bool to specify debug mode
+ * @connect: simulate disconnect or connect for debug mode
+ */
+struct dp_usbpd {
+	enum plug_orientation orientation;
+	bool low_pow_st;
+	bool adaptor_dp_en;
+	bool multi_func;
+	bool usb_config_req;
+	bool exit_dp_mode;
+	bool hpd_high;
+	bool hpd_irq;
+	bool alt_mode_cfg_done;
+	bool debug_en;
+
+	int (*connect)(struct dp_usbpd *dp_usbpd, bool hpd);
+};
+
+/**
+ * struct dp_usbpd_cb - callback functions provided by the client
+ *
+ * @configure: called by usbpd module when PD communication has
+ * been completed and the usb peripheral has been configured on
+ * dp mode.
+ * @disconnect: notify the cable disconnect issued by usb.
+ * @attention: notify any attention message issued by usb.
+ */
+struct dp_usbpd_cb {
+	int (*configure)(struct device *dev);
+	int (*disconnect)(struct device *dev);
+	int (*attention)(struct device *dev);
+};
+
+/**
+ * dp_hpd_get() - setup hpd module
+ *
+ * @dev: device instance of the caller
+ * @cb: struct containing callback function pointers.
+ *
+ * This function allows the client to initialize the usbpd
+ * module. The module will communicate with HPD module.
+ */
+struct dp_usbpd *dp_hpd_get(struct device *dev, struct dp_usbpd_cb *cb);
+
+int dp_hpd_register(struct dp_usbpd *dp_usbpd);
+void dp_hpd_unregister(struct dp_usbpd *dp_usbpd);
+
+#endif /* _DP_HPD_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
new file mode 100644
index 000000000000..9156a7f3dbf8
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_link.c
@@ -0,0 +1,1214 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
+ */
+
+#define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
+
+#include "dp_link.h"
+#include "dp_panel.h"
+
+#define DP_TEST_REQUEST_MASK		0x7F
+
+enum audio_sample_rate {
+	AUDIO_SAMPLE_RATE_32_KHZ	= 0x00,
+	AUDIO_SAMPLE_RATE_44_1_KHZ	= 0x01,
+	AUDIO_SAMPLE_RATE_48_KHZ	= 0x02,
+	AUDIO_SAMPLE_RATE_88_2_KHZ	= 0x03,
+	AUDIO_SAMPLE_RATE_96_KHZ	= 0x04,
+	AUDIO_SAMPLE_RATE_176_4_KHZ	= 0x05,
+	AUDIO_SAMPLE_RATE_192_KHZ	= 0x06,
+};
+
+enum audio_pattern_type {
+	AUDIO_TEST_PATTERN_OPERATOR_DEFINED	= 0x00,
+	AUDIO_TEST_PATTERN_SAWTOOTH		= 0x01,
+};
+
+struct dp_link_request {
+	u32 test_requested;
+	u32 test_link_rate;
+	u32 test_lane_count;
+};
+
+struct dp_link_private {
+	u32 prev_sink_count;
+	struct device *dev;
+	struct drm_dp_aux *aux;
+	struct dp_link dp_link;
+
+	struct dp_link_request request;
+	struct mutex test_response_mutex;
+	struct mutex psm_mutex;
+	u8 link_status[DP_LINK_STATUS_SIZE];
+};
+
+static int dp_aux_link_power_up(struct drm_dp_aux *aux,
+					struct dp_link_info *link)
+{
+	u8 value;
+	int err;
+
+	if (link->revision < 0x11)
+		return 0;
+
+	err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
+	if (err < 0)
+		return err;
+
+	value &= ~DP_SET_POWER_MASK;
+	value |= DP_SET_POWER_D0;
+
+	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
+	if (err < 0)
+		return err;
+
+	usleep_range(1000, 2000);
+
+	return 0;
+}
+
+static int dp_aux_link_power_down(struct drm_dp_aux *aux,
+					struct dp_link_info *link)
+{
+	u8 value;
+	int err;
+
+	if (link->revision < 0x11)
+		return 0;
+
+	err = drm_dp_dpcd_readb(aux, DP_SET_POWER, &value);
+	if (err < 0)
+		return err;
+
+	value &= ~DP_SET_POWER_MASK;
+	value |= DP_SET_POWER_D3;
+
+	err = drm_dp_dpcd_writeb(aux, DP_SET_POWER, value);
+	if (err < 0)
+		return err;
+
+	return 0;
+}
+
+static int dp_link_get_period(struct dp_link_private *link, int const addr)
+{
+	int ret = 0;
+	u8 data;
+	u32 const max_audio_period = 0xA;
+
+	/* TEST_AUDIO_PERIOD_CH_XX */
+	if (drm_dp_dpcd_readb(link->aux, addr, &data) < 0) {
+		DRM_ERROR("failed to read test_audio_period (0x%x)\n", addr);
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	/* Period - Bits 3:0 */
+	data = data & 0xF;
+	if ((int)data > max_audio_period) {
+		DRM_ERROR("invalid test_audio_period_ch_1 = 0x%x\n", data);
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	ret = data;
+exit:
+	return ret;
+}
+
+static int dp_link_parse_audio_channel_period(struct dp_link_private *link)
+{
+	int ret = 0;
+	struct dp_link_test_audio *req = &link->dp_link.test_audio;
+
+	ret = dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH1);
+	if (ret == -EINVAL)
+		goto exit;
+
+	req->test_audio_period_ch_1 = ret;
+	DRM_DEBUG_DP("test_audio_period_ch_1 = 0x%x\n", ret);
+
+	ret = dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH2);
+	if (ret == -EINVAL)
+		goto exit;
+
+	req->test_audio_period_ch_2 = ret;
+	DRM_DEBUG_DP("test_audio_period_ch_2 = 0x%x\n", ret);
+
+	/* TEST_AUDIO_PERIOD_CH_3 (Byte 0x275) */
+	ret = dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH3);
+	if (ret == -EINVAL)
+		goto exit;
+
+	req->test_audio_period_ch_3 = ret;
+	DRM_DEBUG_DP("test_audio_period_ch_3 = 0x%x\n", ret);
+
+	ret = dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH4);
+	if (ret == -EINVAL)
+		goto exit;
+
+	req->test_audio_period_ch_4 = ret;
+	DRM_DEBUG_DP("test_audio_period_ch_4 = 0x%x\n", ret);
+
+	ret = dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH5);
+	if (ret == -EINVAL)
+		goto exit;
+
+	req->test_audio_period_ch_5 = ret;
+	DRM_DEBUG_DP("test_audio_period_ch_5 = 0x%x\n", ret);
+
+	ret = dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH6);
+	if (ret == -EINVAL)
+		goto exit;
+
+	req->test_audio_period_ch_6 = ret;
+	DRM_DEBUG_DP("test_audio_period_ch_6 = 0x%x\n", ret);
+
+	ret = dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH7);
+	if (ret == -EINVAL)
+		goto exit;
+
+	req->test_audio_period_ch_7 = ret;
+	DRM_DEBUG_DP("test_audio_period_ch_7 = 0x%x\n", ret);
+
+	ret = dp_link_get_period(link, DP_TEST_AUDIO_PERIOD_CH8);
+	if (ret == -EINVAL)
+		goto exit;
+
+	req->test_audio_period_ch_8 = ret;
+	DRM_DEBUG_DP("test_audio_period_ch_8 = 0x%x\n", ret);
+exit:
+	return ret;
+}
+
+static int dp_link_parse_audio_pattern_type(struct dp_link_private *link)
+{
+	int ret = 0;
+	u8 data;
+	ssize_t rlen;
+	int const max_audio_pattern_type = 0x1;
+
+	rlen = drm_dp_dpcd_readb(link->aux,
+				DP_TEST_AUDIO_PATTERN_TYPE, &data);
+	if (rlen < 0) {
+		DRM_ERROR("failed to read link audio mode. rlen=%zd\n", rlen);
+		return rlen;
+	}
+
+	/* Audio Pattern Type - Bits 7:0 */
+	if ((int)data > max_audio_pattern_type) {
+		DRM_ERROR("invalid audio pattern type = 0x%x\n", data);
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	link->dp_link.test_audio.test_audio_pattern_type = data;
+	DRM_DEBUG_DP("audio pattern type = 0x%x\n", data);
+exit:
+	return ret;
+}
+
+static int dp_link_parse_audio_mode(struct dp_link_private *link)
+{
+	int ret = 0;
+	u8 data;
+	ssize_t rlen;
+	int const max_audio_sampling_rate = 0x6;
+	int const max_audio_channel_count = 0x8;
+	int sampling_rate = 0x0;
+	int channel_count = 0x0;
+
+	rlen = drm_dp_dpcd_readb(link->aux, DP_TEST_AUDIO_MODE, &data);
+	if (rlen < 0) {
+		DRM_ERROR("failed to read link audio mode. rlen=%zd\n", rlen);
+		return rlen;
+	}
+
+	/* Sampling Rate - Bits 3:0 */
+	sampling_rate = data & 0xF;
+	if (sampling_rate > max_audio_sampling_rate) {
+		DRM_ERROR("sampling rate (0x%x) greater than max (0x%x)\n",
+				sampling_rate, max_audio_sampling_rate);
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	/* Channel Count - Bits 7:4 */
+	channel_count = ((data & 0xF0) >> 4) + 1;
+	if (channel_count > max_audio_channel_count) {
+		DRM_ERROR("channel_count (0x%x) greater than max (0x%x)\n",
+				channel_count, max_audio_channel_count);
+		ret = -EINVAL;
+		goto exit;
+	}
+
+	link->dp_link.test_audio.test_audio_sampling_rate = sampling_rate;
+	link->dp_link.test_audio.test_audio_channel_count = channel_count;
+	DRM_DEBUG_DP("sampling_rate = 0x%x, channel_count = 0x%x\n",
+					sampling_rate, channel_count);
+exit:
+	return ret;
+}
+
+static int dp_link_parse_audio_pattern_params(struct dp_link_private *link)
+{
+	int ret = 0;
+
+	ret = dp_link_parse_audio_mode(link);
+	if (ret)
+		goto exit;
+
+	ret = dp_link_parse_audio_pattern_type(link);
+	if (ret)
+		goto exit;
+
+	ret = dp_link_parse_audio_channel_period(link);
+
+exit:
+	return ret;
+}
+
+static bool dp_link_is_video_pattern_valid(u32 pattern)
+{
+	switch (pattern) {
+	case DP_NO_TEST_PATTERN:
+	case DP_COLOR_RAMP:
+	case DP_BLACK_AND_WHITE_VERTICAL_LINES:
+	case DP_COLOR_SQUARE:
+		return true;
+	default:
+		return false;
+	}
+}
+
+/**
+ * dp_link_is_bit_depth_valid() - validates the bit depth requested
+ * @tbd: bit depth requested by the sink
+ *
+ * Returns true if the requested bit depth is supported.
+ */
+static bool dp_link_is_bit_depth_valid(u32 tbd)
+{
+	/* DP_TEST_VIDEO_PATTERN_NONE is treated as invalid */
+	switch (tbd) {
+	case DP_TEST_BIT_DEPTH_6:
+	case DP_TEST_BIT_DEPTH_8:
+	case DP_TEST_BIT_DEPTH_10:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static int dp_link_parse_timing_params1(struct dp_link_private *link,
+					int addr, int len, u32 *val)
+{
+	u8 bp[2];
+	int rlen;
+
+	if (len != 2)
+		return -EINVAL;
+
+	/* Read the requested video link pattern (Byte 0x221). */
+	rlen = drm_dp_dpcd_read(link->aux, addr, bp, len);
+	if (rlen < len) {
+		DRM_ERROR("failed to read 0x%x\n", addr);
+		return -EINVAL;
+	}
+
+	*val = bp[1] | (bp[0] << 8);
+
+	return 0;
+}
+
+static int dp_link_parse_timing_params2(struct dp_link_private *link,
+					int addr, int len,
+					u32 *val1, u32 *val2)
+{
+	u8 bp[2];
+	int rlen;
+
+	if (len != 2)
+		return -EINVAL;
+
+	/* Read the requested video link pattern (Byte 0x221). */
+	rlen = drm_dp_dpcd_read(link->aux, addr, bp, len);
+	if (rlen < len) {
+		DRM_ERROR("failed to read 0x%x\n", addr);
+		return -EINVAL;
+	}
+
+	*val1 = (bp[0] & BIT(7)) >> 7;
+	*val2 = bp[1] | ((bp[0] & 0x7F) << 8);
+
+	return 0;
+}
+
+static int dp_link_parse_timing_params3(struct dp_link_private *link,
+					int addr, u32 *val)
+{
+	u8 bp;
+	u32 len = 1;
+	int rlen;
+
+	rlen = drm_dp_dpcd_read(link->aux, addr, &bp, len);
+	if (rlen < 1) {
+		DRM_ERROR("failed to read 0x%x\n", addr);
+		return -EINVAL;
+	}
+	*val = bp;
+
+	return 0;
+}
+
+/**
+ * dp_parse_video_pattern_params() - parses video pattern parameters from DPCD
+ * @link: Display Port Driver data
+ *
+ * Returns 0 if it successfully parses the video link pattern and the link
+ * bit depth requested by the sink and, and if the values parsed are valid.
+ */
+static int dp_link_parse_video_pattern_params(struct dp_link_private *link)
+{
+	int ret = 0;
+	ssize_t rlen;
+	u8 bp;
+
+	rlen = drm_dp_dpcd_readb(link->aux, DP_TEST_PATTERN, &bp);
+	if (rlen < 0) {
+		DRM_ERROR("failed to read link video pattern. rlen=%zd\n",
+			rlen);
+		return rlen;
+	}
+
+	if (!dp_link_is_video_pattern_valid(bp)) {
+		DRM_ERROR("invalid link video pattern = 0x%x\n", bp);
+		ret = -EINVAL;
+		return ret;
+	}
+
+	link->dp_link.test_video.test_video_pattern = bp;
+
+	/* Read the requested color bit depth and dynamic range (Byte 0x232) */
+	rlen = drm_dp_dpcd_readb(link->aux, DP_TEST_MISC0, &bp);
+	if (rlen < 0) {
+		DRM_ERROR("failed to read link bit depth. rlen=%zd\n", rlen);
+		return rlen;
+	}
+
+	/* Dynamic Range */
+	link->dp_link.test_video.test_dyn_range =
+			(bp & DP_TEST_DYNAMIC_RANGE_CEA);
+
+	/* Color bit depth */
+	bp &= DP_TEST_BIT_DEPTH_MASK;
+	if (!dp_link_is_bit_depth_valid(bp)) {
+		DRM_ERROR("invalid link bit depth = 0x%x\n", bp);
+		ret = -EINVAL;
+		return ret;
+	}
+
+	link->dp_link.test_video.test_bit_depth = bp;
+
+	/* resolution timing params */
+	ret = dp_link_parse_timing_params1(link, DP_TEST_H_TOTAL_HI, 2,
+			&link->dp_link.test_video.test_h_total);
+	if (ret) {
+		DRM_ERROR("failed to parse test_htotal(DP_TEST_H_TOTAL_HI)\n");
+		return ret;
+	}
+
+	ret = dp_link_parse_timing_params1(link, DP_TEST_V_TOTAL_HI, 2,
+			&link->dp_link.test_video.test_v_total);
+	if (ret) {
+		DRM_ERROR("failed to parse test_v_total(DP_TEST_V_TOTAL_HI)\n");
+		return ret;
+	}
+
+	ret = dp_link_parse_timing_params1(link, DP_TEST_H_START_HI, 2,
+			&link->dp_link.test_video.test_h_start);
+	if (ret) {
+		DRM_ERROR("failed to parse test_h_start(DP_TEST_H_START_HI)\n");
+		return ret;
+	}
+
+	ret = dp_link_parse_timing_params1(link, DP_TEST_V_START_HI, 2,
+			&link->dp_link.test_video.test_v_start);
+	if (ret) {
+		DRM_ERROR("failed to parse test_v_start(DP_TEST_V_START_HI)\n");
+		return ret;
+	}
+
+	ret = dp_link_parse_timing_params2(link, DP_TEST_HSYNC_HI, 2,
+			&link->dp_link.test_video.test_hsync_pol,
+			&link->dp_link.test_video.test_hsync_width);
+	if (ret) {
+		DRM_ERROR("failed to parse (DP_TEST_HSYNC_HI)\n");
+		return ret;
+	}
+
+	ret = dp_link_parse_timing_params2(link, DP_TEST_VSYNC_HI, 2,
+			&link->dp_link.test_video.test_vsync_pol,
+			&link->dp_link.test_video.test_vsync_width);
+	if (ret) {
+		DRM_ERROR("failed to parse (DP_TEST_VSYNC_HI)\n");
+		return ret;
+	}
+
+	ret = dp_link_parse_timing_params1(link, DP_TEST_H_WIDTH_HI, 2,
+			&link->dp_link.test_video.test_h_width);
+	if (ret) {
+		DRM_ERROR("failed to parse test_h_width(DP_TEST_H_WIDTH_HI)\n");
+		return ret;
+	}
+
+	ret = dp_link_parse_timing_params1(link, DP_TEST_V_HEIGHT_HI, 2,
+			&link->dp_link.test_video.test_v_height);
+	if (ret) {
+		DRM_ERROR("failed to parse test_v_height\n");
+		return ret;
+	}
+
+	ret = dp_link_parse_timing_params3(link, DP_TEST_MISC1,
+		&link->dp_link.test_video.test_rr_d);
+	link->dp_link.test_video.test_rr_d &= DP_TEST_REFRESH_DENOMINATOR;
+	if (ret) {
+		DRM_ERROR("failed to parse test_rr_d (DP_TEST_MISC1)\n");
+		return ret;
+	}
+
+	ret = dp_link_parse_timing_params3(link, DP_TEST_REFRESH_RATE_NUMERATOR,
+		&link->dp_link.test_video.test_rr_n);
+	if (ret) {
+		DRM_ERROR("failed to parse test_rr_n\n");
+		return ret;
+	}
+
+	DRM_DEBUG_DP("link video pattern = 0x%x\n"
+		"link dynamic range = 0x%x\n"
+		"link bit depth = 0x%x\n"
+		"TEST_H_TOTAL = %d, TEST_V_TOTAL = %d\n"
+		"TEST_H_START = %d, TEST_V_START = %d\n"
+		"TEST_HSYNC_POL = %d\n"
+		"TEST_HSYNC_WIDTH = %d\n"
+		"TEST_VSYNC_POL = %d\n"
+		"TEST_VSYNC_WIDTH = %d\n"
+		"TEST_H_WIDTH = %d\n"
+		"TEST_V_HEIGHT = %d\n"
+		"TEST_REFRESH_DENOMINATOR = %d\n"
+		 "TEST_REFRESH_NUMERATOR = %d\n",
+		link->dp_link.test_video.test_video_pattern,
+		link->dp_link.test_video.test_dyn_range,
+		link->dp_link.test_video.test_bit_depth,
+		link->dp_link.test_video.test_h_total,
+		link->dp_link.test_video.test_v_total,
+		link->dp_link.test_video.test_h_start,
+		link->dp_link.test_video.test_v_start,
+		link->dp_link.test_video.test_hsync_pol,
+		link->dp_link.test_video.test_hsync_width,
+		link->dp_link.test_video.test_vsync_pol,
+		link->dp_link.test_video.test_vsync_width,
+		link->dp_link.test_video.test_h_width,
+		link->dp_link.test_video.test_v_height,
+		link->dp_link.test_video.test_rr_d,
+		link->dp_link.test_video.test_rr_n);
+
+	return ret;
+}
+
+/**
+ * dp_link_parse_link_training_params() - parses link training parameters from
+ * DPCD
+ * @link: Display Port Driver data
+ *
+ * Returns 0 if it successfully parses the link rate (Byte 0x219) and lane
+ * count (Byte 0x220), and if these values parse are valid.
+ */
+static int dp_link_parse_link_training_params(struct dp_link_private *link)
+{
+	u8 bp;
+	ssize_t rlen;
+
+	rlen = drm_dp_dpcd_readb(link->aux, DP_TEST_LINK_RATE,	&bp);
+	if (rlen < 0) {
+		DRM_ERROR("failed to read link rate. rlen=%zd\n", rlen);
+		return rlen;
+	}
+
+	if (!is_link_rate_valid(bp)) {
+		DRM_ERROR("invalid link rate = 0x%x\n", bp);
+		return -EINVAL;
+	}
+
+	link->request.test_link_rate = bp;
+	DRM_DEBUG_DP("link rate = 0x%x\n", link->request.test_link_rate);
+
+	rlen = drm_dp_dpcd_readb(link->aux, DP_TEST_LANE_COUNT, &bp);
+	if (rlen < 0) {
+		DRM_ERROR("failed to read lane count. rlen=%zd\n", rlen);
+		return rlen;
+	}
+	bp &= DP_MAX_LANE_COUNT_MASK;
+
+	if (!is_lane_count_valid(bp)) {
+		DRM_ERROR("invalid lane count = 0x%x\n", bp);
+		return -EINVAL;
+	}
+
+	link->request.test_lane_count = bp;
+	DRM_DEBUG_DP("lane count = 0x%x\n", link->request.test_lane_count);
+	return 0;
+}
+
+/**
+ * dp_parse_phy_test_params() - parses the phy link parameters
+ * @link: Display Port Driver data
+ *
+ * Parses the DPCD (Byte 0x248) for the DP PHY link pattern that is being
+ * requested.
+ */
+static int dp_link_parse_phy_test_params(struct dp_link_private *link)
+{
+	u8 data;
+	ssize_t rlen;
+
+	rlen = drm_dp_dpcd_readb(link->aux, DP_PHY_TEST_PATTERN,
+					&data);
+	if (rlen < 0) {
+		DRM_ERROR("failed to read phy link pattern. rlen=%zd\n", rlen);
+		return rlen;
+	}
+
+	link->dp_link.phy_params.phy_test_pattern_sel = data;
+
+	DRM_DEBUG_DP("phy_test_pattern_sel = 0x%x\n", data);
+
+	switch (data) {
+	case DP_LINK_QUAL_PATTERN_DISABLE:
+	case DP_LINK_QUAL_PATTERN_D10_2:
+	case DP_LINK_QUAL_PATTERN_ERROR_RATE:
+	case DP_LINK_QUAL_PATTERN_PRBS7:
+	case DP_LINK_QUAL_PATTERN_80BIT_CUSTOM:
+	case DP_LINK_QUAL_PATTERN_HBR2_EYE:
+		return 0;
+	default:
+		return -EINVAL;
+	}
+}
+
+/**
+ * dp_link_is_video_audio_test_requested() - checks for audio/video link request
+ * @link: link requested by the sink
+ *
+ * Returns true if the requested link is a permitted audio/video link.
+ */
+static bool dp_link_is_video_audio_test_requested(u32 link)
+{
+	u8 video_audio_test = (DP_TEST_LINK_VIDEO_PATTERN |
+				DP_TEST_LINK_AUDIO_PATTERN |
+				DP_TEST_LINK_AUDIO_DISABLED_VIDEO);
+
+	return ((link & video_audio_test) &&
+		!(link & ~video_audio_test));
+}
+
+/**
+ * dp_link_parse_request() - parses link request parameters from sink
+ * @link: Display Port Driver data
+ *
+ * Parses the DPCD to check if an automated link is requested (Byte 0x201),
+ * and what type of link automation is being requested (Byte 0x218).
+ */
+static int dp_link_parse_request(struct dp_link_private *link)
+{
+	int ret = 0;
+	u8 data;
+	ssize_t rlen;
+
+	/**
+	 * Read the device service IRQ vector (Byte 0x201) to determine
+	 * whether an automated link has been requested by the sink.
+	 */
+	rlen = drm_dp_dpcd_readb(link->aux,
+				DP_DEVICE_SERVICE_IRQ_VECTOR, &data);
+	if (rlen < 0) {
+		DRM_ERROR("aux read failed. rlen=%zd\n", rlen);
+		return rlen;
+	}
+
+	DRM_DEBUG_DP("device service irq vector = 0x%x\n", data);
+
+	if (!(data & DP_AUTOMATED_TEST_REQUEST)) {
+		DRM_DEBUG_DP("no test requested\n");
+		return 0;
+	}
+
+	/**
+	 * Read the link request byte (Byte 0x218) to determine what type
+	 * of automated link has been requested by the sink.
+	 */
+	rlen = drm_dp_dpcd_readb(link->aux, DP_TEST_REQUEST, &data);
+	if (rlen < 0) {
+		DRM_ERROR("aux read failed. rlen=%zd\n", rlen);
+		return rlen;
+	}
+
+	if (!data || (data == DP_TEST_LINK_FAUX_PATTERN)) {
+		DRM_DEBUG_DP("link 0x%x not supported\n", data);
+		goto end;
+	}
+
+	DRM_DEBUG_DP("Test:(0x%x) requested\n", data);
+	link->request.test_requested = data;
+
+	if (link->request.test_requested == DP_TEST_LINK_PHY_TEST_PATTERN) {
+		ret = dp_link_parse_phy_test_params(link);
+		if (ret)
+			goto end;
+		ret = dp_link_parse_link_training_params(link);
+		if (ret)
+			goto end;
+	}
+
+	if (link->request.test_requested == DP_TEST_LINK_TRAINING) {
+		ret = dp_link_parse_link_training_params(link);
+		if (ret)
+			goto end;
+	}
+
+	if (dp_link_is_video_audio_test_requested(
+			link->request.test_requested)) {
+		ret = dp_link_parse_video_pattern_params(link);
+		if (ret)
+			goto end;
+
+		ret = dp_link_parse_audio_pattern_params(link);
+	}
+end:
+	/*
+	 * Send a DP_TEST_ACK if all link parameters are valid, otherwise send
+	 * a DP_TEST_NAK.
+	 */
+	if (ret) {
+		link->dp_link.test_response = DP_TEST_NAK;
+	} else {
+		if (link->request.test_requested != DP_TEST_LINK_EDID_READ)
+			link->dp_link.test_response = DP_TEST_ACK;
+		else
+			link->dp_link.test_response =
+				DP_TEST_EDID_CHECKSUM_WRITE;
+	}
+
+	return ret;
+}
+
+/**
+ * dp_link_parse_sink_count() - parses the sink count
+ * @dp_link: pointer to link module data
+ *
+ * Parses the DPCD to check if there is an update to the sink count
+ * (Byte 0x200), and whether all the sink devices connected have Content
+ * Protection enabled.
+ */
+static int dp_link_parse_sink_count(struct dp_link *dp_link)
+{
+	ssize_t rlen;
+	bool cp_ready;
+
+	struct dp_link_private *link = container_of(dp_link,
+			struct dp_link_private, dp_link);
+
+	rlen = drm_dp_dpcd_readb(link->aux, DP_SINK_COUNT,
+				 &link->dp_link.sink_count);
+	if (rlen < 0) {
+		DRM_ERROR("sink count read failed. rlen=%zd\n", rlen);
+		return rlen;
+	}
+
+	cp_ready = link->dp_link.sink_count & DP_SINK_CP_READY;
+
+	link->dp_link.sink_count =
+		DP_GET_SINK_COUNT(link->dp_link.sink_count);
+
+	DRM_DEBUG_DP("sink_count = 0x%x, cp_ready = 0x%x\n",
+		link->dp_link.sink_count, cp_ready);
+	return 0;
+}
+
+static void dp_link_parse_sink_status_field(struct dp_link_private *link)
+{
+	int len = 0;
+
+	link->prev_sink_count = link->dp_link.sink_count;
+	dp_link_parse_sink_count(&link->dp_link);
+
+	len = drm_dp_dpcd_read_link_status(link->aux,
+		link->link_status);
+	if (len < DP_LINK_STATUS_SIZE)
+		DRM_ERROR("DP link status read failed\n");
+	dp_link_parse_request(link);
+}
+
+/**
+ * dp_link_process_link_training_request() - processes new training requests
+ * @link: Display Port link data
+ *
+ * This function will handle new link training requests that are initiated by
+ * the sink. In particular, it will update the requested lane count and link
+ * rate, and then trigger the link retraining procedure.
+ *
+ * The function will return 0 if a link training request has been processed,
+ * otherwise it will return -EINVAL.
+ */
+static int dp_link_process_link_training_request(struct dp_link_private *link)
+{
+	if (link->request.test_requested != DP_TEST_LINK_TRAINING)
+		return -EINVAL;
+
+	DRM_DEBUG_DP("Test:0x%x link rate = 0x%x, lane count = 0x%x\n",
+			DP_TEST_LINK_TRAINING,
+			link->request.test_link_rate,
+			link->request.test_lane_count);
+
+	link->dp_link.link_params.num_lanes = link->request.test_lane_count;
+	link->dp_link.link_params.rate = link->request.test_link_rate;
+
+	return 0;
+}
+
+bool dp_link_send_test_response(struct dp_link *dp_link)
+{
+	struct dp_link_private *link = NULL;
+	int ret = 0;
+
+	if (!dp_link) {
+		DRM_ERROR("invalid input\n");
+		return false;
+	}
+
+	link = container_of(dp_link, struct dp_link_private, dp_link);
+
+	mutex_lock(&link->test_response_mutex);
+	ret = drm_dp_dpcd_writeb(link->aux, DP_TEST_RESPONSE,
+			dp_link->test_response);
+	mutex_unlock(&link->test_response_mutex);
+
+	return ret == 1;
+}
+
+int dp_link_psm_config(struct dp_link *dp_link,
+			      struct dp_link_info *link_info, bool enable)
+{
+	struct dp_link_private *link = NULL;
+	int ret = 0;
+
+	if (!dp_link) {
+		DRM_ERROR("invalid params\n");
+		return -EINVAL;
+	}
+
+	link = container_of(dp_link, struct dp_link_private, dp_link);
+
+	mutex_lock(&link->psm_mutex);
+	if (enable)
+		ret = dp_aux_link_power_down(link->aux, link_info);
+	else
+		ret = dp_aux_link_power_up(link->aux, link_info);
+
+	if (ret)
+		DRM_ERROR("Failed to %s low power mode\n", enable ?
+							"enter" : "exit");
+	else
+		dp_link->psm_enabled = enable;
+
+	mutex_unlock(&link->psm_mutex);
+	return ret;
+}
+
+bool dp_link_send_edid_checksum(struct dp_link *dp_link, u8 checksum)
+{
+	struct dp_link_private *link = NULL;
+	int ret = 0;
+
+	if (!dp_link) {
+		DRM_ERROR("invalid input\n");
+		return false;
+	}
+
+	link = container_of(dp_link, struct dp_link_private, dp_link);
+
+	ret = drm_dp_dpcd_writeb(link->aux, DP_TEST_EDID_CHECKSUM,
+						checksum);
+	return ret == 1;
+}
+
+static int dp_link_parse_vx_px(struct dp_link_private *link)
+{
+	int ret = 0;
+
+	DRM_DEBUG_DP("vx: 0=%d, 1=%d, 2=%d, 3=%d\n",
+		drm_dp_get_adjust_request_voltage(link->link_status, 0),
+		drm_dp_get_adjust_request_voltage(link->link_status, 1),
+		drm_dp_get_adjust_request_voltage(link->link_status, 2),
+		drm_dp_get_adjust_request_voltage(link->link_status, 3));
+
+	DRM_DEBUG_DP("px: 0=%d, 1=%d, 2=%d, 3=%d\n",
+		drm_dp_get_adjust_request_pre_emphasis(link->link_status, 0),
+		drm_dp_get_adjust_request_pre_emphasis(link->link_status, 1),
+		drm_dp_get_adjust_request_pre_emphasis(link->link_status, 2),
+		drm_dp_get_adjust_request_pre_emphasis(link->link_status, 3));
+
+	/**
+	 * Update the voltage and pre-emphasis levels as per DPCD request
+	 * vector.
+	 */
+	DRM_DEBUG_DP("Current: v_level = 0x%x, p_level = 0x%x\n",
+			link->dp_link.phy_params.v_level,
+			link->dp_link.phy_params.p_level);
+	link->dp_link.phy_params.v_level =
+		drm_dp_get_adjust_request_voltage(link->link_status, 0);
+	link->dp_link.phy_params.p_level =
+		drm_dp_get_adjust_request_pre_emphasis(link->link_status, 0);
+	DRM_DEBUG_DP("Requested: v_level = 0x%x, p_level = 0x%x\n",
+			link->dp_link.phy_params.v_level,
+			link->dp_link.phy_params.p_level);
+
+	return ret;
+}
+
+/**
+ * dp_link_process_phy_test_pattern_request() - process new phy link requests
+ * @link: Display Port Driver data
+ *
+ * This function will handle new phy link pattern requests that are initiated
+ * by the sink. The function will return 0 if a phy link pattern has been
+ * processed, otherwise it will return -EINVAL.
+ */
+static int dp_link_process_phy_test_pattern_request(
+		struct dp_link_private *link)
+{
+	int ret = 0;
+
+	if (!(link->request.test_requested & DP_TEST_LINK_PHY_TEST_PATTERN)) {
+		DRM_DEBUG_DP("no phy test\n");
+		return -EINVAL;
+	}
+
+	if (!is_link_rate_valid(link->request.test_link_rate) ||
+		!is_lane_count_valid(link->request.test_lane_count)) {
+		DRM_ERROR("Invalid: link rate = 0x%x,lane count = 0x%x\n",
+				link->request.test_link_rate,
+				link->request.test_lane_count);
+		return -EINVAL;
+	}
+
+	DRM_DEBUG_DP("Current: rate = 0x%x, lane count = 0x%x\n",
+			link->dp_link.link_params.rate,
+			link->dp_link.link_params.num_lanes);
+
+	DRM_DEBUG_DP("Requested: rate = 0x%x, lane count = 0x%x\n",
+			link->request.test_link_rate,
+			link->request.test_lane_count);
+
+	link->dp_link.link_params.num_lanes = link->request.test_lane_count;
+	link->dp_link.link_params.rate = link->request.test_link_rate;
+
+	ret = dp_link_parse_vx_px(link);
+
+	if (ret)
+		DRM_ERROR("parse_vx_px failed. ret=%d\n", ret);
+
+	return ret;
+}
+
+static u8 get_link_status(const u8 link_status[DP_LINK_STATUS_SIZE], int r)
+{
+	return link_status[r - DP_LANE0_1_STATUS];
+}
+
+/**
+ * dp_link_process_link_status_update() - processes link status updates
+ * @link: Display Port link module data
+ *
+ * This function will check for changes in the link status, e.g. clock
+ * recovery done on all lanes, and trigger link training if there is a
+ * failure/error on the link.
+ *
+ * The function will return 0 if the a link status update has been processed,
+ * otherwise it will return -EINVAL.
+ */
+static int dp_link_process_link_status_update(struct dp_link_private *link)
+{
+	if (!(get_link_status(link->link_status,
+				DP_LANE_ALIGN_STATUS_UPDATED) &
+				DP_LINK_STATUS_UPDATED) ||
+			(drm_dp_clock_recovery_ok(link->link_status,
+					link->dp_link.link_params.num_lanes) &&
+			drm_dp_channel_eq_ok(link->link_status,
+					link->dp_link.link_params.num_lanes)))
+		return -EINVAL;
+
+	DRM_DEBUG_DP("channel_eq_done = %d, clock_recovery_done = %d\n",
+			drm_dp_clock_recovery_ok(link->link_status,
+			link->dp_link.link_params.num_lanes),
+			drm_dp_clock_recovery_ok(link->link_status,
+			link->dp_link.link_params.num_lanes));
+
+	return 0;
+}
+
+/**
+ * dp_link_process_downstream_port_status_change() - process port status changes
+ * @link: Display Port Driver data
+ *
+ * This function will handle downstream port updates that are initiated by
+ * the sink. If the downstream port status has changed, the EDID is read via
+ * AUX.
+ *
+ * The function will return 0 if a downstream port update has been
+ * processed, otherwise it will return -EINVAL.
+ */
+static int dp_link_process_ds_port_status_change(struct dp_link_private *link)
+{
+	if (get_link_status(link->link_status, DP_LANE_ALIGN_STATUS_UPDATED) &
+					DP_DOWNSTREAM_PORT_STATUS_CHANGED)
+		goto reset;
+
+	if (link->prev_sink_count == link->dp_link.sink_count)
+		return -EINVAL;
+
+reset:
+	/* reset prev_sink_count */
+	link->prev_sink_count = link->dp_link.sink_count;
+
+	return 0;
+}
+
+static bool dp_link_is_video_pattern_requested(struct dp_link_private *link)
+{
+	return (link->request.test_requested & DP_TEST_LINK_VIDEO_PATTERN)
+		&& !(link->request.test_requested &
+		DP_TEST_LINK_AUDIO_DISABLED_VIDEO);
+}
+
+static bool dp_link_is_audio_pattern_requested(struct dp_link_private *link)
+{
+	return (link->request.test_requested & DP_TEST_LINK_AUDIO_PATTERN);
+}
+
+static void dp_link_reset_data(struct dp_link_private *link)
+{
+	link->request = (const struct dp_link_request){ 0 };
+	link->dp_link.test_video = (const struct dp_link_test_video){ 0 };
+	link->dp_link.test_video.test_bit_depth = DP_TEST_BIT_DEPTH_UNKNOWN;
+	link->dp_link.test_audio = (const struct dp_link_test_audio){ 0 };
+	link->dp_link.phy_params.phy_test_pattern_sel = 0;
+	link->dp_link.sink_request = 0;
+	link->dp_link.test_response = 0;
+}
+
+/**
+ * dp_link_process_request() - handle HPD IRQ transition to HIGH
+ * @dp_link: pointer to link module data
+ *
+ * This function will handle the HPD IRQ state transitions from LOW to HIGH
+ * (including cases when there are back to back HPD IRQ HIGH) indicating
+ * the start of a new link training request or sink status update.
+ */
+int dp_link_process_request(struct dp_link *dp_link)
+{
+	int ret = 0;
+	struct dp_link_private *link;
+
+	if (!dp_link) {
+		DRM_ERROR("invalid input\n");
+		return -EINVAL;
+	}
+
+	link = container_of(dp_link, struct dp_link_private, dp_link);
+
+	mutex_lock(&link->test_response_mutex);
+	dp_link_reset_data(link);
+
+	dp_link_parse_sink_status_field(link);
+	mutex_unlock(&link->test_response_mutex);
+
+	if (link->request.test_requested == DP_TEST_LINK_EDID_READ) {
+		dp_link->sink_request |= DP_TEST_LINK_EDID_READ;
+		return ret;
+	}
+
+	ret = dp_link_process_ds_port_status_change(link);
+	if (!ret) {
+		dp_link->sink_request |= DS_PORT_STATUS_CHANGED;
+		return ret;
+	}
+
+	ret = dp_link_process_link_training_request(link);
+	if (!ret) {
+		dp_link->sink_request |= DP_TEST_LINK_TRAINING;
+		return ret;
+	}
+
+	ret = dp_link_process_phy_test_pattern_request(link);
+	if (!ret) {
+		dp_link->sink_request |= DP_TEST_LINK_PHY_TEST_PATTERN;
+		return ret;
+	}
+
+	ret = dp_link_process_link_status_update(link);
+	if (!ret) {
+		dp_link->sink_request |= DP_LINK_STATUS_UPDATED;
+		return ret;
+	}
+
+	if (dp_link_is_video_pattern_requested(link)) {
+		dp_link->sink_request |= DP_TEST_LINK_VIDEO_PATTERN;
+		return -EINVAL;
+	}
+
+	if (dp_link_is_audio_pattern_requested(link)) {
+		dp_link->sink_request |= DP_TEST_LINK_AUDIO_PATTERN;
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
+int dp_link_get_colorimetry_config(struct dp_link *dp_link)
+{
+	u32 cc;
+	struct dp_link_private *link;
+
+	if (!dp_link) {
+		DRM_ERROR("invalid input\n");
+		return -EINVAL;
+	}
+
+	link = container_of(dp_link, struct dp_link_private, dp_link);
+
+	/*
+	 * Unless a video pattern CTS test is ongoing, use RGB_VESA
+	 * Only RGB_VESA and RGB_CEA supported for now
+	 */
+	if (dp_link_is_video_pattern_requested(link))
+		cc = link->dp_link.test_video.test_dyn_range;
+	else
+		cc = DP_TEST_DYNAMIC_RANGE_VESA;
+
+	return cc;
+}
+
+int dp_link_adjust_levels(struct dp_link *dp_link, u8 *link_status)
+{
+	int i;
+	int v_max = 0, p_max = 0;
+
+	if (!dp_link) {
+		DRM_ERROR("invalid input\n");
+		return -EINVAL;
+	}
+
+	/* use the max level across lanes */
+	for (i = 0; i < dp_link->link_params.num_lanes; i++) {
+		u8 data_v = drm_dp_get_adjust_request_voltage(link_status, i);
+		u8 data_p = drm_dp_get_adjust_request_pre_emphasis(link_status,
+									 i);
+		DRM_DEBUG_DP("lane=%d req_vol_swing=%d req_pre_emphasis=%d\n",
+				i, data_v, data_p);
+		if (v_max < data_v)
+			v_max = data_v;
+		if (p_max < data_p)
+			p_max = data_p;
+	}
+
+	dp_link->phy_params.v_level = v_max >> DP_TRAIN_VOLTAGE_SWING_SHIFT;
+	dp_link->phy_params.p_level = p_max >> DP_TRAIN_PRE_EMPHASIS_SHIFT;
+
+	/**
+	 * Adjust the voltage swing and pre-emphasis level combination to within
+	 * the allowable range.
+	 */
+	if (dp_link->phy_params.v_level > DP_TRAIN_VOLTAGE_SWING_MAX) {
+		DRM_DEBUG_DP("Requested vSwingLevel=%d, change to %d\n",
+			dp_link->phy_params.v_level,
+			DP_TRAIN_VOLTAGE_SWING_MAX);
+		dp_link->phy_params.v_level = DP_TRAIN_VOLTAGE_SWING_MAX;
+	}
+
+	if (dp_link->phy_params.p_level > DP_TRAIN_PRE_EMPHASIS_MAX) {
+		DRM_DEBUG_DP("Requested preEmphasisLevel=%d, change to %d\n",
+			dp_link->phy_params.p_level,
+			DP_TRAIN_PRE_EMPHASIS_MAX);
+		dp_link->phy_params.p_level = DP_TRAIN_PRE_EMPHASIS_MAX;
+	}
+
+	if ((dp_link->phy_params.p_level > DP_TRAIN_PRE_EMPHASIS_LVL_1)
+		&& (dp_link->phy_params.v_level ==
+			DP_TRAIN_VOLTAGE_SWING_LVL_2)) {
+		DRM_DEBUG_DP("Requested preEmphasisLevel=%d, change to %d\n",
+			dp_link->phy_params.p_level,
+			DP_TRAIN_PRE_EMPHASIS_LVL_1);
+		dp_link->phy_params.p_level = DP_TRAIN_PRE_EMPHASIS_LVL_1;
+	}
+
+	DRM_DEBUG_DP("adjusted: v_level=%d, p_level=%d\n",
+		dp_link->phy_params.v_level, dp_link->phy_params.p_level);
+
+	return 0;
+}
+
+u32 dp_link_get_test_bits_depth(struct dp_link *dp_link, u32 bpp)
+{
+	u32 tbd;
+
+	/*
+	 * Few simplistic rules and assumptions made here:
+	 *    1. Test bit depth is bit depth per color component
+	 *    2. Assume 3 color components
+	 */
+	switch (bpp) {
+	case 18:
+		tbd = DP_TEST_BIT_DEPTH_6;
+		break;
+	case 24:
+		tbd = DP_TEST_BIT_DEPTH_8;
+		break;
+	case 30:
+		tbd = DP_TEST_BIT_DEPTH_10;
+		break;
+	default:
+		tbd = DP_TEST_BIT_DEPTH_UNKNOWN;
+		break;
+	}
+
+	if (tbd != DP_TEST_BIT_DEPTH_UNKNOWN)
+		tbd = (tbd >> DP_TEST_BIT_DEPTH_SHIFT);
+
+	return tbd;
+}
+
+struct dp_link *dp_link_get(struct device *dev, struct drm_dp_aux *aux)
+{
+	struct dp_link_private *link;
+	struct dp_link *dp_link;
+
+	if (!dev || !aux) {
+		DRM_ERROR("invalid input\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	link = devm_kzalloc(dev, sizeof(*link), GFP_KERNEL);
+	if (!link)
+		return ERR_PTR(-ENOMEM);
+
+	link->dev   = dev;
+	link->aux   = aux;
+
+	mutex_init(&link->test_response_mutex);
+	mutex_init(&link->psm_mutex);
+	dp_link = &link->dp_link;
+
+	return dp_link;
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_link.h b/drivers/gpu/drm/msm/dp/dp_link.h
new file mode 100644
index 000000000000..e9d54db8fb61
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_link.h
@@ -0,0 +1,132 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DP_LINK_H_
+#define _DP_LINK_H_
+
+#include "dp_aux.h"
+
+#define DS_PORT_STATUS_CHANGED 0x200
+#define DP_TEST_BIT_DEPTH_UNKNOWN 0xFFFFFFFF
+#define DP_LINK_CAP_ENHANCED_FRAMING (1 << 0)
+
+struct dp_link_info {
+	unsigned char revision;
+	unsigned int rate;
+	unsigned int num_lanes;
+	unsigned long capabilities;
+};
+
+enum dp_link_voltage_level {
+	DP_TRAIN_VOLTAGE_SWING_LVL_0	= 0,
+	DP_TRAIN_VOLTAGE_SWING_LVL_1	= 1,
+	DP_TRAIN_VOLTAGE_SWING_LVL_2	= 2,
+	DP_TRAIN_VOLTAGE_SWING_MAX	= DP_TRAIN_VOLTAGE_SWING_LVL_2,
+};
+
+enum dp_link_preemaphasis_level {
+	DP_TRAIN_PRE_EMPHASIS_LVL_0	= 0,
+	DP_TRAIN_PRE_EMPHASIS_LVL_1	= 1,
+	DP_TRAIN_PRE_EMPHASIS_LVL_2	= 2,
+	DP_TRAIN_PRE_EMPHASIS_MAX	= DP_TRAIN_PRE_EMPHASIS_LVL_2,
+};
+
+struct dp_link_test_video {
+	u32 test_video_pattern;
+	u32 test_bit_depth;
+	u32 test_dyn_range;
+	u32 test_h_total;
+	u32 test_v_total;
+	u32 test_h_start;
+	u32 test_v_start;
+	u32 test_hsync_pol;
+	u32 test_hsync_width;
+	u32 test_vsync_pol;
+	u32 test_vsync_width;
+	u32 test_h_width;
+	u32 test_v_height;
+	u32 test_rr_d;
+	u32 test_rr_n;
+};
+
+struct dp_link_test_audio {
+	u32 test_audio_sampling_rate;
+	u32 test_audio_channel_count;
+	u32 test_audio_pattern_type;
+	u32 test_audio_period_ch_1;
+	u32 test_audio_period_ch_2;
+	u32 test_audio_period_ch_3;
+	u32 test_audio_period_ch_4;
+	u32 test_audio_period_ch_5;
+	u32 test_audio_period_ch_6;
+	u32 test_audio_period_ch_7;
+	u32 test_audio_period_ch_8;
+};
+
+struct dp_link_phy_params {
+	u32 phy_test_pattern_sel;
+	u8 v_level;
+	u8 p_level;
+};
+
+struct dp_link {
+	u32 sink_request;
+	u32 test_response;
+	bool psm_enabled;
+
+	u8 sink_count;
+	struct dp_link_test_video test_video;
+	struct dp_link_test_audio test_audio;
+	struct dp_link_phy_params phy_params;
+	struct dp_link_info link_params;
+};
+
+/**
+ * mdss_dp_test_bit_depth_to_bpp() - convert test bit depth to bpp
+ * @tbd: test bit depth
+ *
+ * Returns the bits per pixel (bpp) to be used corresponding to the
+ * git bit depth value. This function assumes that bit depth has
+ * already been validated.
+ */
+static inline u32 dp_link_bit_depth_to_bpp(u32 tbd)
+{
+	/*
+	 * Few simplistic rules and assumptions made here:
+	 *    1. Bit depth is per color component
+	 *    2. If bit depth is unknown return 0
+	 *    3. Assume 3 color components
+	 */
+	switch (tbd) {
+	case DP_TEST_BIT_DEPTH_6:
+		return 18;
+	case DP_TEST_BIT_DEPTH_8:
+		return 24;
+	case DP_TEST_BIT_DEPTH_10:
+		return 30;
+	case DP_TEST_BIT_DEPTH_UNKNOWN:
+	default:
+		return 0;
+	}
+}
+
+u32 dp_link_get_test_bits_depth(struct dp_link *dp_link, u32 bpp);
+int dp_link_process_request(struct dp_link *dp_link);
+int dp_link_get_colorimetry_config(struct dp_link *dp_link);
+int dp_link_adjust_levels(struct dp_link *dp_link, u8 *link_status);
+bool dp_link_send_test_response(struct dp_link *dp_link);
+int dp_link_psm_config(struct dp_link *dp_link,
+		struct dp_link_info *link_info, bool enable);
+bool dp_link_send_edid_checksum(struct dp_link *dp_link, u8 checksum);
+
+/**
+ * dp_link_get() - get the functionalities of dp test module
+ *
+ *
+ * return: a pointer to dp_link struct
+ */
+struct dp_link *dp_link_get(struct device *dev, struct drm_dp_aux *aux);
+
+#endif /* _DP_LINK_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
new file mode 100644
index 000000000000..5ac4b017da8f
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -0,0 +1,486 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
+ */
+
+#include "dp_panel.h"
+
+#include <drm/drm_connector.h>
+#include <drm/drm_edid.h>
+
+#define DP_MAX_DS_PORT_COUNT 1
+
+struct dp_panel_private {
+	struct device *dev;
+	struct dp_panel dp_panel;
+	struct drm_dp_aux *aux;
+	struct dp_link *link;
+	struct dp_catalog *catalog;
+	bool panel_on;
+	bool aux_cfg_update_done;
+};
+
+static int dp_panel_read_dpcd(struct dp_panel *dp_panel)
+{
+	int rc = 0;
+	size_t rlen;
+	struct dp_panel_private *panel;
+	struct dp_link_info *link_info;
+	u8 *dpcd, major = 0, minor = 0, temp;
+	u32 dfp_count = 0, offset = DP_DPCD_REV;
+
+	dpcd = dp_panel->dpcd;
+
+	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
+	link_info = &dp_panel->link_info;
+
+	rlen = drm_dp_dpcd_read(panel->aux,
+				DP_TRAINING_AUX_RD_INTERVAL, &temp, 1);
+	if (rlen < 0) {
+		DRM_ERROR("err reading DP_TRAINING_AUX_RD_INTERVAL,rlen=%zd\n",
+				rlen);
+		rc = -EINVAL;
+		goto end;
+	}
+
+	/* check for EXTENDED_RECEIVER_CAPABILITY_FIELD_PRESENT */
+	if (temp & BIT(7)) {
+		DRM_DEBUG_DP("using EXTENDED_RECEIVER_CAPABILITY_FIELD\n");
+		offset = DPRX_EXTENDED_DPCD_FIELD;
+	}
+
+	rlen = drm_dp_dpcd_read(panel->aux, offset,
+		dpcd, (DP_RECEIVER_CAP_SIZE + 1));
+	if (rlen < (DP_RECEIVER_CAP_SIZE + 1)) {
+		DRM_ERROR("dpcd read failed, rlen=%zd\n", rlen);
+		if (rlen == -ETIMEDOUT)
+			rc = rlen;
+		else
+			rc = -EINVAL;
+
+		goto end;
+	}
+
+	print_hex_dump(KERN_DEBUG, "[drm-dp] SINK DPCD: ",
+		DUMP_PREFIX_NONE, 8, 1, dp_panel->dpcd, rlen, false);
+
+	link_info->revision = dpcd[DP_DPCD_REV];
+	major = (link_info->revision >> 4) & 0x0f;
+	minor = link_info->revision & 0x0f;
+
+	link_info->rate = drm_dp_bw_code_to_link_rate(dpcd[DP_MAX_LINK_RATE]);
+	link_info->num_lanes = dpcd[DP_MAX_LANE_COUNT] & DP_MAX_LANE_COUNT_MASK;
+
+	if (link_info->num_lanes > dp_panel->max_dp_lanes)
+		link_info->num_lanes = dp_panel->max_dp_lanes;
+
+	/* Limit support upto HBR2 until HBR3 support is added */
+	if (link_info->rate >= (drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4)))
+		link_info->rate = drm_dp_bw_code_to_link_rate(DP_LINK_BW_5_4);
+
+	DRM_DEBUG_DP("version: %d.%d\n", major, minor);
+	DRM_DEBUG_DP("link_rate=%d\n", link_info->rate);
+	DRM_DEBUG_DP("lane_count=%d\n", link_info->num_lanes);
+
+	if (drm_dp_enhanced_frame_cap(dpcd))
+		link_info->capabilities |= DP_LINK_CAP_ENHANCED_FRAMING;
+
+	dfp_count = dpcd[DP_DOWN_STREAM_PORT_COUNT] &
+						DP_DOWN_STREAM_PORT_COUNT;
+
+	if (dfp_count > DP_MAX_DS_PORT_COUNT) {
+		DRM_ERROR("DS port count %d greater that max (%d) supported\n",
+			dfp_count, DP_MAX_DS_PORT_COUNT);
+		return -EINVAL;
+	}
+end:
+	return rc;
+}
+
+static u32 dp_panel_get_supported_bpp(struct dp_panel *dp_panel,
+		u32 mode_edid_bpp, u32 mode_pclk_khz)
+{
+	struct dp_link_info *link_info;
+	const u32 max_supported_bpp = 30, min_supported_bpp = 18;
+	u32 bpp = 0, data_rate_khz = 0;
+
+	bpp = min_t(u32, mode_edid_bpp, max_supported_bpp);
+
+	link_info = &dp_panel->link_info;
+	data_rate_khz = link_info->num_lanes * link_info->rate * 8;
+
+	while (bpp > min_supported_bpp) {
+		if (mode_pclk_khz * bpp <= data_rate_khz)
+			break;
+		bpp -= 6;
+	}
+
+	return bpp;
+}
+
+static void dp_panel_set_test_mode(struct dp_panel_private *panel,
+		struct dp_display_mode *mode)
+{
+	struct drm_display_mode *drm_mode = NULL;
+	struct dp_link_test_video *test_info = NULL;
+
+	drm_mode = &mode->drm_mode;
+	test_info = &panel->link->test_video;
+
+	drm_mode->hdisplay = test_info->test_h_width;
+	drm_mode->hsync_start = drm_mode->hdisplay + test_info->test_h_total -
+			(test_info->test_h_start + test_info->test_h_width);
+	drm_mode->hsync_end = drm_mode->hsync_start +
+				test_info->test_hsync_width;
+	drm_mode->htotal = drm_mode->hsync_end + test_info->test_h_start -
+						test_info->test_hsync_width;
+
+	drm_mode->vdisplay = test_info->test_v_height;
+	drm_mode->vsync_start = drm_mode->vdisplay + test_info->test_v_total -
+			(test_info->test_v_start + test_info->test_v_height);
+	drm_mode->vsync_end = drm_mode->vsync_start +
+				test_info->test_vsync_width;
+	drm_mode->vtotal = drm_mode->vsync_end + test_info->test_v_start -
+						test_info->test_vsync_width;
+
+	drm_mode->clock = test_info->test_h_total *
+		test_info->test_v_total * test_info->test_rr_n;
+
+	drm_mode->type = 0x48;
+	drm_mode_set_name(drm_mode);
+
+	if (test_info->test_rr_d == 0)
+		drm_mode->clock /= 1000;
+	else
+		drm_mode->clock /= 1001;
+
+	if (test_info->test_h_width == 640)
+		drm_mode->clock = 25170;
+}
+
+static int dp_panel_update_modes(struct drm_connector *connector,
+	struct edid *edid)
+{
+	int rc = 0;
+
+	if (edid) {
+		rc = drm_connector_update_edid_property(connector, edid);
+		if (rc) {
+			DRM_ERROR("failed to update edid property %d\n", rc);
+			return rc;
+		}
+		rc = drm_add_edid_modes(connector, edid);
+		DRM_DEBUG_DP("%s -", __func__);
+		return rc;
+	}
+
+	rc = drm_connector_update_edid_property(connector, NULL);
+	if (rc)
+		DRM_ERROR("failed to update edid property %d\n", rc);
+
+	return rc;
+}
+
+int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
+	struct drm_connector *connector)
+{
+	int rc = 0, bw_code;
+	struct dp_panel_private *panel;
+
+	if (!dp_panel || !connector) {
+		DRM_ERROR("invalid input\n");
+		return -EINVAL;
+	}
+
+	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
+
+	rc = dp_panel_read_dpcd(dp_panel);
+	bw_code = drm_dp_link_rate_to_bw_code(dp_panel->link_info.rate);
+	if (rc || !is_link_rate_valid(bw_code) ||
+			!is_lane_count_valid(dp_panel->link_info.num_lanes) ||
+			(bw_code > dp_panel->max_bw_code)) {
+		DRM_ERROR("read dpcd failed %d\n", rc);
+		return rc;
+	}
+	rc = drm_dp_read_desc(panel->aux, &dp_panel->desc,
+			      drm_dp_is_branch(dp_panel->dpcd));
+	if (rc) {
+		DRM_ERROR("read sink/branch descriptor failed %d\n", rc);
+		return rc;
+	}
+
+	kfree(dp_panel->edid);
+	dp_panel->edid = NULL;
+
+	dp_panel->edid = drm_get_edid(connector,
+					      &panel->aux->ddc);
+	if (!dp_panel->edid) {
+		DRM_ERROR("panel edid read failed\n");
+		return -EINVAL;
+	}
+
+	if (panel->aux_cfg_update_done) {
+		DRM_DEBUG_DP("read DPCD with updated AUX config\n");
+		rc = dp_panel_read_dpcd(dp_panel);
+		bw_code = drm_dp_link_rate_to_bw_code(dp_panel->link_info.rate);
+		if (rc || !is_link_rate_valid(bw_code) ||
+			!is_lane_count_valid(dp_panel->link_info.num_lanes)
+			|| (bw_code > dp_panel->max_bw_code)) {
+			DRM_ERROR("read dpcd failed %d\n", rc);
+			return rc;
+		}
+		panel->aux_cfg_update_done = false;
+	}
+
+	return 0;
+}
+
+u32 dp_panel_get_mode_bpp(struct dp_panel *dp_panel,
+		u32 mode_edid_bpp, u32 mode_pclk_khz)
+{
+	struct dp_panel_private *panel;
+	u32 bpp = mode_edid_bpp;
+
+	if (!dp_panel || !mode_edid_bpp || !mode_pclk_khz) {
+		DRM_ERROR("invalid input\n");
+		return 0;
+	}
+
+	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
+
+	if (dp_panel->video_test)
+		bpp = dp_link_bit_depth_to_bpp(
+				panel->link->test_video.test_bit_depth);
+	else
+		bpp = dp_panel_get_supported_bpp(dp_panel, mode_edid_bpp,
+				mode_pclk_khz);
+
+	return bpp;
+}
+
+int dp_panel_get_modes(struct dp_panel *dp_panel,
+	struct drm_connector *connector, struct dp_display_mode *mode)
+{
+	struct dp_panel_private *panel;
+
+	if (!dp_panel) {
+		DRM_ERROR("invalid input\n");
+		return -EINVAL;
+	}
+
+	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
+
+	if (dp_panel->video_test) {
+		dp_panel_set_test_mode(panel, mode);
+		return 1;
+	} else if (dp_panel->edid) {
+		return dp_panel_update_modes(connector, dp_panel->edid);
+	}
+
+	return 0;
+}
+
+static u8 dp_panel_get_edid_checksum(struct edid *edid)
+{
+	struct edid *last_block;
+	u8 *raw_edid;
+	bool is_edid_corrupt;
+
+	if (!edid) {
+		DRM_ERROR("invalid edid input\n");
+		return 0;
+	}
+
+	raw_edid = (u8 *)edid;
+	raw_edid += (edid->extensions * EDID_LENGTH);
+	last_block = (struct edid *)raw_edid;
+
+	/* block type extension */
+	drm_edid_block_valid(raw_edid, 1, false, &is_edid_corrupt);
+	if (!is_edid_corrupt)
+		return last_block->checksum;
+
+	DRM_ERROR("Invalid block, no checksum\n");
+	return 0;
+}
+
+void dp_panel_handle_sink_request(struct dp_panel *dp_panel)
+{
+	struct dp_panel_private *panel;
+
+	if (!dp_panel) {
+		DRM_ERROR("invalid input\n");
+		return;
+	}
+
+	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
+
+	if (panel->link->sink_request & DP_TEST_LINK_EDID_READ) {
+		u8 checksum = dp_panel_get_edid_checksum(dp_panel->edid);
+
+		dp_link_send_edid_checksum(panel->link, checksum);
+		dp_link_send_test_response(panel->link);
+	}
+}
+
+void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable)
+{
+	struct dp_catalog *catalog;
+	struct dp_panel_private *panel;
+
+	if (!dp_panel) {
+		DRM_ERROR("invalid input\n");
+		return;
+	}
+
+	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
+	catalog = panel->catalog;
+
+	if (!panel->panel_on) {
+		DRM_DEBUG_DP("DP panel not enabled, handle TPG on next on\n");
+		return;
+	}
+
+	if (!enable) {
+		dp_catalog_panel_tpg_disable(catalog);
+		return;
+	}
+
+	DRM_DEBUG_DP("%s: calling catalog tpg_enable\n", __func__);
+	dp_catalog_panel_tpg_enable(catalog, &panel->dp_panel.dp_mode.drm_mode);
+}
+
+void dp_panel_dump_regs(struct dp_panel *dp_panel)
+{
+	struct dp_catalog *catalog;
+	struct dp_panel_private *panel;
+
+	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
+	catalog = panel->catalog;
+
+	dp_catalog_dump_regs(catalog);
+}
+
+int dp_panel_timing_cfg(struct dp_panel *dp_panel)
+{
+	int rc = 0;
+	u32 data, total_ver, total_hor;
+	struct dp_catalog *catalog;
+	struct dp_panel_private *panel;
+	struct drm_display_mode *drm_mode;
+
+	panel = container_of(dp_panel, struct dp_panel_private, dp_panel);
+	catalog = panel->catalog;
+	drm_mode = &panel->dp_panel.dp_mode.drm_mode;
+
+	DRM_DEBUG_DP("width=%d hporch= %d %d %d\n",
+		drm_mode->hdisplay, drm_mode->htotal - drm_mode->hsync_end,
+		drm_mode->hsync_start - drm_mode->hdisplay,
+		drm_mode->hsync_end - drm_mode->hsync_start);
+
+	DRM_DEBUG_DP("height=%d vporch= %d %d %d\n",
+		drm_mode->vdisplay, drm_mode->vtotal - drm_mode->vsync_end,
+		drm_mode->vsync_start - drm_mode->vdisplay,
+		drm_mode->vsync_end - drm_mode->vsync_start);
+
+	total_hor = drm_mode->htotal;
+
+	total_ver = drm_mode->vtotal;
+
+	data = total_ver;
+	data <<= 16;
+	data |= total_hor;
+
+	catalog->total = data;
+
+	data = (drm_mode->vtotal - drm_mode->vsync_start);
+	data <<= 16;
+	data |= (drm_mode->htotal - drm_mode->hsync_start);
+
+	catalog->sync_start = data;
+
+	data = drm_mode->vsync_end - drm_mode->vsync_start;
+	data <<= 16;
+	data |= (panel->dp_panel.dp_mode.v_active_low << 31);
+	data |= drm_mode->hsync_end - drm_mode->hsync_start;
+	data |= (panel->dp_panel.dp_mode.h_active_low << 15);
+
+	catalog->width_blanking = data;
+
+	data = drm_mode->vdisplay;
+	data <<= 16;
+	data |= drm_mode->hdisplay;
+
+	catalog->dp_active = data;
+
+	dp_catalog_panel_timing_cfg(catalog);
+	panel->panel_on = true;
+
+	return rc;
+}
+
+int dp_panel_init_panel_info(struct dp_panel *dp_panel)
+{
+	int rc = 0;
+	struct drm_display_mode *drm_mode;
+
+	drm_mode = &dp_panel->dp_mode.drm_mode;
+
+	/*
+	 * print resolution info as this is a result
+	 * of user initiated action of cable connection
+	 */
+	DRM_DEBUG_DP("SET NEW RESOLUTION:\n");
+	DRM_DEBUG_DP("%dx%d@%dfps\n", drm_mode->hdisplay,
+		drm_mode->vdisplay, drm_mode_vrefresh(drm_mode));
+	DRM_DEBUG_DP("h_porches(back|front|width) = (%d|%d|%d)\n",
+			drm_mode->htotal - drm_mode->hsync_end,
+			drm_mode->hsync_start - drm_mode->hdisplay,
+			drm_mode->hsync_end - drm_mode->hsync_start);
+	DRM_DEBUG_DP("v_porches(back|front|width) = (%d|%d|%d)\n",
+			drm_mode->vtotal - drm_mode->vsync_end,
+			drm_mode->vsync_start - drm_mode->vdisplay,
+			drm_mode->vsync_end - drm_mode->vsync_start);
+	DRM_DEBUG_DP("pixel clock (KHz)=(%d)\n", drm_mode->clock);
+	DRM_DEBUG_DP("bpp = %d\n", dp_panel->dp_mode.bpp);
+
+	dp_panel->dp_mode.bpp = max_t(u32, 18,
+					min_t(u32, dp_panel->dp_mode.bpp, 30));
+	DRM_DEBUG_DP("updated bpp = %d\n", dp_panel->dp_mode.bpp);
+
+	return rc;
+}
+
+struct dp_panel *dp_panel_get(struct dp_panel_in *in)
+{
+	struct dp_panel_private *panel;
+	struct dp_panel *dp_panel;
+
+	if (!in->dev || !in->catalog || !in->aux || !in->link) {
+		DRM_ERROR("invalid input\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	panel = devm_kzalloc(in->dev, sizeof(*panel), GFP_KERNEL);
+	if (!panel)
+		return ERR_PTR(-ENOMEM);
+
+	panel->dev = in->dev;
+	panel->aux = in->aux;
+	panel->catalog = in->catalog;
+	panel->link = in->link;
+
+	dp_panel = &panel->dp_panel;
+	dp_panel->max_bw_code = DP_LINK_BW_8_1;
+	panel->aux_cfg_update_done = false;
+
+	return dp_panel;
+}
+
+void dp_panel_put(struct dp_panel *dp_panel)
+{
+	if (!dp_panel)
+		return;
+
+	kfree(dp_panel->edid);
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
new file mode 100644
index 000000000000..f6f417eef2e9
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DP_PANEL_H_
+#define _DP_PANEL_H_
+
+#include <drm/msm_drm.h>
+
+#include "dp_aux.h"
+#include "dp_link.h"
+#include "dp_hpd.h"
+
+struct edid;
+
+#define DP_MAX_DOWNSTREAM_PORTS 0x10
+#define DPRX_EXTENDED_DPCD_FIELD 0x2200
+
+struct dp_display_mode {
+	struct drm_display_mode drm_mode;
+	u32 capabilities;
+	u32 bpp;
+	u32 h_active_low;
+	u32 v_active_low;
+};
+
+struct dp_panel_in {
+	struct device *dev;
+	struct drm_dp_aux *aux;
+	struct dp_link *link;
+	struct dp_catalog *catalog;
+};
+
+struct dp_panel {
+	/* dpcd raw data */
+	u8 dpcd[DP_RECEIVER_CAP_SIZE + 1];
+
+	struct dp_link_info link_info;
+	struct drm_dp_desc desc;
+	struct edid *edid;
+	struct drm_connector *connector;
+	struct dp_display_mode dp_mode;
+	bool video_test;
+
+	u32 vic;
+	u32 max_pclk_khz;
+	u32 max_dp_lanes;
+
+	u32 max_bw_code;
+};
+
+int dp_panel_init_panel_info(struct dp_panel *dp_panel);
+int dp_panel_deinit(struct dp_panel *dp_panel);
+int dp_panel_timing_cfg(struct dp_panel *dp_panel);
+void dp_panel_dump_regs(struct dp_panel *dp_panel);
+int dp_panel_read_sink_caps(struct dp_panel *dp_panel,
+		struct drm_connector *connector);
+u32 dp_panel_get_mode_bpp(struct dp_panel *dp_panel, u32 mode_max_bpp,
+			u32 mode_pclk_khz);
+int dp_panel_get_modes(struct dp_panel *dp_panel,
+		struct drm_connector *connector, struct dp_display_mode *mode);
+void dp_panel_handle_sink_request(struct dp_panel *dp_panel);
+void dp_panel_tpg_config(struct dp_panel *dp_panel, bool enable);
+
+/**
+ * is_link_rate_valid() - validates the link rate
+ * @lane_rate: link rate requested by the sink
+ *
+ * Returns true if the requested link rate is supported.
+ */
+static inline bool is_link_rate_valid(u32 bw_code)
+{
+	return (bw_code == DP_LINK_BW_1_62 ||
+		bw_code == DP_LINK_BW_2_7 ||
+		bw_code == DP_LINK_BW_5_4 ||
+		bw_code == DP_LINK_BW_8_1);
+}
+
+/**
+ * dp_link_is_lane_count_valid() - validates the lane count
+ * @lane_count: lane count requested by the sink
+ *
+ * Returns true if the requested lane count is supported.
+ */
+static inline bool is_lane_count_valid(u32 lane_count)
+{
+	return (lane_count == 1 ||
+		lane_count == 2 ||
+		lane_count == 4);
+}
+
+struct dp_panel *dp_panel_get(struct dp_panel_in *in);
+void dp_panel_put(struct dp_panel *dp_panel);
+#endif /* _DP_PANEL_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
new file mode 100644
index 000000000000..19c14c1ddbb4
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_parser.c
@@ -0,0 +1,265 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/of_gpio.h>
+
+#include "dp_parser.h"
+
+static const struct dp_regulator_cfg sdm845_dp_reg_cfg = {
+	.num = 2,
+	.regs = {
+		{"vdda-1p2", 21800, 4 },	/* 1.2 V */
+		{"vdda-0p9", 36000, 32 },	/* 0.9 V */
+	},
+};
+
+static int msm_dss_ioremap(struct platform_device *pdev,
+				struct dss_io_data *io_data)
+{
+	struct resource *res = NULL;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res) {
+		DRM_ERROR("%pS->%s: msm_dss_get_res failed\n",
+			__builtin_return_address(0), __func__);
+		return -ENODEV;
+	}
+
+	io_data->len = (u32)resource_size(res);
+	io_data->base = ioremap(res->start, io_data->len);
+	if (!io_data->base) {
+		DRM_ERROR("%pS->%s: ioremap failed\n",
+			__builtin_return_address(0), __func__);
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static void msm_dss_iounmap(struct dss_io_data *io_data)
+{
+	if (io_data->base) {
+		iounmap(io_data->base);
+		io_data->base = NULL;
+	}
+	io_data->len = 0;
+}
+
+static void dp_parser_unmap_io_resources(struct dp_parser *parser)
+{
+	struct dp_io *io = &parser->io;
+
+	msm_dss_iounmap(&io->dp_controller);
+	msm_dss_iounmap(&io->usb3_dp_com);
+}
+
+static int dp_parser_ctrl_res(struct dp_parser *parser)
+{
+	int rc = 0;
+	struct platform_device *pdev = parser->pdev;
+	struct dp_io *io = &parser->io;
+
+	rc = msm_dss_ioremap(pdev, &io->dp_controller);
+	if (rc) {
+		DRM_ERROR("unable to remap dp io resources, rc=%d\n", rc);
+		goto err;
+	}
+
+	return 0;
+err:
+	dp_parser_unmap_io_resources(parser);
+	return rc;
+}
+
+static int dp_parser_misc(struct dp_parser *parser)
+{
+	struct device_node *of_node = parser->pdev->dev.of_node;
+	int len = 0;
+	const char *data_lane_property = "data-lanes";
+
+	len = of_property_count_elems_of_size(of_node,
+			 data_lane_property, sizeof(u32));
+	if (len < 0) {
+		DRM_WARN("Invalid property %s, default max DP lanes = %d\n",
+				data_lane_property, DP_MAX_NUM_DP_LANES);
+		len = DP_MAX_NUM_DP_LANES;
+	}
+
+	parser->max_dp_lanes = len;
+
+	return 0;
+}
+
+static inline bool dp_parser_check_prefix(const char *clk_prefix,
+						const char *clk_name)
+{
+	return !strncmp(clk_prefix, clk_name, strlen(clk_prefix));
+}
+
+static int dp_parser_init_clk_data(struct dp_parser *parser)
+{
+	int num_clk, i, rc;
+	int core_clk_count = 0, ctrl_clk_count = 0;
+	const char *clk_name;
+	struct device *dev = &parser->pdev->dev;
+	struct dss_module_power *core_power = &parser->mp[DP_CORE_PM];
+	struct dss_module_power *ctrl_power = &parser->mp[DP_CTRL_PM];
+
+	num_clk = of_property_count_strings(dev->of_node, "clock-names");
+	if (num_clk <= 0) {
+		DRM_ERROR("no clocks are defined\n");
+		return -EINVAL;
+	}
+
+	for (i = 0; i < num_clk; i++) {
+		rc = of_property_read_string_index(dev->of_node,
+				"clock-names", i, &clk_name);
+		if (rc < 0)
+			return rc;
+
+		if (dp_parser_check_prefix("core", clk_name))
+			core_clk_count++;
+
+		if (dp_parser_check_prefix("ctrl", clk_name))
+			ctrl_clk_count++;
+
+		if (dp_parser_check_prefix("stream", clk_name))
+			ctrl_clk_count++;
+	}
+
+	/* Initialize the CORE power module */
+	if (core_clk_count == 0) {
+		DRM_ERROR("no core clocks are defined\n");
+		return -EINVAL;
+	}
+
+	core_power->num_clk = core_clk_count;
+	core_power->clk_config = devm_kzalloc(dev,
+			sizeof(struct dss_clk) * core_power->num_clk,
+			GFP_KERNEL);
+	if (!core_power->clk_config)
+		return -EINVAL;
+
+	/* Initialize the CTRL power module */
+	if (ctrl_clk_count == 0) {
+		DRM_ERROR("no ctrl clocks are defined\n");
+		return -EINVAL;
+	}
+
+	ctrl_power->num_clk = ctrl_clk_count;
+	ctrl_power->clk_config = devm_kzalloc(dev,
+			sizeof(struct dss_clk) * ctrl_power->num_clk,
+			GFP_KERNEL);
+	if (!ctrl_power->clk_config) {
+		ctrl_power->num_clk = 0;
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int dp_parser_clock(struct dp_parser *parser)
+{
+	int rc = 0, i = 0;
+	int num_clk = 0;
+	int core_clk_index = 0, ctrl_clk_index = 0;
+	int core_clk_count = 0, ctrl_clk_count = 0;
+	const char *clk_name;
+	struct device *dev = &parser->pdev->dev;
+	struct dss_module_power *core_power = &parser->mp[DP_CORE_PM];
+	struct dss_module_power *ctrl_power = &parser->mp[DP_CTRL_PM];
+
+	core_power = &parser->mp[DP_CORE_PM];
+	ctrl_power = &parser->mp[DP_CTRL_PM];
+
+	rc =  dp_parser_init_clk_data(parser);
+	if (rc) {
+		DRM_ERROR("failed to initialize power data %d\n", rc);
+		return -EINVAL;
+	}
+
+	core_clk_count = core_power->num_clk;
+	ctrl_clk_count = ctrl_power->num_clk;
+
+	num_clk = core_clk_count + ctrl_clk_count;
+
+	for (i = 0; i < num_clk; i++) {
+		rc = of_property_read_string_index(dev->of_node, "clock-names",
+				i, &clk_name);
+		if (rc) {
+			DRM_ERROR("error reading clock-names %d\n", rc);
+			return rc;
+		}
+		if (dp_parser_check_prefix("core", clk_name) &&
+				core_clk_index < core_clk_count) {
+			struct dss_clk *clk =
+				&core_power->clk_config[core_clk_index];
+			strlcpy(clk->clk_name, clk_name, sizeof(clk->clk_name));
+			clk->type = DSS_CLK_AHB;
+			core_clk_index++;
+		} else if ((dp_parser_check_prefix("ctrl", clk_name) ||
+			   dp_parser_check_prefix("stream", clk_name))  &&
+			   ctrl_clk_index < ctrl_clk_count) {
+			struct dss_clk *clk =
+				&ctrl_power->clk_config[ctrl_clk_index];
+			strlcpy(clk->clk_name, clk_name, sizeof(clk->clk_name));
+			ctrl_clk_index++;
+
+			if (dp_parser_check_prefix("ctrl_link", clk_name) ||
+			    dp_parser_check_prefix("stream_pixel", clk_name))
+				clk->type = DSS_CLK_PCLK;
+			else
+				clk->type = DSS_CLK_AHB;
+		}
+	}
+
+	DRM_DEBUG_DP("clock parsing successful\n");
+
+	return 0;
+}
+
+static int dp_parser_parse(struct dp_parser *parser)
+{
+	int rc = 0;
+
+	if (!parser) {
+		DRM_ERROR("invalid input\n");
+		return -EINVAL;
+	}
+
+	rc = dp_parser_ctrl_res(parser);
+	if (rc)
+		return rc;
+
+	rc = dp_parser_misc(parser);
+	if (rc)
+		return rc;
+
+	rc = dp_parser_clock(parser);
+	if (rc)
+		return rc;
+
+	/* Map the corresponding regulator information according to
+	 * version. Currently, since we only have one supported platform,
+	 * mapping the regulator directly.
+	 */
+	parser->regulator_cfg = &sdm845_dp_reg_cfg;
+
+	return 0;
+}
+
+struct dp_parser *dp_parser_get(struct platform_device *pdev)
+{
+	struct dp_parser *parser;
+
+	parser = devm_kzalloc(&pdev->dev, sizeof(*parser), GFP_KERNEL);
+	if (!parser)
+		return ERR_PTR(-ENOMEM);
+
+	parser->parse = dp_parser_parse;
+	parser->pdev = pdev;
+
+	return parser;
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_parser.h b/drivers/gpu/drm/msm/dp/dp_parser.h
new file mode 100644
index 000000000000..2085b15aa4cf
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_parser.h
@@ -0,0 +1,139 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DP_PARSER_H_
+#define _DP_PARSER_H_
+
+#include <linux/platform_device.h>
+
+#include "dpu_io_util.h"
+#include "msm_drv.h"
+
+#define DP_LABEL "MDSS DP DISPLAY"
+#define DP_MAX_PIXEL_CLK_KHZ	675000
+#define DP_MAX_NUM_DP_LANES	4
+
+enum dp_pm_type {
+	DP_CORE_PM,
+	DP_CTRL_PM,
+	DP_PHY_PM,
+	DP_MAX_PM
+};
+
+struct dss_io_data {
+	u32 len;
+	void __iomem *base;
+};
+
+static inline const char *dp_parser_pm_name(enum dp_pm_type module)
+{
+	switch (module) {
+	case DP_CORE_PM:	return "DP_CORE_PM";
+	case DP_CTRL_PM:	return "DP_CTRL_PM";
+	case DP_PHY_PM:		return "DP_PHY_PM";
+	default:		return "???";
+	}
+}
+
+/**
+ * struct dp_display_data  - display related device tree data.
+ *
+ * @ctrl_node: referece to controller device
+ * @phy_node:  reference to phy device
+ * @is_active: is the controller currently active
+ * @name: name of the display
+ * @display_type: type of the display
+ */
+struct dp_display_data {
+	struct device_node *ctrl_node;
+	struct device_node *phy_node;
+	bool is_active;
+	const char *name;
+	const char *display_type;
+};
+
+/**
+ * struct dp_ctrl_resource - controller's IO related data
+ *
+ * @dp_controller: Display Port controller mapped memory address
+ * @phy_io: phy's mapped memory address
+ * @ln_tx0_io: USB-DP lane TX0's mapped memory address
+ * @ln_tx1_io: USB-DP lane TX1's mapped memory address
+ * @dp_pll_io: DP PLL mapped memory address
+ * @usb3_dp_com: USB3 DP PHY combo mapped memory address
+ */
+struct dp_io {
+	struct dss_io_data dp_controller;
+	struct dss_io_data phy_io;
+	struct dss_io_data ln_tx0_io;
+	struct dss_io_data ln_tx1_io;
+	struct dss_io_data dp_pll_io;
+	struct dss_io_data usb3_dp_com;
+};
+
+/**
+ * struct dp_pinctrl - DP's pin control
+ *
+ * @pin: pin-controller's instance
+ * @state_active: active state pin control
+ * @state_hpd_active: hpd active state pin control
+ * @state_suspend: suspend state pin control
+ */
+struct dp_pinctrl {
+	struct pinctrl *pin;
+	struct pinctrl_state *state_active;
+	struct pinctrl_state *state_hpd_active;
+	struct pinctrl_state *state_suspend;
+};
+
+#define DP_DEV_REGULATOR_MAX	4
+
+/* Regulators for DP devices */
+struct dp_reg_entry {
+	char name[32];
+	int enable_load;
+	int disable_load;
+};
+
+struct dp_regulator_cfg {
+	int num;
+	struct dp_reg_entry regs[DP_DEV_REGULATOR_MAX];
+};
+
+/**
+ * struct dp_parser - DP parser's data exposed to clients
+ *
+ * @pdev: platform data of the client
+ * @mp: gpio, regulator and clock related data
+ * @pinctrl: pin-control related data
+ * @disp_data: controller's display related data
+ * @parse: function to be called by client to parse device tree.
+ */
+struct dp_parser {
+	struct platform_device *pdev;
+	struct dss_module_power mp[DP_MAX_PM];
+	struct dp_pinctrl pinctrl;
+	struct dp_io io;
+	struct dp_display_data disp_data;
+	const struct dp_regulator_cfg *regulator_cfg;
+	u32 max_dp_lanes;
+
+	int (*parse)(struct dp_parser *parser);
+};
+
+/**
+ * dp_parser_get() - get the DP's device tree parser module
+ *
+ * @pdev: platform data of the client
+ * return: pointer to dp_parser structure.
+ *
+ * This function provides client capability to parse the
+ * device tree and populate the data structures. The data
+ * related to clock, regulators, pin-control and other
+ * can be parsed using this module.
+ */
+struct dp_parser *dp_parser_get(struct platform_device *pdev);
+
+#endif
diff --git a/drivers/gpu/drm/msm/dp/dp_power.c b/drivers/gpu/drm/msm/dp/dp_power.c
new file mode 100644
index 000000000000..4aaa0aae4883
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_power.c
@@ -0,0 +1,363 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
+ */
+
+#define pr_fmt(fmt)	"[drm-dp] %s: " fmt, __func__
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/regulator/consumer.h>
+#include "dp_power.h"
+
+struct dp_power_private {
+	struct dp_parser *parser;
+	struct platform_device *pdev;
+	struct clk *link_clk_src;
+	struct clk *pixel_provider;
+	struct clk *link_provider;
+	struct regulator_bulk_data supplies[DP_DEV_REGULATOR_MAX];
+
+	struct dp_power dp_power;
+};
+
+static void dp_power_regulator_disable(struct dp_power_private *power)
+{
+	struct regulator_bulk_data *s = power->supplies;
+	const struct dp_reg_entry *regs = power->parser->regulator_cfg->regs;
+	int num = power->parser->regulator_cfg->num;
+	int i;
+
+	DBG("");
+	for (i = num - 1; i >= 0; i--)
+		if (regs[i].disable_load >= 0)
+			regulator_set_load(s[i].consumer,
+					   regs[i].disable_load);
+
+	regulator_bulk_disable(num, s);
+}
+
+static int dp_power_regulator_enable(struct dp_power_private *power)
+{
+	struct regulator_bulk_data *s = power->supplies;
+	const struct dp_reg_entry *regs = power->parser->regulator_cfg->regs;
+	int num = power->parser->regulator_cfg->num;
+	int ret, i;
+
+	DBG("");
+	for (i = 0; i < num; i++) {
+		if (regs[i].enable_load >= 0) {
+			ret = regulator_set_load(s[i].consumer,
+						 regs[i].enable_load);
+			if (ret < 0) {
+				pr_err("regulator %d set op mode failed, %d\n",
+					i, ret);
+				goto fail;
+			}
+		}
+	}
+
+	ret = regulator_bulk_enable(num, s);
+	if (ret < 0) {
+		pr_err("regulator enable failed, %d\n", ret);
+		goto fail;
+	}
+
+	return 0;
+
+fail:
+	for (i--; i >= 0; i--)
+		regulator_set_load(s[i].consumer, regs[i].disable_load);
+	return ret;
+}
+
+static int dp_power_regulator_init(struct dp_power_private *power)
+{
+	struct regulator_bulk_data *s = power->supplies;
+	const struct dp_reg_entry *regs = power->parser->regulator_cfg->regs;
+	struct platform_device *pdev = power->pdev;
+	int num = power->parser->regulator_cfg->num;
+	int i, ret;
+
+	for (i = 0; i < num; i++)
+		s[i].supply = regs[i].name;
+
+	ret = devm_regulator_bulk_get(&pdev->dev, num, s);
+	if (ret < 0) {
+		pr_err("%s: failed to init regulator, ret=%d\n",
+						__func__, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int dp_power_clk_init(struct dp_power_private *power)
+{
+	int rc = 0;
+	struct dss_module_power *core, *ctrl;
+	struct device *dev = &power->pdev->dev;
+
+	core = &power->parser->mp[DP_CORE_PM];
+	ctrl = &power->parser->mp[DP_CTRL_PM];
+
+	rc = msm_dss_get_clk(dev, core->clk_config, core->num_clk);
+	if (rc) {
+		DRM_ERROR("failed to get %s clk. err=%d\n",
+			dp_parser_pm_name(DP_CORE_PM), rc);
+		return rc;
+	}
+
+	rc = msm_dss_get_clk(dev, ctrl->clk_config, ctrl->num_clk);
+	if (rc) {
+		DRM_ERROR("failed to get %s clk. err=%d\n",
+			dp_parser_pm_name(DP_CTRL_PM), rc);
+		msm_dss_put_clk(core->clk_config, core->num_clk);
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+static int dp_power_clk_deinit(struct dp_power_private *power)
+{
+	struct dss_module_power *core, *ctrl;
+
+	core = &power->parser->mp[DP_CORE_PM];
+	ctrl = &power->parser->mp[DP_CTRL_PM];
+
+	if (!core || !ctrl)
+		return -EINVAL;
+
+	msm_dss_put_clk(ctrl->clk_config, ctrl->num_clk);
+	msm_dss_put_clk(core->clk_config, core->num_clk);
+	return 0;
+}
+
+static int dp_power_clk_set_rate(struct dp_power_private *power,
+		enum dp_pm_type module, bool enable)
+{
+	int rc = 0;
+	struct dss_module_power *mp = &power->parser->mp[module];
+
+	if (enable) {
+		rc = msm_dss_clk_set_rate(mp->clk_config, mp->num_clk);
+		if (rc) {
+			DRM_ERROR("failed to set clks rate.\n");
+			return rc;
+		}
+	}
+
+	rc = msm_dss_enable_clk(mp->clk_config, mp->num_clk, enable);
+	if (rc) {
+		DRM_ERROR("failed to %d clks, err: %d\n", enable, rc);
+		return rc;
+	}
+
+	return 0;
+}
+
+int dp_power_clk_enable(struct dp_power *dp_power,
+		enum dp_pm_type pm_type, bool enable)
+{
+	int rc = 0;
+	struct dp_power_private *power;
+
+	power = container_of(dp_power, struct dp_power_private, dp_power);
+
+	if (pm_type != DP_CORE_PM && pm_type != DP_CTRL_PM) {
+		DRM_ERROR("unsupported power module: %s\n",
+				dp_parser_pm_name(pm_type));
+		return -EINVAL;
+	}
+
+	if (enable) {
+		if (pm_type == DP_CORE_PM && dp_power->core_clks_on) {
+			DRM_DEBUG_DP("core clks already enabled\n");
+			return 0;
+		}
+
+		if (pm_type == DP_CTRL_PM && dp_power->link_clks_on) {
+			DRM_DEBUG_DP("links clks already enabled\n");
+			return 0;
+		}
+
+		if ((pm_type == DP_CTRL_PM) && (!dp_power->core_clks_on)) {
+			DRM_DEBUG_DP("Enable core clks before link clks\n");
+
+			rc = dp_power_clk_set_rate(power, DP_CORE_PM, enable);
+			if (rc) {
+				DRM_ERROR("fail to enable clks: %s. err=%d\n",
+					dp_parser_pm_name(DP_CORE_PM), rc);
+				return rc;
+			}
+			dp_power->core_clks_on = true;
+		}
+	}
+
+	rc = dp_power_clk_set_rate(power, pm_type, enable);
+	if (rc) {
+		DRM_ERROR("failed to '%s' clks for: %s. err=%d\n",
+			enable ? "enable" : "disable",
+			dp_parser_pm_name(pm_type), rc);
+			return rc;
+	}
+
+	if (pm_type == DP_CORE_PM)
+		dp_power->core_clks_on = enable;
+	else
+		dp_power->link_clks_on = enable;
+
+	DRM_DEBUG_DP("%s clocks for %s\n",
+			enable ? "enable" : "disable",
+			dp_parser_pm_name(pm_type));
+	DRM_DEBUG_DP("link_clks:%s core_clks:%s\n",
+		dp_power->link_clks_on ? "on" : "off",
+		dp_power->core_clks_on ? "on" : "off");
+
+	return 0;
+}
+
+int dp_power_client_init(struct dp_power *dp_power)
+{
+	int rc = 0;
+	struct dp_power_private *power;
+
+	if (!dp_power) {
+		DRM_ERROR("invalid power data\n");
+		return -EINVAL;
+	}
+
+	power = container_of(dp_power, struct dp_power_private, dp_power);
+
+	pm_runtime_enable(&power->pdev->dev);
+
+	rc = dp_power_regulator_init(power);
+	if (rc) {
+		DRM_ERROR("failed to init regulators %d\n", rc);
+		goto error;
+	}
+
+	rc = dp_power_clk_init(power);
+	if (rc) {
+		DRM_ERROR("failed to init clocks %d\n", rc);
+		goto error;
+	}
+	return 0;
+
+error:
+	pm_runtime_disable(&power->pdev->dev);
+	return rc;
+}
+
+void dp_power_client_deinit(struct dp_power *dp_power)
+{
+	struct dp_power_private *power;
+
+	if (!dp_power) {
+		DRM_ERROR("invalid power data\n");
+		return;
+	}
+
+	power = container_of(dp_power, struct dp_power_private, dp_power);
+
+	dp_power_clk_deinit(power);
+	pm_runtime_disable(&power->pdev->dev);
+
+}
+
+int dp_power_set_link_clk_parent(struct dp_power *dp_power)
+{
+	int rc = 0;
+	struct dp_power_private *power;
+	u32 num;
+	struct dss_clk *cfg;
+	char *name = "ctrl_link";
+
+	if (!dp_power) {
+		DRM_ERROR("invalid power data\n");
+		rc = -EINVAL;
+		goto exit;
+	}
+
+	power = container_of(dp_power, struct dp_power_private, dp_power);
+
+	num = power->parser->mp[DP_CTRL_PM].num_clk;
+	cfg = power->parser->mp[DP_CTRL_PM].clk_config;
+
+	while (num && strcmp(cfg->clk_name, name)) {
+		num--;
+		cfg++;
+	}
+
+exit:
+	return rc;
+}
+
+int dp_power_init(struct dp_power *dp_power, bool flip)
+{
+	int rc = 0;
+	struct dp_power_private *power = NULL;
+
+	if (!dp_power) {
+		DRM_ERROR("invalid power data\n");
+		return -EINVAL;
+	}
+
+	power = container_of(dp_power, struct dp_power_private, dp_power);
+
+	pm_runtime_get_sync(&power->pdev->dev);
+	rc = dp_power_regulator_enable(power);
+	if (rc) {
+		DRM_ERROR("failed to enable regulators, %d\n", rc);
+		goto exit;
+	}
+
+	rc = dp_power_clk_enable(dp_power, DP_CORE_PM, true);
+	if (rc) {
+		DRM_ERROR("failed to enable DP core clocks, %d\n", rc);
+		goto err_clk;
+	}
+
+	return 0;
+
+err_clk:
+	dp_power_regulator_disable(power);
+exit:
+	pm_runtime_put_sync(&power->pdev->dev);
+	return rc;
+}
+
+int dp_power_deinit(struct dp_power *dp_power)
+{
+	struct dp_power_private *power;
+
+	power = container_of(dp_power, struct dp_power_private, dp_power);
+
+	dp_power_clk_enable(dp_power, DP_CORE_PM, false);
+	dp_power_regulator_disable(power);
+	pm_runtime_put_sync(&power->pdev->dev);
+	return 0;
+}
+
+struct dp_power *dp_power_get(struct dp_parser *parser)
+{
+	struct dp_power_private *power;
+	struct dp_power *dp_power;
+
+	if (!parser) {
+		DRM_ERROR("invalid input\n");
+		return ERR_PTR(-EINVAL);
+	}
+
+	power = devm_kzalloc(&parser->pdev->dev, sizeof(*power), GFP_KERNEL);
+	if (!power)
+		return ERR_PTR(-ENOMEM);
+
+	power->parser = parser;
+	power->pdev = parser->pdev;
+
+	dp_power = &power->dp_power;
+
+	return dp_power;
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_power.h b/drivers/gpu/drm/msm/dp/dp_power.h
new file mode 100644
index 000000000000..ae55b78bf54a
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_power.h
@@ -0,0 +1,65 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2012-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DP_POWER_H_
+#define _DP_POWER_H_
+
+#include "dp_parser.h"
+
+/**
+ * sruct dp_power - DisplayPort's power related data
+ *
+ * @init: initializes the regulators/core clocks/GPIOs/pinctrl
+ * @deinit: turns off the regulators/core clocks/GPIOs/pinctrl
+ * @clk_enable: enable/disable the DP clocks
+ * @set_link_clk_parent: set the parent of DP link clock
+ * @set_pixel_clk_parent: set the parent of DP pixel clock
+ */
+struct dp_power {
+	bool core_clks_on;
+	bool link_clks_on;
+};
+
+int dp_power_init(struct dp_power *power, bool flip);
+int dp_power_deinit(struct dp_power *power);
+int dp_power_clk_enable(struct dp_power *power, enum dp_pm_type pm_type,
+				bool enable);
+int dp_power_set_link_clk_parent(struct dp_power *power);
+
+/**
+ * dp_power_client_init() - initialize clock and regulator modules
+ *
+ * @power: instance of power module
+ * return: 0 for success, error for failure.
+ *
+ * This API will configure the DisplayPort's clocks and regulator
+ * modules.
+ */
+int dp_power_client_init(struct dp_power *power);
+
+/**
+ * dp_power_clinet_deinit() - de-initialize clock and regulator modules
+ *
+ * @power: instance of power module
+ * return: 0 for success, error for failure.
+ *
+ * This API will de-initialize the DisplayPort's clocks and regulator
+ * modueles.
+ */
+void dp_power_client_deinit(struct dp_power *power);
+
+/**
+ * dp_power_get() - configure and get the DisplayPort power module data
+ *
+ * @parser: instance of parser module
+ * return: pointer to allocated power module data
+ *
+ * This API will configure the DisplayPort's power module and provides
+ * methods to be called by the client to configure the power related
+ * modueles.
+ */
+struct dp_power *dp_power_get(struct dp_parser *parser);
+
+#endif /* _DP_POWER_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
new file mode 100644
index 000000000000..67a2d040b221
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_reg.h
@@ -0,0 +1,490 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DP_REG_H_
+#define _DP_REG_H_
+
+/* DP_TX Registers */
+#define REG_DP_HW_VERSION			(0x00000000)
+
+#define REG_DP_SW_RESET				(0x00000010)
+#define DP_SW_RESET				(0x00000001)
+
+#define REG_DP_PHY_CTRL				(0x00000014)
+#define DP_PHY_CTRL_SW_RESET_PLL		(0x00000001)
+#define DP_PHY_CTRL_SW_RESET			(0x00000004)
+
+#define REG_DP_CLK_CTRL				(0x00000018)
+#define REG_DP_CLK_ACTIVE			(0x0000001C)
+#define REG_DP_INTR_STATUS			(0x00000020)
+#define REG_DP_INTR_STATUS2			(0x00000024)
+#define REG_DP_INTR_STATUS3			(0x00000028)
+
+#define REG_DP_DP_HPD_CTRL			(0x00000000)
+#define DP_DP_HPD_CTRL_HPD_EN			(0x00000001)
+
+#define REG_DP_DP_HPD_INT_STATUS		(0x00000004)
+
+#define REG_DP_DP_HPD_INT_ACK			(0x00000008)
+#define DP_DP_HPD_PLUG_INT_ACK			(0x00000001)
+#define DP_DP_IRQ_HPD_INT_ACK			(0x00000002)
+#define DP_DP_HPD_REPLUG_INT_ACK		(0x00000004)
+#define DP_DP_HPD_UNPLUG_INT_ACK		(0x00000008)
+
+#define REG_DP_DP_HPD_INT_MASK			(0x0000000C)
+#define DP_DP_HPD_PLUG_INT_MASK			(0x00000001)
+#define DP_DP_IRQ_HPD_INT_MASK			(0x00000002)
+#define DP_DP_HPD_REPLUG_INT_MASK		(0x00000004)
+#define DP_DP_HPD_UNPLUG_INT_MASK		(0x00000008)
+
+#define REG_DP_DP_HPD_REFTIMER			(0x00000018)
+#define REG_DP_DP_HPD_EVENT_TIME_0		(0x0000001C)
+#define REG_DP_DP_HPD_EVENT_TIME_1		(0x00000020)
+
+#define REG_DP_AUX_CTRL				(0x00000030)
+#define DP_AUX_CTRL_ENABLE			(0x00000001)
+#define DP_AUX_CTRL_RESET			(0x00000002)
+
+#define REG_DP_AUX_DATA				(0x00000034)
+#define DP_AUX_DATA_READ			(0x00000001)
+#define DP_AUX_DATA_WRITE			(0x00000000)
+#define DP_AUX_DATA_OFFSET			(0x00000008)
+#define DP_AUX_DATA_INDEX_OFFSET		(0x00000010)
+#define DP_AUX_DATA_MASK			(0x0000ff00)
+#define DP_AUX_DATA_INDEX_WRITE			(0x80000000)
+
+#define REG_DP_AUX_TRANS_CTRL			(0x00000038)
+#define DP_AUX_TRANS_CTRL_I2C			(0x00000100)
+#define DP_AUX_TRANS_CTRL_GO			(0x00000200)
+#define DP_AUX_TRANS_CTRL_NO_SEND_ADDR		(0x00000400)
+#define DP_AUX_TRANS_CTRL_NO_SEND_STOP		(0x00000800)
+
+#define REG_DP_TIMEOUT_COUNT			(0x0000003C)
+#define REG_DP_AUX_LIMITS			(0x00000040)
+#define REG_DP_AUX_STATUS			(0x00000044)
+
+#define DP_DPCD_CP_IRQ				(0x201)
+#define DP_DPCD_RXSTATUS			(0x69493)
+
+#define DP_INTERRUPT_TRANS_NUM			(0x000000A0)
+
+#define REG_DP_MAINLINK_CTRL			(0x00000000)
+#define DP_MAINLINK_CTRL_ENABLE			(0x00000001)
+#define DP_MAINLINK_CTRL_RESET			(0x00000002)
+#define DP_MAINLINK_FB_BOUNDARY_SEL		(0x02000000)
+
+#define REG_DP_STATE_CTRL			(0x00000004)
+#define DP_STATE_CTRL_LINK_TRAINING_PATTERN1	(0x00000001)
+#define DP_STATE_CTRL_LINK_TRAINING_PATTERN2	(0x00000002)
+#define DP_STATE_CTRL_LINK_TRAINING_PATTERN3	(0x00000004)
+#define DP_STATE_CTRL_LINK_TRAINING_PATTERN4	(0x00000008)
+#define DP_STATE_CTRL_LINK_SYMBOL_ERR_MEASURE	(0x00000010)
+#define DP_STATE_CTRL_LINK_PRBS7		(0x00000020)
+#define DP_STATE_CTRL_LINK_TEST_CUSTOM_PATTERN	(0x00000040)
+#define DP_STATE_CTRL_SEND_VIDEO		(0x00000080)
+#define DP_STATE_CTRL_PUSH_IDLE			(0x00000100)
+
+#define REG_DP_CONFIGURATION_CTRL		(0x00000008)
+#define DP_CONFIGURATION_CTRL_SYNC_ASYNC_CLK	(0x00000001)
+#define DP_CONFIGURATION_CTRL_STATIC_DYNAMIC_CN (0x00000002)
+#define DP_CONFIGURATION_CTRL_P_INTERLACED	(0x00000004)
+#define DP_CONFIGURATION_CTRL_INTERLACED_BTF	(0x00000008)
+#define DP_CONFIGURATION_CTRL_NUM_OF_LANES	(0x00000010)
+#define DP_CONFIGURATION_CTRL_ENHANCED_FRAMING	(0x00000040)
+#define DP_CONFIGURATION_CTRL_SEND_VSC		(0x00000080)
+#define DP_CONFIGURATION_CTRL_BPC		(0x00000100)
+#define DP_CONFIGURATION_CTRL_ASSR		(0x00000400)
+#define DP_CONFIGURATION_CTRL_RGB_YUV		(0x00000800)
+#define DP_CONFIGURATION_CTRL_LSCLK_DIV		(0x00002000)
+#define DP_CONFIGURATION_CTRL_NUM_OF_LANES_SHIFT	(0x04)
+#define DP_CONFIGURATION_CTRL_BPC_SHIFT		(0x08)
+#define DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT	(0x0D)
+
+#define REG_DP_SOFTWARE_MVID			(0x00000010)
+#define REG_DP_SOFTWARE_NVID			(0x00000018)
+#define REG_DP_TOTAL_HOR_VER			(0x0000001C)
+#define REG_DP_START_HOR_VER_FROM_SYNC		(0x00000020)
+#define REG_DP_HSYNC_VSYNC_WIDTH_POLARITY	(0x00000024)
+#define REG_DP_ACTIVE_HOR_VER			(0x00000028)
+
+#define REG_DP_MISC1_MISC0			(0x0000002C)
+#define DP_MISC0_SYNCHRONOUS_CLK		(0x00000001)
+#define DP_MISC0_COLORIMETRY_CFG_SHIFT		(0x00000001)
+#define DP_MISC0_TEST_BITS_DEPTH_SHIFT		(0x00000005)
+
+#define REG_DP_VALID_BOUNDARY			(0x00000030)
+#define REG_DP_VALID_BOUNDARY_2			(0x00000034)
+
+#define REG_DP_LOGICAL2PHYSICAL_LANE_MAPPING	(0x00000038)
+#define LANE0_MAPPING_SHIFT			(0x00000000)
+#define LANE1_MAPPING_SHIFT			(0x00000002)
+#define LANE2_MAPPING_SHIFT			(0x00000004)
+#define LANE3_MAPPING_SHIFT			(0x00000006)
+
+#define REG_DP_MAINLINK_READY			(0x00000040)
+#define DP_MAINLINK_READY_FOR_VIDEO		(0x00000001)
+#define DP_MAINLINK_READY_LINK_TRAINING_SHIFT	(0x00000003)
+
+#define REG_DP_MAINLINK_LEVELS			(0x00000044)
+#define DP_MAINLINK_SAFE_TO_EXIT_LEVEL_2	(0x00000002)
+
+
+#define REG_DP_TU				(0x0000004C)
+
+#define REG_DP_HBR2_COMPLIANCE_SCRAMBLER_RESET	(0x00000054)
+#define DP_HBR2_ERM_PATTERN			(0x00010000)
+
+#define REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG0	(0x000000C0)
+#define REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG1	(0x000000C4)
+#define REG_DP_TEST_80BIT_CUSTOM_PATTERN_REG2	(0x000000C8)
+
+#define MMSS_DP_MISC1_MISC0			(0x0000002C)
+#define MMSS_DP_AUDIO_TIMING_GEN		(0x00000080)
+#define MMSS_DP_AUDIO_TIMING_RBR_32		(0x00000084)
+#define MMSS_DP_AUDIO_TIMING_HBR_32		(0x00000088)
+#define MMSS_DP_AUDIO_TIMING_RBR_44		(0x0000008C)
+#define MMSS_DP_AUDIO_TIMING_HBR_44		(0x00000090)
+#define MMSS_DP_AUDIO_TIMING_RBR_48		(0x00000094)
+#define MMSS_DP_AUDIO_TIMING_HBR_48		(0x00000098)
+
+#define MMSS_DP_PSR_CRC_RG			(0x00000154)
+#define MMSS_DP_PSR_CRC_B			(0x00000158)
+
+#define REG_DP_COMPRESSION_MODE_CTRL		(0x00000180)
+
+#define MMSS_DP_AUDIO_CFG			(0x00000200)
+#define MMSS_DP_AUDIO_STATUS			(0x00000204)
+#define MMSS_DP_AUDIO_PKT_CTRL			(0x00000208)
+#define MMSS_DP_AUDIO_PKT_CTRL2			(0x0000020C)
+#define MMSS_DP_AUDIO_ACR_CTRL			(0x00000210)
+#define MMSS_DP_AUDIO_CTRL_RESET		(0x00000214)
+
+#define MMSS_DP_SDP_CFG				(0x00000228)
+#define MMSS_DP_SDP_CFG2			(0x0000022C)
+#define MMSS_DP_AUDIO_TIMESTAMP_0		(0x00000230)
+#define MMSS_DP_AUDIO_TIMESTAMP_1		(0x00000234)
+
+#define MMSS_DP_AUDIO_STREAM_0			(0x00000240)
+#define MMSS_DP_AUDIO_STREAM_1			(0x00000244)
+
+#define MMSS_DP_EXTENSION_0			(0x00000250)
+#define MMSS_DP_EXTENSION_1			(0x00000254)
+#define MMSS_DP_EXTENSION_2			(0x00000258)
+#define MMSS_DP_EXTENSION_3			(0x0000025C)
+#define MMSS_DP_EXTENSION_4			(0x00000260)
+#define MMSS_DP_EXTENSION_5			(0x00000264)
+#define MMSS_DP_EXTENSION_6			(0x00000268)
+#define MMSS_DP_EXTENSION_7			(0x0000026C)
+#define MMSS_DP_EXTENSION_8			(0x00000270)
+#define MMSS_DP_EXTENSION_9			(0x00000274)
+#define MMSS_DP_AUDIO_COPYMANAGEMENT_0		(0x00000278)
+#define MMSS_DP_AUDIO_COPYMANAGEMENT_1		(0x0000027C)
+#define MMSS_DP_AUDIO_COPYMANAGEMENT_2		(0x00000280)
+#define MMSS_DP_AUDIO_COPYMANAGEMENT_3		(0x00000284)
+#define MMSS_DP_AUDIO_COPYMANAGEMENT_4		(0x00000288)
+#define MMSS_DP_AUDIO_COPYMANAGEMENT_5		(0x0000028C)
+#define MMSS_DP_AUDIO_ISRC_0			(0x00000290)
+#define MMSS_DP_AUDIO_ISRC_1			(0x00000294)
+#define MMSS_DP_AUDIO_ISRC_2			(0x00000298)
+#define MMSS_DP_AUDIO_ISRC_3			(0x0000029C)
+#define MMSS_DP_AUDIO_ISRC_4			(0x000002A0)
+#define MMSS_DP_AUDIO_ISRC_5			(0x000002A4)
+#define MMSS_DP_AUDIO_INFOFRAME_0		(0x000002A8)
+#define MMSS_DP_AUDIO_INFOFRAME_1		(0x000002AC)
+#define MMSS_DP_AUDIO_INFOFRAME_2		(0x000002B0)
+
+#define MMSS_DP_GENERIC0_0			(0x00000300)
+#define MMSS_DP_GENERIC0_1			(0x00000304)
+#define MMSS_DP_GENERIC0_2			(0x00000308)
+#define MMSS_DP_GENERIC0_3			(0x0000030C)
+#define MMSS_DP_GENERIC0_4			(0x00000310)
+#define MMSS_DP_GENERIC0_5			(0x00000314)
+#define MMSS_DP_GENERIC0_6			(0x00000318)
+#define MMSS_DP_GENERIC0_7			(0x0000031C)
+#define MMSS_DP_GENERIC0_8			(0x00000320)
+#define MMSS_DP_GENERIC0_9			(0x00000324)
+#define MMSS_DP_GENERIC1_0			(0x00000328)
+#define MMSS_DP_GENERIC1_1			(0x0000032C)
+#define MMSS_DP_GENERIC1_2			(0x00000330)
+#define MMSS_DP_GENERIC1_3			(0x00000334)
+#define MMSS_DP_GENERIC1_4			(0x00000338)
+#define MMSS_DP_GENERIC1_5			(0x0000033C)
+#define MMSS_DP_GENERIC1_6			(0x00000340)
+#define MMSS_DP_GENERIC1_7			(0x00000344)
+#define MMSS_DP_GENERIC1_8			(0x00000348)
+#define MMSS_DP_GENERIC1_9			(0x0000034C)
+
+#define MMSS_DP_VSCEXT_0			(0x000002D0)
+#define MMSS_DP_VSCEXT_1			(0x000002D4)
+#define MMSS_DP_VSCEXT_2			(0x000002D8)
+#define MMSS_DP_VSCEXT_3			(0x000002DC)
+#define MMSS_DP_VSCEXT_4			(0x000002E0)
+#define MMSS_DP_VSCEXT_5			(0x000002E4)
+#define MMSS_DP_VSCEXT_6			(0x000002E8)
+#define MMSS_DP_VSCEXT_7			(0x000002EC)
+#define MMSS_DP_VSCEXT_8			(0x000002F0)
+#define MMSS_DP_VSCEXT_9			(0x000002F4)
+
+#define MMSS_DP_BIST_ENABLE			(0x00000000)
+#define DP_BIST_ENABLE_DPBIST_EN		(0x00000001)
+
+#define MMSS_DP_TIMING_ENGINE_EN		(0x00000010)
+#define DP_TIMING_ENGINE_EN_EN			(0x00000001)
+
+#define MMSS_DP_INTF_CONFIG			(0x00000014)
+#define MMSS_DP_INTF_HSYNC_CTL			(0x00000018)
+#define MMSS_DP_INTF_VSYNC_PERIOD_F0		(0x0000001C)
+#define MMSS_DP_INTF_VSYNC_PERIOD_F1		(0x00000020)
+#define MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F0	(0x00000024)
+#define MMSS_DP_INTF_VSYNC_PULSE_WIDTH_F1	(0x00000028)
+#define MMSS_INTF_DISPLAY_V_START_F0		(0x0000002C)
+#define MMSS_INTF_DISPLAY_V_START_F1		(0x00000030)
+#define MMSS_DP_INTF_DISPLAY_V_END_F0		(0x00000034)
+#define MMSS_DP_INTF_DISPLAY_V_END_F1		(0x00000038)
+#define MMSS_DP_INTF_ACTIVE_V_START_F0		(0x0000003C)
+#define MMSS_DP_INTF_ACTIVE_V_START_F1		(0x00000040)
+#define MMSS_DP_INTF_ACTIVE_V_END_F0		(0x00000044)
+#define MMSS_DP_INTF_ACTIVE_V_END_F1		(0x00000048)
+#define MMSS_DP_INTF_DISPLAY_HCTL		(0x0000004C)
+#define MMSS_DP_INTF_ACTIVE_HCTL		(0x00000050)
+#define MMSS_DP_INTF_POLARITY_CTL		(0x00000058)
+
+#define MMSS_DP_TPG_MAIN_CONTROL		(0x00000060)
+#define MMSS_DP_DSC_DTO				(0x0000007C)
+#define DP_TPG_CHECKERED_RECT_PATTERN		(0x00000100)
+
+#define MMSS_DP_TPG_VIDEO_CONFIG		(0x00000064)
+#define DP_TPG_VIDEO_CONFIG_BPP_8BIT		(0x00000001)
+#define DP_TPG_VIDEO_CONFIG_RGB			(0x00000004)
+
+#define MMSS_DP_ASYNC_FIFO_CONFIG		(0x00000088)
+
+/*DP PHY Register offsets */
+#define REG_DP_PHY_REVISION_ID0                 (0x00000000)
+#define REG_DP_PHY_REVISION_ID1                 (0x00000004)
+#define REG_DP_PHY_REVISION_ID2                 (0x00000008)
+#define REG_DP_PHY_REVISION_ID3                 (0x0000000C)
+
+#define REG_DP_PHY_CFG                          (0x00000010)
+
+#define REG_DP_PHY_PD_CTL                       (0x00000018)
+#define DP_PHY_PD_CTL_PWRDN                     (0x00000001)
+#define DP_PHY_PD_CTL_PSR_PWRDN			(0x00000002)
+#define DP_PHY_PD_CTL_AUX_PWRDN			(0x00000004)
+#define DP_PHY_PD_CTL_LANE_0_1_PWRDN		(0x00000008)
+#define DP_PHY_PD_CTL_LANE_2_3_PWRDN		(0x00000010)
+#define DP_PHY_PD_CTL_PLL_PWRDN			(0x00000020)
+#define DP_PHY_PD_CTL_DP_CLAMP_EN		(0x00000040)
+
+#define REG_DP_PHY_MODE                         (0x0000001C)
+
+#define REG_DP_PHY_AUX_CFG0                     (0x00000020)
+#define REG_DP_PHY_AUX_CFG1                     (0x00000024)
+#define REG_DP_PHY_AUX_CFG2                     (0x00000028)
+#define REG_DP_PHY_AUX_CFG3                     (0x0000002C)
+#define REG_DP_PHY_AUX_CFG4                     (0x00000030)
+#define REG_DP_PHY_AUX_CFG5                     (0x00000034)
+#define REG_DP_PHY_AUX_CFG6                     (0x00000038)
+#define REG_DP_PHY_AUX_CFG7                     (0x0000003C)
+#define REG_DP_PHY_AUX_CFG8                     (0x00000040)
+#define REG_DP_PHY_AUX_CFG9                     (0x00000044)
+
+#define REG_DP_PHY_AUX_INTERRUPT_MASK           (0x00000048)
+#define PHY_AUX_STOP_ERR_MASK                   (0x00000001)
+#define PHY_AUX_DEC_ERR_MASK                    (0x00000002)
+#define PHY_AUX_SYNC_ERR_MASK                   (0x00000004)
+#define PHY_AUX_ALIGN_ERR_MASK                  (0x00000008)
+#define PHY_AUX_REQ_ERR_MASK                    (0x00000010)
+
+
+#define REG_DP_PHY_AUX_INTERRUPT_CLEAR          (0x0000004C)
+#define REG_DP_PHY_AUX_BIST_CFG			(0x00000050)
+#define REG_DP_PHY_AUX_INTERRUPT_STATUS         (0x000000BC)
+
+#define REG_DP_PHY_VCO_DIV			0x0064
+#define REG_DP_PHY_TX0_TX1_LANE_CTL		0x006C
+#define REG_DP_PHY_TX2_TX3_LANE_CTL		0x0088
+
+#define REG_DP_PHY_SPARE0			(0x00AC)
+#define DP_PHY_SPARE0_MASK			(0x000F)
+#define DP_PHY_SPARE0_ORIENTATION_INFO_SHIFT	(0x0004)
+
+#define REG_DP_PHY_STATUS			(0x00C0)
+
+/* Tx registers */
+#define REG_DP_PHY_TXn_BIST_MODE_LANENO		0x0000
+#define REG_DP_PHY_TXn_CLKBUF_ENABLE		0x0008
+
+#define REG_DP_PHY_TXn_TX_EMP_POST1_LVL		0x000C
+#define DP_PHY_TXn_TX_EMP_POST1_LVL_MASK	0x001F
+#define DP_PHY_TXn_TX_EMP_POST1_LVL_MUX_EN	0x0020
+
+#define REG_DP_PHY_TXn_TX_DRV_LVL		0x001C
+#define DP_PHY_TXn_TX_DRV_LVL_MASK		0x001F
+#define DP_PHY_TXn_TX_DRV_LVL_MUX_EN		0x0020
+
+#define REG_DP_PHY_TXn_RESET_TSYNC_EN		0x0024
+#define REG_DP_PHY_TXn_PRE_STALL_LDO_BOOST_EN	0x0028
+#define REG_DP_PHY_TXn_TX_BAND			0x002C
+#define REG_DP_PHY_TXn_SLEW_CNTL		0x0030
+#define REG_DP_PHY_TXn_INTERFACE_SELECT		0x0034
+
+#define REG_DP_PHY_TXn_RES_CODE_LANE_TX		0x003C
+#define REG_DP_PHY_TXn_RES_CODE_LANE_RX		0x0040
+#define REG_DP_PHY_TXn_RES_CODE_LANE_OFFSET_TX	0x0044
+#define REG_DP_PHY_TXn_RES_CODE_LANE_OFFSET_RX	0x0048
+
+#define REG_DP_PHY_TXn_DEBUG_BUS_SEL		0x0058
+#define REG_DP_PHY_TXn_TRANSCEIVER_BIAS_EN	0x005C
+#define REG_DP_PHY_TXn_HIGHZ_DRVR_EN		0x0060
+#define REG_DP_PHY_TXn_TX_POL_INV		0x0064
+#define REG_DP_PHY_TXn_PARRATE_REC_DETECT_IDLE_EN 0x0068
+
+#define REG_DP_PHY_TXn_LANE_MODE_1		0x008C
+
+#define REG_DP_PHY_TXn_TRAN_DRVR_EMP_EN		0x00C0
+#define REG_DP_PHY_TXn_TX_INTERFACE_MODE	0x00C4
+
+#define REG_DP_PHY_TXn_VMODE_CTRL1		0x00F0
+
+/* PLL register offset */
+#define QSERDES_COM_ATB_SEL1			0x0000
+#define QSERDES_COM_ATB_SEL2			0x0004
+#define QSERDES_COM_FREQ_UPDATE			0x0008
+#define QSERDES_COM_BG_TIMER			0x000C
+#define QSERDES_COM_SSC_EN_CENTER		0x0010
+#define QSERDES_COM_SSC_ADJ_PER1		0x0014
+#define QSERDES_COM_SSC_ADJ_PER2		0x0018
+#define QSERDES_COM_SSC_PER1			0x001C
+#define QSERDES_COM_SSC_PER2			0x0020
+#define QSERDES_COM_SSC_STEP_SIZE1		0x0024
+#define QSERDES_COM_SSC_STEP_SIZE2		0x0028
+#define QSERDES_COM_POST_DIV			0x002C
+#define QSERDES_COM_POST_DIV_MUX		0x0030
+
+#define QSERDES_COM_BIAS_EN_CLKBUFLR_EN		0x0034
+#define QSERDES_COM_BIAS_EN			0x0001
+#define QSERDES_COM_BIAS_EN_MUX			0x0002
+#define QSERDES_COM_CLKBUF_R_EN			0x0004
+#define QSERDES_COM_CLKBUF_L_EN			0x0008
+#define QSERDES_COM_EN_SYSCLK_TX_SEL		0x0010
+#define QSERDES_COM_CLKBUF_RX_DRIVE_L		0x0020
+#define QSERDES_COM_CLKBUF_RX_DRIVE_R		0x0040
+
+#define QSERDES_COM_CLK_ENABLE1			0x0038
+#define QSERDES_COM_SYS_CLK_CTRL		0x003C
+#define QSERDES_COM_SYSCLK_BUF_ENABLE		0x0040
+#define QSERDES_COM_PLL_EN			0x0044
+#define QSERDES_COM_PLL_IVCO			0x0048
+#define QSERDES_COM_CMN_IETRIM			0x004C
+#define QSERDES_COM_CMN_IPTRIM			0x0050
+
+#define QSERDES_COM_CP_CTRL_MODE0		0x0060
+#define QSERDES_COM_CP_CTRL_MODE1		0x0064
+#define QSERDES_COM_PLL_RCTRL_MODE0		0x0068
+#define QSERDES_COM_PLL_RCTRL_MODE1		0x006C
+#define QSERDES_COM_PLL_CCTRL_MODE0		0x0070
+#define QSERDES_COM_PLL_CCTRL_MODE1		0x0074
+#define QSERDES_COM_PLL_CNTRL			0x0078
+#define QSERDES_COM_BIAS_EN_CTRL_BY_PSM		0x007C
+#define QSERDES_COM_SYSCLK_EN_SEL		0x0080
+#define QSERDES_COM_CML_SYSCLK_SEL		0x0084
+#define QSERDES_COM_RESETSM_CNTRL		0x0088
+#define QSERDES_COM_RESETSM_CNTRL2		0x008C
+#define QSERDES_COM_LOCK_CMP_EN			0x0090
+#define QSERDES_COM_LOCK_CMP_CFG		0x0094
+#define QSERDES_COM_LOCK_CMP1_MODE0		0x0098
+#define QSERDES_COM_LOCK_CMP2_MODE0		0x009C
+#define QSERDES_COM_LOCK_CMP3_MODE0		0x00A0
+
+#define QSERDES_COM_DEC_START_MODE0		0x00B0
+#define QSERDES_COM_DEC_START_MODE1		0x00B4
+#define QSERDES_COM_DIV_FRAC_START1_MODE0	0x00B8
+#define QSERDES_COM_DIV_FRAC_START2_MODE0	0x00BC
+#define QSERDES_COM_DIV_FRAC_START3_MODE0	0x00C0
+#define QSERDES_COM_DIV_FRAC_START1_MODE1	0x00C4
+#define QSERDES_COM_DIV_FRAC_START2_MODE1	0x00C8
+#define QSERDES_COM_DIV_FRAC_START3_MODE1	0x00CC
+#define QSERDES_COM_INTEGLOOP_INITVAL		0x00D0
+#define QSERDES_COM_INTEGLOOP_EN		0x00D4
+#define QSERDES_COM_INTEGLOOP_GAIN0_MODE0	0x00D8
+#define QSERDES_COM_INTEGLOOP_GAIN1_MODE0	0x00DC
+#define QSERDES_COM_INTEGLOOP_GAIN0_MODE1	0x00E0
+#define QSERDES_COM_INTEGLOOP_GAIN1_MODE1	0x00E4
+#define QSERDES_COM_VCOCAL_DEADMAN_CTRL		0x00E8
+#define QSERDES_COM_VCO_TUNE_CTRL		0x00EC
+#define QSERDES_COM_VCO_TUNE_MAP		0x00F0
+
+#define QSERDES_COM_CMN_STATUS			0x0124
+#define QSERDES_COM_RESET_SM_STATUS		0x0128
+
+#define QSERDES_COM_CLK_SEL			0x0138
+#define QSERDES_COM_HSCLK_SEL			0x013C
+
+#define QSERDES_COM_CORECLK_DIV_MODE0		0x0148
+
+#define QSERDES_COM_SW_RESET			0x0150
+#define QSERDES_COM_CORE_CLK_EN			0x0154
+#define QSERDES_COM_C_READY_STATUS		0x0158
+#define QSERDES_COM_CMN_CONFIG			0x015C
+
+#define QSERDES_COM_SVS_MODE_CLK_SEL		0x0164
+
+/* DP MMSS_CC registers */
+#define MMSS_DP_LINK_CMD_RCGR			(0x0138)
+#define MMSS_DP_LINK_CFG_RCGR			(0x013C)
+#define MMSS_DP_PIXEL_M				(0x01B4)
+#define MMSS_DP_PIXEL_N				(0x01B8)
+
+/* DP HDCP 1.3 registers */
+#define DP_HDCP_CTRL                                   (0x0A0)
+#define DP_HDCP_STATUS                                 (0x0A4)
+#define DP_HDCP_SW_UPPER_AKSV                          (0x098)
+#define DP_HDCP_SW_LOWER_AKSV                          (0x09C)
+#define DP_HDCP_ENTROPY_CTRL0                          (0x350)
+#define DP_HDCP_ENTROPY_CTRL1                          (0x35C)
+#define DP_HDCP_SHA_STATUS                             (0x0C8)
+#define DP_HDCP_RCVPORT_DATA2_0                        (0x0B0)
+#define DP_HDCP_RCVPORT_DATA3                          (0x0A4)
+#define DP_HDCP_RCVPORT_DATA4                          (0x0A8)
+#define DP_HDCP_RCVPORT_DATA5                          (0x0C0)
+#define DP_HDCP_RCVPORT_DATA6                          (0x0C4)
+
+#define HDCP_SEC_DP_TZ_HV_HLOS_HDCP_SHA_CTRL           (0x024)
+#define HDCP_SEC_DP_TZ_HV_HLOS_HDCP_SHA_DATA           (0x028)
+#define HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA0      (0x004)
+#define HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA1      (0x008)
+#define HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA7      (0x00C)
+#define HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA8      (0x010)
+#define HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA9      (0x014)
+#define HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA10     (0x018)
+#define HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA11     (0x01C)
+#define HDCP_SEC_DP_TZ_HV_HLOS_HDCP_RCVPORT_DATA12     (0x020)
+
+/* USB3 DP COM registers */
+#define REG_USB3_DP_COM_RESET_OVRD_CTRL			(0x1C)
+#define USB3_DP_COM_OVRD_CTRL_SW_DPPHY_RESET		(0x01)
+#define USB3_DP_COM_OVRD_CTRL_SW_DPPHY_RESET_MUX	(0x02)
+#define USB3_DP_COM_OVRD_CTRL_SW_USB3PHY_RESET		(0x04)
+#define USB3_DP_COM_OVRD_CTRL_SW_USB3PHY_RESET_MUX	(0x08)
+
+#define REG_USB3_DP_COM_PHY_MODE_CTRL			(0x00)
+#define USB3_DP_COM_PHY_MODE_DP				(0x03)
+
+#define REG_USB3_DP_COM_SW_RESET			(0x04)
+#define USB3_DP_COM_SW_RESET_SET			(0x01)
+
+#define REG_USB3_DP_COM_TYPEC_CTRL			(0x10)
+#define USB3_DP_COM_TYPEC_CTRL_PORTSEL			(0x01)
+#define USB3_DP_COM_TYPEC_CTRL_PORTSEL_MUX		(0x02)
+
+#define REG_USB3_DP_COM_SWI_CTRL			(0x0c)
+
+#define REG_USB3_DP_COM_POWER_DOWN_CTRL			(0x08)
+#define USB3_DP_COM_POWER_DOWN_CTRL_SW_PWRDN		(0x01)
+
+
+
+#endif /* _DP_REG_H_ */
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7d641c7e3514..1e793c0357bb 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1350,6 +1350,7 @@ static int __init msm_drm_register(void)
 	msm_dsi_register();
 	msm_edp_register();
 	msm_hdmi_register();
+	msm_dp_register();
 	adreno_register();
 	return platform_driver_register(&msm_platform_driver);
 }
@@ -1358,6 +1359,7 @@ static void __exit msm_drm_unregister(void)
 {
 	DBG("fini");
 	platform_driver_unregister(&msm_platform_driver);
+	msm_dp_unregister();
 	msm_hdmi_unregister();
 	adreno_unregister();
 	msm_edp_unregister();
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index af259b0573ea..9360331a8f39 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -159,6 +159,8 @@ struct msm_drm_private {
 	/* DSI is shared by mdp4 and mdp5 */
 	struct msm_dsi *dsi[2];
 
+	struct msm_dp *dp;
+
 	/* when we have more than one 'msm_gpu' these need to be an array: */
 	struct msm_gpu *gpu;
 	struct msm_file_private *lastctx;
@@ -378,6 +380,49 @@ static inline int msm_dsi_modeset_init(struct msm_dsi *msm_dsi,
 }
 #endif
 
+#ifdef CONFIG_DRM_MSM_DP
+int __init msm_dp_register(void);
+void __exit msm_dp_unregister(void);
+int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
+			 struct drm_encoder *encoder);
+int msm_dp_display_enable(struct msm_dp *dp, struct drm_encoder *encoder);
+int msm_dp_display_disable(struct msm_dp *dp, struct drm_encoder *encoder);
+void msm_dp_display_mode_set(struct msm_dp *dp, struct drm_encoder *encoder,
+				struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode);
+
+#else
+static inline int __init msm_dp_register(void)
+{
+	return -EINVAL;
+}
+static inline void __exit msm_dp_unregister(void)
+{
+}
+static inline int msm_dp_modeset_init(struct msm_dp *dp_display,
+				       struct drm_device *dev,
+				       struct drm_encoder *encoder)
+{
+	return -EINVAL;
+}
+static inline int msm_dp_display_enable(struct msm_dp *dp,
+					struct drm_encoder *encoder)
+{
+	return -EINVAL;
+}
+static inline int msm_dp_display_disable(struct msm_dp *dp,
+					struct drm_encoder *encoder)
+{
+	return -EINVAL;
+}
+static inline void msm_dp_display_mode_set(struct msm_dp *dp,
+				struct drm_encoder *encoder,
+				struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode)
+{
+}
+#endif
+
 void __init msm_mdp_register(void);
 void __exit msm_mdp_unregister(void);
 void __init msm_dpu_register(void);
@@ -398,8 +443,9 @@ void msm_perf_debugfs_cleanup(struct msm_drm_private *priv);
 #else
 static inline int msm_debugfs_late_init(struct drm_device *dev) { return 0; }
 __printf(3, 4)
-static inline void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
-		const char *fmt, ...) {}
+static inline void msm_rd_dump_submit(struct msm_rd_state *rd,
+			struct msm_gem_submit *submit,
+			const char *fmt, ...) {}
 static inline void msm_rd_debugfs_cleanup(struct msm_drm_private *priv) {}
 static inline void msm_perf_debugfs_cleanup(struct msm_drm_private *priv) {}
 #endif
@@ -419,7 +465,8 @@ struct msm_gpu_submitqueue;
 int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx);
 struct msm_gpu_submitqueue *msm_submitqueue_get(struct msm_file_private *ctx,
 		u32 id);
-int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
+int msm_submitqueue_create(struct drm_device *drm,
+		struct msm_file_private *ctx,
 		u32 prio, u32 flags, u32 *id);
 int msm_submitqueue_query(struct drm_device *drm, struct msm_file_private *ctx,
 		struct drm_msm_submitqueue_query *args);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
