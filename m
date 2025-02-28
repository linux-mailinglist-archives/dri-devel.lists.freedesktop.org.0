Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D268A4A470
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 21:55:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7381E10E06F;
	Fri, 28 Feb 2025 20:55:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dnaXFuUN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7A910E06F
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Feb 2025 20:55:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DFBA95C0466;
 Fri, 28 Feb 2025 20:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60A10C4CED6;
 Fri, 28 Feb 2025 20:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1740776148;
 bh=DVOXdCV9GkKYKxJB6M6Kf40iX3b9h5JojSMUwEOoEC0=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=dnaXFuUNQqz0wHQwxbaushLVMexq5C5PgypAKDW428FXp/185OwGsEhnCMNeUqRS2
 ASM+MbzhVAvQK1kQ4mw1rTct9OPfb8buRc8pFeYejFUiGLJydIkdVWirdQFxLq5quD
 3k5AoNhk6W5JlN8drQuRKIB3WzOMPw+fK74nDFN/lhLX8uIlQlly4mqVxJPRJfabNv
 q1QvALJtPP9t6WEluTRaQjkcoAXEQnIBdh/gwn9taPucd5YoeZRZc4v/U/OdbdahlJ
 0Op49tNlCuVMX9t0W2xJMvsSzey85+pyhGMqUjWd6FEeGLR1Vsof0kUhehWKz1x369
 sjeEY/rd52lYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 49037C282C5;
 Fri, 28 Feb 2025 20:55:48 +0000 (UTC)
From: Mark Dietzer via B4 Relay <devnull+git.doridian.net@kernel.org>
Date: Fri, 28 Feb 2025 12:55:38 -0800
Subject: [PATCH v2] drm: panel-backlight-quirks: Add Framework 16 panel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250228-framework16-drm-quirks-v2-1-c7faf86f5e9d@doridian.net>
X-B4-Tracking: v=1; b=H4sIAMkiwmcC/x3MSw6DIBSF4a0Yxr0GqCJ01H00HaBcKrGIvdhHY
 tx7iZOTfIPzbywjBczsUm2M8BNySHOBPFVsGO38QAiumEkuWy6lBk824jfRJBQ4ivB6B5oydE3
 fasd5d9aKlfNC6MPvCN/uxZ5ShHUktEdODEZpIRAa1zbQaG6hH7gp46QxBjUqdbXLUnub12jDs
 x5SZPv+B37kwIywAAAA
X-Change-ID: 20250228-framework16-drm-quirks-74b58d007386
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Mark Dietzer <git@doridian.net>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740776148; l=1790;
 i=git@doridian.net; s=20250228; h=from:subject:message-id;
 bh=VIZraXEVgTCwedadhMfL61upUk+4zJ3L3psT7F1eUjI=;
 b=o/XjDTdr9X8LVhvkYI397hOp1cceapWrnvZWHE/45brOGko4VU0lqtnkEU26kUdr2mikXI7Xk
 RgqPAOhD16NBWb3cl1lzUpg/Yr0y89XlI2h9MqEMBovyEUZGxzn8DHr
X-Developer-Key: i=git@doridian.net; a=ed25519;
 pk=XY9bZ7EBhoLNoRt6zd2/vutpAXC3tsX6OytpZHjbUsQ=
X-Endpoint-Received: by B4 Relay for git@doridian.net/20250228 with auth_id=353
X-Original-From: Mark Dietzer <git@doridian.net>
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
Reply-To: git@doridian.net
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mark Dietzer <git@doridian.net>

Similarly for the Framework 13 panels already handled in those quirks,
the 16 can be helped by the same kind of patch.

I have run this on my own 16 for multiple months (hard coding the value to
0 before the quirks made it upstream) and it has resulted in a darker
minimum brightness (as expected) and no issues.

The Framework community threads between the 13 and 16 for this improvement
are the same one, so user reports in the link below will be mixed and
likely more focused on the 13.

Link: https://community.frame.work/t/solved-even-lower-screen-brightness/25711/60

Signed-off-by: Mark Dietzer <git@doridian.net>
Reviewed-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/gpu/drm/drm_panel_backlight_quirks.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel_backlight_quirks.c b/drivers/gpu/drm/drm_panel_backlight_quirks.c
index c477d98ade2b41314d4218281ced7d3c4d087769..52aa2a7fa63e5b0fefc1d94bf1f9ace8e2af8962 100644
--- a/drivers/gpu/drm/drm_panel_backlight_quirks.c
+++ b/drivers/gpu/drm/drm_panel_backlight_quirks.c
@@ -41,6 +41,14 @@ static const struct drm_panel_min_backlight_quirk drm_panel_min_backlight_quirks
 		.ident.name = "NE135A1M-NY1",
 		.min_brightness = 0,
 	},
+	/* 16 inch panel */
+	{
+		.dmi_match.field = DMI_BOARD_VENDOR,
+		.dmi_match.value = "Framework",
+		.ident.panel_id = drm_edid_encode_panel_id('B', 'O', 'E', 0x0cb4),
+		.ident.name = "NE160QDM-NZ6",
+		.min_brightness = 0,
+	},
 };
 
 static bool drm_panel_min_backlight_quirk_matches(const struct drm_panel_min_backlight_quirk *quirk,

---
base-commit: 76544811c850a1f4c055aa182b513b7a843868ea
change-id: 20250228-framework16-drm-quirks-74b58d007386

Best regards,
-- 
Mark Dietzer <git@doridian.net>


