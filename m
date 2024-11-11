Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 595569C4499
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 19:10:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB53810E500;
	Mon, 11 Nov 2024 18:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="Dz6gdD3K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 765BC10E501;
 Mon, 11 Nov 2024 18:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1731348626;
 bh=8H8xBXK1HgMOQ+vsSlHOZrCpBpOh7Wa+WddZuG0gJME=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Dz6gdD3K2TBD9RO43ZUaklQcdPxzwQMa4ug7LVTRJ02Lbr3/moDFSw5s05MvXBEAa
 Rt5A+Xmo4smMhHABQYjGLZVle3qVBWM53ENB44ohqfilLnoIR5zGtQfun+N9OaszF9
 rNflUchacH3heP9fwzo8KTh5vNELxOqNzGCQ0RjU=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 11 Nov 2024 19:09:37 +0100
Subject: [PATCH v7 3/4] drm: panel-backlight-quirks: Add Framework 13 matte
 panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241111-amdgpu-min-backlight-quirk-v7-3-f662851fda69@weissschuh.net>
References: <20241111-amdgpu-min-backlight-quirk-v7-0-f662851fda69@weissschuh.net>
In-Reply-To: <20241111-amdgpu-min-backlight-quirk-v7-0-f662851fda69@weissschuh.net>
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, Xinhui Pan <Xinhui.Pan@amd.com>, 
 Jonathan Corbet <corbet@lwn.net>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>, 
 linux-doc@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731348626; l=1592;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=8H8xBXK1HgMOQ+vsSlHOZrCpBpOh7Wa+WddZuG0gJME=;
 b=SsWiSHcju57hPOqWYpNBRHXQOeyPsQ0H9go2sfjMDozSoFIbgmJ1DHFx/wRLqrgHQzaugrCF2
 r5+YMI1pVNGBGKhAvDw4fihbwJaBcJfXVbOKeTXG2mW4CX+IPW+ofoQ
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
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

The value of "min_input_signal" returned from ATIF on a Framework AMD 13
is "12". This leads to a fairly bright minimum display backlight.

Add a quirk to override that the minimum backlight PWM to "0" which
leads to a much lower minimum brightness, which is still visible.

Tested on a Framework AMD 13 BIOS 3.05 with the matte panel.

Link: https://community.frame.work/t/25711/9
Link: https://community.frame.work/t/47036
Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
Tested-by: Dustin L. Howett <dustin@howett.net>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Harry Wentland <harry.wentland@amd.com>
---
 drivers/gpu/drm/drm_panel_backlight_quirks.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
index 6b8bbed77c7f1f3570a6e68c276244cfe4386f6c..f2aefff618ddbb6c2170db5c9f535f3b6a465d1d 100644
--- a/drivers/gpu/drm/drm_panel_backlight_quirks.c
+++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
@@ -17,6 +17,14 @@ struct drm_panel_min_backlight_quirk {
 };
 
 static const struct drm_panel_min_backlight_quirk drm_panel_min_backlight_quirks[] = {
+	/* 13 inch matte panel */
+	{
+		.dmi_match.field = DMI_BOARD_VENDOR,
+		.dmi_match.value = "Framework",
+		.ident.panel_id = drm_edid_encode_panel_id('B', 'O', 'E', 0x0bca),
+		.ident.name = "NE135FBM-N41",
+		.min_brightness = 0,
+	},
 };
 
 static bool drm_panel_min_backlight_quirk_matches(const struct drm_panel_min_backlight_quirk *quirk,

-- 
2.47.0

