Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 835C1B3BE97
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 16:57:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5BB10EBEF;
	Fri, 29 Aug 2025 14:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=temperror (0-bit key; unprotected) header.d=antheas.dev header.i=@antheas.dev header.b="R9JrjxDr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78E5C10EBEA;
 Fri, 29 Aug 2025 14:57:50 +0000 (UTC)
Received: from relay12 (localhost [127.0.0.1])
 by relay12.grserver.gr (Proxmox) with ESMTP id 1C955BDE43;
 Fri, 29 Aug 2025 17:57:49 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by relay12.grserver.gr (Proxmox) with ESMTPS id 8D31ABDD96;
 Fri, 29 Aug 2025 17:57:48 +0300 (EEST)
Received: from antheas-z13 (x5996a855.customers.hiper-net.dk [89.150.168.85])
 by linux3247.grserver.gr (Postfix) with ESMTPSA id AA6D72018C9;
 Fri, 29 Aug 2025 17:57:47 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
 s=default; t=1756479468;
 bh=iy5mjsAtc23/5vk879aOYltCxJDQw7DgKHkVwiiTYp4=; h=From:To:Subject;
 b=R9JrjxDrLI8z8uwiSf0c2gNBBWRvmn1BpNrkPR1YJMofpENrTmRnkau7z/T2WvEWj
 +4Ch3Sv+FHv7b6sb+rh+XD023YhP3kRqSSo5FOdkh0GkwObxebjqbHwtyYmKW1Hfq+
 L+vu8gco0h+mwmjdELM8jlqBjfG65B0THEYOCozFVtXUDrquRXcoD00pSnY+ZViXjZ
 WJL0YIgBtrp+7WbLcUXlwg/kXdjOVqnys0w5Z7VVXsAAinQRYfoSiAXU+CWBiTqc9U
 NTP3vBVZS381Ns4Ln8HIS8NcgaL1inoBzQDMyibVIi2SbVHe/Q0JLLidPfvV2JMAen
 vzyMGyuoCrA7w==
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
Subject: [PATCH v3 3/6] drm: panel-backlight-quirks: Add secondary DMI match
Date: Fri, 29 Aug 2025 16:55:38 +0200
Message-ID: <20250829145541.512671-4-lkml@antheas.dev>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250829145541.512671-1-lkml@antheas.dev>
References: <20250829145541.512671-1-lkml@antheas.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <175647946822.278051.14854790477276188364@linux3247.grserver.gr>
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

Using a single DMI match only allows matching per manufacturer.
Introduce a second optional match to allow matching make/model.
In addition, make DMI optional to allow matching only by EDID.

Tested-by: Philip Müller <philm@manjaro.org>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
---
 drivers/gpu/drm/drm_panel_backlight_quirks.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
index 702726c20ccc..3d386a96e50e 100644
--- a/drivers/gpu/drm/drm_panel_backlight_quirks.c
+++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
@@ -8,11 +8,14 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_utils.h>
 
+struct drm_panel_match {
+	enum dmi_field field;
+	const char * const value;
+};
+
 struct drm_get_panel_backlight_quirk {
-	struct {
-		enum dmi_field field;
-		const char * const value;
-	} dmi_match;
+	struct drm_panel_match dmi_match;
+	struct drm_panel_match dmi_match_other;
 	struct drm_edid_ident ident;
 	struct drm_panel_backlight_quirk quirk;
 };
@@ -48,7 +51,13 @@ static bool drm_panel_min_backlight_quirk_matches(
 	const struct drm_get_panel_backlight_quirk *quirk,
 	const struct drm_edid *edid)
 {
-	if (!dmi_match(quirk->dmi_match.field, quirk->dmi_match.value))
+	if (quirk->dmi_match.field &&
+	    !dmi_match(quirk->dmi_match.field, quirk->dmi_match.value))
+		return false;
+
+	if (quirk->dmi_match_other.field &&
+	    !dmi_match(quirk->dmi_match_other.field,
+		       quirk->dmi_match_other.value))
 		return false;
 
 	if (quirk->ident.panel_id && !drm_edid_match(edid, &quirk->ident))
-- 
2.51.0


