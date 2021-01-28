Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6A1307EDD
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 20:45:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22CB26EA18;
	Thu, 28 Jan 2021 19:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0C76E1F6
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 11:23:35 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id b17so3149652plz.6
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 03:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JFDIHF7A4xcJQCMZd2qVFd4aLKExesv1nCxMC8zcGnE=;
 b=oCMMsElsQjsYPCn7s2OLoPRchtAGewDclcCB5Q6GrqZA5TKeMKJPxdvzz6h5bJ889o
 dwktzpXo1aQ3vUb5IXfxY18SRSetXL1DRLDBttfCpGcP2Y+vDLMHzjjdVmmDqQSE70ed
 iHV7J2Vf+J+/L9+HQcJ6smMrv1O8bdvOxxEEo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JFDIHF7A4xcJQCMZd2qVFd4aLKExesv1nCxMC8zcGnE=;
 b=lIaVI0GBWJJ1PfmuctY4ff4sa6ymfSajF5rjKaGDmM9A+TlofoZnpCHXLl/xhCTs/p
 pywj22Ivlu2tmRovxjmB24octzrRRtjxUS+yOLAZcbgXUZGBZmT00om6a9R0bm3Xe9qs
 bCVhV9qA3F7Xo97Fxd2pGIboVcyyIzLFktTG3+bYbYzd2LnNJL0s2IRTt0G8yW1XpPZR
 6pHHjh139vbRIOWJviY8Myb/GZ98gvomzYLYr76lmRDPawco4wGKOAPF4FghHPAgK9v8
 cpN6d8WsfozC8OhokdfheXQjS67s4KNERigHk9XA6GzJTRPOJODPegigr3HQ/ajKIOtE
 Ivfw==
X-Gm-Message-State: AOAM5302RUtlxMRRUIdV6y/e/kDy9UDa3+OwezEycamrI1Lhc5WODWxC
 jrlk8XXIlE7C1tCr1Nxn65knwg==
X-Google-Smtp-Source: ABdhPJxvKZHW3iC9gdjoGC9Ej9lSJzioxFB5NLyQI/sXvEHdrcLtbheh/V1Xf/BpFNPjD0XrWJfwgg==
X-Received: by 2002:a17:902:8342:b029:e1:6aa:d770 with SMTP id
 z2-20020a1709028342b02900e106aad770mr7671394pln.27.1611833015130; 
 Thu, 28 Jan 2021 03:23:35 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e0a5:d2fc:aaad:1e4a])
 by smtp.gmail.com with ESMTPSA id j198sm3138315pfd.71.2021.01.28.03.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:23:34 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v12 6/8] drm/mediatek: enable dither function
Date: Thu, 28 Jan 2021 19:23:12 +0800
Message-Id: <20210128112314.1304160-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210128112314.1304160-1-hsinyi@chromium.org>
References: <20210128112314.1304160-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 28 Jan 2021 19:44:35 +0000
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
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index ac2cb25620357..6c8f246380a74 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -53,6 +53,7 @@
 #define DITHER_EN				BIT(0)
 #define DISP_DITHER_CFG				0x0020
 #define DITHER_RELAY_MODE			BIT(0)
+#define DITHER_ENGINE_EN			BIT(1)
 #define DISP_DITHER_SIZE			0x0030
 
 #define LUT_10BIT_MASK				0x03ff
@@ -314,9 +315,19 @@ static void mtk_dither_config(struct device *dev, unsigned int w,
 			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
+	bool enable = (bpc == 5 || bpc == 6);
 
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_DITHER_SIZE);
-	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
+	if (enable) {
+		mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc,
+				      DISP_DITHER_CFG, DITHER_ENGINE_EN,
+				      cmdq_pkt);
+	} else {
+		mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg,
+			      priv->regs, DISP_DITHER_CFG);
+	}
+
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
+		      DISP_DITHER_SIZE);
 }
 
 static void mtk_dither_start(struct device *dev)
-- 
2.30.0.280.ga3ce27912f-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
