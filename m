Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98FDD944A0D
	for <lists+dri-devel@lfdr.de>; Thu,  1 Aug 2024 13:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A04910E90B;
	Thu,  1 Aug 2024 11:07:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Z5tTmjzn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4FC10E8A4
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Aug 2024 07:15:02 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3687ea0521cso4302003f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 01 Aug 2024 00:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1722496501; x=1723101301; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7rmqBnLseOtJ9KRdZacKpjLcbfV4+lBj1GzvcZ+bqJo=;
 b=Z5tTmjzn5veMgdtiE6b99IA6U5FObAfEMKp2xiSOSo7aqhnv4fmYvwm6rIfxa+q2b1
 g25AiE5qi08ORQHpeWpT92tZp4XMAmSZ8dFrb3d/GfW/oys8lQ14MUw8hmUQd8A8axoj
 NadAGiFGSmEwJxMD1G3Sm2wBTmrgOTgUy4D99p10ArNZkPzCDAMx5ww3Rl+mvCyQkR2S
 WYn5E4ZOK5RDljRbx4O+7G8z7hwcQowtQsXNXfZVKjX8msIm5Q/ePw2bTs248HPEsnQL
 FUan9YIU9OakeoCDHJxLsDcmubfximOpfhPqFnIpJGlLEzwV0OZOEKy3/BjxYgw2puLn
 d+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722496501; x=1723101301;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7rmqBnLseOtJ9KRdZacKpjLcbfV4+lBj1GzvcZ+bqJo=;
 b=IUraA0lM8LMsuVOavOQgVscaCtcVlbcgy+M4p318QxHtbQlAIi2eDpyc4pAMhWYUhd
 kETHOsDEnDPkOIiALyvEccbX9UaX2mJ6KdjwBiRVs+JuHpGjpYKQMP+JRRwlfMcHZska
 /oAc6CsX58d41h6FGMTDHWSSBxWzhyEhfWqURNEhcqpnxGR2nG4k8l+az0q8uPukbUHF
 1CLW1+MEJRwsTdfBmTEjiVAvDzBE8yn22CSpgRwY8yhW7Y9U+X4efS6g6YKcic49/qNj
 3Mty4ZsIsF5myll7FaKID6qEoHCll0q8/gq93pcchooAG0+d1zal3Xryax/+0rLGbBI7
 rVqw==
X-Gm-Message-State: AOJu0YxyC2oerbaUeUSci0M6OTCQ+OGw9THcx0gbF+I1/KQ7qPfE4jM1
 TTqxnh+6cj1semRztesxHlqGU0yg9ZGoCLPqB1r6t1HmgBPv9e7HxSJEtQ==
X-Google-Smtp-Source: AGHT+IHCIHnPkzdnbELB+bdsG/wG+2k7LXNxUzEOoMmV2vPI5s8jIxCr1/58PbwkhXHl7mDAHteg4g==
X-Received: by 2002:adf:f60d:0:b0:369:b842:5065 with SMTP id
 ffacd0b85a97d-36baaf61c08mr1184585f8f.41.1722496500711; 
 Thu, 01 Aug 2024 00:15:00 -0700 (PDT)
Received: from localhost.localdomain (2-230-196-213.ip203.fastwebnet.it.
 [2.230.196.213]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36b367c0574sm18661407f8f.8.2024.08.01.00.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Aug 2024 00:15:00 -0700 (PDT)
From: Marco Rodolfi <marco.rodolfi.1992@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Marco Rodolfi <marco.rodolfi@tuta.io>
Subject: [PATCH] [V2] drm: panel-orientation-quirks: Also handle rotation for
 DeckHD equipped LCDs units
Date: Thu,  1 Aug 2024 09:10:03 +0200
Message-ID: <20240801071002.35814-2-marco.rodolfi.1992@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 01 Aug 2024 11:07:51 +0000
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

Changes in V2:
Had some issues with gmail and this mailinglist that I completely
mistyped the panel resolution in the original patch. It is still a 16:10
panel, not a 16:9, so the original one is wrong. It's fixed now.

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
+		.driver_data = (void *)&lcd1200x1920_rightside_up,
 	}, {	/* Valve Steam Deck (Galileo) */
 		.matches = {
 		  DMI_EXACT_MATCH(DMI_SYS_VENDOR, "Valve"),
-- 
2.46.0

