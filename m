Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F6983607D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 12:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06BB210ED7B;
	Mon, 22 Jan 2024 11:05:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B15410ED78
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 11:05:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C285561309;
 Mon, 22 Jan 2024 11:05:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A181C433B2;
 Mon, 22 Jan 2024 11:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705921524;
 bh=3cbdCulYDMzHdVHQyMlTnkEbtcMWUQ2WS/4aMQLbalE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dgUXEweSjNFK/nw1p8YvQREa0chlb+TkiAcu+Fi7+FCNzam/6zTPyNnOEskoKtPor
 MBV16HJ30AhMhj5kxauYUJA1m31tOl8xdv5FPhb2qjGFKm4Q9/UK+eJ8h8Nf2BRp2A
 EcsyoVPx/rz/cUXi5Jk27U/J5Io0NraoViFM0qIIo8ahvfBwWayAX24cWhtd4X57Gz
 76J3Rff+ucD/dJ98z9SYc7KjjL/3Yo+hhbvrFY6j0WGMRtR+CkMkVVxRPXqDmffg9f
 8wtZSk+yTH/fmlacapZVNEimxHdKMnb+PR/gPDL8KVhK75VjvvvcxFS8siwPnH3HGf
 uoo/fMwMsfJYg==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH v2 37/47] tty: vt: make consw::con_font_default()'s name const
Date: Mon, 22 Jan 2024 12:03:51 +0100
Message-ID: <20240122110401.7289-38-jirislaby@kernel.org>
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
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Daniel Vetter <daniel@ffwll.ch>, "Jiri Slaby \(SUSE\)" <jirislaby@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's a name after all and that is not supposed to be changed. So make it
const to make this obvious.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-parisc@vger.kernel.org
---
 drivers/video/console/newport_con.c | 3 ++-
 drivers/video/console/sticon.c      | 3 ++-
 drivers/video/fbdev/core/fbcon.c    | 3 ++-
 include/linux/console.h             | 2 +-
 4 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
index 4203bd5fd0a1..a51cfc1d560e 100644
--- a/drivers/video/console/newport_con.c
+++ b/drivers/video/console/newport_con.c
@@ -564,7 +564,8 @@ static int newport_set_def_font(int unit, struct console_font *op)
 	return 0;
 }
 
-static int newport_font_default(struct vc_data *vc, struct console_font *op, char *name)
+static int newport_font_default(struct vc_data *vc, struct console_font *op,
+				const char *name)
 {
 	return newport_set_def_font(vc->vc_num, op);
 }
diff --git a/drivers/video/console/sticon.c b/drivers/video/console/sticon.c
index 710201fb8ce4..4c7b4959a1aa 100644
--- a/drivers/video/console/sticon.c
+++ b/drivers/video/console/sticon.c
@@ -246,7 +246,8 @@ static int sticon_set_font(struct vc_data *vc, const struct console_font *op,
 	return 0;
 }
 
-static int sticon_font_default(struct vc_data *vc, struct console_font *op, char *name)
+static int sticon_font_default(struct vc_data *vc, struct console_font *op,
+			       const char *name)
 {
 	sticon_set_def_font(vc->vc_num);
 
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 62474630c4d4..657160eec0a5 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2533,7 +2533,8 @@ static int fbcon_set_font(struct vc_data *vc, const struct console_font *font,
 	return fbcon_do_set_font(vc, font->width, font->height, charcount, new_data, 1);
 }
 
-static int fbcon_set_def_font(struct vc_data *vc, struct console_font *font, char *name)
+static int fbcon_set_def_font(struct vc_data *vc, struct console_font *font,
+			      const char *name)
 {
 	struct fb_info *info = fbcon_info_from_console(vc->vc_num);
 	const struct font_desc *f;
diff --git a/include/linux/console.h b/include/linux/console.h
index 0a9f4cbdde83..6bb7e5e37ae4 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -81,7 +81,7 @@ struct consw {
 	int	(*con_font_get)(struct vc_data *vc, struct console_font *font,
 			unsigned int vpitch);
 	int	(*con_font_default)(struct vc_data *vc,
-			struct console_font *font, char *name);
+			struct console_font *font, const char *name);
 	int     (*con_resize)(struct vc_data *vc, unsigned int width,
 			      unsigned int height, bool from_user);
 	void	(*con_set_palette)(struct vc_data *vc,
-- 
2.43.0

