Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4578313B1
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 09:00:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2D5410E722;
	Thu, 18 Jan 2024 07:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50CCA10E6F4
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 07:59:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A34CDCE1D6B;
 Thu, 18 Jan 2024 07:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 604ADC433C7;
 Thu, 18 Jan 2024 07:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705564765;
 bh=GuttBthplzcWAD92DYxHAXefieOSH/0KZn+o6peTBWY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jK+FEF6cWzI+fO9Fnk6BTANz83FQ+Lf1d+PsJX7UgvaZ3SD0ojQzqBSQUAT0/ca6V
 Y74TcR+ajAzxBP+CHyJf5GIpa9w6z6aLiowoJ4h0OiNZ5YLqLYiTaf20qygE60FF2e
 zQ7thTa4t7woijOADtWIoBemY1RBlSKro8h/aNmGhYzubDfgWf3VoNwdxIdB6+TbU1
 CFQHvk5E6jfSXOeGV3Thu6bwPJbURfO657v2/3kfXKyKWqS9m4bA5F9iQYRBM68YR8
 tWk0jTTDeyqpvaaMIptgZrva5raYWF4rBZOCHDGJsZoW6VNoRuSpOrRKm5HZ+6rS9C
 9X1GNlPY2Opww==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH 37/45] fbcon: remove consw::con_screen_pos()
Date: Thu, 18 Jan 2024 08:57:48 +0100
Message-ID: <20240118075756.10541-38-jirislaby@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240118075756.10541-1-jirislaby@kernel.org>
References: <20240118075756.10541-1-jirislaby@kernel.org>
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

