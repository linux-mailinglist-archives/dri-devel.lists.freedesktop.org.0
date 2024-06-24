Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 330EB91548F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 18:44:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18A0D10E244;
	Mon, 24 Jun 2024 16:44:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WiXjVg64";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 802C610E27D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 16:44:09 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-42172ed3597so27116405e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 09:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719247448; x=1719852248; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ved9pZHSLvDLUPYxuu5ADz4/DRMPqTel82rQmFgJsv8=;
 b=WiXjVg64pJZQhl4M0h6g0juYG72H/GLB4Ag3vHAqVHZykQgXOqFELTYoZxRaJvvkLj
 o5vuN6RGZtSib6aV3UsCvZ5QEMMIksxXKXaqnKzGtP240w95HC1qWQpFpjIkrGf25Xvg
 8zr4aAZeOQMkowd7/6p/2+hSyZjTdwSTpSjjVb4K8ksRyYU2YSsh0bw8aqbFFuVC+2QJ
 sXLOV8/efSKeAfeE+hjBVrjaLojG6H4tw6RT4aNQIbDFgMOauadGX464u2tU26uOkqjJ
 fyULM7Fa89qk+fQLoeR5gOHpGranwCtYarp3IFlDnLydyCLXSLrN454h3ANSqht3JUIT
 0AIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719247448; x=1719852248;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ved9pZHSLvDLUPYxuu5ADz4/DRMPqTel82rQmFgJsv8=;
 b=O1939V/chAjNBCePCbDWowjo1c1uhxnTAQy7qVY406k4CPK3bVkBMcuagsZmQhUj0W
 Bjr7QalUBYV7BpfHXLhCSDwz0oraxX91E0n7AGJiwOXAaZoiDgkLkYBHbIEAO1qB2ITn
 XCfi2oxiP6wLVAQUIBHPo/H3AyqnwW5T48ZlPWUiu00+XK7NFp2FiYIS3kn+ZyvY2d4j
 YIekLgjucfOJmIzivuvrYqEjSGhf+pJSWpomBiuph070/ESGyHYp43Xl6EFPPsObYDi1
 fIrzjWmfcc37V0yoRbxQBAEGHVJpr21+xKgLV0J2MbNy4Y3DMBMXMbxp6hgPsP0Y9I15
 no2w==
X-Gm-Message-State: AOJu0YzBVrl2MlsMnsr/60zeHWKtQjjJYgPjLW7iPg3J9Be8Rp9gZICi
 gJX357+ohS2zHXNexZe2lUbYk2paRN8wGTEIyq31fZsjd4pzN0HD
X-Google-Smtp-Source: AGHT+IFxufk+8bZWSFo5H95XETmbIR8xWYc74lh7Lzz8/zakL9+PW+wJ3qLYXaIxadr7Xc+Z3bl8Bg==
X-Received: by 2002:a05:600c:138e:b0:421:805f:ab3c with SMTP id
 5b1f17b1804b1-42489533effmr61514635e9.14.1719247447674; 
 Mon, 24 Jun 2024 09:44:07 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-103.cable.dynamic.surfer.at.
 [84.115.213.103]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42484fc0aecsm126090365e9.12.2024.06.24.09.44.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jun 2024 09:44:07 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Mon, 24 Jun 2024 18:43:48 +0200
Subject: [PATCH 3/3] drm/mediatek: ovl_adaptor: use scoped variant of
 for_each_child_of_node()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-mtk_disp_ovl_adaptor_scoped-v1-3-9fa1e074d881@gmail.com>
References: <20240624-mtk_disp_ovl_adaptor_scoped-v1-0-9fa1e074d881@gmail.com>
In-Reply-To: <20240624-mtk_disp_ovl_adaptor_scoped-v1-0-9fa1e074d881@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719247441; l=1676;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=wa0T80IF/y+nnAamP5x5ocsqIEtI9E9JOf3ilDfD1yo=;
 b=M9kK0ImZkRyD1NOWZet5N+FhNkzhbstvrwy7I96XW9Qwjr5TGDy8zsCLgzUzrxPsLZTtpED/X
 cFIZmEu7appC+67/uzXN9oG5FM74e5jHbRgj7YIRdMdBI8ar0b/8ytM
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

In order to avoid potential memory leaks if new error paths are added
without a call to of_node_put(), use for_each_child_of_node_scoped()
instead of for_each_child_of_node(). The former automatically decrements
the refcount when the child goes out of scope, which removes the need
for explicit calls to of_node_put().

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
index 3faf26a55e77..aec927cce468 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl_adaptor.c
@@ -493,12 +493,12 @@ static int compare_of(struct device *dev, void *data)
 static int ovl_adaptor_comp_init(struct device *dev, struct component_match **match)
 {
 	struct mtk_disp_ovl_adaptor *priv = dev_get_drvdata(dev);
-	struct device_node *node, *parent;
+	struct device_node *parent;
 	struct platform_device *comp_pdev;
 
 	parent = dev->parent->parent->of_node->parent;
 
-	for_each_child_of_node(parent, node) {
+	for_each_child_of_node_scoped(parent, node) {
 		const struct of_device_id *of_id;
 		enum mtk_ovl_adaptor_comp_type type;
 		int id;
@@ -522,10 +522,8 @@ static int ovl_adaptor_comp_init(struct device *dev, struct component_match **ma
 		}
 
 		comp_pdev = of_find_device_by_node(node);
-		if (!comp_pdev) {
-			of_node_put(node);
+		if (!comp_pdev)
 			return -EPROBE_DEFER;
-		}
 
 		priv->ovl_adaptor_comp[id] = &comp_pdev->dev;
 

-- 
2.40.1

