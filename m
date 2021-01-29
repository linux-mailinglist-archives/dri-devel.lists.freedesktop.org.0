Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB283086DF
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 09:12:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D426EA96;
	Fri, 29 Jan 2021 08:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 286B16EA81
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 07:34:57 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id c132so6100236pga.3
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 23:34:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z0VzfNDnc1RNpKDeThOpKuoraFZ7ZUithfDN0lHwcjc=;
 b=TZlyGJRidU43SvB+usEmJhbiogpEBxkWU7lt38+Hx8JDPJUO+68ZyCxSXCNgPBDW25
 0uYkOXwFqmxlBYwzrJ1s1BbLh8cDVbUleOI/cLu1ScjXfvn0gwFW6biVIqPg9Pe+fARn
 s3Z8/v3SE5rdkXQops9PO/SAcOecDmpJSPSjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z0VzfNDnc1RNpKDeThOpKuoraFZ7ZUithfDN0lHwcjc=;
 b=WAy8Cm446rLC/Kr8V1c1yhF61AL5rQcScH2qMD7ndAllft+++8xtFOHwDzWTZuFBiC
 SmxB0jWyWTR+4DjRGzU1sf5kPmnFE+O22wzvAzgmJkBVBskBf7NczrDN1lgxkgJF1q0L
 Q2D6jWnFwnB7aCu6zLwKT80walIi8MlcAuOJNtyvcE7e2Qvyn5Of7hirvmzFo6tBn3E0
 ySoOVNb75CFldKOqm1VKUK6XRp5BM2mu+5YBMgzj5jAjYPGuAWtpW19EQnnqd2qf6Tey
 0/dLJR6IbT1V81UvoYg+Na4ENBDJzfAK0f2EXqatAYEqShHYJ4BdD2pGQc2cQAGNMpsZ
 SXBg==
X-Gm-Message-State: AOAM530tHoJ4NW8UJ8GtwcIZ0X3tdpXDMXmpfwSL/SlaWgnWkrftl4cO
 vKxFjiZflykAYOu2MauKiJui7A==
X-Google-Smtp-Source: ABdhPJy0ekUDoYPIR7eUwYsy3duD/m0fqRvopGyLRi/0wI+d34WZYnW5TQk31h5jTmTx9tnOn/Drkw==
X-Received: by 2002:a63:e30d:: with SMTP id f13mr3528882pgh.39.1611905696728; 
 Thu, 28 Jan 2021 23:34:56 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:51f1:c468:a70b:7c09])
 by smtp.gmail.com with ESMTPSA id p1sm7689980pfn.21.2021.01.28.23.34.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 23:34:56 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 6/8] drm/mediatek: add matrix bits private data for ccorr
Date: Fri, 29 Jan 2021 15:34:34 +0800
Message-Id: <20210129073436.2429834-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210129073436.2429834-1-hsinyi@chromium.org>
References: <20210129073436.2429834-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 29 Jan 2021 08:11:32 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

matrix bits of mt8183 is 12
matrix bits of mt8192 is 13

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 22 +++++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 0c68090eb1e92..1c7163a12f3b1 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -31,8 +31,10 @@
 #define DISP_CCORR_COEF_3			0x008C
 #define DISP_CCORR_COEF_4			0x0090
 
+#define CCORR_MATRIX_BITS			12
+
 struct mtk_disp_ccorr_data {
-	u32 reserved;
+	u32 matrix_bits;
 };
 
 /**
@@ -116,6 +118,7 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
 	uint16_t coeffs[9] = { 0 };
 	int i;
 	struct cmdq_pkt *cmdq_pkt = NULL;
+	u32 matrix_bits;
 
 	if (!blob)
 		return;
@@ -123,8 +126,16 @@ void mtk_ccorr_ctm_set(struct device *dev, struct drm_crtc_state *state)
 	ctm = (struct drm_color_ctm *)blob->data;
 	input = ctm->matrix;
 
-	for (i = 0; i < ARRAY_SIZE(coeffs); i++)
+	if (ccorr->data)
+		matrix_bits = ccorr->data->matrix_bits;
+	else
+		matrix_bits = CCORR_MATRIX_BITS;
+
+	for (i = 0; i < ARRAY_SIZE(coeffs); i++) {
 		coeffs[i] = mtk_ctm_s31_32_to_s1_10(input[i]);
+		if (matrix_bits > CCORR_MATRIX_BITS)
+			coeffs[i] <<= (matrix_bits - CCORR_MATRIX_BITS);
+	}
 
 	mtk_ddp_write(cmdq_pkt, coeffs[0] << 16 | coeffs[1],
 		      &ccorr->cmdq_reg, ccorr->regs, DISP_CCORR_COEF_0);
@@ -205,8 +216,13 @@ static int mtk_disp_ccorr_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct mtk_disp_ccorr_data mt8183_ccorr_driver_data = {
+	.matrix_bits = CCORR_MATRIX_BITS,
+};
+
 static const struct of_device_id mtk_disp_ccorr_driver_dt_match[] = {
-	{ .compatible = "mediatek,mt8183-disp-ccorr"},
+	{ .compatible = "mediatek,mt8183-disp-ccorr",
+	  .data = &mt8183_ccorr_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_ccorr_driver_dt_match);
-- 
2.30.0.365.g02bc693789-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
