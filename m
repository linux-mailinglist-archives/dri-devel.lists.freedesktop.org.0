Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3C1309BA7
	for <lists+dri-devel@lfdr.de>; Sun, 31 Jan 2021 12:43:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8A8A6E18F;
	Sun, 31 Jan 2021 11:43:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA676E17D
 for <dri-devel@lists.freedesktop.org>; Sun, 31 Jan 2021 05:11:05 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id a20so8386120pjs.1
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Jan 2021 21:11:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j678qJx/JPZkac4bEG/8rI07bilrUpTVTBhhwHGCLyE=;
 b=HVch7Qv7dq+iRZl0F7OTOFc01KRsOkitFn7szOaZ9AduniQxvk4XBoFLuthP8Kv6+0
 Plhwxk/rCbQwhF4rXRcgnKJqGrjCIonm0eYQsveQ2gVikK3JsdbZbzJnH6djhj1w6gIn
 +KOVbeHocLUgCb2ZDLZ7kmf5WqLdirwI4T2OY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j678qJx/JPZkac4bEG/8rI07bilrUpTVTBhhwHGCLyE=;
 b=ERkxAL/W4LNVbtsGi5sgOEDR3mnKzCkwfLZD46wAXncQCXlDit/ygIFMowZIMUOzH4
 U1ls+NJvAwTxbxvEushAuVcmJ+Sk9Gm45BZm9rTX1c4oU84NE0UthmtFLKjt8LSkeRIf
 RU2hHUv+TbcgktIvVxELqA04mfVRxNKlExYtyiGvQ92MzMev5xLZsLykCpxNaYsDC4hv
 Jbi+AiCwo2QhCeXwhe4cAT/ZFt2r7FoJsNMWSfb96ZjAgNsaE+7meAziJ5dejUBO7o9A
 dnCn9c818EiGKfHKHWNR1iz03mW+z2YE5O2aKkDyfFo37Wnhr0ZUiAkhMJCkUXHl+7xN
 1ZOg==
X-Gm-Message-State: AOAM533I451XIVpUJJJ0txQboC3R1NxC8zKpSRCFTBnPg0v1Mvf6gHs0
 J7wx/oikhJkz1xlHCfPIEcuZLA==
X-Google-Smtp-Source: ABdhPJw5rGGPEQ8dqERgZpeHNpM1Tn38J69RC4BmBr0NM6uPyiS94+8Vq5WTIlas3qzw4/OIei1tzw==
X-Received: by 2002:a17:90b:60c:: with SMTP id
 gb12mr11373176pjb.125.1612069865252; 
 Sat, 30 Jan 2021 21:11:05 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:35ef:a870:bb74:2590])
 by smtp.gmail.com with ESMTPSA id d22sm11470680pjv.11.2021.01.30.21.11.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 21:11:04 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] drm/mediatek: enable dither function
Date: Sun, 31 Jan 2021 13:10:58 +0800
Message-Id: <20210131051058.3407985-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 31 Jan 2021 11:43:06 +0000
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

Enable dither function to improve the display quality.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
Previous version:
https://patchwork.kernel.org/project/linux-mediatek/patch/20210129092209.2584718-7-hsinyi@chromium.org/
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index c730029ac8fc7..0444b429daf00 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -53,6 +53,7 @@
 #define DITHER_EN				BIT(0)
 #define DISP_DITHER_CFG				0x0020
 #define DITHER_RELAY_MODE			BIT(0)
+#define DITHER_ENGINE_EN			BIT(1)
 #define DISP_DITHER_SIZE			0x0030
 
 #define LUT_10BIT_MASK				0x03ff
@@ -315,8 +316,12 @@ static void mtk_dither_config(struct device *dev, unsigned int w,
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
 
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_DITHER_SIZE);
-	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
+		      DISP_DITHER_SIZE);
+	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs,
+		      DISP_DITHER_CFG);
+	mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc, DISP_DITHER_CFG,
+			      DITHER_ENGINE_EN, cmdq_pkt);
 }
 
 static void mtk_dither_start(struct device *dev)
-- 
2.30.0.365.g02bc693789-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
