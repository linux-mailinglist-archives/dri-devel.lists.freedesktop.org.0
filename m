Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B44030B9AC
	for <lists+dri-devel@lfdr.de>; Tue,  2 Feb 2021 09:27:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 41E736E8E5;
	Tue,  2 Feb 2021 08:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E9A6E452
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Feb 2021 10:37:45 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id 8so4398961plc.10
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Feb 2021 02:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f1Znj6OivgMAdlpTmZtNwTUdHVfyjxsrVrIZX5cgCQQ=;
 b=IqbgFDU6SacFk6Q8JhPBEmJAFEhQ/ymT7/a8vm5CwjxqaAZiCdjM+NOcurbcxqQ5Em
 k6XTuW9LT9nueisEfNgpM6C5CLLJNjFSxsR/83UNv9pxyCjJO6Bo9FQHaFO7RQrV2XbU
 mt8sp5rv8iPsrJXjVhBU01g7iGOjHB7qlDEsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f1Znj6OivgMAdlpTmZtNwTUdHVfyjxsrVrIZX5cgCQQ=;
 b=moPZboxb48Ko/Np17SA5ZDL5s31dtc0geREQw0QNDCphQBaEpPQ/4KCOky9lD3aYx1
 5zUoGiZtIA8c6yiUKQbfz+LQ+67kHs3OxrEODzU1S5DRVQ2Y2O5D5A7T+17n8iwYJZ74
 UOKaclO1euFYU+lKxGO5ngIcBpH16KJe2W54EB+/ZchN0bbBuYfWONxRUqdkzQfi36Uf
 G0LEv63r9DrB8LavHxWS5WOSyPx9SazCZg1k6qajex8lW0aFNYtFmt85iWpBAfaRyd36
 xRymKgwnsg7N3iIQ038/gdgo6I4eAGSn67vmtI3HFZO29a4+kQa2GT9O3WrsXWLbZjgu
 Bthg==
X-Gm-Message-State: AOAM530W/vhDyHdjYaX0rFf4BxqYrb/fJkmT8huvbPcU0fS5NchjHxd8
 GSvFXPITNeAO5FDT3fu+AImKImnSp6v6UQ==
X-Google-Smtp-Source: ABdhPJxGUkkAe7tJYEX6+fmpVDu6k+JrucNgsMp+k/qXCq7PXx13UGJgUbgz79Nopoo1YkUnJH/rfg==
X-Received: by 2002:a17:902:b206:b029:dc:1f41:962d with SMTP id
 t6-20020a170902b206b02900dc1f41962dmr17350708plr.28.1612175865282; 
 Mon, 01 Feb 2021 02:37:45 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:a0cd:1b84:6d56:68e1])
 by smtp.gmail.com with ESMTPSA id 76sm17610356pfz.174.2021.02.01.02.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 02:37:44 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5 5/8] drm/mediatek: Fix ccorr size config
Date: Mon,  1 Feb 2021 18:37:24 +0800
Message-Id: <20210201103727.376721-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210201103727.376721-1-hsinyi@chromium.org>
References: <20210201103727.376721-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 02 Feb 2021 08:27:00 +0000
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

Fix setting to follow hardware datasheet. The original error setting
affects mt8192 display.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 6ee2431e6b843..6c86673a835c3 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -65,7 +65,7 @@ void mtk_ccorr_config(struct device *dev, unsigned int w,
 {
 	struct mtk_disp_ccorr *ccorr = dev_get_drvdata(dev);
 
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &ccorr->cmdq_reg, ccorr->regs,
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, &ccorr->cmdq_reg, ccorr->regs,
 		      DISP_CCORR_SIZE);
 	mtk_ddp_write(cmdq_pkt, CCORR_ENGINE_EN, &ccorr->cmdq_reg, ccorr->regs,
 		      DISP_CCORR_CFG);
-- 
2.30.0.365.g02bc693789-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
