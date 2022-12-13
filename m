Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7188564C07B
	for <lists+dri-devel@lfdr.de>; Wed, 14 Dec 2022 00:23:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA7C910E388;
	Tue, 13 Dec 2022 23:23:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m-r1.th.seeweb.it (m-r1.th.seeweb.it [5.144.164.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F13110E385;
 Tue, 13 Dec 2022 23:22:56 +0000 (UTC)
Received: from localhost.localdomain (94-209-172-39.cable.dynamic.v4.ziggo.nl
 [94.209.172.39])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 54CCF200AC;
 Wed, 14 Dec 2022 00:22:24 +0100 (CET)
From: Marijn Suijten <marijn.suijten@somainline.org>
To: phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Vinod Koul <vkoul@kernel.org>
Subject: [RFC PATCH 1/6] drm/msm/dpu1: Implement DSC binding to PP block for
 CTL V1
Date: Wed, 14 Dec 2022 00:22:02 +0100
Message-Id: <20221213232207.113607-2-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221213232207.113607-1-marijn.suijten@somainline.org>
References: <20221213232207.113607-1-marijn.suijten@somainline.org>
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
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Haowen Bai <baihaowen@meizu.com>,
 Sam Ravnborg <sam@ravnborg.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Jani Nikula <jani.nikula@intel.com>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 Loic Poulain <loic.poulain@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, sunliming <sunliming@kylinos.cn>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All V1 CTL blocks (active CTLs) explicitly bind the pixel output from a
DSC block to a PINGPONG block by setting the PINGPONG idx in a DSC
hardware register.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  3 +++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  9 +++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    | 27 +++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    |  4 +++
 4 files changed, 43 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 9c6817b5a194..c17ac85eb447 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1830,6 +1830,9 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_dsc *hw_dsc,
 	if (hw_pp->ops.setup_dsc)
 		hw_pp->ops.setup_dsc(hw_pp);
 
+	if (hw_dsc->ops.dsc_bind_pingpong_blk)
+		hw_dsc->ops.dsc_bind_pingpong_blk(hw_dsc, true, hw_pp->idx);
+
 	if (hw_pp->ops.enable_dsc)
 		hw_pp->ops.enable_dsc(hw_pp);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index c160dae95a69..96f849907aa2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -268,6 +268,15 @@ enum {
 	DPU_VBIF_MAX
 };
 
+/**
+ * DSC features
+ * @DPU_DSC_OUTPUT_CTRL       Configure which PINGPONG block gets
+ *                            the pixel output from this DSC.
+ */
+enum {
+	DPU_DSC_OUTPUT_CTRL = 0x1,
+};
+
 /**
  * MACRO DPU_HW_BLK_INFO - information of HW blocks inside DPU
  * @name:              string name for debug purposes
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index 3662df698dae..619926da1441 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -29,6 +29,8 @@
 #define DSC_RANGE_MAX_QP                0x0B0
 #define DSC_RANGE_BPG_OFFSET            0x0EC
 
+#define DSC_CTL(m) (0x1800 - 0x3FC * (m - DSC_0))
+
 static void dpu_hw_dsc_disable(struct dpu_hw_dsc *dsc)
 {
 	struct dpu_hw_blk_reg_map *c = &dsc->hw;
@@ -150,6 +152,29 @@ static void dpu_hw_dsc_config_thresh(struct dpu_hw_dsc *hw_dsc,
 	}
 }
 
+static void dpu_hw_dsc_bind_pingpong_blk(
+		struct dpu_hw_dsc *hw_dsc,
+		bool enable,
+		const enum dpu_pingpong pp)
+{
+	struct dpu_hw_blk_reg_map *c = &hw_dsc->hw;
+	int mux_cfg = 0xF;
+	u32 dsc_ctl_offset;
+
+	dsc_ctl_offset = DSC_CTL(hw_dsc->idx);
+
+	if (enable)
+		mux_cfg = (pp - PINGPONG_0) & 0x7;
+
+	DRM_DEBUG_KMS("%s dsc:%d %s pp:%d\n",
+			enable ? "Binding" : "Unbinding",
+			hw_dsc->idx - DSC_0,
+			enable ? "to" : "from",
+			pp - PINGPONG_0);
+
+	DPU_REG_WRITE(c, dsc_ctl_offset, mux_cfg);
+}
+
 static struct dpu_dsc_cfg *_dsc_offset(enum dpu_dsc dsc,
 				       const struct dpu_mdss_cfg *m,
 				       void __iomem *addr,
@@ -174,6 +199,8 @@ static void _setup_dsc_ops(struct dpu_hw_dsc_ops *ops,
 	ops->dsc_disable = dpu_hw_dsc_disable;
 	ops->dsc_config = dpu_hw_dsc_config;
 	ops->dsc_config_thresh = dpu_hw_dsc_config_thresh;
+	if (cap & BIT(DPU_DSC_OUTPUT_CTRL))
+		ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
 };
 
 struct dpu_hw_dsc *dpu_hw_dsc_init(enum dpu_dsc idx, void __iomem *addr,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
index c0b77fe1a696..ae9b5db53d7f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
@@ -42,6 +42,10 @@ struct dpu_hw_dsc_ops {
 	 */
 	void (*dsc_config_thresh)(struct dpu_hw_dsc *hw_dsc,
 				  struct drm_dsc_config *dsc);
+
+	void (*dsc_bind_pingpong_blk)(struct dpu_hw_dsc *hw_dsc,
+				  bool enable,
+				  enum dpu_pingpong pp);
 };
 
 struct dpu_hw_dsc {
-- 
2.38.1

