Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C84539088
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 14:18:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 187D11120FB;
	Tue, 31 May 2022 12:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83FA41120FB
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 12:18:28 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id y29so2420080ljd.7
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 05:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8eyhHuanqx+u4deTGj8V2+LlpkWjiwWvkK9gQujKI9w=;
 b=k1lxgjYuUHs2jvEXJ2gHGHbuWOZeTeFJbBxc1GD4/ekw2+5fCyevW6SfEKV36ceyWU
 dpz/NHmnkaOFO+9FOrPJNEcaCOBgx1hOPTdOAi154fuPMWmJPTfqXwTtUM5lMPk8BsYT
 WbPTRLAKqGkCTkN/N9JaJvxzYP3QDARmOq6g6f2JqOwOGQLyExNc3K8X5IA3pF+1gKhY
 OhQHPBVj4yALlugq722WQk0FHY/rnviRqyKvhfDEzHWPu7+7Hdcfd/RXzKg2yTB/4lYz
 IVAR2e4QG91vGUmfZFxW74sMj9Urc32dMpDbcIGtZi6KgKD2rA61/DWh9LK/VRcpc0uV
 HpyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8eyhHuanqx+u4deTGj8V2+LlpkWjiwWvkK9gQujKI9w=;
 b=ql1ZGJdEi2t5IjXyBB1vTnI3FkkyYqj4fOhxcJ4KctVyRCSJOudntWB6I17qhy2wbE
 QnDvCEwvYhPO91NfwGi6LNJx6VDWDshQ6FnJ6RGu7uz722FUYdVLjemf4Xv6r6hQTjsd
 zhNzXRv7w0HcfBEtPUDgmwl/jVPwoc9M0vzdGaLOLtYugiJkRLxkIBgcJuD8R2Kw5dDY
 Y6GChUpGPwRLG3JASel5GVJOvNSpLuGt4DUDonX/CnC8sS21LF2GHMnSh9zLKTdUxbao
 b4PQlCA7MAh6SbpK4vhSb8lYzpDlBRhsbBymVSZWwO1K/6UByZiNeHHih/7QlBP0Mutr
 PPzg==
X-Gm-Message-State: AOAM530Ou/Fb0F76P/3AU4Ex5U74V1pT8B1kypSPdHQ3lnZPbyyGlR7i
 RD1QSnbtRY1F+TwdYZVwGXJOqQ==
X-Google-Smtp-Source: ABdhPJyupkC4slDXUK9Tw7uNHV4EJd1TiIX+PRxr4gqAnhEVxx5ILLtn79JaVw866aURIj0smdfN8g==
X-Received: by 2002:a2e:a7ca:0:b0:253:f7ab:a008 with SMTP id
 x10-20020a2ea7ca000000b00253f7aba008mr21502340ljp.10.1653999506642; 
 Tue, 31 May 2022 05:18:26 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 e26-20020a2e501a000000b002554f47e37asm1145056ljb.119.2022.05.31.05.18.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 May 2022 05:18:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH] drm/msm: less magic numbers in msm_mdss_enable
Date: Tue, 31 May 2022 15:18:25 +0300
Message-Id: <20220531121825.1126204-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace magic register writes in msm_mdss_enable() with version that
contains less magic and more variable names that can be traced back to
the dpu_hw_catalog or the downstream dtsi files.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 79 ++++++++++++++++++++++++++++++----
 1 file changed, 71 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 0454a571adf7..2a48263cd1b5 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -21,6 +21,7 @@
 #define HW_REV				0x0
 #define HW_INTR_STATUS			0x0010
 
+#define UBWC_DEC_HW_VERSION		0x58
 #define UBWC_STATIC			0x144
 #define UBWC_CTRL_2			0x150
 #define UBWC_PREDICTION_MODE		0x154
@@ -132,9 +133,63 @@ static int _msm_mdss_irq_domain_add(struct msm_mdss *msm_mdss)
 	return 0;
 }
 
