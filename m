Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D9B913913
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 10:51:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67BCE10E0FE;
	Sun, 23 Jun 2024 08:51:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.b="p88ZX1vK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3DC010E1ED;
 Sun, 23 Jun 2024 08:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
 s=mail; t=1719132689;
 bh=w+SrR5E2JH9+hXfgQFtUFlkQAtNtXTw/JtvQbmbDgI4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=p88ZX1vK0LXjzMv9Cuf3tt6aYObE6RfqxXtI4UUCWNhDlS/8pUHs6gt6TGIhBRyII
 piUqw4EzgSC5SJzS2SVOXyf+0NvY93HZQ7oeEaMX7hbKY4XRz8tJQPU3qihyA660ls
 KnFOZBO4EQlpluBZmv5c9qrXmxOo6WA4YYudn7+s=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sun, 23 Jun 2024 10:51:28 +0200
Subject: [PATCH v2 2/3] drm: panel-backlight-quirks: Add Framework 13 matte
 panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240623-amdgpu-min-backlight-quirk-v2-2-cecf7f49da9b@weissschuh.net>
References: <20240623-amdgpu-min-backlight-quirk-v2-0-cecf7f49da9b@weissschuh.net>
In-Reply-To: <20240623-amdgpu-min-backlight-quirk-v2-0-cecf7f49da9b@weissschuh.net>
To: Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 Matt Hartley <matt.hartley@gmail.com>, Kieran Levin <ktl@framework.net>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dustin Howett <dustin@howett.net>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719132688; l=1413;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=w+SrR5E2JH9+hXfgQFtUFlkQAtNtXTw/JtvQbmbDgI4=;
 b=kObTJ0lXuxpRUDitaTT79l1LZGQynamMmqQkggT8nuu6Lxxyrp77H8ph0Vgw7YJBGZJoCCeqI
 HXJSPX3GUlCBx1Sh4goeIhsBO9tJ0ZcrMWYhTazIoelLw/0UaJwaF/U
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
---
 drivers/gpu/drm/drm_panel_backlight_quirks.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
index a89b5fd1940e..e7671b1ba885 100644
--- a/drivers/gpu/drm/drm_panel_backlight_quirks.c
+++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
@@ -17,6 +17,15 @@ struct drm_panel_backlight_entry {
 };
 
 static const struct drm_panel_backlight_entry drm_panel_backlight_entries[] = {
+	/* 13 inch matte panel */
+	{
+		.dmi_match.field = DMI_BOARD_VENDOR,
+		.dmi_match.value = "Framework",
+		.ident.panel_id = drm_edid_encode_panel_id('B', 'O', 'E', 0x0bca),
+		.ident.name = "NE135FBM-N41",
+		.quirk.overrides.pwm_min_brightness = true,
+		.quirk.pwm_min_brightness = 0,
+	},
 };
 
 static bool drm_panel_backlight_entry_matches(const struct drm_panel_backlight_entry *entry,

-- 
2.45.2

