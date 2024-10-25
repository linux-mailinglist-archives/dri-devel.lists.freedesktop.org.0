Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E1B89B0ADE
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 19:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F5F510EB44;
	Fri, 25 Oct 2024 17:17:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="MiB5wshz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9733C10EB36
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 17:16:21 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-43161c0068bso22043515e9.1
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Oct 2024 10:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1729876580; x=1730481380;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ND5qe7OBv3VTVRpCDuAboIPK8dxpxdN+CM3FHGRXNAw=;
 b=MiB5wshzl5TM4jSV/D8iQ4xM7f7AYsgDLmhYroUTn2Mq+CDXnOvxsOYKIvTE74oHYW
 WEgKOvBZMKg9K/X0DxmnA27uvPHqbCdhDM3sgGrnU5HUEwBl5eK9RRHYOTDAV7G1roBG
 waTdSnqwqG8yCjXhtWGWCSN+SrDhjw1JvTbqEml2kXtCqsjpSAcr+niNC8O/xrkNS7XF
 o4in1rhRQvIsOSJE1cydDSas93usV522VUeSY7qSz2Xkrpg7Tc5lMxQgPmDlHjId9pAT
 hq8uwg70vA3RTsowVLUiKH0WAAFAe66fOQC/IZX53+t+/kP2mFl0hg77rQl3HlB/gS3d
 YaSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729876580; x=1730481380;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ND5qe7OBv3VTVRpCDuAboIPK8dxpxdN+CM3FHGRXNAw=;
 b=IKE8TwkXMcl/cI6QLYkSoj1ZvBZpKvqKU8+0uNICx4F6QtrOlDBQ5/o3NKzBYV2cIS
 y2GedwvqmHedgIONPrsaubtuD7WPI80z8BN/UoSqcSgvpEn5co/aTHmnZjCB2vVDHtcZ
 YEVTuefJ5ORORSV5z1+gOKwm1gl881NZNl04iqa2dfaSNdzs7SmZP6URBBPQ0jHeqKBa
 dMWIAvFyeq6xBwEAFL1wgYziqw18+YBzSJOBHU2FxsGzG02vVCnH5R6mJGatG+yO8e4S
 3wsnL1O4sbBX9VC5GMiMDJ6XjMvPu8wZJQofLTtVQNc+tTC+drWH3qMF99GB7wT+LmYu
 cTRQ==
X-Gm-Message-State: AOJu0YypL1Yq+oKpCNKTV90VTcw8+4pT7PUhTcdwc5FL2GrePEfjAibW
 dbMXNRluD9Fk9f8LpGBlWG01pbytBg9soBeX9Sw1C4yfnmUQEjbeNJFWCzD+B2Q=
X-Google-Smtp-Source: AGHT+IH6OtEiwFMpJgenp0RKgtUcQ2xa79UJzkJTMiVDfTU9tdYzxLD3qQqnLPLck4wyddL0IEmq3A==
X-Received: by 2002:a05:600c:46c8:b0:431:44fe:fd9a with SMTP id
 5b1f17b1804b1-43184209b20mr90133795e9.19.1729876579764; 
 Fri, 25 Oct 2024 10:16:19 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-38058b91f50sm2013649f8f.94.2024.10.25.10.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2024 10:16:19 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 25 Oct 2024 18:15:50 +0100
Subject: [PATCH v2 19/36] drm/vc4: txp: Add a new TXP encoder type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-drm-vc4-2712-support-v2-19-35efa83c8fc0@raspberrypi.com>
References: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
In-Reply-To: <20241025-drm-vc4-2712-support-v2-0-35efa83c8fc0@raspberrypi.com>
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

From: Maxime Ripard <mripard@kernel.org>

Starting with BCM2712, we'll have a two TXP. Let's follow the HDMI
example and add two encoder types for TXP: TXP0 and TXP1.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/vc4/tests/vc4_mock.c           |   4 +-
 drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c | 106 ++++++++++++-------------
 drivers/gpu/drm/vc4/vc4_drv.h                  |   3 +-
 drivers/gpu/drm/vc4/vc4_kms.c                  |   2 +-
 drivers/gpu/drm/vc4/vc4_txp.c                  |   2 +-
 5 files changed, 59 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock.c b/drivers/gpu/drm/vc4/tests/vc4_mock.c
