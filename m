Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13823836070
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 12:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 498FF10ED78;
	Mon, 22 Jan 2024 11:05:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3C6210ED72
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 11:05:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D041F612EE;
 Mon, 22 Jan 2024 11:05:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCABEC43390;
 Mon, 22 Jan 2024 11:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705921526;
 bh=2URKPRL7zfWbHQYqpoKtEkBU2SALWu3e2GJlko088uA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uzUIcl3IVgdt1LAfkiVpeKfY50AYKvfkmObnKYuViAvyPsXvlgJjkZEVtW3QmLoe9
 I/YvcsOjspyVNZsdjaQuG+rArH/xY/E2IrrVtWLU2m/3derN05jBl2dUmTvO+b77Mr
 a82d3Kyd0MfhEbAg1kiB6itfc34E3RSpQ4WGxVbvOLOj8dzz7BoPaocd8xJJBYbZHi
 II16H+iunyulp4AtsHZMAF4uTr9Iwr+GkI/YwrKG43tatrQO444uVhxUSYnXANuYFU
 KUQKlOYciL1DZZbtpgA0A99HIq+6c5BlC8+JAnQTjcaQ1LdJ6nYliHba8axR5knQfy
 jXi1oDoQFj0cg==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH v2 38/47] tty: vt: change consw::con_set_origin() return type
Date: Mon, 22 Jan 2024 12:03:52 +0100
Message-ID: <20240122110401.7289-39-jirislaby@kernel.org>
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
Cc: linux-fbdev@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-serial@vger.kernel.org, "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The return value of consw::con_set_origin() is only true/false, meaining
if vc->vc_origin is set to vc->vc_screenbuf or not.

So switch the type and returned values accordingly.

And document the hook.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/video/console/vgacon.c | 8 ++++----
 include/linux/console.h        | 5 ++++-
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index 4d1c8f5863af..7597f04b0dc7 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -65,7 +65,7 @@ static struct vgastate vgastate;
  *  Interface used by the world
  */
 
-static int vgacon_set_origin(struct vc_data *c);
+static bool vgacon_set_origin(struct vc_data *c);
 
 static struct uni_pagedict *vgacon_uni_pagedir;
 static int vgacon_refcount;
@@ -1100,15 +1100,15 @@ static int vgacon_resize(struct vc_data *c, unsigned int width,
 	return 0;
 }
 
-static int vgacon_set_origin(struct vc_data *c)
+static bool vgacon_set_origin(struct vc_data *c)
 {
 	if (vga_is_gfx ||	/* We don't play origin tricks in graphic modes */
 	    (console_blanked && !vga_palette_blanked))	/* Nor we write to blanked screens */
-		return 0;
+		return false;
 	c->vc_origin = c->vc_visible_origin = vga_vram_base;
 	vga_set_mem_top(c);
 	vga_rolled_over = 0;
-	return 1;
+	return true;
 }
 
 static void vgacon_save_screen(struct vc_data *c)
diff --git a/include/linux/console.h b/include/linux/console.h
index 6bb7e5e37ae4..82e4b554a801 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -55,6 +55,9 @@ enum vc_intensity;
  * @con_set_palette: sets the palette of the console to @table (optional)
  * @con_scrolldelta: the contents of the console should be scrolled by @lines.
  *		     Invoked by user. (optional)
+ * @con_set_origin: set origin (see &vc_data::vc_origin) of the @vc. If not
+ *		provided or returns false, the origin is set to
+ *		@vc->vc_screenbuf. (optional)
  */
 struct consw {
 	struct module *owner;
@@ -87,7 +90,7 @@ struct consw {
 	void	(*con_set_palette)(struct vc_data *vc,
 			const unsigned char *table);
 	void	(*con_scrolldelta)(struct vc_data *vc, int lines);
-	int	(*con_set_origin)(struct vc_data *vc);
+	bool	(*con_set_origin)(struct vc_data *vc);
 	void	(*con_save_screen)(struct vc_data *vc);
 	u8	(*con_build_attr)(struct vc_data *vc, u8 color,
 			enum vc_intensity intensity,
-- 
2.43.0

