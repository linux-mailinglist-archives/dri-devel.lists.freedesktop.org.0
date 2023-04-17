Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B37246E51B2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 22:22:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A9310E5EC;
	Mon, 17 Apr 2023 20:22:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay06.th.seeweb.it (relay06.th.seeweb.it [5.144.164.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E064D10E5E8
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Apr 2023 20:21:55 +0000 (UTC)
Received: from Marijn-Arch-PC.localdomain
 (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id B1B5C3F99B;
 Mon, 17 Apr 2023 22:21:53 +0200 (CEST)
From: Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon, 17 Apr 2023 22:21:51 +0200
Subject: [PATCH v2 12/17] drm/msm/dpu: Move
 dpu_hw_{tear_check,pp_vsync_info} to dpu_hw_mdss.h
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-dpu-intf-te-v2-12-ef76c877eb97@somainline.org>
References: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
In-Reply-To: <20230411-dpu-intf-te-v2-0-ef76c877eb97@somainline.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Adam Skladowski <a39.skl@gmail.com>, Loic Poulain <loic.poulain@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Robert Foss <rfoss@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Rajesh Yadav <ryadav@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>
X-Mailer: b4 0.12.2
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
Cc: Archit Taneja <architt@codeaurora.org>,
 Jami Kettunen <jami.kettunen@somainline.org>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org,
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Konrad Dybcio <konrad.dybcio@somainline.org>

Now that newer SoCs since DPU 5.0.0 manage tearcheck in the INTF instead
of PINGPONG block, move the struct definition to a common file. Also,
bring in documentation from msm-4.19 techpack while at it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
[Marijn: Also move dpu_hw_pp_vsync_info]
Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h     | 46 +++++++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h | 22 ------------
 2 files changed, 46 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 2d9192a6ce00..6ed12fd0505b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -463,4 +463,50 @@ struct dpu_mdss_color {
 #define DPU_DBG_MASK_DSPP     (1 << 10)
 #define DPU_DBG_MASK_DSC      (1 << 11)
 
+/**
+ * struct dpu_hw_tear_check - Struct contains parameters to configure
+ * tear-effect module. This structure is used to configure tear-check
+ * logic present either in ping-pong or in interface module.
+ * @vsync_count:        Ratio of MDP VSYNC clk freq(Hz) to refresh rate divided
+ *                      by no of lines
+ * @sync_cfg_height:    Total vertical lines (display height - 1)
+ * @vsync_init_val:     Init value to which the read pointer gets loaded at
+ *                      vsync edge
+ * @sync_threshold_start:    Read pointer threshold start ROI for write operation
+ * @sync_threshold_continue: The minimum number of lines the write pointer
+ *                           needs to be above the read pointer
+ * @start_pos:          The position from which the start_threshold value is added
+ * @rd_ptr_irq:         The read pointer line at which interrupt has to be generated
+ * @hw_vsync_mode:      Sync with external frame sync input
+ */
+struct dpu_hw_tear_check {
+	/*
+	 * This is ratio of MDP VSYNC clk freq(Hz) to
+	 * refresh rate divided by no of lines
+	 */
+	u32 vsync_count;
+	u32 sync_cfg_height;
+	u32 vsync_init_val;
+	u32 sync_threshold_start;
+	u32 sync_threshold_continue;
+	u32 start_pos;
+	u32 rd_ptr_irq;
+	u8 hw_vsync_mode;
+};
+
+/**
+ * struct dpu_hw_pp_vsync_info - Struct contains parameters to configure
+ * read and write pointers for command mode panels
+ * @rd_ptr_init_val:    Value of rd pointer at vsync edge
+ * @rd_ptr_frame_count: Num frames sent since enabling interface
+ * @rd_ptr_line_count:  Current line on panel (rd ptr)
+ * @wr_ptr_line_count:  Current line within pp fifo (wr ptr)
+ */
+struct dpu_hw_pp_vsync_info {
+	u32 rd_ptr_init_val;
+	u32 rd_ptr_frame_count;
+	u32 rd_ptr_line_count;
+	u32 wr_ptr_line_count;
+};
+
 #endif  /* _DPU_HW_MDSS_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
index 851b013c4c4b..78db18dbda2b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h
@@ -13,28 +13,6 @@
 
 struct dpu_hw_pingpong;
 
-struct dpu_hw_tear_check {
-	/*
-	 * This is ratio of MDP VSYNC clk freq(Hz) to
-	 * refresh rate divided by no of lines
-	 */
-	u32 vsync_count;
-	u32 sync_cfg_height;
-	u32 vsync_init_val;
-	u32 sync_threshold_start;
-	u32 sync_threshold_continue;
-	u32 start_pos;
-	u32 rd_ptr_irq;
-	u8 hw_vsync_mode;
-};
-
-struct dpu_hw_pp_vsync_info {
-	u32 rd_ptr_init_val;	/* value of rd pointer at vsync edge */
-	u32 rd_ptr_frame_count;	/* num frames sent since enabling interface */
-	u32 rd_ptr_line_count;	/* current line on panel (rd ptr) */
-	u32 wr_ptr_line_count;	/* current line within pp fifo (wr ptr) */
-};
-
 /**
  * struct dpu_hw_dither_cfg - dither feature structure
  * @flags: for customizing operations

-- 
2.40.0

