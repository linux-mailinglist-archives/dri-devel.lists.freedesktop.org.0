Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5934C77AA
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 19:26:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A066A10E19B;
	Mon, 28 Feb 2022 18:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A957E10E3FA
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 18:26:14 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u1so16805944wrg.11
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 10:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NM2ZhSOgeRHdN1vkJcDiGjO8C/zSOTco+Z9Yb+OtTAU=;
 b=azouk0SiCDcaOY3VkjJqxF9J1KvwFRFzKYCQ476RROqMAaaYNQ7Llb33rcrRmUkIdI
 se/BkXGpPXRTF01eIwZF9604v1uwjpwIZ0XrECxqeF0RS5SXiPzOTRQ0/CkELjlOxbih
 noyocMKO/JixaYB8L2xbLszjTdmf4GDk8ssD98jnMmxy2WjCYiCi7EjoQRroiSLGRQ44
 IyKnHHQZhtstmV6oZO2PUYqtQgxWXPhbuxvRx0rs/4jlCtJNrlnf2PqmERRVkPs6wHqB
 29qTfYq+TGM8p/ei4G/dkPzUnDwE3Q2KQ+TWUMmlPpFmHvztyQ67qzA8/b+lcccji2kH
 0btw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NM2ZhSOgeRHdN1vkJcDiGjO8C/zSOTco+Z9Yb+OtTAU=;
 b=2rgwEDtLqYHjp09r1Min2RSqlStdZYC8ekx1c3ZNwRQpCVY9k8ohjw564vmSozodk4
 aahsvCwecQwUkgQKWsq8K4WWH8BLVScs65nf+dqr20EpyjqizlHHVZMv57WfzrFqfpNe
 ZS7qSZeWqrb2/JifeMoYLF1LoTj2WWcxA7JtQLugQihVPrzzmWQE6KxTMjKcsNSL+QuG
 0bHjUFN1hBl67FI6nSrG4vLABpk5/zc7c0Rb4kSWpAo3WfA9GsG7uTDRLc+vpl+DiQ5j
 CyruoCXwF3UfRG0mqKaxYtxKWlj+LhLlp3IJy2iBT172ThZTQLY21lYws2ugoeY/wdrn
 rllQ==
X-Gm-Message-State: AOAM532iljNOZEV6H5lVAj2pQF60boXvHh4II3Dxr+oI6Th31u02Z2Yz
 uIlmgXSRFege0fFX5D3e/LM=
X-Google-Smtp-Source: ABdhPJxQtBUWZoIjif+v/uhsqfy9wl/Eoo6gd2uZzb0YEfp2Y9hJpppW6JLB/diOkKfjPK3QGN/LBg==
X-Received: by 2002:a05:6000:1866:b0:1ef:8a14:ab6a with SMTP id
 d6-20020a056000186600b001ef8a14ab6amr8856121wri.12.1646072773210; 
 Mon, 28 Feb 2022 10:26:13 -0800 (PST)
Received: from localhost.localdomain ([94.73.33.246])
 by smtp.gmail.com with ESMTPSA id
 q11-20020adfcd8b000000b001e320028660sm11099011wrj.92.2022.02.28.10.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:26:12 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: andrzej.hajda@intel.com
Subject: [PATCH] drm/bridge: nxp-ptn3460: switch to devm_drm_of_get_bridge
Date: Mon, 28 Feb 2022 19:26:00 +0100
Message-Id: <20220228182600.22463-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: jonas@kwiboo.se, airlied@linux.ie, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function "drm_of_find_panel_or_bridge" has been deprecated in
favor of "devm_drm_of_get_bridge".

Switch to the new function and reduce boilerplate.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/bridge/nxp-ptn3460.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index e941c1132598..1ab91f4e057b 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -263,7 +263,6 @@ static int ptn3460_probe(struct i2c_client *client,
 	struct device *dev = &client->dev;
 	struct ptn3460_bridge *ptn_bridge;
 	struct drm_bridge *panel_bridge;
-	struct drm_panel *panel;
 	int ret;
 
 	ptn_bridge = devm_kzalloc(dev, sizeof(*ptn_bridge), GFP_KERNEL);
@@ -271,11 +270,7 @@ static int ptn3460_probe(struct i2c_client *client,
 		return -ENOMEM;
 	}
 
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &panel, NULL);
-	if (ret)
-		return ret;
-
-	panel_bridge = devm_drm_panel_bridge_add(dev, panel);
+	panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 0, 0);
 	if (IS_ERR(panel_bridge))
 		return PTR_ERR(panel_bridge);
 
-- 
2.25.1

