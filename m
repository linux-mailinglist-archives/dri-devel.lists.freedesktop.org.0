Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84791B388D3
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 19:46:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB1610E87F;
	Wed, 27 Aug 2025 17:46:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=temperror (0-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="H7MrhF69";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2160510E87F;
 Wed, 27 Aug 2025 17:46:21 +0000 (UTC)
Received: from relay10 (localhost.localdomain [127.0.0.1])
 by relay10.grserver.gr (Proxmox) with ESMTP id D2CCF49367;
 Wed, 27 Aug 2025 20:46:19 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by relay10.grserver.gr (Proxmox) with ESMTPS id 102294936C;
 Wed, 27 Aug 2025 20:46:19 +0300 (EEST)
Received: from antheas-z13 (x5996a855.customers.hiper-net.dk [89.150.168.85])
 by linux3247.grserver.gr (Postfix) with ESMTPSA id 1FC141FDEA8;
 Wed, 27 Aug 2025 20:46:18 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1756316778;
 bh=ISfp3kQz5F8NvozgxSjB9Oij0MVFzpiUsAcxlVWnpG4=; h=From:To:Subject;
 b=H7MrhF6937KuzgwZwR6bOzHDepZVt4vA+hNmsiwgtvG8dUGmhseJbC9NZe4han9gf
 OnD4onVQM/+wdcs9zOS3vTYP4uA8ffqMKHrJU9/oUx289K+f6w9jIz/0VS7Xhm8S3H
 l7cQ5nXkHB2lS5+T7ZciBBMgHSkHYYIjdFV/QsWAuuR/h/pCmToknRgZaYrr61Lu8b
 qgH9dY0ajCzrQPiFP4DmspYQSkpJCXZqF2rkaemHyIpL9cPBmmz+44ebitiUV3DatJ
 6qvk0V4FU1bxElSpvRzN9HHNwJz1zLisZAOgK8KEVJrhsQNz0u2IklZ78bYKAK6SIT
 FNFs2Kic63bZA==
Authentication-Results: linux3247.grserver.gr;
 spf=pass (sender IP is 89.150.168.85) smtp.mailfrom=lkml@antheas.dev
 smtp.helo=antheas-z13
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 philm@manjaro.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v2 5/5] drm: panel-backlight-quirks: Add Steam Deck brightness
 quirk
Date: Wed, 27 Aug 2025 19:44:00 +0200
Message-ID: <20250827174400.3692549-6-lkml@antheas.dev>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250827174400.3692549-1-lkml@antheas.dev>
References: <20250827174400.3692549-1-lkml@antheas.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <175631677861.1365508.2422182497171344248@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean
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

On the SteamOS kernel, Valve universally makes minimum brightness 0
for all devices. SteamOS is (was?) meant for the Steam Deck, so
enabling it universally is reasonable. However, it causes issues in
certain devices. Therefore, introduce it just for the Steam Deck here.

SteamOS kernel does not have a public mirror, but this replaces commit
806dd74bb225 ("amd/drm: override backlight min value from 12 -> 0")
in the latest, as of this writing, SteamOS kernel (6.11.11-valve24).
See unofficial mirror reconstructed from sources below.

Link: https://gitlab.com/evlaV/linux-integration/-/commit/806dd74bb225
Reviewed-by: Robert Beckett <bob.beckett@collabora.com>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/gpu/drm/drm_panel_backlight_quirks.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
index 2bdbd5583d32..69d38c248a0a 100644
--- a/drivers/gpu/drm/drm_panel_backlight_quirks.c
+++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
@@ -81,6 +81,21 @@ static const struct drm_get_panel_backlight_quirk drm_panel_min_backlight_quirks
 		.dmi_match_other.value = "ONEXPLAYER F1 EVA-02",
 		.quirk = { .brightness_mask = 3, },
 	},
+	/* Steam Deck models */
+	{
+		.dmi_match.field = DMI_SYS_VENDOR,
+		.dmi_match.value = "Valve",
+		.dmi_match_other.field = DMI_PRODUCT_NAME,
+		.dmi_match_other.value = "Jupiter",
+		.quirk = { .min_brightness = 1, },
+	},
+	{
+		.dmi_match.field = DMI_SYS_VENDOR,
+		.dmi_match.value = "Valve",
+		.dmi_match_other.field = DMI_PRODUCT_NAME,
+		.dmi_match_other.value = "Galileo",
+		.quirk = { .min_brightness = 1, },
+	},
 };
 
 static bool drm_panel_min_backlight_quirk_matches(
-- 
2.51.0


