Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BB5990728
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 17:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6597710EA35;
	Fri,  4 Oct 2024 15:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S6j33G+Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9355410EA35
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 15:09:14 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-20b6458ee37so25621345ad.1
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Oct 2024 08:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1728054554; x=1728659354; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Fa7E4EUymtfN4KRPnka0562XBK8R6gqCQBvfGcUm6b0=;
 b=S6j33G+ZwVHKJt+/VEuVKXynbBqz0xlDsmHWeV1NzW51Yhk+PqstQtQTcyXjus/Ewa
 LghAXHdi/kP1rdmz9/AVwIsWhPfaqqNgSDzaUMVlQ32LfhJS4bYOWZv4nT0MnZJpW+AG
 u8WJsAp6SJAL4dSgPhovtX4qBJYE3ONT5rBpKF8PtFIyX2JMQ924/Yiucos18Jte+1QT
 +5IgrJ79XB3I25wSByokAPiKjkBe569RL0AzmApstw8dYTFRCf5+gIkvGKh09JlPl5mw
 cfSTGDYjZaWpiF6yk8SBlPX9XY5UnsD5GF5A0HKc5PhPYRRR1wfrVnlf+lzcX4b88P88
 QFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728054554; x=1728659354;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Fa7E4EUymtfN4KRPnka0562XBK8R6gqCQBvfGcUm6b0=;
 b=f3Yi6pBwFUTAr5yNVJIK0FNHJkDD2MNgYgHAEe5GCuU0Q+eOuuHRHxp1OGQiMOLzly
 Xb+8czr9MsoXg+m0YVa7dI2vcPyJsznbutX0TqkH3YQfsmd8eP13w7NsuNN4BqcUsW3x
 9ouPUjsG9amuXbtvaVkJYvloDFJ2tbBcR89l5K3h58iannOD2/P9+zvxlrDNkjKYy8Rz
 HwZStITjxNXK89t/bCc5JQQrx1BtMygS0jCiZlDe3ju6bIJUyhSzQKnQIKuxh9xkV/RR
 mlbZ/6IuEQWpukfOzVPbvF29dir9c8514mRhpgWl01Np2RCC38+8QxwMoFTs6zi+fKKK
 lzuw==
X-Gm-Message-State: AOJu0Yyii7IB2gFJ6h7SE2d+m18Zv+b326yHbETdbS1AKrQErePYw2l3
 SnFnkGFLkC2yWCeBHl4bId/XKQtzErc5sRwNqBJi5nuFGaDDdg16
X-Google-Smtp-Source: AGHT+IHqT4WwRtTWnbphT/hdIJs+bGfTdngKVlLEJIWAIBZgE8nozehC5fPrEF0vNA1zmLCvXqEaSQ==
X-Received: by 2002:a17:902:d2c9:b0:20b:4862:425f with SMTP id
 d9443c01a7336-20bfdfff453mr44987885ad.27.1728054553981; 
 Fri, 04 Oct 2024 08:09:13 -0700 (PDT)
Received: from advait-kdeneon.. ([2405:201:1e:f1d5:cc2a:fef9:63f0:2e09])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-20beeca14a6sm25352775ad.86.2024.10.04.08.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Oct 2024 08:09:13 -0700 (PDT)
From: Advait Dhamorikar <advaitdhamorikar@gmail.com>
To: Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 anupnewsmail@gmail.com, Advait Dhamorikar <advaitdhamorikar@gmail.com>
Subject: [PATCH] drm/atmel_hlcdc: Fix uninitialized variable
Date: Fri,  4 Oct 2024 20:38:49 +0530
Message-Id: <20241004150849.70883-1-advaitdhamorikar@gmail.com>
X-Mailer: git-send-email 2.34.1
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

atmel_hlcdc_plane_update_buffers: may use an uninitialized
sr variable when the if condition remains unsatisfied

Signed-off-by: Advait Dhamorikar <advaitdhamorikar@gmail.com>
---
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index 4a7ba0918eca..4150c4d0b4f2 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -559,7 +559,7 @@ static void atmel_hlcdc_plane_update_buffers(struct atmel_hlcdc_plane *plane,
 	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
 	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
 	struct drm_framebuffer *fb = state->base.fb;
-	u32 sr;
+	u32 sr = 0;
 	int i;
 
 	if (!dc->desc->is_xlcdc)
-- 
2.34.1

