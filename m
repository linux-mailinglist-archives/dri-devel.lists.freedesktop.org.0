Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64953836086
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 12:06:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E10F310ED86;
	Mon, 22 Jan 2024 11:06:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31ECE10ED86
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 11:06:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AB273612FC;
 Mon, 22 Jan 2024 11:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C2D1C43399;
 Mon, 22 Jan 2024 11:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705921534;
 bh=TxyfiQSfnfbUMhKRrQ0H1rTP3kUo5bAgp6fUTnxFTJs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ri2i+PdEyuTAa48yKloQAaUEBdltv3sUW5IvQCgMHA5/PGjfEtjbCLyTeA5D9LuI/
 yH1G9cZVHEfEI6SGU2iYZMrZxzEV9R0XdnaK9fjVRzCheDdi9FE06VhDFgjKaU8yZo
 aMPf9qZt/S4F0J0tomif/GBJhbR/UeVG0uOXR2F5LzH780+xVi4P8AJQidfdFNIUSA
 2bsuGom7MXXuunapSC1vOQhx0Wn4YBkDm8sIO73aWpIR01/4A+rB6hqNKrjO78Ojfx
 VI3gGDYa7ZRwCTEoFzkvT8imwotEo0ZgLUE9ICL5topY1Fb6Ff5+0FiDPmHbAxKt/8
 kWean2TzXr8cg==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH v2 42/47] fbcon: remove fbcon_getxy()
Date: Mon, 22 Jan 2024 12:03:56 +0100
Message-ID: <20240122110401.7289-43-jirislaby@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122110401.7289-1-jirislaby@kernel.org>
References: <20240122110401.7289-1-jirislaby@kernel.org>
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, linux-serial@vger.kernel.org,
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Again, fbcon_getxy() is the same as the default implementation since the
softscroll removal in commit 50145474f6ef (fbcon: remove soft scrollback
code). Drop that.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/video/fbdev/core/fbcon.c | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 2166ea1a5430..9c2962900d13 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2593,30 +2593,6 @@ static void fbcon_set_palette(struct vc_data *vc, const unsigned char *table)
 	fb_set_cmap(&palette_cmap, info);
 }
 
-static unsigned long fbcon_getxy(struct vc_data *vc, unsigned long pos,
-				 int *px, int *py)
-{
-	unsigned long ret;
-	int x, y;
-
-	if (pos >= vc->vc_origin && pos < vc->vc_scr_end) {
-		unsigned long offset = (pos - vc->vc_origin) / 2;
-
-		x = offset % vc->vc_cols;
-		y = offset / vc->vc_cols;
-		ret = pos + (vc->vc_cols - x) * 2;
-	} else {
-		/* Should not happen */
-		x = y = 0;
-		ret = vc->vc_origin;
-	}
-	if (px)
-		*px = x;
-	if (py)
-		*py = y;
-	return ret;
-}
-
 /* As we might be inside of softback, we may work with non-contiguous buffer,
    that's why we have to use a separate routine. */
 static void fbcon_invert_region(struct vc_data *vc, u16 * p, int cnt)
@@ -3157,7 +3133,6 @@ static const struct consw fb_con = {
 	.con_font_default	= fbcon_set_def_font,
 	.con_set_palette 	= fbcon_set_palette,
 	.con_invert_region 	= fbcon_invert_region,
-	.con_getxy 		= fbcon_getxy,
 	.con_resize             = fbcon_resize,
 	.con_debug_enter	= fbcon_debug_enter,
 	.con_debug_leave	= fbcon_debug_leave,
-- 
2.43.0

