Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9635A8520CB
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 22:55:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59E0F10E02F;
	Mon, 12 Feb 2024 21:55:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VKlJW4F8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A18110E02F
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 21:55:47 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-6e09a890341so1502515b3a.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Feb 2024 13:55:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707774945; x=1708379745; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Hsqc1DvmmxB3axNP5BMsYZJAEgwUf5CF4YmTNlqSGbA=;
 b=VKlJW4F8Zu5lVGgBLKKaIp3f+2E5QP2Ru8/6wbY6TYk5j+aVTTUaffycTxeydrc/fj
 EFmHN8rKLY4dMO67JTwYulX7FcN8ifqacI7KaPpm5I2BoZwrQzaOHQ7E/oASJ0rrTLJf
 1kqYeQGeYlkmYvW+1hBe2tn36wtU0/99YTg8/I4mTcZqj2yL67z0ZdmMMWxayqDiP0k5
 kcp+ebI8kLmxLlY2c4dWTVJP5LST9f27GgxKqxIu7M9/anUaH1qayMRYOa0PRcaMCmSE
 C2Hmko2xJGNSwPUkyUVw0ElwVa3PGnFU4jw9E0eIudGQWQPLTM1VRpSlhNk4fr39sLjg
 Dr2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707774945; x=1708379745;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hsqc1DvmmxB3axNP5BMsYZJAEgwUf5CF4YmTNlqSGbA=;
 b=mWD278ENBCeJ1z7ScUcb4qkTngTzK/qgPIlpBcKj4nGl1YhTHomtfAXQyDFpphCRsK
 3EruUZ/UtNVWowKwaPz/6E5S//h2/CnWw8S83Hjvj1UORTcfj40a29XnGo9s77fK4euQ
 hCm8gMrObKKJHeWDSxXCH2Y/WlrmwnuEEMxkqQCPo9hHf5HUIwVy4TogFD+6Q/zte4jY
 h0/vbgUEYLbhYuciEdmCrmrBvNgBGdKst8uiwYI7yXURTWTkpoHv7PDwSHVZqpQj34RE
 MR79QkoYxqQdee24DhofMJPCcrH81W13oua1spiZ06GBi/ya4BaQASl6ezLBl9rNSV+9
 74jQ==
X-Gm-Message-State: AOJu0YwNI1/7fSDTuDnWs66LekoIInU5iDA06Y9xYciZ7S5pynRoPTLv
 h2ZiJHyEdO6i8Xdslow34cfcGF23QzrTwD18Gmtou/b9glg3enfB4Rors9la
X-Google-Smtp-Source: AGHT+IHj0WR5Hcj8YnPlvwL3CWPRbYDSlTvLoG6xlnQ2L0rpNKUIXQY5hf+J5qTYTqzkRqu0OnLLOw==
X-Received: by 2002:a62:8104:0:b0:6e0:ce45:d781 with SMTP id
 t4-20020a628104000000b006e0ce45d781mr4163831pfd.16.1707774945160; 
 Mon, 12 Feb 2024 13:55:45 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCViaMU7RDTULr51gacAoII6GxPSl9070X2jrfpZ4ePcCBd1Goqto+8N6lV2b4AqT324A0uKvwTqU1GRhYPx9NcDC3TlDc/qbwLTe/47kMpxnnyIxnzJnsrkBi4MjXuiKBbTGgfRn6AbD0xett601m4qicEJgBFx4TCt+u8nTWsP2SCKorkkIsu/EqMwJT0CdYQ5innk83OfUJgBcTbRYEZv1JopsOkqCp7y2nmJwNbeloE8TSOF8hSYNKjkyihP7BWjpKnIpkoFUeBhzwhD8bCCUGBN
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 r18-20020a62e412000000b006e03ab56acbsm5977451pfh.217.2024.02.12.13.55.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Feb 2024 13:55:43 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jani Nikula <jani.nikula@intel.com>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/crtc: fix uninitialized variable use even harder
Date: Mon, 12 Feb 2024 13:55:34 -0800
Message-ID: <20240212215534.190682-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Rob Clark <robdclark@chromium.org>

DRM_MODESET_LOCK_ALL_BEGIN() has a hidden trap-door (aka retry loop),
which means we can't rely too much on variable initializers.

Fixes: 6e455f5dcdd1 ("drm/crtc: fix uninitialized variable use")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
I have mixed feelings about DRM_MODESET_LOCK_ALL_BEGIN() (and friends)
magic.  On one hand it simplifies the deadlock/back dance.  OTOH it
conceals a nasty sharp edge.  Maybe it is better to have the complicated
restart path a bit more explicit, like it was originally.

 drivers/gpu/drm/drm_crtc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index cb90e70d85e8..65f9f66933bb 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -904,6 +904,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 	connector_set = NULL;
 	fb = NULL;
 	mode = NULL;
+	num_connectors = 0;
 
 	DRM_MODESET_LOCK_ALL_END(dev, ctx, ret);
 
-- 
2.43.0

