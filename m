Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC6DAAECE2
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 22:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FECD10E8AC;
	Wed,  7 May 2025 20:22:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NOHybiq7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7FC810E89B
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 20:22:36 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 46e09a7af769-72bceb93f2fso782090a34.0
 for <dri-devel@lists.freedesktop.org>; Wed, 07 May 2025 13:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746649356; x=1747254156; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DOnjdA/K9t8YFoMyvpC9mBKsBSMkiqJxTGJB4LzuHbI=;
 b=NOHybiq75VqTGievYISZgmyMA2RBnSUQMsFm+ej7VRL2n6XgNfsTTu88Z2XCjXJ4fB
 qNMYvAj5kybMK8nfuuv8l3HP0HkHSNGMtW9vZVkfh3OCfFNMFa8rwslvA5W3g/E1hZ5s
 GJxyd08lvpWSBRB4nhLULHUUZF4dEJvJIM1RKxIn/K5ZjighvaZi0uHXjVwZzOOy+D6+
 T4pHiFdyHlsa/eYn0mNQm7/fHex5RV3utnmW3jFeCBCa0u5jRFc79OfOtKhE7XUkYN4X
 +keS0Qtc+lGa6jgFAP0+VBNUYNBswcz/P8DUkyuyTk54rzBwq6iV0zZFYAPCDcf5eBuD
 /pYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746649356; x=1747254156;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DOnjdA/K9t8YFoMyvpC9mBKsBSMkiqJxTGJB4LzuHbI=;
 b=WyYnqjsU0OjozgmeaVHIm31sWsUXacEhUZxJNRNTyNKkLgcM+JlFXwP5ydEzw9fj2k
 9BrBQMlAfVZOpLPRq4kWvkeMVVvQEaLeYmUKr6zjQyzRdDi+4IiTUoYM0sNl9uno+mnc
 S0hvKOSrSRKr57RQ5Urys/Axr83OjotYGMokKZqyXcW45GeVxJ5Or1qCPIxi30TOSos1
 TdqxwzQhvnhlO3qH8piXGIXnY58p7C0XHS9Aub/tQK2vnCU6W+w1RH/2HVnEyfM7RTRQ
 ax4qDDYlOUiC4hlEjtzYEaj7jX2e8pLQU9Vt4cbVoH/mVnAoJZ12Ap6G5hmARnuOTEc7
 hjGw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDIBaPu06dsw0nzncaH56iIgdXy1VwW8YVkIf2HPP6RWLTkSYtqfzzT1plD9KlDtBT47+WjfCqAHM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzT2ZTt3hIGfX1mVpZT/62DAdLOinHQX2UiS8QthN9N8Hil1acd
 hal47DiGvwR0ZpsrD4PVWdD8KETMVN5fYCpgmPpLpCfYYZE/yAhD
X-Gm-Gg: ASbGncuRSPi9KeNy+BVnaMDxBgf4ud3egpqN+uZQEP+N6D15RaGGGjIslXPTIh2MAOs
 gt7nMFJXOcdogtbn6Aq8NYoYfjdtTwVmJsyJI+dRgoKCDCsKX+qnxFrUeYNTUeIhtC8BsvZXGdI
 NaTshjVQnAqS0nTa5GPwPjloTZ9VIf6d1LkP4lDdLRnaU+IC9k3uEa/7J6DlKrbHtXznPuuoQ8F
 84SrNQnl9283e5Fb3InfO6OraaohmRQBVL1a2lMSQFzRoTIjg5yEdl321k/eOPzkSo8m2uKfW2Z
 xRY5QJlmY+zGpOHGli/mFN14zW4siafQAWkwerSLZeSjkJy0Nb2pU82n55/u
