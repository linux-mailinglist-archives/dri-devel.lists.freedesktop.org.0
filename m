Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7198B3DDB3
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 11:11:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6651010E03D;
	Mon,  1 Sep 2025 09:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ShGSKhxY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10CD310E03D
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 09:11:32 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-45b77f59bd8so23108805e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 02:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756717890; x=1757322690; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Jtzlsr7MnFg9Y5VOjl2EoljPhue21WUatPCKKyRxvGQ=;
 b=ShGSKhxYSqxY4bPQTDfiKQ9PHNdAO8QfjfqSbBXlOP9GEeza9RBpCGzGfQRECLykEn
 YWXEla/J5I+O9tn10ILVdQfA2UBqjFZWRvHJ9VWTsSd94065EfD0E8FsYzeVBa5N3meo
 0BTH74bac45SAd1JprPnMGYlDMYVDUBM4dP7PqP52l3xH5jKQTfW6onDYvMLdtwAFbOW
 QP9N8fLF+KXldo0yM+D39lpjPTMM6V0LbwlesCtcRtGDw5WZDaL7fIZZLyl7iJ86c4m7
 xlr9IVUT9QCBZyRyC9/8txFACMN38pVWyLsBMbhiltHaANoRnFUkVSlCGUfDiFAvbs8W
 3Iyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756717890; x=1757322690;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jtzlsr7MnFg9Y5VOjl2EoljPhue21WUatPCKKyRxvGQ=;
 b=ucVTnr9MTPipKbOZPso2Zgy3lkN+TFW/TeDUfpo2lPPlacz7O3NuU80nehEKClXYE7
 bLQheigS5/thBp5oEvmgJ36V2b7kHcbcisxeVbj0mn7w0aW5awOiW5mKTKLFDxtzF9kV
 cdN84BOCDxdCfaWKAxROJZxZLDB3H6emITXcDvxQh0qLzP79WnfNsgnonqdNIjXAZX5h
 ycfrpeLywGszJE4i00DiiIYeARkCc7Ar1Qw5GVa38P3B1n0aOcYvrAM5Zj9I/9rME/px
 h5T5bdpvFAaFQErLucwx7Mm7MUdul/6lSx23YapMkjTidBARFTgpjQr0oW/7R1Pg++wp
 YT4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCryWzmOc0rV0PqR2aOExyLiqHcWtxM6z1E3Rj4BJr9C3aOwGqPkOrf4SkO+r6gzsw1Rs0B0chsbU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwsovtsZXLwrmyv9fzxZDVLiUPTYcjvn9CHnDVXeRl5AHmQKNel
 gZhNNLBL094aELoocy+cHUwAKgVk3NSk+N+tiiYbecRzi7wWy7EQMjQT
X-Gm-Gg: ASbGncs0pqXyrwivgaiApGVEgMHqefDXCDqv7LI38/DXY7DSLoOqkCTv3V7dQUzleuX
 oDu6NJ7s5WsMJVDZE57yIhFyVYlAq75yVfH8V+F96qhGvR2eTpjwCzOMS75rJmt6naWH9HYAwiK
 9K2oum9S1yoCXmTDyi4jwiDwQPmw8O9oE79dTbFn5JTLvC7/aX/4ZktUvSPiuV3nvDe5oViQJbZ
 d6B+qruvhz+5rqrVbhjVBUsvsKpH1Q2FRabP3oyImj8Uobp8154X7a6+fVh/aV2VQn4ShdxLiwZ
 o//oKtgjn99BAr57Ayu12y4O4HYFKgTqy2A4kuhsjpTQIxX3+XNEaPNpFB+UFtQqzKmB40qnRbN
 gnFW9olhNKZVuTjNjzFeqllbOeOzV1Ew=
X-Google-Smtp-Source: AGHT+IF89HPh/W7gp3tyZa5ClRJdNdBTtpXKZrbEusjQ0tOtn6D/ZUDJbY4LvRTCQajkSfbWR5bnoA==
X-Received: by 2002:a05:600c:4f4a:b0:45b:8a0e:cdbf with SMTP id
 5b1f17b1804b1-45b8a0ece70mr40139155e9.1.1756717890322; 
 Mon, 01 Sep 2025 02:11:30 -0700 (PDT)
Received: from localhost ([87.254.0.133]) by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-3d60d93b949sm4451045f8f.2.2025.09.01.02.11.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 02:11:29 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: andy.yan@rock-chips.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/bridge: synopsys: Fix spelling mistake "pixeel" ->
 "pixel"
Date: Mon,  1 Sep 2025 10:10:44 +0100
Message-ID: <20250901091044.2450367-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

There is a spelling mistake in a dev_warn message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 9bbfe8da3de0..d9b9739ae3d0 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -1554,7 +1554,7 @@ static int dw_dp_bridge_atomic_check(struct drm_bridge *bridge,
 
 	if ((adjusted_mode->hsync_start - adjusted_mode->hdisplay) & 0x1) {
 		adjusted_mode->hsync_start += 1;
-		dev_warn(dp->dev, "hfp is not 2 pixeel aligned, fixup to aligned hfp\n");
+		dev_warn(dp->dev, "hfp is not 2 pixel aligned, fixup to aligned hfp\n");
 	}
 
 	if (adjusted_mode->hsync_end - adjusted_mode->hsync_start < min_hsync) {
-- 
2.51.0

