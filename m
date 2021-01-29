Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7E23094D8
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 12:29:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 449346ECBD;
	Sat, 30 Jan 2021 11:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866EA6EAAE
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 09:22:30 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id w14so5872022pfi.2
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 01:22:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GAxvV7R4/vTpyFlTAS6Pj5shqaEt+L+HnuJKV7F1rVo=;
 b=Ror+4QerXQjaE2vsEtt/+J6Osk5wHvps9k7IL561MxxrR0M8AlpNXUTXL7GSZcEmIa
 sGXI1Pk8qyQWP2g3mUunqAmPL2czr29hlfaAkss9eMjS2WmmhBLBicT3gcjqEfOH7qFD
 P37bkpKSfyXEaMLWmGCnk/e0dElc79D15tfe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GAxvV7R4/vTpyFlTAS6Pj5shqaEt+L+HnuJKV7F1rVo=;
 b=B0ZV+uYvwngaF+VsWcrBo/EtfmSrmItuhrAHaAYcLs6Gd76DWLkY6IUETwfVboV4Lj
 PnE0VjfUVVqHmoT7xfUOWIap69OQJWgPLRJTWf89pdZyAABCLTGD35AzX+pYqZFDQy3D
 69UjVleBPmYKh11yYuiqCP0F/O08ktQk0VXokY+6LpNX0A3oYTegnCCbKBJ/NPpfMtxg
 hSUpVNb5/Tv+1j/S5LY85pzMVtNYJCZNTcHpL//pQ/zRV2mLwAZwID67z+logMUSf4i0
 NQUsrA9agfpAwbL80xNjFB/GZ8Nc9b2rgid8gsHqv4CMa15jZTW8hHuZ0O8pjQcOW+a0
 3F0w==
X-Gm-Message-State: AOAM532FmRJTRsBuEMtpoyxXeZfEaJ6GGudUhaySpYrYtoGY16GiGVVh
 QEJoUzOxorjmilRf+PP5UkA/jw==
X-Google-Smtp-Source: ABdhPJy4+2S1A2x1ndwikJR7JIysE1W0izSM4nTbR8FztfNfzjanB9rfmcVpcKhsDDrm7mJ2NRd+CA==
X-Received: by 2002:a63:1c09:: with SMTP id c9mr3869976pgc.185.1611912150169; 
 Fri, 29 Jan 2021 01:22:30 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:51f1:c468:a70b:7c09])
 by smtp.gmail.com with ESMTPSA id p7sm8032776pfn.52.2021.01.29.01.22.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 01:22:29 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v13 6/8] drm/mediatek: enable dither function
Date: Fri, 29 Jan 2021 17:22:07 +0800
Message-Id: <20210129092209.2584718-7-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210129092209.2584718-1-hsinyi@chromium.org>
References: <20210129092209.2584718-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Sat, 30 Jan 2021 11:28:31 +0000
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

Enable dither function to improve the display quality for dither
supported bpc 4, 6, 8. For not supported bpc, use relay mode.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index ac2cb25620357..5761dd15eedf2 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -53,6 +53,7 @@
 #define DITHER_EN				BIT(0)
 #define DISP_DITHER_CFG				0x0020
 #define DITHER_RELAY_MODE			BIT(0)
+#define DITHER_ENGINE_EN			BIT(1)
 #define DISP_DITHER_SIZE			0x0030
 
 #define LUT_10BIT_MASK				0x03ff
@@ -314,9 +315,17 @@ static void mtk_dither_config(struct device *dev, unsigned int w,
 			      unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
 {
 	struct mtk_ddp_comp_dev *priv = dev_get_drvdata(dev);
-
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs, DISP_DITHER_SIZE);
-	mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg, priv->regs, DISP_DITHER_CFG);
+	bool valid_bpc = (bpc == 4 || bpc == 6 || bpc == 8);
+
+	mtk_ddp_write(cmdq_pkt, h << 16 | w, &priv->cmdq_reg, priv->regs,
+		      DISP_DITHER_SIZE);
+	if (valid_bpc)
+		mtk_dither_set_common(priv->regs, &priv->cmdq_reg, bpc,
+				      DISP_DITHER_CFG, DITHER_ENGINE_EN,
+				      cmdq_pkt);
+	else
+		mtk_ddp_write(cmdq_pkt, DITHER_RELAY_MODE, &priv->cmdq_reg,
+			      priv->regs, DISP_DITHER_CFG);
 }
 
 static void mtk_dither_start(struct device *dev)
-- 
2.30.0.365.g02bc693789-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
