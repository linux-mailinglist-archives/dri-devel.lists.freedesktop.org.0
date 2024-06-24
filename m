Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FFA915492
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 18:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C697E10E4D5;
	Mon, 24 Jun 2024 16:44:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hrQJVeEI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0529210E27D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 16:44:08 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4248ea53493so11085785e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719247446; x=1719852246; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uw74zf66DQORFJn85kqFB7s36On7KUi5ywYxV+PBn+Q=;
 b=hrQJVeEI0hIKgBitEgqsodnA1G+RnR0rnpg6svYpMSDzs2+/jZ0c1ejumpsjl/b48j
 llLfJdzxHgQykDZYFob7lm87WuhLfpp+ql7vhZWYjkvG6+KMLibw8uD7GfZHouGJIilX
 2VnMBtjz+Afp1mHB2w1Fc3KY2McKGk/Rd4guKCBDjuQUW+5n8QPmDXx42iaTGKD+MENB
 csyO9uXdfLscNT5+Rh/XCOQHwm1we1s+K211zjmE0KQfLqKNDAMPD6RXIoc6igqr46Ho
 eWGTmyJbvm5m+PKbdawcAoPjVKx54UNvOB2Oz2TmJXfjUCL0M3nyI3utFsvK2bOuBfO3
 6wAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719247446; x=1719852246;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uw74zf66DQORFJn85kqFB7s36On7KUi5ywYxV+PBn+Q=;
 b=oRUiLuZGVYx1TnGSdjX5fdBVVkpYh8ElAq1V02EKJGYZU+BX/OKRqkXH8wl2JK4YdS
 Gp/1z0L5u1byGvsqzv0f8o9b/K3ztHqbZm3tB8+ODamiABAKUuVVCCzgmymAobPwgCYu
 vhTKYt48mR48D4m9PjOz0X5YYRlOYFmi8jRO6HtxrjIhp7sl554CDbFqZUb3/lm0QFiU
 9edC5V9aUb6YoJhL8A7hbeTXfrd4aUYjNXQRFaxaWGjxIK3vKy08gMX8LTQmbORGmAms
 zRbPdEW1e+fqpurJtamUMPeLVedALWBhcVijecvKsRO7fzQu0i95UMj1CwbBkr3bDLgz
 CSrQ==
X-Gm-Message-State: AOJu0Yws0U5fbrVN85MvG+krs4/c1/dNnJmvxSwFSZl/Z/8J8qYj7NWZ
 6+u31X2q4+Hxq6Eej7HlxgC5DEA1+to+tsglKCMHE5lD5SWSb1SI
X-Google-Smtp-Source: AGHT+IFJgazm2qcBXOO1WWxGq23AutwedIYScGjsNMAPrLSl9grCFKoRB3d22V6hGWsVj6fq6F18nQ==
X-Received: by 2002:a05:600c:6ca:b0:424:8dc4:ee43 with SMTP id
 5b1f17b1804b1-4248dc4ef8cmr40224005e9.6.1719247446267; 
 Mon, 24 Jun 2024 09:44:06 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-103.cable.dynamic.surfer.at.
 [84.115.213.103]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42484fc0aecsm126090365e9.12.2024.06.24.09.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 09:44:05 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 24 Jun 2024 18:43:47 +0200
Subject: [PATCH 2/3] drm/mediatek: ovl_adaptor: add missing of_node_put()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-mtk_disp_ovl_adaptor_scoped-v1-2-9fa1e074d881@gmail.com>
References: <20240624-mtk_disp_ovl_adaptor_scoped-v1-0-9fa1e074d881@gmail.com>
In-Reply-To: <20240624-mtk_disp_ovl_adaptor_scoped-v1-0-9fa1e074d881@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719247441; l=1042;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=Y2BB2weXpa+LoCNHgaMdua1IE8aKDXJvx8s/YfYa6MI=;
 b=RAqXlU9Qx0xyXFz5ElRIdZf5wbyhqD1m5J/GrWFrXfBbUzgeeyRE+ciEsRkz6rmFpz1gue41A
 vrubTA59EmVC63CZJ8zl+7GhwXzFo2s4l6d2Ty9wnfS3yvCWNVBinoH
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Error paths that exit for_each_child_of_node() need to call
of_node_put() to decerement the child refcount and avoid memory leaks.

Add the missing of_node_put().

Cc: stable@vger.kernel.org
Fixes: 453c3364632a ("drm/mediatek: Add ovl_adaptor support for MT8195")
Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 1418992311c4..3faf26a55e77 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -522,8 +522,10 @@ static int ovl_adaptor_comp_init(struct device *dev, struct component_match **ma
 		}
 
 		comp_pdev = of_find_device_by_node(node);
-		if (!comp_pdev)
+		if (!comp_pdev) {
+			of_node_put(node);
 			return -EPROBE_DEFER;
+		}
 
 		priv->ovl_adaptor_comp[id] = &comp_pdev->dev;
 

-- 
2.40.1

