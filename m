Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAE8986A24F
	for <lists+dri-devel@lfdr.de>; Tue, 27 Feb 2024 23:19:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15DDA10E97E;
	Tue, 27 Feb 2024 22:19:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="QzcDkQqB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com
 [209.85.214.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B1510E97E
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 22:19:53 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id
 d9443c01a7336-1dc1e7c0e29so25475785ad.1
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Feb 2024 14:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709072392; x=1709677192;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=siqoqedRmX2wPOUVHojbCwdAvexAbFGkcd6CPRaGDIY=;
 b=QzcDkQqBnaT4aaUdZS/I8UHYfniESbjhI0gammVvvreWm1KeBF731Hb67Ro1XWerYj
 qRgtM4jKkV2EGvNdyoHrTZLswujf2Ok129Dd5GIUl6VPRjkL3ORyOLtBkS8bnKQzuaOJ
 8U9/I2Rmi3+VTTfuLT0jlt5SnuNOQMWXFSy+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709072392; x=1709677192;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=siqoqedRmX2wPOUVHojbCwdAvexAbFGkcd6CPRaGDIY=;
 b=YoUfZpHFZFNl/N6SllwQkjg8J9ttWFfxaG/z8YysXWOU4kIahoqcd6+VbjT9tI6t0+
 vzrcjPqNpIMosW1Qsb91621HfiHtCLWQo9mdruCjsW5FnnkBNUGRjPDOFsQFPvDhZPlh
 OCOQd+7MsHzPp6EqAlFnLbTJbsWYlK8E3OhM6Bys1Q0nX/Kx3VLvTiAZAyHolalrgYP2
 XpL36YePmAN6KI9+FH9FzNko7zIG97dcT9hN5QmZAT4z5450se9YBNWMRdJL1ADufq7j
 /Y3lJpXq6hzcd4xRDtFD5xw5L0o2fKyyIyRETQpX77xq4OP+b+MPm2/aXETRQdVblsaV
 RHfQ==
X-Gm-Message-State: AOJu0YxmbQ9+tVGIqvXoZqxqsBx8tBq5deE53VULaPlSSnzV2FT2Rzys
 V+yobB8EiuSAXm9n8LiO5k4LY253hdqU2fHiGdTOGL5usH/rVEWq+ZE0Wud7cBZIQNaBXPhLQfF
 qcFN/
X-Google-Smtp-Source: AGHT+IH1lcjzhqQizUXuOPIrr9G1+WlHe9Wkmz7qQRPWhtBpFB1p3i5u5gHC00NhNR/XxtpIWOdy9g==
X-Received: by 2002:a17:902:dac6:b0:1dc:c445:b253 with SMTP id
 q6-20020a170902dac600b001dcc445b253mr1771550plx.36.1709072391882; 
 Tue, 27 Feb 2024 14:19:51 -0800 (PST)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:ff74:aba4:ea8d:f18e])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a170903104d00b001dc78455383sm2006780plc.223.2024.02.27.14.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 14:19:51 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org
Cc: Rob Clark <robdclark@chromium.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Sean Paul <sean@poorly.run>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/udl: Add ARGB8888 as a format
Date: Tue, 27 Feb 2024 14:19:29 -0800
Message-ID: <20240227141928.1.I24ac8d51544e4624b7e9d438d95880c4283e611b@changeid>
X-Mailer: git-send-email 2.44.0.rc1.240.g4c46232300-goog
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

Even though the UDL driver converts to RGB565 internally (see
pixel32_to_be16() in udl_transfer.c), it advertises XRGB8888 for
compatibility. Let's add ARGB8888 to that list.

This makes UDL devices work on ChromeOS again after commit
c91acda3a380 ("drm/gem: Check for valid formats"). Prior to that
commit things were "working" because we'd silently treat the ARGB8888
that ChromeOS wanted as XRGB8888.

Fixes: c91acda3a380 ("drm/gem: Check for valid formats")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/udl/udl_modeset.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/udl_modeset.c
index 7702359c90c2..0f8d3678770e 100644
--- a/drivers/gpu/drm/udl/udl_modeset.c
+++ b/drivers/gpu/drm/udl/udl_modeset.c
@@ -253,6 +253,7 @@ static int udl_handle_damage(struct drm_framebuffer *fb,
 static const uint32_t udl_primary_plane_formats[] = {
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
 };
 
 static const uint64_t udl_primary_plane_fmtmods[] = {
-- 
2.44.0.rc1.240.g4c46232300-goog

