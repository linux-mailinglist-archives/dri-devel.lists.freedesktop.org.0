Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C2883607C
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 12:06:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD0C10ED84;
	Mon, 22 Jan 2024 11:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0056B10ED84
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 11:06:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 82694B80D63;
 Mon, 22 Jan 2024 11:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3170C43394;
 Mon, 22 Jan 2024 11:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705921528;
 bh=GuttBthplzcWAD92DYxHAXefieOSH/0KZn+o6peTBWY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JkEJ3ZLeZRKJT8TiXZPqzBFEKe8bSvYCaa3SZPpPAZMk3r7QIrU+oy8ELtckKcy6y
 5F/Kkgnm6T8CqAJfKL61naUGAqh2QtxSmK8Es8gI0qcrmbAs0WM5ZvU8ZUKqqva4ba
 4M3SAsgY2fJ0YpGFqC67JbfYi21V+5c0oneK1c1+RdHMpiTWFHwtbvia0utDvqla+T
 N5mjhTj490fiqEMnP9Bm5mw7X1ZMR6A7ZgjBkIQHjUqggq+dCt8CyRDixMNHw3pxwH
 y+EIFO+j/t8YPtX2iGQF9Vs+aKGlFrL55d3IldtPP0o/MOpZ63YStm4+HhMomxY9D/
 21lUB+gCy9n9A==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH v2 39/47] fbcon: remove consw::con_screen_pos()
Date: Mon, 22 Jan 2024 12:03:53 +0100
Message-ID: <20240122110401.7289-40-jirislaby@kernel.org>
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

fbcon_screen_pos() performs the same as the default implementation. The
only difference in the default implementation is that is considers both
vc->vc_origin and vc->vc_visible_origin. But given fbcon's softscroll
code was already removed in commit 50145474f6ef (fbcon: remove soft
scrollback code), both are always the same.

So remove fbcon_screen_pos() too.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/video/fbdev/core/fbcon.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 657160eec0a5..2166ea1a5430 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2593,11 +2593,6 @@ static void fbcon_set_palette(struct vc_data *vc, const unsigned char *table)
 	fb_set_cmap(&palette_cmap, info);
 }
 
-static u16 *fbcon_screen_pos(const struct vc_data *vc, int offset)
-{
-	return (u16 *) (vc->vc_origin + offset);
-}
-
 static unsigned long fbcon_getxy(struct vc_data *vc, unsigned long pos,
 				 int *px, int *py)
 {
@@ -3162,7 +3157,6 @@ static const struct consw fb_con = {
 	.con_font_default	= fbcon_set_def_font,
 	.con_set_palette 	= fbcon_set_palette,
 	.con_invert_region 	= fbcon_invert_region,
-	.con_screen_pos 	= fbcon_screen_pos,
 	.con_getxy 		= fbcon_getxy,
 	.con_resize             = fbcon_resize,
 	.con_debug_enter	= fbcon_debug_enter,
-- 
2.43.0

