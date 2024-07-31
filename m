Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FFD94335D
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 17:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8DA210E65E;
	Wed, 31 Jul 2024 15:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DV6EZIQ+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9388A10E59D
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 11:15:37 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-42808071810so35868905e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 04:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722424536; x=1723029336; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Yoc6zeV+UUfPUAkO8s473XLApPWUZwYT209NIsza5Bk=;
 b=DV6EZIQ+cr3k90ADctj9Dv1sCZbR6ragrQ+HCv1LJ7u9dKt32t1xjVYjsgqHBGrfY4
 kc2OYfNU0q9NDZr/x/88ckNqO4/VJKN5wV5IHNZzIFGbdGKYA48zAj42t0W3CKBS1nDe
 aADegb2gYNabRaV1Vi0oc9nDczy+bVpPKuoJ5zwQCwBpA6vyjpJsojJpIHoLWG+/Sbnn
 9sPeZdxQeP1DAo7kZqFsCC7jjSzpvj7V13NMlF2r37hPZOR6uWDWao9XE8bCK5qYjYOV
 iHbhK5W242NKbfEqG5NFaPsoC91baatOHUkWLOPOD0rwmGE0778SFAVX5fogmdWPvzgL
 wGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722424536; x=1723029336;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Yoc6zeV+UUfPUAkO8s473XLApPWUZwYT209NIsza5Bk=;
 b=i6Etk7SA+2mkgPSOdgR9AYAM236vaM7aE241YXcQP2KcXosSNh2GWlBsdlEaI2EEJi
 bPipHw24loinoEMxpelXSAUp3lSOYNQh8eRuwINBW/f6ziiOCkaNzDb/XztDsY2sbVZn
 /c9gkpIA+ydUWkM5yT7Zh+YMwFCdadfsMk1UWg6RIawcx/AMFNk3EHHLbLSVVEVwIKCH
 5kVS+693D84x0Mau+gBMaDcD6ky50w9UMGbe1W3H/LqUCAKL0of0BwAg6szY63tWkEWA
 cI6UQ6W2njS5kpiyePyKDJ0VHNNHqC/mDIs7CLXIFe4uM8ufxNejVwx/MsZHaEWg6UsH
 f9aQ==
X-Gm-Message-State: AOJu0YzhpBhcHMpbHQgROOnNFkQopzGT4GYRMiJExOU0PpLTC5GUy0QP
 aSE8lN9L7eYv9gB+MkAgiMhWhgZqXKbks+EGwLIjc6O48AQZjaiPDSyvUQ==
X-Google-Smtp-Source: AGHT+IEFsOOfa78LBgpnWf3DHLhofIGUtIXlBYtyFfM5jESbcgZHgSvbueACD84KfPPhcOHgD3HFsw==
X-Received: by 2002:adf:e90a:0:b0:368:5e8:2c8e with SMTP id
 ffacd0b85a97d-36b5d093b36mr8768638f8f.58.1722424535713; 
 Wed, 31 Jul 2024 04:15:35 -0700 (PDT)
Received: from localhost.localdomain (2-230-196-213.ip203.fastwebnet.it.
 [2.230.196.213]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b367fc873sm16786850f8f.60.2024.07.31.04.15.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 04:15:35 -0700 (PDT)
From: Marco Rodolfi <marco.rodolfi.1992@gmail.com>
X-Google-Original-From: Marco Rodolfi <marco.rodolfi@tuta.io>
To: dri-devel@lists.freedesktop.org
Cc: Marco Rodolfi <marco.rodolfi@tuta.io>
Subject: [PATCH] drm: panel-orientation-quirks: Also handle rotation for
 DeckHD equipped LCDs units
Date: Wed, 31 Jul 2024 13:13:51 +0200
Message-ID: <20240731111350.221646-2-marco.rodolfi@tuta.io>
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