index 372482fcd6c7..e276a957b01c 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_mock.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_mock.c
@@ -52,7 +52,7 @@ struct vc4_mock_desc {
 static const struct vc4_mock_desc vc4_mock =
 	VC4_MOCK_DESC(
 		VC4_MOCK_CRTC_DESC(&bcm2835_txp_data.base,
-				   VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_TXP,
+				   VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_TXP0,
 							DRM_MODE_ENCODER_VIRTUAL,
 							DRM_MODE_CONNECTOR_WRITEBACK)),
 		VC4_MOCK_PIXELVALVE_DESC(&bcm2835_pv0_data,
@@ -78,7 +78,7 @@ static const struct vc4_mock_desc vc4_mock =
 static const struct vc4_mock_desc vc5_mock =
 	VC4_MOCK_DESC(
 		VC4_MOCK_CRTC_DESC(&bcm2835_txp_data.base,
-				   VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_TXP,
+				   VC4_MOCK_OUTPUT_DESC(VC4_ENCODER_TYPE_TXP0,
 							DRM_MODE_ENCODER_VIRTUAL,
 							DRM_MODE_CONNECTOR_WRITEBACK)),
 		VC4_MOCK_PIXELVALVE_DESC(&bcm2711_pv0_data,
diff --git a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
index 61622e951031..40a05869a50e 100644
--- a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
+++ b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
@@ -90,7 +90,7 @@ static const struct encoder_constraint vc4_encoder_constraints[] = {
 	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_DSI0, 0),
 	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_HDMI0, 1),
 	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_VEC, 1),
-	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_TXP, 2),
+	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_TXP0, 2),
 	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_DSI1, 2),
 };
 
@@ -98,7 +98,7 @@ static const struct encoder_constraint vc5_encoder_constraints[] = {
 	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_DPI, 0),
 	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_DSI0, 0),
 	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_VEC, 1),
-	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_TXP, 0, 2),
+	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_TXP0, 0, 2),
 	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_DSI1, 0, 1, 2),
 	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_HDMI0, 0, 1, 2),
 	ENCODER_CONSTRAINT(VC4_ENCODER_TYPE_HDMI1, 0, 1, 2),
