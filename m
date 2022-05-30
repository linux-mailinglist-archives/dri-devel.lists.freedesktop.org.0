Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F387F538C14
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 09:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6DE810F465;
	Tue, 31 May 2022 07:41:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F25410E53E
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 14:24:18 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t6so14887938wra.4
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 07:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rUAWdJ1Rf6hO8ecNBUpnATX0ltMJMJR8PSAH4KO8bJM=;
 b=LXAGdGTLAayi/VD6RlJh8cDSac2FGSYcJt/uGESSMobfyQL1XbIq81Ywa+yllK/x2E
 sJAS1Rtf5zCjVFmHW4pfy9Tm5dcA5ZVlkEAgvw2NGpz9WZyyL1fOivsSvW9ytr3I57tI
 +6fjo5tQhXgr2qaexjNggNiuq6T69aTHW9odw2YHwZzw+W6m95HcY+q9sBmorz9c0xYk
 bA0W/CuhgZRg2uQS5Mkr9/Y/bZpmCfybLP6mrXZw7koQ3b+VufvplHhXB5NVUCdaMUoW
 TCkVYinu9AA7khJHktcQJTHSDsPEUzbWColgtl13bs4lm9K4PQIRKfICpI7XOPwBSQPj
 1kIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rUAWdJ1Rf6hO8ecNBUpnATX0ltMJMJR8PSAH4KO8bJM=;
 b=b1gZZVKdXdEpNRQHlB/ddjOwC2QwgCMOTfos1W5ghBPjuYBbRyvwyhPlCV2U+bljFj
 lcGe+Z6XRfg9ISfpww8cXMVe78KojkaSXgsDOmIABeCbbZO4PT0TPaAPbt2cO+aOkSDo
 LB7bjpBFFj3Tw+GBnu4oEulFULcQ2h9y/Z9TzkEtTQP7zbJx4c9L6NYZ8c6qELCHm6w3
 kp1GRSRmjyskQNNtUBaPjrgceD4F/8Lmr8U4MShCWO0Bh5dtT/bcOPYJxcopknQg6Uzn
 l5zVWMHND5GBxTLrUPEE7hvi14UnxGaP67claR8qwiCdRTDoJNb2mCMFRTZp4iKu3fh1
 qOxQ==
X-Gm-Message-State: AOAM530Ekb/Gd7LpSb4FBUKNJzKxLp8kOFmcdIII7eE6GhQfkOWIKsTz
 Y6rxQlN0IC29JwGqNovv5q77+Q==
X-Google-Smtp-Source: ABdhPJwUdn2UEohzLhlkvTp89uivSBFAQcrCfQrdg/myp0CdGWHmaAJLOG8f0NAC612sXpmZ9kB+sw==
X-Received: by 2002:a05:6000:1288:b0:210:154:ea50 with SMTP id
 f8-20020a056000128800b002100154ea50mr21132673wrx.213.1653920656629; 
 Mon, 30 May 2022 07:24:16 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 y4-20020a056000168400b0020d10a249eesm9134310wrd.13.2022.05.30.07.24.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 07:24:15 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] drm/mediatek: fix crtc index computation
Date: Mon, 30 May 2022 16:24:07 +0200
Message-Id: <20220530142407.781187-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 31 May 2022 07:41:20 +0000
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
Cc: Fabien Parent <fparent@baylibre.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The code always assume that the main path is enabled, which is not
always the case. When the main path is not enabled, the CRTC index
of the ext path is incorrect which makes the secondary path
not usable. Fix the CRTC index calculation.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 46 +++++++++++++++------
 1 file changed, 34 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 5d7504a72b11..6f2abfc608fb 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -430,25 +430,47 @@ int mtk_ddp_comp_get_id(struct device_node *node,
 	return -EINVAL;
 }
 
+static bool mtk_drm_comp_is_enabled(struct drm_device *drm,
+				    const enum mtk_ddp_comp_id *path,
+				    unsigned int path_len)
+{
+	struct mtk_drm_private *priv = drm->dev_private;
+
+	return path && path_len && !!priv->comp_node[path[path_len - 1]];
+}
+
 unsigned int mtk_drm_find_possible_crtc_by_comp(struct drm_device *drm,
 						struct device *dev)
 {
 	struct mtk_drm_private *private = drm->dev_private;
-	unsigned int ret = 0;
+	unsigned int index = 0;
 
-	if (mtk_drm_find_comp_in_ddp(dev, private->data->main_path, private->data->main_len,
+	if (mtk_drm_find_comp_in_ddp(dev, private->data->main_path,
+				     private->data->main_len,
 				     private->ddp_comp))
-		ret = BIT(0);
-	else if (mtk_drm_find_comp_in_ddp(dev, private->data->ext_path,
-					  private->data->ext_len, private->ddp_comp))
-		ret = BIT(1);
-	else if (mtk_drm_find_comp_in_ddp(dev, private->data->third_path,
-					  private->data->third_len, private->ddp_comp))
-		ret = BIT(2);
-	else
-		DRM_INFO("Failed to find comp in ddp table\n");
+		return BIT(index);
+
+	if (mtk_drm_comp_is_enabled(drm, private->data->main_path,
+				    private->data->main_len))
+		index++;
 
-	return ret;
+	if (mtk_drm_find_comp_in_ddp(dev, private->data->ext_path,
+				     private->data->ext_len,
+				     private->ddp_comp))
+		return BIT(index);
+
+	if (mtk_drm_comp_is_enabled(drm, private->data->ext_path,
+				    private->data->ext_len))
+		index++;
+
+	if (mtk_drm_find_comp_in_ddp(dev, private->data->third_path,
+					  private->data->third_len,
+					  private->ddp_comp))
+		return BIT(index);
+
+	DRM_INFO("Failed to find comp in ddp table\n");
+
+	return 0;
 }
 
 int mtk_ddp_comp_init(struct device_node *node, struct mtk_ddp_comp *comp,
-- 
2.36.1

