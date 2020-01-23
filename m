Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E028B1479BB
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2020 09:53:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6A56FF92;
	Fri, 24 Jan 2020 08:53:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 371 seconds by postgrey-1.36 at gabe;
 Thu, 23 Jan 2020 10:24:52 UTC
Received: from alexa-out-blr-02.qualcomm.com (alexa-out-blr-02.qualcomm.com
 [103.229.18.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 168C56FBC5;
 Thu, 23 Jan 2020 10:24:51 +0000 (UTC)
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
 by alexa-out-blr-02.qualcomm.com with ESMTP/TLS/AES256-SHA;
 23 Jan 2020 15:48:38 +0530
Received: from kalyant-linux.qualcomm.com ([10.204.66.210])
 by ironmsg01-blr.qualcomm.com with ESMTP; 23 Jan 2020 15:48:13 +0530
Received: by kalyant-linux.qualcomm.com (Postfix, from userid 94428)
 id D4CD74534; Thu, 23 Jan 2020 15:48:11 +0530 (IST)
From: Kalyan Thota <kalyan_t@codeaurora.org>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: [PATCH] msm:disp:dpu1: add UBWC support for display on SC7180
Date: Thu, 23 Jan 2020 15:47:55 +0530
Message-Id: <1579774675-20235-1-git-send-email-kalyan_t@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Mailman-Approved-At: Fri, 24 Jan 2020 08:52:34 +0000
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
Cc: harigovi@codeaurora.org, travitej@codeaurora.org, dianders@chromium.org,
 linux-kernel@vger.kernel.org, seanpaul@chromium.org,
 Kalyan Thota <kalyan_t@codeaurora.org>, hoegsberg@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add UBWC global configuration for display on
SC7180 target.

Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 58 +++++++++++++++++++++++++++++++-
 1 file changed, 57 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
index 29705e7..80d3cfc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
@@ -12,6 +12,7 @@
 
 #define to_dpu_mdss(x) container_of(x, struct dpu_mdss, base)
 
+#define HW_REV				0x0
 #define HW_INTR_STATUS			0x0010
 
 /* Max BW defined in KBps */
@@ -22,6 +23,17 @@ struct dpu_irq_controller {
 	struct irq_domain *domain;
 };
 
+struct dpu_hw_cfg {
+	u32 val;
+	u32 offset;
+};
+
+struct dpu_mdss_hw_init_handler {
+	u32 hw_rev;
+	u32 hw_reg_count;
+	struct dpu_hw_cfg* hw_cfg;
+};
+
 struct dpu_mdss {
 	struct msm_mdss base;
 	void __iomem *mmio;
@@ -32,6 +44,44 @@ struct dpu_mdss {
 	u32 num_paths;
 };
 
+static struct dpu_hw_cfg hw_cfg[] = {
+    {
+	/* UBWC global settings */
+	.val = 0x1E,
+	.offset = 0x144,
+    }
+};
+
+static struct dpu_mdss_hw_init_handler cfg_handler[] = {
+    { .hw_rev = DPU_HW_VER_620,
+      .hw_reg_count = ARRAY_SIZE(hw_cfg),
+      .hw_cfg = hw_cfg
+    },
+};
+
+static void dpu_mdss_hw_init(struct dpu_mdss *dpu_mdss, u32 hw_rev)
+{
+	int i;
+	u32 count = 0;
+	struct dpu_hw_cfg *hw_cfg = NULL;
+
+	for (i = 0; i < ARRAY_SIZE(cfg_handler); i++) {
+		if (cfg_handler[i].hw_rev == hw_rev) {
+			hw_cfg = cfg_handler[i].hw_cfg;
+			count = cfg_handler[i].hw_reg_count;
+			break;
+	    }
+	}
+
+	for (i = 0; i < count; i++ ) {
+		writel_relaxed(hw_cfg->val,
+			dpu_mdss->mmio + hw_cfg->offset);
+		hw_cfg++;
+	}
+
+    return;
+}
+
 static int dpu_mdss_parse_data_bus_icc_path(struct drm_device *dev,
 						struct dpu_mdss *dpu_mdss)
 {
@@ -174,12 +224,18 @@ static int dpu_mdss_enable(struct msm_mdss *mdss)
 	struct dpu_mdss *dpu_mdss = to_dpu_mdss(mdss);
 	struct dss_module_power *mp = &dpu_mdss->mp;
 	int ret;
+	u32 mdss_rev;
 
 	dpu_mdss_icc_request_bw(mdss);
 
 	ret = msm_dss_enable_clk(mp->clk_config, mp->num_clk, true);
-	if (ret)
+	if (ret) {
 		DPU_ERROR("clock enable failed, ret:%d\n", ret);
+		return ret;
+	}
+
+	mdss_rev = readl_relaxed(dpu_mdss->mmio + HW_REV);
+	dpu_mdss_hw_init(dpu_mdss, mdss_rev);
 
 	return ret;
 }
-- 
1.9.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
