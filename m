Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A469199EEDB
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 16:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FCAE10E58E;
	Tue, 15 Oct 2024 14:10:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LQjA6VEe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28FCD10E58E
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 14:10:16 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-430ee5c9570so63995115e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 07:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1729001414; x=1729606214; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=d0S6YMoGPkQS3jMGBGZ20kgoq+vZUxOnC0t6FsdhxLU=;
 b=LQjA6VEel7SoW2aF1xZiD9VLLmyCx5j5tM6j3595d74zMVQziz5Cy/nSY85b3zyjyS
 F2tU8cRfD30KgQ3rkQAbAAsLqz5iAq8DWV1q4N3DuebMFrJbBNoD+AoXfVnQtItRkTOB
 55zQqIZF3FmmodK2e8X2a+wi/3cKaW6j5R9hoV43gsLqEPsBStU22SuevYWzjyHsJv4e
 s+bfuHC+Ylr1mnse0p7KXy+golkk0RIJFoVF1l1eVZKmPSRI/UeCnjMv7Bi2B2fdVnZW
 QM0x0amioX4uZZdD0CbnX6Rw20a1FnMrRxgQsb+U889xUs8P1CkAUA5ximsDmSU9/mkf
 fRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729001414; x=1729606214;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=d0S6YMoGPkQS3jMGBGZ20kgoq+vZUxOnC0t6FsdhxLU=;
 b=UAMtKXdUoObnP6I53TAVaMMk8z/fzM1oWsFNG4kD7TilbB4X6Afh25+zuiHyvwLAeK
 x0ZITb9b+2qWPC8Jyd4Z9102gaLQOb8PJC1EcirD4z0pEqD6yg9sZ8Wz1e3bgS6kN8wQ
 JpmjEVAFtq6thbd65kAKEdDFzZFZ0F2uQq7PmuferxxIifBUS5snYdZhFQba80H81Jc4
 fQngnfaCI8WcCU71Y603ma97qx5dRHCq98HlRTc2+BWHu+9Du56937Viz5yxwizvntx3
 oXyytr1hlDdYmM1UMBsrN0jdclU/2//lWSIAZvKsSleioVhr8v5Sn5p8J8tLoukdp3B1
 xOJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUvVkyAYsds+vcuk2sIzqV3Xqt2rqFP4VIdvFat09E+/FZ/EZbQS1acJb4USgVb0PJtnpHUPxmV08=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxiPsCzNXx/Aq4JpPG/qy5zqYnNTx3X42479SsZXHU/yg/c+BNR
 TpcQffpwJBc6pKIbvcM+Ibl1F0YVS9AhkzFUFmrGN4w2CZStllXd
X-Google-Smtp-Source: AGHT+IHp4e5RHLdoduJkY+KzguH7RjGzLSJHN735+mjgkEary+e1KlddLzkEUjNNgR+FRgq+djFEUw==
X-Received: by 2002:a05:600c:3acd:b0:42c:df29:2366 with SMTP id
 5b1f17b1804b1-431256166e5mr131924165e9.33.1729001414085; 
 Tue, 15 Oct 2024 07:10:14 -0700 (PDT)
Received: from localhost ([194.120.133.34]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4313f55defbsm19257855e9.7.2024.10.15.07.10.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2024 07:10:13 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] drm/omap: clean up error exit path on omap_encoder
 allocation failure
Date: Tue, 15 Oct 2024 15:10:12 +0100
Message-Id: <20241015141012.155559-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.5
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

Currently when an allocation failure occurs for omap_encoder the exit
path will destroy encoder via omap_encoder_destroy  if it is not null.
However, encoder is always null at this point, so the check and destroy
is redundant and can be removed. Clean up the code by removing the exit
path and redundant omap_encoder_destroy call, and just return NULL.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/gpu/drm/omapdrm/omap_encoder.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_encoder.c b/drivers/gpu/drm/omapdrm/omap_encoder.c
index 4dd05bc732da..a99022638a2c 100644
--- a/drivers/gpu/drm/omapdrm/omap_encoder.c
+++ b/drivers/gpu/drm/omapdrm/omap_encoder.c
@@ -126,21 +126,15 @@ struct drm_encoder *omap_encoder_init(struct drm_device *dev,
 
 	omap_encoder = kzalloc(sizeof(*omap_encoder), GFP_KERNEL);
 	if (!omap_encoder)
-		goto fail;
+		return NULL;
 
 	omap_encoder->output = output;
 
 	encoder = &omap_encoder->base;
 
 	drm_encoder_init(dev, encoder, &omap_encoder_funcs,
 			 DRM_MODE_ENCODER_TMDS, NULL);
 	drm_encoder_helper_add(encoder, &omap_encoder_helper_funcs);
 
 	return encoder;
-
-fail:
-	if (encoder)
-		omap_encoder_destroy(encoder);
-
-	return NULL;
 }
-- 
2.39.5

