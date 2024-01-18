Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 359528313AE
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 09:00:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1A9610E6F4;
	Thu, 18 Jan 2024 07:59:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07E7710E6F4
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 07:59:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 79588B816ED;
 Thu, 18 Jan 2024 07:59:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158B8C43399;
 Thu, 18 Jan 2024 07:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705564762;
 bh=+Fey0ueL3fs+YfoywPjRe7ybSQ7PCBnb+Q6J1ddQlD8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i6d0N+d0AoOKuyftlq2UstduK0SAteraz7/1E0aTPJEQfef6OmG9CSofeaGqyUdKA
 hwKgSj9tEJR5fT59H/Izk8fUdoEqrDAEWg/N87P+xddlAIv6psQeNzXX7udJPzfYd2
 M01zz2/WKFXSoo20pLY4mZuIErSwMTflEv1KDIFx2kCwSQ9msgpt5yxukoKWhs8Ty5
 Ltu0WoFKcFd6E0TFeYwWmSoPigVQXjaktPHZLdn7CCYJ+61ZPt/a1BdxYNNQrKLYAK
 UX41bBxpOaqaLe+xJFhNfhsK4GsZHLYKXFOgcbA2Kcp/O/o19WoqssSadd5S49uwx4
 rp8Eqbl0abYRA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH 36/45] tty: vt: change consw::con_set_origin() return type
Date: Thu, 18 Jan 2024 08:57:47 +0100
Message-ID: <20240118075756.10541-37-jirislaby@kernel.org>
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
index ea086b39c6f5..4a40da81990d 100644
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
index 543de22a3f23..c07e1ce6bd14 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -63,6 +63,9 @@ enum vc_intensity;
  * @con_set_palette: sets the palette of the console to @table (optional)
  * @con_scrolldelta: the contents of the console should be scrolled by @lines.
  *		     Invoked by user. (optional)
+ * @con_set_origin: set origin (see &vc_data::vc_origin) of the @vc. If not
+ *		provided or returns false, the origin is set to
+ *		@vc->vc_screenbuf. (optional)
  */
 struct consw {
 	struct module *owner;
@@ -95,7 +98,7 @@ struct consw {
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

