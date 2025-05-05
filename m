Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 030F3AAA09B
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 00:37:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A63510E4E1;
	Mon,  5 May 2025 22:37:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A1hCKBEX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9240610E4E1
 for <dri-devel@lists.freedesktop.org>; Mon,  5 May 2025 22:37:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1356F629C0;
 Mon,  5 May 2025 22:36:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F61FC4CEED;
 Mon,  5 May 2025 22:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746484642;
 bh=UQ4fYYDOqGWhEE90z4YemxbN1I6T53FGwnmHFuiuFEA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=A1hCKBEX3AYj/SwldQIi+U4oJLSyUYy/qbZ4YZ+eTRbhu4BbGcfhWHKX80SgA+Dhv
 N5h54ExjC6Tmxv6t63XVT8ZHr0OVB9FOCjE15mIiwViwhghXAVTgB6Dr69TD5gLz1Q
 d57N7nC1Pz/K9Z6M3kCmTgvP1mq7/3Xx1wCHd3oa8zpJQcts/qSE606XrdimvZc/AE
 yVq4qKzFUWfokJ5fzjZ2ML2tB88k37tddQ64pwMhG2lE93ikY4gUjR95u++8mesbW1
 Io0u1qpSEFH3pXUiJW+GxceCjrquD1we+LsJzg1lib+8NMWpfcNMWS6NcRI9IS4xuK
 EyZ7f0FFX31rw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Jocelyn Falempe <jfalempe@redhat.com>, Sasha Levin <sashal@kernel.org>,
 airlied@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.14 579/642] drm/ast: Find VBIOS mode from regular
 display size
Date: Mon,  5 May 2025 18:13:15 -0400
Message-Id: <20250505221419.2672473-579-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit
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

From: Thomas Zimmermann <tzimmermann@suse.de>

[ Upstream commit c81202906b5cd56db403e95db3d29c9dfc8c74c1 ]

The ast driver looks up supplied display modes from an internal list of
display modes supported by the VBIOS.

Do not use the crtc_-prefixed display values from struct drm_display_mode
for looking up the VBIOS mode. The fields contain raw values that the
driver programs to hardware. They are affected by display settings like
double-scan or interlace.

Instead use the regular vdisplay and hdisplay fields for lookup. As the
programmed values can now differ from the values used for lookup, set
struct drm_display_mode.crtc_vdisplay and .crtc_hdisplay from the VBIOS
mode.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250131092257.115596-9-tzimmermann@suse.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/ast/ast_mode.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 9d5321c81e68d..a29fe1ae803f1 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -131,7 +131,7 @@ static bool ast_get_vbios_mode_info(const struct drm_format_info *format,
 		return false;
 	}
 
-	switch (mode->crtc_hdisplay) {
+	switch (mode->hdisplay) {
 	case 640:
 		vbios_mode->enh_table = &res_640x480[refresh_rate_index];
 		break;
@@ -145,7 +145,7 @@ static bool ast_get_vbios_mode_info(const struct drm_format_info *format,
 		vbios_mode->enh_table = &res_1152x864[refresh_rate_index];
 		break;
 	case 1280:
-		if (mode->crtc_vdisplay == 800)
+		if (mode->vdisplay == 800)
 			vbios_mode->enh_table = &res_1280x800[refresh_rate_index];
 		else
 			vbios_mode->enh_table = &res_1280x1024[refresh_rate_index];
@@ -157,7 +157,7 @@ static bool ast_get_vbios_mode_info(const struct drm_format_info *format,
 		vbios_mode->enh_table = &res_1440x900[refresh_rate_index];
 		break;
 	case 1600:
-		if (mode->crtc_vdisplay == 900)
+		if (mode->vdisplay == 900)
 			vbios_mode->enh_table = &res_1600x900[refresh_rate_index];
 		else
 			vbios_mode->enh_table = &res_1600x1200[refresh_rate_index];
@@ -166,7 +166,7 @@ static bool ast_get_vbios_mode_info(const struct drm_format_info *format,
 		vbios_mode->enh_table = &res_1680x1050[refresh_rate_index];
 		break;
 	case 1920:
-		if (mode->crtc_vdisplay == 1080)
+		if (mode->vdisplay == 1080)
 			vbios_mode->enh_table = &res_1920x1080[refresh_rate_index];
 		else
 			vbios_mode->enh_table = &res_1920x1200[refresh_rate_index];
@@ -210,6 +210,7 @@ static bool ast_get_vbios_mode_info(const struct drm_format_info *format,
 	hborder = (vbios_mode->enh_table->flags & HBorder) ? 8 : 0;
 	vborder = (vbios_mode->enh_table->flags & VBorder) ? 8 : 0;
 
+	adjusted_mode->crtc_hdisplay = vbios_mode->enh_table->hde;
 	adjusted_mode->crtc_htotal = vbios_mode->enh_table->ht;
 	adjusted_mode->crtc_hblank_start = vbios_mode->enh_table->hde + hborder;
 	adjusted_mode->crtc_hblank_end = vbios_mode->enh_table->ht - hborder;
@@ -219,6 +220,7 @@ static bool ast_get_vbios_mode_info(const struct drm_format_info *format,
 					 vbios_mode->enh_table->hfp +
 					 vbios_mode->enh_table->hsync);
 
+	adjusted_mode->crtc_vdisplay = vbios_mode->enh_table->vde;
 	adjusted_mode->crtc_vtotal = vbios_mode->enh_table->vt;
 	adjusted_mode->crtc_vblank_start = vbios_mode->enh_table->vde + vborder;
 	adjusted_mode->crtc_vblank_end = vbios_mode->enh_table->vt - vborder;
-- 
2.39.5

