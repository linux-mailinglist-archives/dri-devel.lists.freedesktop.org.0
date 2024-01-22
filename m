Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B81836084
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 12:06:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E11910ED82;
	Mon, 22 Jan 2024 11:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C129D10ED82
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 11:05:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 28D49B80D61;
 Mon, 22 Jan 2024 11:05:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D482C433B1;
 Mon, 22 Jan 2024 11:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705921521;
 bh=IKLg2kJaeFqcGQ+VJxoWwGbKT+lgS5Wu+LxqOcY2pXU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SfPDnsT0HFDqd7BvvI4vHArKincsCUZrgtwb0crZzdmZ8BromTvHLjEpghtSwr3Zy
 OEysS7LKIKJ3mCUPQHEJ8WnPtVT5RsxMqhbru2ZujivlVq8iuiiwYZ64QzCNk61X4o
 OapVg3wKBd8Yw9JJ3DsL9vNh7s3ve3UQ7x5yQ49UXalDlQ7FC/alaa4SV4d9KLNv/p
 AknQ9pdt3N9kljn9/jKJhY9GvJAA+Hw1gv0+xT1gFyOU6uuo5eTHngOXx965H9BOu+
 SAlhiy6EbGBHb6w2F8Gdn8psTdLhzEVdNCckdpjXgOVz8/xgC53gTbIUBL6/tu2mex
 RbEqA8Zi080vQ==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH v2 36/47] tty: vt: make font of consw::con_font_set() const
Date: Mon, 22 Jan 2024 12:03:50 +0100
Message-ID: <20240122110401.7289-37-jirislaby@kernel.org>
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
 linux-parisc@vger.kernel.org, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Provided the font parameter of consw::con_font_set() is not supposed to
be changed, make it const.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-parisc@vger.kernel.org
---
 drivers/tty/vt/vt.c                 | 2 +-
 drivers/video/console/newport_con.c | 5 +++--
 drivers/video/console/sticon.c      | 4 ++--
 drivers/video/console/vgacon.c      | 2 +-
 drivers/video/fbdev/core/fbcon.c    | 2 +-
 include/linux/console.h             | 5 +++--
 6 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index de9148094c2d..0ac537f82f7a 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -4625,7 +4625,7 @@ static int con_font_get(struct vc_data *vc, struct console_font_op *op)
 	return rc;
 }
 
-static int con_font_set(struct vc_data *vc, struct console_font_op *op)
+static int con_font_set(struct vc_data *vc, const struct console_font_op *op)
 {
 	struct console_font font;
 	int rc = -EINVAL;
diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
index dbb31bf87bf1..4203bd5fd0a1 100644
--- a/drivers/video/console/newport_con.c
+++ b/drivers/video/console/newport_con.c
@@ -496,7 +496,8 @@ static bool newport_blank(struct vc_data *c, enum vesa_blank_mode blank,
 	return true;
 }
 
-static int newport_set_font(int unit, struct console_font *op, unsigned int vpitch)
+static int newport_set_font(int unit, const struct console_font *op,
+			    unsigned int vpitch)
 {
 	int w = op->width;
 	int h = op->height;
@@ -568,7 +569,7 @@ static int newport_font_default(struct vc_data *vc, struct console_font *op, cha
 	return newport_set_def_font(vc->vc_num, op);
 }
 
-static int newport_font_set(struct vc_data *vc, struct console_font *font,
+static int newport_font_set(struct vc_data *vc, const struct console_font *font,
 			    unsigned int vpitch, unsigned int flags)
 {
 	return newport_set_font(vc->vc_num, font, vpitch);
diff --git a/drivers/video/console/sticon.c b/drivers/video/console/sticon.c
index cbb9ef438214..710201fb8ce4 100644
--- a/drivers/video/console/sticon.c
+++ b/drivers/video/console/sticon.c
@@ -153,7 +153,7 @@ static void sticon_set_def_font(int unit)
 	}
 }
 
-static int sticon_set_font(struct vc_data *vc, struct console_font *op,
+static int sticon_set_font(struct vc_data *vc, const struct console_font *op,
 			   unsigned int vpitch)
 {
 	struct sti_struct *sti = sticon_sti;
@@ -253,7 +253,7 @@ static int sticon_font_default(struct vc_data *vc, struct console_font *op, char
 	return 0;
 }
 
-static int sticon_font_set(struct vc_data *vc, struct console_font *font,
+static int sticon_font_set(struct vc_data *vc, const struct console_font *font,
 			   unsigned int vpitch, unsigned int flags)
 {
 	return sticon_set_font(vc, font, vpitch);
diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index c9a22118102f..4d1c8f5863af 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -1039,7 +1039,7 @@ static int vgacon_adjust_height(struct vc_data *vc, unsigned fontheight)
 	return 0;
 }
 
-static int vgacon_font_set(struct vc_data *c, struct console_font *font,
+static int vgacon_font_set(struct vc_data *c, const struct console_font *font,
 			   unsigned int vpitch, unsigned int flags)
 {
 	unsigned charcount = font->charcount;
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index eee2adf5c682..62474630c4d4 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2460,7 +2460,7 @@ static int fbcon_do_set_font(struct vc_data *vc, int w, int h, int charcount,
  *  but lets not assume that, since charcount of 512 is small for unicode support.
  */
 
-static int fbcon_set_font(struct vc_data *vc, struct console_font *font,
+static int fbcon_set_font(struct vc_data *vc, const struct console_font *font,
 			  unsigned int vpitch, unsigned int flags)
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
diff --git a/include/linux/console.h b/include/linux/console.h
index 6392bcd2fe7c..0a9f4cbdde83 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -75,8 +75,9 @@ struct consw {
 	bool	(*con_switch)(struct vc_data *vc);
 	bool	(*con_blank)(struct vc_data *vc, enum vesa_blank_mode blank,
 			     bool mode_switch);
-	int	(*con_font_set)(struct vc_data *vc, struct console_font *font,
-			unsigned int vpitch, unsigned int flags);
+	int	(*con_font_set)(struct vc_data *vc,
+				const struct console_font *font,
+				unsigned int vpitch, unsigned int flags);
 	int	(*con_font_get)(struct vc_data *vc, struct console_font *font,
 			unsigned int vpitch);
 	int	(*con_font_default)(struct vc_data *vc,
-- 
2.43.0

