Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE557836081
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 12:06:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2943310ED7D;
	Mon, 22 Jan 2024 11:05:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41EAB10ED72
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 11:05:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B53DD612DD;
 Mon, 22 Jan 2024 11:04:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FDCBC43399;
 Mon, 22 Jan 2024 11:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705921495;
 bh=nvYd6isOoXNLl9Y7Tt4RQvNbFL1i4ad9TROebYx41cg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gvjcuxmPWnpQraJHKhPFKv/geE4KgahFZ1YiykUbAHUeIrByN6wKr6SlFOynAyUSh
 AzEPoCIhVvDj3EAvtcYaJ/D8oICwzTOj1H2V5luw2F+j50ePj6Wy0qhhGN+AMHEwWu
 LP0XKdlHS69zC5b5/tMqmMGU61953wKeBFTeUe0rl+v/gu49V6D4ITu3G7aznCMx4+
 gOvZa96zkCf9WXQ8SsUmLJcXteu7taTPO4xnsvy9htYCtH7nZZtVa7hBmMr31wrWNv
 40p1psXvU/wuW2vZ3MGrDgs/luIShFdqnhdA5vj2rVMGJ4MDO0kGY40cVhEVf/S2ST
 kukmJ1smWI+hQ==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH v2 25/47] tty: vt: sanitize consw::con_putc() parameters
Date: Mon, 22 Jan 2024 12:03:39 +0100
Message-ID: <20240122110401.7289-26-jirislaby@kernel.org>
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

Make parameters of consw::con_putc() saner:
* x and y are unsigned now, as they cannot be negative, and
* ca is made u16, as it is composed of two 8bit values (character and
  attribute). See the con_putcs() hook, u16/ushort is worked on there.

And document the hook.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/video/console/dummycon.c    | 6 ++++--
 drivers/video/console/newport_con.c | 4 ++--
 include/linux/console.h             | 5 ++++-
 3 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/video/console/dummycon.c b/drivers/video/console/dummycon.c
index 0a69d5c216ee..1874beed0325 100644
--- a/drivers/video/console/dummycon.c
+++ b/drivers/video/console/dummycon.c
@@ -50,7 +50,8 @@ void dummycon_unregister_output_notifier(struct notifier_block *nb)
 	raw_notifier_chain_unregister(&dummycon_output_nh, nb);
 }
 
-static void dummycon_putc(struct vc_data *vc, int c, int ypos, int xpos)
+static void dummycon_putc(struct vc_data *vc, u16 c, unsigned int y,
+                          unsigned int x)
 {
 	WARN_CONSOLE_UNLOCKED();
 
@@ -84,7 +85,8 @@ static int dummycon_blank(struct vc_data *vc, int blank, int mode_switch)
 	return 1;
 }
 #else
-static void dummycon_putc(struct vc_data *vc, int c, int ypos, int xpos) { }
+static void dummycon_putc(struct vc_data *vc, u16 c, unsigned int y,
+			  unsigned int x) { }
 static void dummycon_putcs(struct vc_data *vc, const unsigned short *s,
 			   int count, int ypos, int xpos) { }
 static int dummycon_blank(struct vc_data *vc, int blank, int mode_switch)
diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
index 55c6106b3507..9b5c0118873e 100644
--- a/drivers/video/console/newport_con.c
+++ b/drivers/video/console/newport_con.c
@@ -367,8 +367,8 @@ static void newport_clear(struct vc_data *vc, unsigned int sy, unsigned int sx,
 	}
 }
 
-static void newport_putc(struct vc_data *vc, int charattr, int ypos,
-			 int xpos)
+static void newport_putc(struct vc_data *vc, u16 charattr, unsigned int ypos,
+			 unsigned int xpos)
 {
 	unsigned char *p;
 
diff --git a/include/linux/console.h b/include/linux/console.h
index 8fd96a5fca5f..92d57e5b3009 100644
--- a/include/linux/console.h
+++ b/include/linux/console.h
@@ -39,6 +39,8 @@ enum vc_intensity;
  * @con_init:   initialize the console on @vc. @init is true for the very first
  *		call on this @vc.
  * @con_clear:  erase @count characters at [@x, @y] on @vc. @count >= 1.
+ * @con_putc:   emit one character with attributes @ca to [@x, @y] on @vc.
+ *		(optional -- @con_putcs would be called instead)
  * @con_scroll: move lines from @top to @bottom in direction @dir by @lines.
  *		Return true if no generic handling should be done.
  *		Invoked by csi_M and printing to the console.
@@ -53,7 +55,8 @@ struct consw {
 	void	(*con_deinit)(struct vc_data *vc);
 	void	(*con_clear)(struct vc_data *vc, unsigned int y,
 			     unsigned int x, unsigned int count);
-	void	(*con_putc)(struct vc_data *vc, int c, int ypos, int xpos);
+	void	(*con_putc)(struct vc_data *vc, u16 ca, unsigned int y,
+			    unsigned int x);
 	void	(*con_putcs)(struct vc_data *vc, const unsigned short *s,
 			int count, int ypos, int xpos);
 	void	(*con_cursor)(struct vc_data *vc, int mode);
-- 
2.43.0

