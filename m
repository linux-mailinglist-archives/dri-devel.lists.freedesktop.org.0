Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3043055CB
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jan 2021 09:30:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 572A26E7EF;
	Wed, 27 Jan 2021 08:29:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA0C6E51B
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jan 2021 04:54:53 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id 11so415191pfu.4
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Jan 2021 20:54:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TylT5ylvrSjXZkyDWey49Aq08z8epZnlbLmRvBO6dZo=;
 b=Tc+it0gmwJ+uU8imyifVsbbL0tQbg1r0O7axx2m5PQMU9SsOBEtnFIz7NJrws/tPdI
 sGXJung+g6yOpezvv8bsQ+dzp/YEkvO+r4tRawUuKH7LbV8ps8tSe6A+eNjRiJspo3iG
 AkLDVUg68g1bYXieR5XnjrNugfmkRY9hL3sbI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TylT5ylvrSjXZkyDWey49Aq08z8epZnlbLmRvBO6dZo=;
 b=BE5eanypugcCX1xq9u+jyXLyi1+5HB70K1uy/vFSls3z9fi7yg1xlibqokdlxgz/uj
 Mfce1KO/bmGTHNjmhVtkMwk6aeMzjhMuv2T6/OAG978489RG0fKmTB3l41RaiDvRerBC
 Q8R2ehgYHnjgfeD6PwpKA3okpDiG7otHWTRKBJcNkzosHF773HQO4VerOIEmDbetBIjN
 oFMz1fiuWfqYfITtTcYiTRiPGonyRXcX4st2f0qt1pB0K59MCI4XuSVDEkK0pXYqfLPP
 vr1emqxgDvdpHMl0O8PAS+h57O08kaJouULgk90ZkRZSTl90ZQtoigp98k5Vp0hM0emN
 Dufg==
X-Gm-Message-State: AOAM530VXXRZ1jaJmKc1D4vKQ9g0jGWvSIEw2cDjrAZPWBCrfHMu/Jgx
 o/13jRZkCe5r7pwDSqyjwIFBnA==
X-Google-Smtp-Source: ABdhPJyy01Q5a/LPZ4E7UcdQg5mKkFvVyYvr6fPjvcMa6xvNPlRFx5WzfjRFbv8mXDBUtrtl/OLw0g==
X-Received: by 2002:a62:5c43:0:b029:1bb:9418:b59b with SMTP id
 q64-20020a625c430000b02901bb9418b59bmr8642305pfb.35.1611723293345; 
 Tue, 26 Jan 2021 20:54:53 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e0a5:d2fc:aaad:1e4a])
 by smtp.gmail.com with ESMTPSA id a141sm684484pfa.189.2021.01.26.20.54.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jan 2021 20:54:52 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v10 7/9] drm/mediatek: enable dither function
Date: Wed, 27 Jan 2021 12:54:20 +0800
Message-Id: <20210127045422.2418917-8-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210127045422.2418917-1-hsinyi@chromium.org>
References: <20210127045422.2418917-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 27 Jan 2021 08:29:46 +0000
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
 Project_Global_Chrome_Upstream_Group@mediatek.com,
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
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 37 ++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 8173f709272be..ee54505412dcd 100644
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
 
@@ -313,8 +315,41 @@ static void mtk_dither_config(struct device *dev, unsigned int w,
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
+	bool enable = true;
+
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
+	if (bpc == 6) {
+		mtk_ddp_write(cmdq_pkt, 0x40400001, &priv->cmdq_reg, priv->regs, DITHER_REG(15));
+		mtk_ddp_write(cmdq_pkt, 0x40404040, &priv->cmdq_reg, priv->regs, DITHER_REG(16));
+	} else if (bpc == 5) {
+		mtk_ddp_write(cmdq_pkt, 0x50500001, &priv->cmdq_reg, priv->regs, DITHER_REG(15));
+		mtk_ddp_write(cmdq_pkt, 0x50504040, &priv->cmdq_reg, priv->regs, DITHER_REG(16));
+	} else {
+		enable = false;
+	}
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
