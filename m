Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80E19053FA
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 15:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF73110E12E;
	Wed, 12 Jun 2024 13:41:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CC5610E12E
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 13:41:22 +0000 (UTC)
Received: from andre.telenet-ops.be (andre.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:15])
 by gauss.telenet-ops.be (Postfix) with ESMTPS id 4VzmsY0G4xz4wxL9
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jun 2024 15:41:21 +0200 (CEST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:170b:1b4a:247:a009])
 by andre.telenet-ops.be with bizsmtp
 id adhK2C0073axqkY01dhKtR; Wed, 12 Jun 2024 15:41:20 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1sHOD0-008cdj-7Y;
 Wed, 12 Jun 2024 15:41:19 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1sHOE3-00EaMZ-A5;
 Wed, 12 Jun 2024 15:41:19 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Helge Deller <deller@gmx.de>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] video/logo: Make logo data const again
Date: Wed, 12 Jun 2024 15:41:17 +0200
Message-Id: <1ea18c51dd1c029e3c50bfb082f5942b58b7360c.1718199543.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As gcc-4.1 is no longer supported, the logo data can be made const
again.  Hence revert commit 15e3252464432a29 ("fbdev: work around old
compiler bug").

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/video/logo/pnmtologo.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/logo/pnmtologo.c b/drivers/video/logo/pnmtologo.c
index 8080c4d9c4a23fbb..28d9f0b907a99a05 100644
--- a/drivers/video/logo/pnmtologo.c
+++ b/drivers/video/logo/pnmtologo.c
@@ -238,7 +238,7 @@ static void write_header(void)
 	fprintf(out, " *  Linux logo %s\n", logoname);
 	fputs(" */\n\n", out);
 	fputs("#include <linux/linux_logo.h>\n\n", out);
-	fprintf(out, "static unsigned char %s_data[] __initdata = {\n",
+	fprintf(out, "static const unsigned char %s_data[] __initconst = {\n",
 		logoname);
 }
 
@@ -375,7 +375,7 @@ static void write_logo_clut224(void)
 	fputs("\n};\n\n", out);
 
 	/* write logo clut */
-	fprintf(out, "static unsigned char %s_clut[] __initdata = {\n",
+	fprintf(out, "static const unsigned char %s_clut[] __initconst = {\n",
 		logoname);
 	write_hex_cnt = 0;
 	for (i = 0; i < logo_clutsize; i++) {
-- 
2.34.1

