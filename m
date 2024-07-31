Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0813943360
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 17:30:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AD8410E662;
	Wed, 31 Jul 2024 15:30:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aqOwvpGl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD73610E629
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 14:40:37 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-4281ca54fd3so29420785e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 07:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722436836; x=1723041636; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=luazhowgAPWQgoDgxyCIPanafJftn7iOtGjNDkstdBs=;
 b=aqOwvpGlt12NcTEg6JRmtvy56m/8h9UmXZO1iGxOz9ahyToRv6qvkbYFz+uCTfQoZJ
 HZ6KsiHHT0zp26YyggSMIldy+wpnbtQZY6QVS+JWqXYttFyYLuhxSl1/BLSaQyiMsoo+
 ghHv1mmzgZh3KcIyFOdXEz2uSSz1IOlXGWL9vopfMyvGYjqVAeYS77oes4y9tFglhzBR
 AkiqDBASuCCCjALZcWz188f7i8qmjlZQ3aPnjNVtqa3GPCPBtP1dV8wCMkJ9vKZgdRMC
 kuA1GHKsrUdK1YJ24u/YMYd/6YRkq7Lb7Zr3v0TvdNvxHi9KFLAbYStoSwO+1m65orLM
 rW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722436836; x=1723041636;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=luazhowgAPWQgoDgxyCIPanafJftn7iOtGjNDkstdBs=;
 b=LesmRwYsTdRfmfMFujhVrkxZ9C62g5Z9Ug1Xzwdx66fT6WTirBS/5PKzIcCgrbXPKQ
 8c3lXzplrubdsjvPx/JjIjkqkL3Nj52TpdFzOAuCGkJdHzQLmSt5q3JLzviWj/dawoOE
 SfWYHgkygM66rfKY9mn3kBUH02TjhR9OeyORljeyFbMPbs8Jp+cewcnj4aAZTATlDTjG
 rAD5C3Li2z5Jz3zAEzjGvaXU83E1EdGTILjOOtcaiMYhdATF+wP0qQ0jdbSdebF+eKak
 TZKeZVWA7NF2GMaOaGPI/D5ZsKcTck+6WfneNPAy0OJexLUxWr/+xrIqsVuiG5lptmbN
 fTPA==
X-Gm-Message-State: AOJu0Yy7Zla8z2WoscWTKg4/M9pygoGM2Xoo1Ib22CKXPxu0fLmIapJX
 DHVjVL16xJz/ALQbBM0M44qC0DYzxKwVADjdHzrTZ3pEbqYlU4yvZxbD8Q==
X-Google-Smtp-Source: AGHT+IGSFvPo9JWOxUClyaAhzEi1aHSsoNAcdmmUiXe8FZR8XGmYJsFYfHJPY7wIknczednlwN59GA==
X-Received: by 2002:a05:600c:19c9:b0:426:50e1:ea6e with SMTP id
 5b1f17b1804b1-42821a5e245mr55668085e9.18.1722436835822; 
 Wed, 31 Jul 2024 07:40:35 -0700 (PDT)
Received: from localhost.localdomain (2-230-196-213.ip203.fastwebnet.it.
 [2.230.196.213]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b367fca75sm17235287f8f.58.2024.07.31.07.40.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 07:40:35 -0700 (PDT)
From: Marco Rodolfi <marco.rodolfi.1992@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Marco Rodolfi <marco.rodolfi@tuta.io>
Subject: [PATCH] drm: panel-orientation-quirks: Also handle rotation for
 DeckHD equipped LCDs units
Date: Wed, 31 Jul 2024 16:37:07 +0200
Message-ID: <20240731143706.271391-2-marco.rodolfi.1992@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 31 Jul 2024 15:30:09 +0000
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

From: Marco Rodolfi <marco.rodolfi@tuta.io>

This patch also take account of the different resolution for the
aftermarket DeckHD panel, which hasn't been accounted for yet in kernel,
since these quirks are applied based on BIOS information + panel
resolution.

This patch correct that problem and make the panel oriented the right
way.

Signed-off-by: Marco Rodolfi <marco.rodolfi@tuta.io>

---
 drivers/gpu/drm/drm_panel_orientation_quirks.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panel_orientation_quirks.c b/drivers/gpu/drm/drm_panel_orientation_quirks.c
index 3860a8ce1e2d..32582dbdc184 100644
--- a/drivers/gpu/drm/drm_panel_orientation_quirks.c
+++ b/drivers/gpu/drm/drm_panel_orientation_quirks.c
@@ -420,13 +420,20 @@ static const struct dmi_system_id orientation_data[] = {
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Galaxy Book 10.6"),
 		},
 		.driver_data = (void *)&lcd1280x1920_rightside_up,
-	}, {	/* Valve Steam Deck (Jupiter) */
+	}, {	/* Valve Steam Deck (Jupiter) Stock Display */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
 		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Jupiter"),
 		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
 		},
 		.driver_data = (void *)&lcd800x1280_rightside_up,
+	}, {	/* Valve Steam Deck (Jupiter) DeckHD Display */
+		.matches = {
+		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Jupiter"),
+		  DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "1"),
+		},
+		.driver_data = (void *)&lcd1080x1920_rightside_up,
 	}, {	/* Valve Steam Deck (Galileo) */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
-- 
2.46.0

