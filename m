Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 328DB2F462D
	for <lists+dri-devel@lfdr.de>; Wed, 13 Jan 2021 09:22:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803DA6E0F8;
	Wed, 13 Jan 2021 08:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0836789F19;
 Tue, 12 Jan 2021 19:26:50 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 6E4A83EB31;
 Tue, 12 Jan 2021 20:26:48 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 5/7] drm/msm/dpu: Disable autorefresh in command mode
Date: Tue, 12 Jan 2021 20:26:30 +0100
Message-Id: <20210112192632.502897-6-angelogioacchino.delregno@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210112192632.502897-1-angelogioacchino.delregno@somainline.org>
References: <20210112192632.502897-1-angelogioacchino.delregno@somainline.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 13 Jan 2021 08:21:20 +0000
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
Cc: freedreno@lists.freedesktop.org, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 martin.botka@somainline.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 marijn.suijten@somainline.org, phone-devel@vger.kernel.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When a command mode display is used, it may be retaining the bootloader
configuration which, in most of the cases, enables the autorefresh
feature in order to keep the splash up.

Since there is no autorefresh management in this driver, wire up the
autorefresh ops in the dpu_hw_pingpong and disable the feature when
preparing for cmd commit: instead of disabling it when initializing
the command mode, this road was chosen as to open future possibility
of enabling and managing the autorefresh feature in the driver.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 68 +++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 26 +++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 14 ++++
 3 files changed, 108 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 5a056c1191df..4d3481baaead 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -4,8 +4,10 @@
  */
 
 #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
+#include <linux/delay.h>
 #include "dpu_encoder_phys.h"
 #include "dpu_hw_interrupts.h"
+#include "dpu_hw_pingpong.h"
 #include "dpu_core_irq.h"
 #include "dpu_formats.h"
 #include "dpu_trace.h"
@@ -35,6 +37,8 @@
 
 #define DPU_ENC_WR_PTR_START_TIMEOUT_US 20000
 
+#define DPU_ENC_MAX_POLL_TIMEOUT_US	2000
+
 static bool dpu_encoder_phys_cmd_is_master(struct dpu_encoder_phys *phys_enc)
 {
 	return (phys_enc->split_role != ENC_ROLE_SLAVE) ? true : false;
@@ -580,6 +584,69 @@ static void dpu_encoder_phys_cmd_prepare_for_kickoff(
 			atomic_read(&phys_enc->pending_kickoff_cnt));
 }
 