@@ -207,7 +207,7 @@ static const struct pv_muxing_param vc4_test_pv_muxing_params[] = {
 	VC4_PV_MUXING_TEST("1 output: DSI1",
 			   VC4_ENCODER_TYPE_DSI1),
 	VC4_PV_MUXING_TEST("1 output: TXP",
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC4_PV_MUXING_TEST("2 outputs: DSI0, HDMI0",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_HDMI0),
@@ -219,7 +219,7 @@ static const struct pv_muxing_param vc4_test_pv_muxing_params[] = {
 			   VC4_ENCODER_TYPE_DSI1),
 	VC4_PV_MUXING_TEST("2 outputs: DSI0, TXP",
 			   VC4_ENCODER_TYPE_DSI0,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC4_PV_MUXING_TEST("2 outputs: DPI, HDMI0",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_HDMI0),
@@ -231,19 +231,19 @@ static const struct pv_muxing_param vc4_test_pv_muxing_params[] = {
 			   VC4_ENCODER_TYPE_DSI1),
 	VC4_PV_MUXING_TEST("2 outputs: DPI, TXP",
 			   VC4_ENCODER_TYPE_DPI,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC4_PV_MUXING_TEST("2 outputs: HDMI0, DSI1",
 			   VC4_ENCODER_TYPE_HDMI0,
 			   VC4_ENCODER_TYPE_DSI1),
 	VC4_PV_MUXING_TEST("2 outputs: HDMI0, TXP",
 			   VC4_ENCODER_TYPE_HDMI0,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC4_PV_MUXING_TEST("2 outputs: VEC, DSI1",
 			   VC4_ENCODER_TYPE_VEC,
 			   VC4_ENCODER_TYPE_DSI1),
 	VC4_PV_MUXING_TEST("2 outputs: VEC, TXP",
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC4_PV_MUXING_TEST("3 outputs: DSI0, HDMI0, DSI1",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_HDMI0,
@@ -251,7 +251,7 @@ static const struct pv_muxing_param vc4_test_pv_muxing_params[] = {
 	VC4_PV_MUXING_TEST("3 outputs: DSI0, HDMI0, TXP",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_HDMI0,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC4_PV_MUXING_TEST("3 outputs: DSI0, VEC, DSI1",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_VEC,
@@ -259,7 +259,7 @@ static const struct pv_muxing_param vc4_test_pv_muxing_params[] = {
 	VC4_PV_MUXING_TEST("3 outputs: DSI0, VEC, TXP",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC4_PV_MUXING_TEST("3 outputs: DPI, HDMI0, DSI1",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_HDMI0,
@@ -267,7 +267,7 @@ static const struct pv_muxing_param vc4_test_pv_muxing_params[] = {
 	VC4_PV_MUXING_TEST("3 outputs: DPI, HDMI0, TXP",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_HDMI0,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC4_PV_MUXING_TEST("3 outputs: DPI, VEC, DSI1",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_VEC,
@@ -275,7 +275,7 @@ static const struct pv_muxing_param vc4_test_pv_muxing_params[] = {
 	VC4_PV_MUXING_TEST("3 outputs: DPI, VEC, TXP",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 };
 
 KUNIT_ARRAY_PARAM(vc4_test_pv_muxing,
@@ -287,7 +287,7 @@ static const struct pv_muxing_param vc4_test_pv_muxing_invalid_params[] = {
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_DSI0),
 	VC4_PV_MUXING_TEST("TXP/DSI1 Conflict",
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1),
 	VC4_PV_MUXING_TEST("HDMI0/VEC Conflict",
 			   VC4_ENCODER_TYPE_HDMI0,
@@ -296,22 +296,22 @@ static const struct pv_muxing_param vc4_test_pv_muxing_invalid_params[] = {
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_HDMI0,
 			   VC4_ENCODER_TYPE_DSI1,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC4_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, DSI1, TXP",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_VEC,
 			   VC4_ENCODER_TYPE_DSI1,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC4_PV_MUXING_TEST("More than 3 outputs: DPI, HDMI0, DSI1, TXP",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_HDMI0,
 			   VC4_ENCODER_TYPE_DSI1,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC4_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, DSI1, TXP",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_VEC,
 			   VC4_ENCODER_TYPE_DSI1,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 };
 
 KUNIT_ARRAY_PARAM(vc4_test_pv_muxing_invalid,
@@ -342,7 +342,7 @@ static const struct pv_muxing_param vc5_test_pv_muxing_params[] = {
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("2 outputs: DPI, TXP",
 			   VC4_ENCODER_TYPE_DPI,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC5_PV_MUXING_TEST("2 outputs: DPI, VEC",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_VEC),
@@ -360,7 +360,7 @@ static const struct pv_muxing_param vc5_test_pv_muxing_params[] = {
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("2 outputs: DSI0, TXP",
 			   VC4_ENCODER_TYPE_DSI0,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC5_PV_MUXING_TEST("2 outputs: DSI0, VEC",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_VEC),
@@ -372,7 +372,7 @@ static const struct pv_muxing_param vc5_test_pv_muxing_params[] = {
 			   VC4_ENCODER_TYPE_VEC),
 	VC5_PV_MUXING_TEST("2 outputs: DSI1, TXP",
 			   VC4_ENCODER_TYPE_DSI1,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC5_PV_MUXING_TEST("2 outputs: DSI1, HDMI0",
 			   VC4_ENCODER_TYPE_DSI1,
 			   VC4_ENCODER_TYPE_HDMI0),
@@ -384,7 +384,7 @@ static const struct pv_muxing_param vc5_test_pv_muxing_params[] = {
 			   VC4_ENCODER_TYPE_VEC),
 	VC5_PV_MUXING_TEST("2 outputs: HDMI0, TXP",
 			   VC4_ENCODER_TYPE_HDMI0,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC5_PV_MUXING_TEST("2 outputs: HDMI0, HDMI1",
 			   VC4_ENCODER_TYPE_HDMI0,
 			   VC4_ENCODER_TYPE_HDMI1),
@@ -393,14 +393,14 @@ static const struct pv_muxing_param vc5_test_pv_muxing_params[] = {
 			   VC4_ENCODER_TYPE_VEC),
 	VC5_PV_MUXING_TEST("2 outputs: HDMI1, TXP",
 			   VC4_ENCODER_TYPE_HDMI1,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC5_PV_MUXING_TEST("2 outputs: TXP, VEC",
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_VEC),
 	VC5_PV_MUXING_TEST("3 outputs: DPI, VEC, TXP",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC5_PV_MUXING_TEST("3 outputs: DPI, VEC, DSI1",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_VEC,
@@ -415,15 +415,15 @@ static const struct pv_muxing_param vc5_test_pv_muxing_params[] = {
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("3 outputs: DPI, TXP, DSI1",
 			   VC4_ENCODER_TYPE_DPI,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1),
 	VC5_PV_MUXING_TEST("3 outputs: DPI, TXP, HDMI0",
 			   VC4_ENCODER_TYPE_DPI,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_HDMI0),
 	VC5_PV_MUXING_TEST("3 outputs: DPI, TXP, HDMI1",
 			   VC4_ENCODER_TYPE_DPI,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("3 outputs: DPI, DSI1, HDMI0",
 			   VC4_ENCODER_TYPE_DPI,
@@ -440,7 +440,7 @@ static const struct pv_muxing_param vc5_test_pv_muxing_params[] = {
 	VC5_PV_MUXING_TEST("3 outputs: DSI0, VEC, TXP",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP),
+			   VC4_ENCODER_TYPE_TXP0),
 	VC5_PV_MUXING_TEST("3 outputs: DSI0, VEC, DSI1",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_VEC,
@@ -455,15 +455,15 @@ static const struct pv_muxing_param vc5_test_pv_muxing_params[] = {
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("3 outputs: DSI0, TXP, DSI1",
 			   VC4_ENCODER_TYPE_DSI0,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1),
 	VC5_PV_MUXING_TEST("3 outputs: DSI0, TXP, HDMI0",
 			   VC4_ENCODER_TYPE_DSI0,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_HDMI0),
 	VC5_PV_MUXING_TEST("3 outputs: DSI0, TXP, HDMI1",
 			   VC4_ENCODER_TYPE_DSI0,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("3 outputs: DSI0, DSI1, HDMI0",
 			   VC4_ENCODER_TYPE_DSI0,
@@ -490,17 +490,17 @@ static const struct pv_muxing_param vc5_test_pv_muxing_invalid_params[] = {
 	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, TXP, DSI1",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, TXP, HDMI0",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_HDMI0),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, TXP, HDMI1",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, DSI1, HDMI0",
 			   VC4_ENCODER_TYPE_DPI,
@@ -519,17 +519,17 @@ static const struct pv_muxing_param vc5_test_pv_muxing_invalid_params[] = {
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, TXP, DSI1, HDMI0",
 			   VC4_ENCODER_TYPE_DPI,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1,
 			   VC4_ENCODER_TYPE_HDMI0),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, TXP, DSI1, HDMI1",
 			   VC4_ENCODER_TYPE_DPI,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, TXP, HDMI0, HDMI1",
 			   VC4_ENCODER_TYPE_DPI,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_HDMI0,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, DSI1, HDMI0, HDMI1",
@@ -540,19 +540,19 @@ static const struct pv_muxing_param vc5_test_pv_muxing_invalid_params[] = {
 	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, TXP, DSI1, HDMI0",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1,
 			   VC4_ENCODER_TYPE_HDMI0),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, TXP, DSI1, HDMI1",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, TXP, HDMI0, HDMI1",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_HDMI0,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, DSI1, HDMI0, HDMI1",
@@ -563,24 +563,24 @@ static const struct pv_muxing_param vc5_test_pv_muxing_invalid_params[] = {
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, TXP, DSI1, HDMI0, HDMI1",
 			   VC4_ENCODER_TYPE_DPI,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1,
 			   VC4_ENCODER_TYPE_HDMI0,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, TXP, DSI1",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, TXP, HDMI0",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_HDMI0),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, TXP, HDMI1",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, DSI1, HDMI0",
 			   VC4_ENCODER_TYPE_DSI0,
@@ -599,17 +599,17 @@ static const struct pv_muxing_param vc5_test_pv_muxing_invalid_params[] = {
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, TXP, DSI1, HDMI0",
 			   VC4_ENCODER_TYPE_DSI0,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1,
 			   VC4_ENCODER_TYPE_HDMI0),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, TXP, DSI1, HDMI1",
 			   VC4_ENCODER_TYPE_DSI0,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, TXP, HDMI0, HDMI1",
 			   VC4_ENCODER_TYPE_DSI0,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_HDMI0,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, DSI1, HDMI0, HDMI1",
@@ -620,19 +620,19 @@ static const struct pv_muxing_param vc5_test_pv_muxing_invalid_params[] = {
 	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, TXP, DSI1, HDMI0",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1,
 			   VC4_ENCODER_TYPE_HDMI0),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, TXP, DSI1, HDMI1",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, TXP, HDMI0, HDMI1",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_HDMI0,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, DSI1, HDMI0, HDMI1",
@@ -643,27 +643,27 @@ static const struct pv_muxing_param vc5_test_pv_muxing_invalid_params[] = {
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, TXP, DSI1, HDMI0, HDMI1",
 			   VC4_ENCODER_TYPE_DSI0,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1,
 			   VC4_ENCODER_TYPE_HDMI0,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: VEC, TXP, DSI1, HDMI0, HDMI1",
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1,
 			   VC4_ENCODER_TYPE_HDMI0,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DPI, VEC, TXP, DSI1, HDMI0, HDMI1",
 			   VC4_ENCODER_TYPE_DPI,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1,
 			   VC4_ENCODER_TYPE_HDMI0,
 			   VC4_ENCODER_TYPE_HDMI1),
 	VC5_PV_MUXING_TEST("More than 3 outputs: DSI0, VEC, TXP, DSI1, HDMI0, HDMI1",
 			   VC4_ENCODER_TYPE_DSI0,
 			   VC4_ENCODER_TYPE_VEC,
-			   VC4_ENCODER_TYPE_TXP,
+			   VC4_ENCODER_TYPE_TXP0,
 			   VC4_ENCODER_TYPE_DSI1,
 			   VC4_ENCODER_TYPE_HDMI0,
 			   VC4_ENCODER_TYPE_HDMI1),
diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 70b7a771ff47..de2107e593c2 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -489,7 +489,8 @@ enum vc4_encoder_type {
 	VC4_ENCODER_TYPE_DSI1,
 	VC4_ENCODER_TYPE_SMI,
 	VC4_ENCODER_TYPE_DPI,
-	VC4_ENCODER_TYPE_TXP,
+	VC4_ENCODER_TYPE_TXP0,
+	VC4_ENCODER_TYPE_TXP1,
 };
 
 struct vc4_encoder {
diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index aa0b50d6c9fd..3fcfc265e1e2 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -350,7 +350,7 @@ static void vc6_hvs_pv_muxing_commit(struct vc4_dev *vc4,
 			mux = 0;
 			break;
 
-		case VC4_ENCODER_TYPE_TXP:
+		case VC4_ENCODER_TYPE_TXP1:
 			mux = 2;
 			break;
 
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index ecd2fc5edf45..2979d141f3bb 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -515,7 +515,7 @@ const struct vc4_txp_data bcm2835_txp_data = {
 		.hvs_available_channels = BIT(2),
 		.hvs_output = 2,
 	},
-	.encoder_type = VC4_ENCODER_TYPE_TXP,
+	.encoder_type = VC4_ENCODER_TYPE_TXP0,
 	.has_byte_enable = true,
 };
 

-- 
2.34.1

