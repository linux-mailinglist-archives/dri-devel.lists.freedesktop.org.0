Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B57AB3BE9B
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 16:58:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 913CB10EBF3;
	Fri, 29 Aug 2025 14:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=temperror (0-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="XEnolZwB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay10.grserver.gr (relay10.grserver.gr [37.27.248.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBB2010EBF0;
 Fri, 29 Aug 2025 14:57:53 +0000 (UTC)
Received: from relay10 (localhost.localdomain [127.0.0.1])
 by relay10.grserver.gr (Proxmox) with ESMTP id 9F74546EEB;
 Fri, 29 Aug 2025 17:57:51 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by relay10.grserver.gr (Proxmox) with ESMTPS id 68B8346E58;
 Fri, 29 Aug 2025 17:57:50 +0300 (EEST)
Received: from antheas-z13 (x5996a855.customers.hiper-net.dk [89.150.168.85])
 by linux3247.grserver.gr (Postfix) with ESMTPSA id 6B8832018C2;
 Fri, 29 Aug 2025 17:57:49 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1756479470;
 bh=wnaFa95KLwLAHuy8hRJGl95XVR2g5HRB8pLDB83uhp4=; h=From:To:Subject;
 b=XEnolZwBIv1Hd+UuES803Wwkw4PVCyozWLBGUn4dkHyg5PQaV7mioMuYXO/f90lxh
 voYVK1BWrhleR5DVnj7ioyaFi1+EjnlZqkPG73g7HnBsyzvhJntlmQ4XxDrTRMrfXm
 /lKcBJ5mWm5Z9Gg9JVxEMQAXnBbLO2mhz8s6mXJ3MdaHTo2bngDPu3N2qYay2lUu3Z
 g1x+4PECNAHL5UMlGHlesm9e2Mf+Yt9PBlQKxAz9DyOx2Rn4aBCTHEc7kNKC2XCSqJ
 QtPPxVPwQ096gMBNl81jqllxSeAsPNTkmkzqebSTUytXlplaFMY6OMctoDRBUtn8eT
 2NYUjxqFI3/yg==
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
Subject: [PATCH v3 5/6] drm: panel-backlight-quirks: Add Steam Deck brightness
 quirk
Date: Fri, 29 Aug 2025 16:55:40 +0200
Message-ID: <20250829145541.512671-6-lkml@antheas.dev>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250829145541.512671-1-lkml@antheas.dev>
References: <20250829145541.512671-1-lkml@antheas.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <175647946994.278128.15105326836596737803@linux3247.grserver.gr>
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
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/gpu/drm/drm_panel_backlight_quirks.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
index 2bdbd5583d32..537dc6dd0534 100644
--- a/drivers/gpu/drm/drm_panel_backlight_quirks.c
+++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
@@ -45,6 +45,21 @@ static const struct drm_get_panel_backlight_quirk drm_panel_min_backlight_quirks
 		.ident.name = "NE135A1M-NY1",
 		.quirk = { .min_brightness = 1, },
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
 	/* Have OLED Panels with brightness issue when last byte is 0/1 */
 	{
 		.dmi_match.field = DMI_SYS_VENDOR,
-- 
2.51.0