+#define UBWC_1_0 0x10000000
+#define UBWC_2_0 0x20000000
+#define UBWC_3_0 0x30000000
+#define UBWC_4_0 0x40000000
+
+static void msm_mdss_setup_ubwc_dec_20(struct msm_mdss *msm_mdss,
+				       u32 ubwc_static)
+{
+	writel_relaxed(ubwc_static, msm_mdss->mmio + UBWC_STATIC);
+}
+
+static void msm_mdss_setup_ubwc_dec_30(struct msm_mdss *msm_mdss,
+				       unsigned int ubwc_version,
+				       u32 ubwc_swizzle,
+				       u32 highest_bank_bit,
+				       u32 macrotile_mode)
+{
+	u32 value = (ubwc_swizzle & 0x1) |
+		    (highest_bank_bit & 0x3) << 4 |
+		    (macrotile_mode & 0x1) << 12;
+
+	if (ubwc_version == UBWC_3_0)
+		value |= BIT(10);
+
+	if (ubwc_version == UBWC_1_0)
+		value |= BIT(8);
+
+	writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
+}
+
+static void msm_mdss_setup_ubwc_dec_40(struct msm_mdss *msm_mdss,
+				       unsigned int ubwc_version,
+				       u32 ubwc_swizzle,
+				       u32 ubwc_static,
+				       u32 highest_bank_bit,
+				       u32 macrotile_mode)
+{
+	u32 value = (ubwc_swizzle & 0x7) |
+		    (ubwc_static & 0x1) << 3 |
+		    (highest_bank_bit & 0x7) << 4 |
+		    (macrotile_mode & 0x1) << 12;
+
+	writel_relaxed(value, msm_mdss->mmio + UBWC_STATIC);
+
+	if (ubwc_version == UBWC_3_0) {
+		writel_relaxed(1, msm_mdss->mmio + UBWC_CTRL_2);
+		writel_relaxed(0, msm_mdss->mmio + UBWC_PREDICTION_MODE);
+	} else {
+		writel_relaxed(2, msm_mdss->mmio + UBWC_CTRL_2);
+		writel_relaxed(1, msm_mdss->mmio + UBWC_PREDICTION_MODE);
+	}
+}
+
 static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 {
 	int ret;
+	u32 hw_rev;
 
 	ret = clk_bulk_prepare_enable(msm_mdss->num_clocks, msm_mdss->clocks);
 	if (ret) {
@@ -149,26 +204,34 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	if (msm_mdss->is_mdp5)
 		return 0;
 
+	hw_rev = readl_relaxed(msm_mdss->mmio + HW_REV);
+	dev_info(msm_mdss->dev, "HW_REV: 0x%x\n", hw_rev);
+	dev_info(msm_mdss->dev, "UBWC_DEC_HW_VERSION: 0x%x\n",
+		readl_relaxed(msm_mdss->mmio + UBWC_DEC_HW_VERSION));
+
 	/*
 	 * ubwc config is part of the "mdss" region which is not accessible
 	 * from the rest of the driver. hardcode known configurations here
+	 *
+	 * Decoder version can be read from the UBWC_DEC_HW_VERSION reg,
+	 * UBWC_n comes from hw_catalog.
+	 * Unforunately this driver can not access hw catalog.
 	 */
-	switch (readl_relaxed(msm_mdss->mmio + HW_REV)) {
+	switch (hw_rev) {
 	case DPU_HW_VER_500:
 	case DPU_HW_VER_501:
-		writel_relaxed(0x420, msm_mdss->mmio + UBWC_STATIC);
+		msm_mdss_setup_ubwc_dec_30(msm_mdss, UBWC_3_0, 0, 2, 0);
 		break;
 	case DPU_HW_VER_600:
-		/* TODO: 0x102e for LP_DDR4 */
-		writel_relaxed(0x103e, msm_mdss->mmio + UBWC_STATIC);
-		writel_relaxed(2, msm_mdss->mmio + UBWC_CTRL_2);
-		writel_relaxed(1, msm_mdss->mmio + UBWC_PREDICTION_MODE);
+		/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
 		break;
 	case DPU_HW_VER_620:
-		writel_relaxed(0x1e, msm_mdss->mmio + UBWC_STATIC);
+		/* UBWC_2_0 */
+		msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x1e);
 		break;
 	case DPU_HW_VER_720:
-		writel_relaxed(0x101e, msm_mdss->mmio + UBWC_STATIC);
+		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
 		break;
 	}
 
-- 
2.35.1

