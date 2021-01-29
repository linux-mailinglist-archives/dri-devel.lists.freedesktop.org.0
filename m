Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DE533094C1
	for <lists+dri-devel@lfdr.de>; Sat, 30 Jan 2021 12:28:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C62CE6EC9D;
	Sat, 30 Jan 2021 11:28:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088266EAAE
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 09:22:28 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id o16so6256529pgg.5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 01:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VYKPllHMWXaaXlZ0ycUuc3ILhWc2RI4QmKMXgurARyo=;
 b=jTpgJguT5rc+REw7O6/K0qTwwZVrCE3PjR2qrmceptZeRXHQf1ptuB+EwicOkJQ4jK
 FgMyX0Mjyls5nNcEB64aVPGaHcrKlpd9WFrkafvUu+5fW5f22C2/DRbf/VLQUhZj5LEy
 FxwZD7f+FDj1tRkN+JcM5nGYAtrOxAwiNRm1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VYKPllHMWXaaXlZ0ycUuc3ILhWc2RI4QmKMXgurARyo=;
 b=QOi7I4MIDuu8nZdMz9hqIdFcZgPp49Su4iYTHEBOg+TgM9j+f2q+I4igJwyBUyxShn
 d6jDjnvKLT9QHzYxdRKC9jMzEEQ39S69SLI8pD9aErzM0f+8UL0GKe5T6WsXZsdDrqd9
 g3G5/wZ4mv9CMy3zxFjtI1fY04mtAxMJFU8YHP+Zg/SlEtv4HpMw3NtYCIwDwF5X8Rwx
 xcmMXC33qP4JZKLAll9NlORdjYRNilzREtKZFJSgbDZb0Lb+3ks1JhP84ljNJE8vzYDz
 eep16GIgPZ5FgTEBXxlbh5lR0p3up1sy1f9reFztBm4ZOf9YBNBxvjj/mJPHpp8KAShp
 /36w==
X-Gm-Message-State: AOAM531yqZhLHjOANz9wfoijdWeK6UufJQ2WnDFto2ZVna96UoAacK6f
 d07Jxhtr6U6LJBBD/q4FtVM7kg==
X-Google-Smtp-Source: ABdhPJxXiQyYhzjtAjJjlkwydXVP8/KnjoC5ZcXO4RzEoPq3EErvu/qghbd9CDZ++s6D3E3HYFTf+A==
X-Received: by 2002:a62:1a06:0:b029:1bc:21e:ed47 with SMTP id
 a6-20020a621a060000b02901bc021eed47mr3628536pfa.40.1611912147633; 
 Fri, 29 Jan 2021 01:22:27 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:51f1:c468:a70b:7c09])
 by smtp.gmail.com with ESMTPSA id p7sm8032776pfn.52.2021.01.29.01.22.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 01:22:27 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v13 5/8] drm/mediatek: add has_dither private data for gamma
Date: Fri, 29 Jan 2021 17:22:06 +0800
Message-Id: <20210129092209.2584718-6-hsinyi@chromium.org>
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

Not all SoC has dither function in gamma module.
Add private data to control this function setting.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 6b520807921e3..5092a27ccc28b 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -27,7 +27,7 @@
 #define LUT_10BIT_MASK				0x03ff
 
 struct mtk_disp_gamma_data {
-	u32 reserved;
+	bool has_dither;
 };
 
 /**
@@ -93,8 +93,9 @@ void mtk_gamma_config(struct device *dev, unsigned int w,
 
 	mtk_ddp_write(cmdq_pkt, h << 16 | w, &gamma->cmdq_reg, gamma->regs,
 		      DISP_GAMMA_SIZE);
-	mtk_dither_set_common(gamma->regs, &gamma->cmdq_reg, bpc, DISP_GAMMA_CFG,
-			      GAMMA_DITHERING, cmdq_pkt);
+	if (gamma->data && gamma->data->has_dither)
+		mtk_dither_set_common(gamma->regs, &gamma->cmdq_reg, bpc,
+				      DISP_GAMMA_CFG, GAMMA_DITHERING, cmdq_pkt);
 }
 
 void mtk_gamma_start(struct device *dev)
@@ -174,8 +175,13 @@ static int mtk_disp_gamma_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct mtk_disp_gamma_data mt8173_gamma_driver_data = {
+	.has_dither = true,
+};
+
 static const struct of_device_id mtk_disp_gamma_driver_dt_match[] = {
-	{ .compatible = "mediatek,mt8173-disp-gamma"},
+	{ .compatible = "mediatek,mt8173-disp-gamma",
+	  .data = &mt8173_gamma_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_gamma_driver_dt_match);
-- 
2.30.0.365.g02bc693789-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
