Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EFF85435E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 08:24:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB6210E1CB;
	Wed, 14 Feb 2024 07:24:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="Q+QekAqf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C9910E1CB
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Feb 2024 07:24:47 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-6da9c834646so4260102b3a.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Feb 2024 23:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1707895486; x=1708500286;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sg/3QYKNiqClt5O0Rsi2fxy3eaHE++NDSM8zl4s0ReY=;
 b=Q+QekAqfPZNoJNQropRD3+gNCqOLz0ZkZRWVY1yf2FeLXuU6pKg+SXel2loGE+mjUD
 lFbVqWpuYdG6BbbrziFTVVG3cFGApRnzeh4i1x71CFRLR1RVib/PqQho6qFR9RAnGbB3
 fGgSHZNFN9gl7LVvhSoIyeFGXZhCRrzl3sTl4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707895486; x=1708500286;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sg/3QYKNiqClt5O0Rsi2fxy3eaHE++NDSM8zl4s0ReY=;
 b=omFiRJXiSKzGv6vxfwmwzwwj8R3/hazb9ZVyOs8ztxAYcGgJGdxYkk6RwZqbiMLheS
 y/CA2EAbm9ReZgObTuDWQouIUVLbXu1O636ujSG+nHKRNtduqqAdLM/EjtGRUQOffO9t
 hAbuZJOSQFJeaM67fmnyh03cj4FWtNLJvu56WCZP1pPn6aMVA5l5cez7Dh1dUNYhBi2W
 VfPBcxXWGIDC3S9k5sJYD2q2dPQKT0dvnDf5rjMphp50V7g0rUtw6UzT0F7OC0keSrTS
 fN7WqB2+eVso7KWST+oP0Be+hzdg5EoNcgth1W7ZPz9zTtGFS0QEA0n5Ymxa5l4bKyEv
 fYZw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVL01f9JHFbElQplUo9M21LlBBvv1pxqDMk4cDOda+IgvUuH1f7Hbj/Rl60q6Ox+cChnCTM+KDb/dKShREAcRnUoWpFHS3mzAb3QmXSGmik
X-Gm-Message-State: AOJu0YwNoKUacjla2HkshBawjf5z6//qq8DnvWb8TxceWGlCOo4bVSEN
 tLH9mPFPk1kNbo4/s1QVSibcdXXygwwplaoOxsOVRUWK4ya/T6x0UBUU62rVfw==
X-Google-Smtp-Source: AGHT+IHWbMtV63iwSm28tHkn/2uPWUswzI/yZYK3Z2XzyqiZ9BVUhRH9TCq/XmElpxGcwmayReWaZg==
X-Received: by 2002:a05:6a00:80ce:b0:6de:3b41:2845 with SMTP id
 ei14-20020a056a0080ce00b006de3b412845mr1267315pfb.32.1707895486644; 
 Tue, 13 Feb 2024 23:24:46 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCX4/g6RttGYyHt4IsNRLuOZdesxIRm+ez9N3te0y7PNHNxkbAq/gfLjGQNAA8z6y+2HAxio50rLlkidsgRuThahQI8gXckBUsWdA7WZSzQiAcxb9SpIVyMkSsKgMzrtEAlr3TgSM7nIUhWLvxGINc8amjEYn+9pFOzlyVoI4HYAKPM4UERGfxjzs7RVfiojfETdZdXgnKWA3WDuMfCwjahbDVCNano0PFs6wUC99uaefO1NT3sek53MrBW3QXKnSJfKtt1NcCV77IleVY0RoP5BaLqylO0kcdhmOzn8T6x6/F+JSQ8hVsMM6v3fakLTpryWxM6hDn+4NZdHBuQklWp/1ewEIyZWPif76A==
Received: from hsinyi.sjc.corp.google.com ([2620:15c:9d:2:3a01:e2cd:4e75:f52d])
 by smtp.gmail.com with ESMTPSA id
 n8-20020aa78a48000000b006e03bc76711sm8548314pfa.165.2024.02.13.23.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 23:24:46 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org
Subject: [PATCH] Revert "drm/panel-edp: Add auo_b116xa3_mode"
Date: Tue, 13 Feb 2024 23:22:54 -0800
Message-ID: <20240214072435.1496536-2-hsinyi@chromium.org>
X-Mailer: git-send-email 2.43.0.687.g38aa6559b0-goog
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

This reverts commit 70e0d5550f5cec301ad116703b840a539fe985dc.

The overridden mode fixes the panel glitching issue on mt8186 chromebook.
However, it causes the internal display not working on mt8173 chromebook.
Revert the overridden mode for now to let mt8173 have a functional display.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/panel/panel-edp.c | 19 ++-----------------
 1 file changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 7d556b1bfa82..bd71d239272a 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -1002,19 +1002,6 @@ static const struct panel_desc auo_b101ean01 = {
 	},
 };
 
-static const struct drm_display_mode auo_b116xa3_mode = {
-	.clock = 70589,
-	.hdisplay = 1366,
-	.hsync_start = 1366 + 40,
-	.hsync_end = 1366 + 40 + 40,
-	.htotal = 1366 + 40 + 40 + 32,
-	.vdisplay = 768,
-	.vsync_start = 768 + 10,
-	.vsync_end = 768 + 10 + 12,
-	.vtotal = 768 + 10 + 12 + 6,
-	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
-};
-
 static const struct drm_display_mode auo_b116xak01_mode = {
 	.clock = 69300,
 	.hdisplay = 1366,
@@ -1963,12 +1950,10 @@ static const struct edp_panel_entry edp_panels[] = {
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x239b, &delay_200_500_e50, "B116XAN06.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x255c, &delay_200_500_e50, "B116XTN02.5"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x403d, &delay_200_500_e50, "B140HAN04.0"),
-	EDP_PANEL_ENTRY2('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01.0",
-			 &auo_b116xa3_mode),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x405c, &auo_b116xak01.delay, "B116XAK01.0"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x435c, &delay_200_500_e50, "Unknown"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x582d, &delay_200_500_e50, "B133UAN01.0"),
-	EDP_PANEL_ENTRY2('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1",
-			 &auo_b116xa3_mode),
+	EDP_PANEL_ENTRY('A', 'U', 'O', 0x615c, &delay_200_500_e50, "B116XAN06.1"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x635c, &delay_200_500_e50, "B116XAN06.3"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x639c, &delay_200_500_e50, "B140HAK02.7"),
 	EDP_PANEL_ENTRY('A', 'U', 'O', 0x723c, &delay_200_500_e50, "B140XTN07.2"),
-- 
2.43.0.687.g38aa6559b0-goog