+static bool dpu_encoder_phys_cmd_is_ongoing_pptx(
+		struct dpu_encoder_phys *phys_enc)
+{
+	struct dpu_hw_pp_vsync_info info;
+
+	if (!phys_enc)
+		return false;
+
+	phys_enc->hw_pp->ops.get_vsync_info(phys_enc->hw_pp, &info);
+	if (info.wr_ptr_line_count > 0 &&
+	    info.wr_ptr_line_count < phys_enc->cached_mode.vdisplay)
+		return true;
+
+	return false;
+}
+
+static void dpu_encoder_phys_cmd_prepare_commit(
+		struct dpu_encoder_phys *phys_enc)
+{
+	struct dpu_encoder_phys_cmd *cmd_enc =
+		to_dpu_encoder_phys_cmd(phys_enc);
+	int trial = 0;
+
+	if (!phys_enc)
+		return;
+	if (!phys_enc->hw_pp)
+		return;
+	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
+		return;
+
+	/* If autorefresh is already disabled, we have nothing to do */
+	if (!phys_enc->hw_pp->ops.get_autorefresh(phys_enc->hw_pp, NULL))
+		return;
+
+	/*
+	 * If autorefresh is enabled, disable it and make sure it is safe to
+	 * proceed with current frame commit/push. Sequence fallowed is,
+	 * 1. Disable TE
+	 * 2. Disable autorefresh config
+	 * 4. Poll for frame transfer ongoing to be false
+	 * 5. Enable TE back
+	 */
+	_dpu_encoder_phys_cmd_connect_te(phys_enc, false);
+	phys_enc->hw_pp->ops.setup_autorefresh(phys_enc->hw_pp, 0, false);
+
+	do {
+		udelay(DPU_ENC_MAX_POLL_TIMEOUT_US);
+		if ((trial * DPU_ENC_MAX_POLL_TIMEOUT_US)
+				> (KICKOFF_TIMEOUT_MS * USEC_PER_MSEC)) {
+			DPU_ERROR_CMDENC(cmd_enc,
+					"disable autorefresh failed\n");
+			break;
+		}
+
+		trial++;
+	} while (dpu_encoder_phys_cmd_is_ongoing_pptx(phys_enc));
+
+	_dpu_encoder_phys_cmd_connect_te(phys_enc, true);
+
+	DPU_DEBUG_CMDENC(to_dpu_encoder_phys_cmd(phys_enc),
+			 "disabled autorefresh\n");
+}
+
 static int _dpu_encoder_phys_cmd_wait_for_ctl_start(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -681,6 +748,7 @@ static void dpu_encoder_phys_cmd_trigger_start(
 static void dpu_encoder_phys_cmd_init_ops(
 		struct dpu_encoder_phys_ops *ops)
 {
+	ops->prepare_commit = dpu_encoder_phys_cmd_prepare_commit;
 	ops->is_master = dpu_encoder_phys_cmd_is_master;
 	ops->mode_set = dpu_encoder_phys_cmd_mode_set;
 	ops->mode_fixup = dpu_encoder_phys_cmd_mode_fixup;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index bea4ab5c58c5..245a7a62b5c6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -23,6 +23,7 @@
 #define PP_WR_PTR_IRQ                   0x024
 #define PP_OUT_LINE_COUNT               0x028
 #define PP_LINE_COUNT                   0x02C
+#define PP_AUTOREFRESH_CONFIG           0x030
 
 #define PP_FBC_MODE                     0x034
 #define PP_FBC_BUDGET_CTL               0x038
@@ -120,6 +121,29 @@ static int dpu_hw_pp_setup_te_config(struct dpu_hw_pingpong *pp,
 	return 0;
 }
 
+static void dpu_hw_pp_setup_autorefresh_config(struct dpu_hw_pingpong *pp,
+					       u32 frame_count, bool enable)
+{
+	DPU_REG_WRITE(&pp->hw, PP_AUTOREFRESH_CONFIG,
+		      enable ? (BIT(31) | frame_count) : 0);
+}
+
+/*
+ * dpu_hw_pp_get_autorefresh_config - Get autorefresh config from HW
+ * @pp:          DPU pingpong structure
+ * @frame_count: Used to return the current frame count from hw
+ *
+ * Returns: True if autorefresh enabled, false if disabled.
+ */
+static bool dpu_hw_pp_get_autorefresh_config(struct dpu_hw_pingpong *pp,
+					     u32 *frame_count)
+{
+	u32 val = DPU_REG_READ(&pp->hw, PP_AUTOREFRESH_CONFIG);
+	if (frame_count != NULL)
+		*frame_count = val & 0xffff;
+	return !!((val & BIT(31)) >> 31);
+}
+
 static int dpu_hw_pp_poll_timeout_wr_ptr(struct dpu_hw_pingpong *pp,
 		u32 timeout_us)
 {
@@ -228,6 +252,8 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
 	c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
 	c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
 	c->ops.get_vsync_info = dpu_hw_pp_get_vsync_info;
+	c->ops.setup_autorefresh = dpu_hw_pp_setup_autorefresh_config;
+	c->ops.get_autorefresh = dpu_hw_pp_get_autorefresh_config;
 	c->ops.poll_timeout_wr_ptr = dpu_hw_pp_poll_timeout_wr_ptr;
 	c->ops.get_line_count = dpu_hw_pp_get_line_count;
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
index 6902b9b95c8e..845b9ce80e31 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
@@ -63,6 +63,8 @@ struct dpu_hw_dither_cfg {
  *  @setup_tearcheck : program tear check values
  *  @enable_tearcheck : enables tear check
  *  @get_vsync_info : retries timing info of the panel
+ *  @setup_autorefresh : configure and enable the autorefresh config
+ *  @get_autorefresh : retrieve autorefresh config from hardware
  *  @setup_dither : function to program the dither hw block
  *  @get_line_count: obtain current vertical line counter
  */
@@ -94,6 +96,18 @@ struct dpu_hw_pingpong_ops {
 	int (*get_vsync_info)(struct dpu_hw_pingpong *pp,
 			struct dpu_hw_pp_vsync_info  *info);
 
+	/**
+	 * configure and enable the autorefresh config
+	 */
+	void (*setup_autorefresh)(struct dpu_hw_pingpong *pp,
+				  u32 frame_count, bool enable);
+
+	/**
+	 * retrieve autorefresh config from hardware
+	 */
+	bool (*get_autorefresh)(struct dpu_hw_pingpong *pp,
+				u32 *frame_count);
+
 	/**
 	 * poll until write pointer transmission starts
 	 * @Return: 0 on success, -ETIMEDOUT on timeout
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