X-Google-Smtp-Source: AGHT+IGhdN7iQduVHwjpHb/fdju1Q9acMOat+8tQez4g/T+ucKmAnspCZWL5Wcod8/fm0yG7hchEvA==
X-Received: by 2002:a05:6830:33f8:b0:72a:b2a:476 with SMTP id
 46e09a7af769-7321b364c5dmr525805a34.3.1746649355944; 
 Wed, 07 May 2025 13:22:35 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:fb0:1bcf:e46c:46ba:cecd:a52c])
 by smtp.gmail.com with ESMTPSA id
 46e09a7af769-732109df2dcsm725945a34.9.2025.05.07.13.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 May 2025 13:22:35 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 ryan@testtoast.com, macromorgan@hotmail.com, p.zabel@pengutronix.de,
 tzimmermann@suse.de, maarten.lankhorst@linux.intel.com, simona@ffwll.ch,
 airlied@gmail.com, mripard@kernel.org, samuel@sholland.org,
 jernej.skrabec@gmail.com, wens@csie.org, conor+dt@kernel.org,
 krzk+dt@kernel.org, robh@kernel.org
Subject: [PATCH V9 11/24] drm: sun4i: de33: vi_scaler: add Display Engine 3.3
 (DE33) support
Date: Wed,  7 May 2025 15:19:30 -0500
Message-ID: <20250507201943.330111-12-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250507201943.330111-1-macroalpha82@gmail.com>
References: <20250507201943.330111-1-macroalpha82@gmail.com>
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

From: Chris Morgan <macromorgan@hotmail.com>

The vi_scaler appears to be used in preference to the ui_scaler module
for hardware video scaling in the DE33.

Enable support for this scaler.

Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c  | 20 ++++++++++++++++----
 drivers/gpu/drm/sun4i/sun8i_vi_scaler.c |  4 +++-
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 7a21d32ff1e4..3eefdb710dee 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -94,12 +94,24 @@ static int sun8i_ui_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 		hscale = state->src_w / state->crtc_w;
 		vscale = state->src_h / state->crtc_h;
 
-		sun8i_ui_scaler_setup(mixer, channel, src_w, src_h, dst_w,
-				      dst_h, hscale, vscale, hphase, vphase);
-		sun8i_ui_scaler_enable(mixer, channel, true);
+		if (mixer->cfg->de_type == sun8i_mixer_de33) {
+			sun8i_vi_scaler_setup(mixer, channel, src_w, src_h,
+					      dst_w, dst_h, hscale, vscale,
+					      hphase, vphase,
+					      state->fb->format);
+			sun8i_vi_scaler_enable(mixer, channel, true);
+		} else {
+			sun8i_ui_scaler_setup(mixer, channel, src_w, src_h,
+					      dst_w, dst_h, hscale, vscale,
+					      hphase, vphase);
+			sun8i_ui_scaler_enable(mixer, channel, true);
+		}
 	} else {
 		DRM_DEBUG_DRIVER("HW scaling is not needed\n");
-		sun8i_ui_scaler_enable(mixer, channel, false);
+		if (mixer->cfg->de_type == sun8i_mixer_de33)
+			sun8i_vi_scaler_enable(mixer, channel, false);
+		else
+			sun8i_ui_scaler_enable(mixer, channel, false);
 	}
 
 	/* Set base coordinates */
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
index ad87ab395803..6839fd5ab602 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_scaler.c
@@ -835,7 +835,9 @@ static const u32 bicubic4coefftab32[480] = {
 
 static u32 sun8i_vi_scaler_base(struct sun8i_mixer *mixer, int channel)
 {
-	if (mixer->cfg->de_type == sun8i_mixer_de3)
+	if (mixer->cfg->de_type == sun8i_mixer_de33)
+		return sun8i_channel_base(mixer, channel) + 0x3000;
+	else if (mixer->cfg->de_type == sun8i_mixer_de3)
 		return DE3_VI_SCALER_UNIT_BASE +
 		       DE3_VI_SCALER_UNIT_SIZE * channel;
 	else
-- 
2.43.0

