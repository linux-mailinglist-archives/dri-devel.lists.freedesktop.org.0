Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8F5C18AAE
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 08:23:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8A7D10E168;
	Wed, 29 Oct 2025 07:23:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="W0hM6lkx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77E0610E168
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 07:23:24 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-7a27bf4fbcbso5851812b3a.1
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 00:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761722604; x=1762327404; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w7WzjBbcIkMp9vE4EpjCxo/Q8IBE8WxTrpS4XkHUl5o=;
 b=W0hM6lkxFY0bzuSEVEFmEL6IjiuGCWxk5y9RhqTYCQLsXuxqfyTZeQRQU+XqXFrJXF
 Q5ZG12g9c0Nf9sB1TNKSeWKgi33YCaae64alZKaIQtKdIsxt4mSSy5dlfqpK/o2mUVQB
 f+DEh5suZtvTtZkMeYcCTOCf2AH/c4+JU8BBkclPEUm8tz9uvfb1ckYfFQKqlAUu8iSE
 qOm0y943w4I3suSya3TVh6vfTsCdWCQCTDe+mMsswb79VN/PFIWIsqxYFfHrd8TkZ89z
 PCsW64sPK6Ta4TVR70X/ykNXykKROEjJ7qq3brxbcYYLJLwFebA2DigHQU+kgFOa+hsI
 +tHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761722604; x=1762327404;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w7WzjBbcIkMp9vE4EpjCxo/Q8IBE8WxTrpS4XkHUl5o=;
 b=IfYXcG34D/y8TSZOYicu3Lryxz+8vklFcAA+ncw0cddq5bawsDE9LmMZ7HWYS30n9w
 D3aeMtKQEnHTlA5PKEEBEmPe+dmBszv5wxNYe5LaRdejsySEONAxojGg1wL6GGx74UGD
 zRkwlEPJGujWgegJ502GauOhuf+dOR7FbiIWwuhaIO80CgyRhLfUt/yXp4Qi7WK4+Xxl
 VsWmS7MDMxCasF6eoq6NKVYZ/Hi5EoGVFq0OoCprZ9YQ4rByduxdtEmObWCwPoK9+p+x
 cZ4kgbZVgIndcT1NdairW4EPekfZ1ah6HkyJDMF6d/+GsJ+J0oft/2jo1I4PqcNHHyM9
 e1dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTmzUZBsV4w+mKX6ncTOuzb1PJAo5MQmgO8UgKC7VKcG7t/BZ2uJR2jpx2Q9D982A9GgLZBu4ILIE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuTrynpwE9mVfXLj2woCjjk+JuIypFPtcnmojp3mBV9+EyJboq
 mYxP+3j77W067FrbI5Gp4LfnlLTHUNxhHWq1Fo2/mfhlg9fgAzehnEbG
X-Gm-Gg: ASbGncsk1k3M0N8WntrvOG6d5OqtlycyBAvI4eEcuuZxKP16m+0mNLUeGOEM/hJ/Fgn
 ZPB7u8ySFBih5WJYqJ6i9bFrC9p52ny4GkzvMQhDW7zvkO23Pzw4PSErMf5b2rF+qbjmD+5qSmU
 gCtMzsKJSyF9uZhLXGBeH4+8NYzn2554hYE/AaJchhtyyyQ0RVGMqiGUOMgJZzVd624x52jrGxP
 bpL6XZu4swUgQvDC2zvhvyZwtJuPQzWtwQ+8dPrZqiIJTV3JoMdJAfP/PMrvWB9E9uwsYnSltro
 5k0VpA+u9wnh6gx+ocX09RDAqEFDiGMAfAMJ1n4Y+lznxTM9fVdJ4koqgy240cvJeIs4HwnscQP
 ipt/jpYR9ivQH37UqnT2LAoFxZgYtcXYuivuLm9GM8SkCSOyWL66O74bEhlgQB0NP905puHXWmD
 QQBefbnG2I90CoLWOSjY6JlA==
X-Google-Smtp-Source: AGHT+IFyoTqxEaHdHcYwG2j5PoXFVoRtIyJkYmXJKSPfYslsy5ZMiSdta/UGyBhYN4fJfCWD+fCbVA==
X-Received: by 2002:a05:6300:218c:b0:341:6c8a:5218 with SMTP id
 adf61e73a8af0-34655401460mr2197446637.56.1761722603774; 
 Wed, 29 Oct 2025 00:23:23 -0700 (PDT)
Received: from localhost.localdomain ([124.77.218.104])
 by smtp.googlemail.com with ESMTPSA id
 41be03b00d2f7-b71268bdb2dsm13021005a12.5.2025.10.29.00.23.20
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 29 Oct 2025 00:23:23 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>, CK Hu <ck.hu@mediatek.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Guillaume Ranquet <granquet@baylibre.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: linmq006@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH] drm/mediatek: Fix device node reference leak in
 mtk_dp_dt_parse()
Date: Wed, 29 Oct 2025 15:23:06 +0800
Message-Id: <20251029072307.10955-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function mtk_dp_dt_parse() calls of_graph_get_endpoint_by_regs()
to get the endpoint device node, but fails to call of_node_put() to release
the reference when the function returns. This results in a device node
reference leak.

Fix this by adding the missing of_node_put() call before returning from
the function.

Found via static analysis and code review.

Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
Cc: stable@vger.kernel.org
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index bef6eeb30d3e..b0b1e158600f 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2087,6 +2087,7 @@ static int mtk_dp_dt_parse(struct mtk_dp *mtk_dp,
 	endpoint = of_graph_get_endpoint_by_regs(pdev->dev.of_node, 1, -1);
 	len = of_property_count_elems_of_size(endpoint,
 					      "data-lanes", sizeof(u32));
+	of_node_put(endpoint);
 	if (len < 0 || len > 4 || len == 3) {
 		dev_err(dev, "invalid data lane size: %d\n", len);
 		return -EINVAL;
-- 
2.39.5 (Apple Git-154)

