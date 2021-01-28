Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C50623070D5
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 09:15:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45AFD6E900;
	Thu, 28 Jan 2021 08:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5ED6E8F4
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 07:28:29 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id i63so3434872pfg.7
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 23:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fne+vhWkm1Z1Aqcwns1m/8EIUHXNQn4A+aQoJ3scn6c=;
 b=JR2mytdDYyZTlKBy0TO/0LfCu+l8Qy8jLpRyEnDzR9OLN8n/wqraoIViKpWO/gQKb9
 +1+yUfi6CFUwZfR3AKsSJ08yhitKEX+7fbG82Wr7bUOCOkQk13OxXhXphD/Tr1qHfP0U
 L45FyMiaera7CCXFagCxyz4HUWh8SnJg5HMDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fne+vhWkm1Z1Aqcwns1m/8EIUHXNQn4A+aQoJ3scn6c=;
 b=ARQwIamNw/dYsTODKreHQYiw3yY/rlp5MT0OXiCfPuqQrQK+arzcKhcnzifPeQhfxZ
 /FEM3zLvS6YZ8AIk4yfIlK88m0UqZmwXQmrwKupmZovUhx7HgvoFbjGMr9H3uYThhZMV
 xNEuERjCmTrfGUX0mMMUF3n99I13SEGr+js6bnztWlEk6nodKkgmtvzZMvxtMa/sXb2i
 vicNT8q9KPP5cikm6eIX2AglzXMiwaGkQz9k7s0uhe1rnK2fTaFsX3kkgs6j12A/buN2
 AdnG0+UWTEsxuRcekObtUzN+1R+d7biUPpDPXUmmlefBmc69++i3+8xnLG9p3cHOXTHR
 N0BQ==
X-Gm-Message-State: AOAM533qZprFvhfip19QYgIXrCeZlrtxwp9BHM24I7mKZMkQ8NKsgHJH
 X6GF2pwGoafp78WTm5FziT5K3w==
X-Google-Smtp-Source: ABdhPJzyTMG7Btac7TH5DXBrPhgpAXQ+Sjkf0xFq2Jr5myqxPMyVT2/nWmLn4j5qXYiXNB52rSQWNA==
X-Received: by 2002:a05:6a00:2281:b029:1bb:15d2:3b9f with SMTP id
 f1-20020a056a002281b02901bb15d23b9fmr14394166pfe.25.1611818909201; 
 Wed, 27 Jan 2021 23:28:29 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e0a5:d2fc:aaad:1e4a])
 by smtp.gmail.com with ESMTPSA id h2sm4800304pfk.4.2021.01.27.23.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 23:28:28 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v11 7/9] drm/mediatek: enable dither function
Date: Thu, 28 Jan 2021 15:28:00 +0800
Message-Id: <20210128072802.830971-8-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210128072802.830971-1-hsinyi@chromium.org>
References: <20210128072802.830971-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Jan 2021 08:15:36 +0000
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

for 5 or 6 bpc panel, we need enable dither function
to improve the display quality

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 44 ++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 8173f709272be..e85625704d611 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -53,7 +53,9 @@
 #define DITHER_EN				BIT(0)
 #define DISP_DITHER_CFG				0x0020
 #define DITHER_RELAY_MODE			BIT(0)
+#define DITHER_ENGINE_EN			BIT(1)
 #define DISP_DITHER_SIZE			0x0030
+#define DITHER_REG(idx)				(0x100 + (idx) * 4)
 
 #define LUT_10BIT_MASK				0x03ff
 
@@ -313,8 +315,48 @@ static void mtk_dither_config(struct device *dev, unsigned int w,
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
+	bool enable = false;
+
+	/* default value for dither reg 5 to 14 */
+	const u32 dither_setting[] = {
+		0x00000000, /* 5 */
+		0x00003002, /* 6 */
+		0x00000000, /* 7 */
+		0x00000000, /* 8 */
+		0x00000000, /* 9 */
+		0x00000000, /* 10 */
+		0x00000000, /* 11 */
+		0x00000011, /* 12 */
+		0x00000000, /* 13 */
+		0x00000000, /* 14 */
+	};
+
+	if (bpc == 5 || bpc == 6) {
+		enable = true;
+		mtk_ddp_write(cmdq_pkt,
+			      DITHER_LSB_ERR_SHIFT_R(MTK_MAX_BPC - bpc) |
+			      DITHER_ADD_LSHIFT_R(MTK_MAX_BPC - bpc) |
+			      DITHER_NEW_BIT_MODE,
+			      &priv->cmdq_reg, priv->regs, DITHER_REG(15));
+		mtk_ddp_write(cmdq_pkt,
+			      DITHER_LSB_ERR_SHIFT_B(MTK_MAX_BPC - bpc) |
+			      DITHER_ADD_LSHIFT_B(MTK_MAX_BPC - bpc) |
+			      DITHER_LSB_ERR_SHIFT_G(MTK_MAX_BPC - bpc) |
+			      DITHER_ADD_LSHIFT_G(MTK_MAX_BPC - bpc),
+			      &priv->cmdq_reg, priv->regs, DITHER_REG(16));
+	}
+
+
+	if (enable) {
+		u32 idx;
+
+		for (idx = 0; idx < ARRAY_SIZE(dither_setting); idx++)
+			mtk_ddp_write(cmdq_pkt, dither_setting[idx], &priv->cmdq_reg, priv->regs,
+				      DITHER_REG(idx + 5));
+	}
+
 	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_DITHER_SIZE);
-	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
+        mtk_ddp_write(cmdq_pkt, enable ? DITHER_ENGINE_EN : DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
 }
 
 static void mtk_dither_start(struct device *dev)
-- 
2.30.0.280.ga3ce27912f-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
