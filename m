Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FC2A9AD158
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 18:50:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38EE710E1D0;
	Wed, 23 Oct 2024 16:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="okHShdDc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 030E810E195
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 16:50:13 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4315abed18aso67271495e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 09:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729702211; x=1730307011;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DHsrd+uLJ3zzJTfflluftUpg1xM7uGde28YhgXiEaII=;
 b=okHShdDccY/j6YlLsljBNNB9Ex2yVUJnw8U5m9YoshBL8fyKNagvdlr98FvzzqlVcU
 d0KznKf2BxNnJjsvY15FjFU5HAEatyBu7FbA7wHaD/PvZOWpJtBm3/BB/iVIUElZKBMJ
 A7bkQBdPDj/4ULU6+XrTLyvIAFrjT+DqiV/Y34HyIuDJcKiR1w2gFh9IXDh24BUNtxqm
 qhAnxeIMAoW7ftUWNEyJeMwdBp07w6XbbV++A2GwLiapezO8j7J278rN9A8lwvdQB7OV
 5uLSqaTu7FedWjYYj49GCroRcDgs9CuxlBHvx3mbq8srRtZQwU6sK4sSmbrApU19KuDS
 fvvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729702211; x=1730307011;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DHsrd+uLJ3zzJTfflluftUpg1xM7uGde28YhgXiEaII=;
 b=Jdv0iZkapqDG1oR6iWbe5fJt6k0nXHWTDr3Plhot3dCkn+bynzk0FG5hgztppqTEzN
 DccQm/2ssladsj4/qhUfebcP0uME65g00QW/aadjPyjO+RQ8CI0XbwLJwwjEXovweI1X
 Nskp0XkCDXqWwi1KSh69lkT0jpcICoDs3SDjA0898mRtI9BiaqVom8tJ4GilwCsGqM+8
 q1raV570j8Trlq6oMzGSMR8VEj8mXU6GwZD6FT+PnBeJumHiahgK+oF4ccD6NHGxyuRe
 S0mEre74x3mB+VEXo1ULGFC4r6NUvLxM+JmGlbpWMgbt0u2EB8dUSjml3ENRWHCdkeY/
 xbtw==
X-Gm-Message-State: AOJu0YyRpS0TbuY9RBQZwwA8drVvwqu+puPSXshx+eu3l1OP4EAimKcA
 9nHdEPtvGA79OAtja+blHu1NxCzj4QFQF++pEdYFjfpLupiZOaimiWrxgzEjJTw=
X-Google-Smtp-Source: AGHT+IERhAzD85giYVwWPW2yr0xeM1afTBRNEqyh3+VJ9Dt+uRH4uKHHawanviz9+PlgBvlZWTrZUA==
X-Received: by 2002:a05:600c:3b07:b0:431:5c1c:250b with SMTP id
 5b1f17b1804b1-431841e0ff1mr27913915e9.1.1729702211354; 
 Wed, 23 Oct 2024 09:50:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 5b1f17b1804b1-43186c50445sm21642035e9.39.2024.10.23.09.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 09:50:10 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Oct 2024 17:50:00 +0100
Subject: [PATCH 03/37] drm/vc4: Fix reading of frame count on GEN5 / Pi4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241023-drm-vc4-2712-support-v1-3-1cc2d5594907@raspberrypi.com>
References: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
In-Reply-To: <20241023-drm-vc4-2712-support-v1-0-1cc2d5594907@raspberrypi.com>
To: Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1
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

The frame count values moved within registers DISPSTAT1 and
DISPSTAT2 with GEN5, so update the accessor function to
accommodate that.

Fixes: b51cd7ad143d ("drm/vc4: hvs: Fix frame count register readout")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/vc4_hvs.c  | 45 +++++++++++++++++++++++++++++++-----------
 drivers/gpu/drm/vc4/vc4_regs.h |  6 ++++++
 2 files changed, 40 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
index 1edf6e3fa7e6..f8edb0791091 100644
--- a/drivers/gpu/drm/vc4/vc4_hvs.c
+++ b/drivers/gpu/drm/vc4/vc4_hvs.c
@@ -272,19 +272,42 @@ u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo)
 	if (!drm_dev_enter(drm, &idx))
 		return 0;
 
-	switch (fifo) {
-	case 0:
-		field = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTAT1),
-				      SCALER_DISPSTAT1_FRCNT0);
-		break;
-	case 1:
-		field = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTAT1),
-				      SCALER_DISPSTAT1_FRCNT1);
+	switch (vc4->gen) {
+	case VC4_GEN_5:
+		switch (fifo) {
+		case 0:
+			field = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTAT1),
+					      SCALER5_DISPSTAT1_FRCNT0);
+			break;
+		case 1:
+			field = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTAT1),
+					      SCALER5_DISPSTAT1_FRCNT1);
+			break;
+		case 2:
+			field = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTAT2),
+					      SCALER5_DISPSTAT2_FRCNT2);
+			break;
+		}
 		break;
-	case 2:
-		field = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTAT2),
-				      SCALER_DISPSTAT2_FRCNT2);
+	case VC4_GEN_4:
+		switch (fifo) {
+		case 0:
+			field = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTAT1),
+					      SCALER_DISPSTAT1_FRCNT0);
+			break;
+		case 1:
+			field = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTAT1),
+					      SCALER_DISPSTAT1_FRCNT1);
+			break;
+		case 2:
+			field = VC4_GET_FIELD(HVS_READ(SCALER_DISPSTAT2),
+					      SCALER_DISPSTAT2_FRCNT2);
+			break;
+		}
 		break;
+	default:
+		drm_err(drm, "Unknown VC4 generation: %d", vc4->gen);
+		return 0;
 	}
 
 	drm_dev_exit(idx);
diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_regs.h
index c55dec383929..341a75cf92e5 100644
--- a/drivers/gpu/drm/vc4/vc4_regs.h
+++ b/drivers/gpu/drm/vc4/vc4_regs.h
@@ -418,6 +418,10 @@
 # define SCALER_DISPSTAT1_FRCNT0_SHIFT		18
 # define SCALER_DISPSTAT1_FRCNT1_MASK		VC4_MASK(17, 12)
 # define SCALER_DISPSTAT1_FRCNT1_SHIFT		12
+# define SCALER5_DISPSTAT1_FRCNT0_MASK		VC4_MASK(25, 20)
+# define SCALER5_DISPSTAT1_FRCNT0_SHIFT		20
+# define SCALER5_DISPSTAT1_FRCNT1_MASK		VC4_MASK(19, 14)
+# define SCALER5_DISPSTAT1_FRCNT1_SHIFT		14
 
 #define SCALER_DISPSTATX(x)			(SCALER_DISPSTAT0 +        \
 						 (x) * (SCALER_DISPSTAT1 - \
@@ -436,6 +440,8 @@
 #define SCALER_DISPSTAT2                        0x00000068
 # define SCALER_DISPSTAT2_FRCNT2_MASK		VC4_MASK(17, 12)
 # define SCALER_DISPSTAT2_FRCNT2_SHIFT		12
+# define SCALER5_DISPSTAT2_FRCNT2_MASK		VC4_MASK(19, 14)
+# define SCALER5_DISPSTAT2_FRCNT2_SHIFT		14
 
 #define SCALER_DISPBASE2                        0x0000006c
 #define SCALER_DISPALPHA2                       0x00000070

-- 
2.34.1

