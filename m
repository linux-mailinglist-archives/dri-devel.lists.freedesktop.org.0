Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDE999AC90
	for <lists+dri-devel@lfdr.de>; Fri, 11 Oct 2024 21:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77E1D10E1E1;
	Fri, 11 Oct 2024 19:22:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jto2iA9u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9572F10E1E1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 19:22:27 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-37d39d9f782so1467871f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 12:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728674546; x=1729279346; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=m894EEj8MKVIaKel5D8cwxspY83xIoj8l4L9T9MgTMM=;
 b=Jto2iA9utD7mtd2vCtbss1KD2j3uIEzw49XnW0gPD8ssDig4oQ9bC2AoZcwWGogQoa
 r2oaLhPFfVBaIwyz5lAAcxftt/kr0wq8+Y70KNxujAiwD7fSRVpq94vjuJXAryli8Pzc
 fZT/Nlepx+7yDUsTT7AoCW1KsXYMarkLC0hnRisdBczy445YbIi/66GmN+/jYv2RwMYc
 M8Co+J7rbXXjyRri2MqDPxS6WM9yKvf/DqwA4bbcPQp3g9nv0FBD6vNGcpswvUnWxePC
 50bgZl3SN+bTNAuT6L4n34TCe3A+BXvLtnqwzqZ6ckya+50t/G/disUBcXz0jv4s+NQy
 KF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728674546; x=1729279346;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=m894EEj8MKVIaKel5D8cwxspY83xIoj8l4L9T9MgTMM=;
 b=QR+tKogSMbpSd0FYUCAtsZ2RGg9ay0knJiKnZIh4zHSzqn7A7RoGmOFS3bc6rTUoPt
 bAoSdMJMnMfrbo9nJHl3PcphFiB1SXlfLF7/QxUdCxBnlsPrKQ+/0V29B5wYADjY/7qZ
 JynElD276kDa5hE0aGQNaQl9itiw+n9WfdpvMuBD+CrVlvUnHWhtCw7aGgV4e4Fui2Dd
 TxoktaacNcIN7mUUBdt4PfzicbeWLzDECCfpmNdEdJI6WsYQGrVhoszFUgY4qMazzD++
 xTOo3QocZYCDT4vxre12K+9KM+yuJW2Bbd10Ih1XeudPaI6M3tC6QyQvE1rs/wHfve7U
 FLYA==
X-Gm-Message-State: AOJu0Yx8jtoITL29Co1zOA5JrVCDwLjv3ud0q1yUYeSEoejak9IG5427
 RuSk9fbFaCULblNOJXYR8jmcbE/pSlvyB3GG7qdgAqG28PMteQIe
X-Google-Smtp-Source: AGHT+IET3Ck++IAbg8SE1O1j1TEiGtDgB9CXJmSO93us894bSYi9oAhFM+9i9y/jH/CFuKjQZAnQuA==
X-Received: by 2002:a5d:4082:0:b0:37d:4d3f:51e9 with SMTP id
 ffacd0b85a97d-37d5ffb98b0mr440582f8f.40.1728674545757; 
 Fri, 11 Oct 2024 12:22:25 -0700 (PDT)
Received: from [127.0.1.1]
 (2a02-8389-41cf-e200-55c0-165d-e76c-a019.cable.dynamic.v6.surfer.at.
 [2a02:8389:41cf:e200:55c0:165d:e76c:a019])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b7ee49bsm4581663f8f.100.2024.10.11.12.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2024 12:22:25 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Fri, 11 Oct 2024 21:21:52 +0200
Subject: [PATCH 2/2] drm/mediatek: Switch to
 for_each_child_of_node_scoped()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241011-mtk_drm_drv_memleak-v1-2-2b40c74c8d75@gmail.com>
References: <20241011-mtk_drm_drv_memleak-v1-0-2b40c74c8d75@gmail.com>
In-Reply-To: <20241011-mtk_drm_drv_memleak-v1-0-2b40c74c8d75@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, CK Hu <ck.hu@mediatek.com>, 
 "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728674541; l=1436;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=NIQyalFfWvXbrf5QDhsF9KSVr5abtwUFulTgkzyXOgM=;
 b=rbU7FqAOUJAaaOiSLWdKxgwrbugJ/grvJuThgHTtqrrqNwfI9iTGPlHUx/XB89McOBEJe5dBu
 yJhiWoNOe+BBmCJt5qEWcN0JkOJoUYWYGOxcxUVTsX0PA3p8LqE99pX
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

Introduce the scoped variant of the loop to automatically release the
child node when it goes out of scope, which is more robust than the
non-scoped variant, and accounts for new early exits that could be added
in the future.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 0878df832859..9ab656b10a49 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -372,12 +372,11 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 	struct mtk_drm_private *temp_drm_priv;
 	struct device_node *phandle = dev->parent->of_node;
 	const struct of_device_id *of_id;
-	struct device_node *node;
 	struct device *drm_dev;
 	unsigned int cnt = 0;
 	int i, j;
 
-	for_each_child_of_node(phandle->parent, node) {
+	for_each_child_of_node_scoped(phandle->parent, node) {
 		struct platform_device *pdev;
 
 		of_id = of_match_node(mtk_drm_of_ids, node);
@@ -406,10 +405,8 @@ static bool mtk_drm_get_all_drm_priv(struct device *dev)
 		if (temp_drm_priv->mtk_drm_bound)
 			cnt++;
 
-		if (cnt == MAX_CRTC) {
-			of_node_put(node);
+		if (cnt == MAX_CRTC)
 			break;
-		}
 	}
 
 	if (drm_priv->data->mmsys_dev_num == cnt) {

-- 
2.43.0

