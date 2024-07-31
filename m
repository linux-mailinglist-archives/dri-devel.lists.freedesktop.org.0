Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB48994335A
	for <lists+dri-devel@lfdr.de>; Wed, 31 Jul 2024 17:30:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58E5510E659;
	Wed, 31 Jul 2024 15:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ub5aOMqD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 107E410E640
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 14:45:47 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-368f92df172so2792245f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Jul 2024 07:45:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722437145; x=1723041945; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XtTvVZlehT5qqGKmMngWyPQ4yDQBJW13Nw5rO8UBbbE=;
 b=Ub5aOMqDPSYHqRqu6p2EoYlMuMETX93OVRAfIwlD1sFxasxsIcszViu/wgRRiMn9yw
 uoaAy7l3SeaRfAFhwFRWKE5L46yfwdUQ06PpmboZX8MskxraSYZAUK6AJTuywvWC9acF
 RybO2XhGUSB8WBKBI/iE/813kqBrndTAquLvznnYoG1Og6jnW0cHyp0Yv2rm/Km/CWms
 rQ6Z4rHNYhpX6RsMWbqaGRlQvAP+f0u1zrX/iGK3FJgJJqtmT1HmoZucf0vlmxWAfgwD
 kFsRhzckFLcduPLSpmUa6ScrDLxKHrloBE5GUBPevcO07sUaCSBDuq18YBJMLKt/DebS
 nufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722437145; x=1723041945;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XtTvVZlehT5qqGKmMngWyPQ4yDQBJW13Nw5rO8UBbbE=;
 b=F/aSp1P+7YRg7No/BbHEI/M9RfgWfBquINnyd3CEAiRmqlAWvNJXj5QVMvXGOJEJG5
 MCjZsktLxSvnctAwRgHnJev13jaQYKPzEP8rLip6widRlV4FLN//JSa7CjFD6MreDBg0
 NHVfXnJ54AKkH9vc4xbuSqsTiaS+QZ59858jc7U/kkc2BE35FgoKUkY0x6hrksclJra4
 rB706gOkT3QNHaWQBLw+vlXpdTjI0AY+M6OyCdg6QZt4bPMgK5c0w5VpCEZ8TeWrn61D
 BDzoM7o5deeCHBz2tKBzkH/drYgTEOTWcIvXHG4yasq64JwozsDQMJCC4DXnlYEZUAAY
 HOmQ==
X-Gm-Message-State: AOJu0Yy0b5Uv4CPf0NagpuvO+9GEASaNXt03yIaxiXNN2fHSNtjT6UL8
 dgDrBN2sFdUV0DDnwVH0Xaj2ei68zR2trxtOhS14Y7My0Z/lQg01XXoMCQ==
X-Google-Smtp-Source: AGHT+IHwpM7IMU0+Fa0BpPNji+JCzqZgU6rAwQ6QwfCWDW4szxKJ8W5j5jclKRSXt/ZZ1YBjwdTvCA==
X-Received: by 2002:a5d:410c:0:b0:368:7edd:cd80 with SMTP id
 ffacd0b85a97d-36b5cf2407cmr9827472f8f.20.1722437145164; 
 Wed, 31 Jul 2024 07:45:45 -0700 (PDT)
Received: from localhost.localdomain (2-230-196-213.ip203.fastwebnet.it.
 [2.230.196.213]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b367d966csm17226451f8f.38.2024.07.31.07.45.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Jul 2024 07:45:44 -0700 (PDT)
From: Marco Rodolfi <marco.rodolfi.1992@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Marco Rodolfi <marco.rodolfi.1992@gmail.com>
Subject: [PATCH] drm: panel-orientation-quirks: Also handle rotation for
 DeckHD equipped LCDs units
Date: Wed, 31 Jul 2024 16:44:25 +0200
Message-ID: <20240731144424.272624-2-marco.rodolfi.1992@gmail.com>
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

This patch also take account of the different resolution for the
aftermarket DeckHD panel, which hasn't been accounted for yet in kernel,
since these quirks are applied based on BIOS information + panel
resolution.

This patch correct that problem and make the panel oriented the right
way.

Signed-off-by: Marco Rodolfi <marco.rodolfi.1992@gmail.com>
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

