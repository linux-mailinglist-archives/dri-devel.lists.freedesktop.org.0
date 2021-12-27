Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C7B47FB4C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Dec 2021 10:25:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D74B410F349;
	Mon, 27 Dec 2021 09:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 398D810F349
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Dec 2021 09:25:29 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id k64so13201978pfd.11
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Dec 2021 01:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=thF8QMh/Z+UXM664Ky8cQ4mDytOil9avA8P/Uj9RuDE=;
 b=ge4l4vgY7b/2iiTfqKZNts4FrBLc50KW2L+rUl2gqV3gDDriCB42uISLRCQt5qFEwF
 8bH1yEywWOxxslnMdhSbd4uuYkvMNqRKCaevnjH0LoC1pJDJPFvF/uDvk+Q43THtbvYf
 +0oDWDd+YyrhcQ2xehTrQN0hb+Yrgxp591pKRvP8FULq+GmZYary7XWvYpvT/u6vn9J0
 q9fuwOnXVobd70zaoQD8CjbjgX3bjuy3Yj+gIPO/OwaJjd7zDtffunfE2xfDtOgZlJgJ
 ZL7cVQ0+Gx4RbiKRKnGLXTfHVyDjtHmEKsMLV8XzLKUa6uQb2ZXJzwcrWy9pkjZIuS5x
 oJcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=thF8QMh/Z+UXM664Ky8cQ4mDytOil9avA8P/Uj9RuDE=;
 b=ITjY34GfBP6YL83GQjJXM+ywV2UPnmA1+vdBq0JSjYZv6vzPB4+Ax3vo1IY9IVmJ1C
 smZ9C7QbESeH2L9yYyQnLA/iR16x7KdKaviUokjYoBx2YrOUsKirosL2IqOwZucWb2sW
 0FU9uFmStzTaY/tAc2WbYVLsxsX9tj30ci9DnClfLpfUKBeA0CYaOLLGrKDNe6viDcI2
 O4WtLFLmK+XEv/PFM/HL6gKNoSJMlsyzDAeDYHzvJsm9D8Tgu3+pi+rqZo9K0Hvdno+G
 1MN3zjLMGmjvKu7gYmSOa3Pfh1vPOTWEeLaQ65VCGoyEXlwW/ejI9oHQoK0OIaxXi7/X
 jqDg==
X-Gm-Message-State: AOAM5339f/my84MMboB7689leAJzzOtwXyP70I5E97wMJY9SrTMUo1R3
 QJAvDehUtivmRmyelmusQ/YhJLZugaY8jiwD
X-Google-Smtp-Source: ABdhPJwI1HoauXj+E2aeOuXDXBjj/BZXYOy71+hi4sM9eZ4FkcW7N9l1ePob84nwkbZK4FawxOto9w==
X-Received: by 2002:a63:1f5b:: with SMTP id q27mr14881459pgm.608.1640597128893; 
 Mon, 27 Dec 2021 01:25:28 -0800 (PST)
Received: from localhost.localdomain ([159.226.95.43])
 by smtp.googlemail.com with ESMTPSA id 12sm16178442pfm.84.2021.12.27.01.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 01:25:28 -0800 (PST)
From: Miaoqian Lin <linmq006@gmail.com>
To: 
Subject: [PATCH] drm/bridge: Fix free wrong object in
 sii8620_init_rcp_input_dev
Date: Mon, 27 Dec 2021 09:25:22 +0000
Message-Id: <20211227092522.21755-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linmq006@gmail.com, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sean Young <sean@mess.org>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Robert Foss <robert.foss@linaro.org>, Maciej Purski <m.purski@samsung.com>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

rc_dev is allocated by rc_allocate_device(), and doesn't assigned to
ctx->rc_dev before calling  rc_free_device(ctx->rc_dev).
So it should call rc_free_device(rc_dev);

Fixes: e25f1f7 ("drm/bridge/sii8620: add remote control support")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
 drivers/gpu/drm/bridge/sil-sii8620.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/sil-sii8620.c b/drivers/gpu/drm/bridge/sil-sii8620.c
index 843265d7f1b1..ec7745c31da0 100644
--- a/drivers/gpu/drm/bridge/sil-sii8620.c
+++ b/drivers/gpu/drm/bridge/sil-sii8620.c
@@ -2120,7 +2120,7 @@ static void sii8620_init_rcp_input_dev(struct sii8620 *ctx)
 	if (ret) {
 		dev_err(ctx->dev, "Failed to register RC device\n");
 		ctx->error = ret;
-		rc_free_device(ctx->rc_dev);
+		rc_free_device(rc_dev);
 		return;
 	}
 	ctx->rc_dev = rc_dev;
-- 
2.17.1

