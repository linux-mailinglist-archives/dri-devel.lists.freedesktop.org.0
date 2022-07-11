Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC1B570747
	for <lists+dri-devel@lfdr.de>; Mon, 11 Jul 2022 17:41:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E7168F349;
	Mon, 11 Jul 2022 15:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78CE48F342
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Jul 2022 15:41:17 +0000 (UTC)
Received: from ramsan.of.borg ([84.195.186.194])
 by laurent.telenet-ops.be with bizsmtp
 id trhF2700T4C55Sk01rhF8n; Mon, 11 Jul 2022 17:41:15 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oAvX9-0036tK-8N; Mon, 11 Jul 2022 17:41:15 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1oAvX8-006sRL-SE; Mon, 11 Jul 2022 17:41:14 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Helge Deller <deller@gmx.de>
Subject: [PATCH] video: fbdev: Make *fb_setup() and *fb_init() static
Date: Mon, 11 Jul 2022 17:41:11 +0200
Message-Id: <e347823ebc341dc7a17d307e1973c2ba1c33a2e6.1657553990.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-fbdev@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The various *fb_setup() and *fb_init() functions are only used locally,
so they should be static.  Most of them do not need forward
declarations, so remove these where appropriate.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/video/fbdev/68328fb.c    |  7 ++-----
 drivers/video/fbdev/atafb.c      |  2 +-
 drivers/video/fbdev/dnfb.c       |  2 +-
 drivers/video/fbdev/fm2fb.c      |  4 ++--
 drivers/video/fbdev/hpfb.c       |  4 ++--
 drivers/video/fbdev/q40fb.c      |  2 +-
 drivers/video/fbdev/skeletonfb.c |  6 ++----
 drivers/video/fbdev/valkyriefb.c | 10 +++-------
 8 files changed, 14 insertions(+), 23 deletions(-)

diff --git a/drivers/video/fbdev/68328fb.c b/drivers/video/fbdev/68328fb.c
index 9811f1bad8d498fc..7db03ed77c762fc4 100644
--- a/drivers/video/fbdev/68328fb.c
+++ b/drivers/video/fbdev/68328fb.c
@@ -84,9 +84,6 @@ static const struct fb_fix_screeninfo mc68x328fb_fix __initconst = {
     /*
      *  Interface used by the world
      */
-int mc68x328fb_init(void);
-int mc68x328fb_setup(char *);
-
 static int mc68x328fb_check_var(struct fb_var_screeninfo *var,
 			 struct fb_info *info);
 static int mc68x328fb_set_par(struct fb_info *info);
@@ -403,7 +400,7 @@ static int mc68x328fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 #endif
 }
 
-int __init mc68x328fb_setup(char *options)
+static int __init mc68x328fb_setup(char *options)
 {
 	if (!options || !*options)
 		return 1;
@@ -414,7 +411,7 @@ int __init mc68x328fb_setup(char *options)
      *  Initialisation
      */
 
-int __init mc68x328fb_init(void)
+static int __init mc68x328fb_init(void)
 {
 #ifndef MODULE
 	char *option = NULL;
diff --git a/drivers/video/fbdev/atafb.c b/drivers/video/fbdev/atafb.c
index 52a35b6616438133..102c727cedc0f005 100644
--- a/drivers/video/fbdev/atafb.c
+++ b/drivers/video/fbdev/atafb.c
@@ -2981,7 +2981,7 @@ static void __init atafb_setup_user(char *spec)
 	}
 }
 
-int __init atafb_setup(char *options)
+static int __init atafb_setup(char *options)
 {
 	char *this_opt;
 	int temp;
diff --git a/drivers/video/fbdev/dnfb.c b/drivers/video/fbdev/dnfb.c
index 3688f91658482d7a..18405c402ec155ab 100644
--- a/drivers/video/fbdev/dnfb.c
+++ b/drivers/video/fbdev/dnfb.c
@@ -280,7 +280,7 @@ static struct platform_device dnfb_device = {
 	.name	= "dnfb",
 };
 
-int __init dnfb_init(void)
+static int __init dnfb_init(void)
 {
 	int ret;
 
diff --git a/drivers/video/fbdev/fm2fb.c b/drivers/video/fbdev/fm2fb.c
index 3b727d528fde9eb5..942e382cf1cf9fd9 100644
--- a/drivers/video/fbdev/fm2fb.c
+++ b/drivers/video/fbdev/fm2fb.c
@@ -293,7 +293,7 @@ static int fm2fb_probe(struct zorro_dev *z, const struct zorro_device_id *id)
 	return 0;
 }
 
-int __init fm2fb_setup(char *options)
+static int __init fm2fb_setup(char *options)
 {
 	char *this_opt;
 
@@ -309,7 +309,7 @@ int __init fm2fb_setup(char *options)
 	return 0;
 }
 
-int __init fm2fb_init(void)
+static int __init fm2fb_init(void)
 {
 	char *option = NULL;
 
diff --git a/drivers/video/fbdev/hpfb.c b/drivers/video/fbdev/hpfb.c
index 8d418abdd7678a15..cdd44e5deafe4d91 100644
--- a/drivers/video/fbdev/hpfb.c
+++ b/drivers/video/fbdev/hpfb.c
@@ -375,7 +375,7 @@ static struct dio_driver hpfb_driver = {
     .remove    = hpfb_remove_one,
 };
 
-int __init hpfb_init(void)
+static int __init hpfb_init(void)
 {
 	unsigned int sid;
 	unsigned char i;
@@ -415,7 +415,7 @@ int __init hpfb_init(void)
 	return 0;
 }
 
-void __exit hpfb_cleanup_module(void)
+static void __exit hpfb_cleanup_module(void)
 {
 	dio_unregister_driver(&hpfb_driver);
 }
diff --git a/drivers/video/fbdev/q40fb.c b/drivers/video/fbdev/q40fb.c
index 079a2a7fb2c58a23..964bc88bb89c4b09 100644
--- a/drivers/video/fbdev/q40fb.c
+++ b/drivers/video/fbdev/q40fb.c
@@ -133,7 +133,7 @@ static struct platform_device q40fb_device = {
 	.name	= "q40fb",
 };
 
-int __init q40fb_init(void)
+static int __init q40fb_init(void)
 {
 	int ret = 0;
 
diff --git a/drivers/video/fbdev/skeletonfb.c b/drivers/video/fbdev/skeletonfb.c
index d119b1d08007fa6b..8ab9a3fbd281635c 100644
--- a/drivers/video/fbdev/skeletonfb.c
+++ b/drivers/video/fbdev/skeletonfb.c
@@ -131,8 +131,6 @@ static struct fb_info info;
      */
 static struct xxx_par __initdata current_par;
 
-int xxxfb_init(void);
-
 /**
  *	xxxfb_open - Optional function. Called when the framebuffer is
  *		     first accessed.
@@ -886,7 +884,7 @@ static struct pci_driver xxxfb_driver = {
 
 MODULE_DEVICE_TABLE(pci, xxxfb_id_table);
 
-int __init xxxfb_init(void)
+static int __init xxxfb_init(void)
 {
 	/*
 	 *  For kernel boot options (in 'video=xxxfb:<options>' format)
@@ -967,7 +965,7 @@ static struct platform_device *xxxfb_device;
  * Only necessary if your driver takes special options,
  * otherwise we fall back on the generic fb_setup().
  */
-int __init xxxfb_setup(char *options)
+static int __init xxxfb_setup(char *options)
 {
     /* Parse user specified options (`video=xxxfb:') */
 }
diff --git a/drivers/video/fbdev/valkyriefb.c b/drivers/video/fbdev/valkyriefb.c
index a6c9d4f266695646..1007023a5e889b4b 100644
--- a/drivers/video/fbdev/valkyriefb.c
+++ b/drivers/video/fbdev/valkyriefb.c
@@ -90,11 +90,7 @@ struct fb_info_valkyrie {
 	u32			pseudo_palette[16];
 };
 
-/*
- * Exported functions
- */
-int valkyriefb_init(void);
-int valkyriefb_setup(char*);
+static int valkyriefb_setup(char*);
 
 static int valkyriefb_check_var(struct fb_var_screeninfo *var,
 				struct fb_info *info);
@@ -302,7 +298,7 @@ static void __init valkyrie_choose_mode(struct fb_info_valkyrie *p)
 	       default_vmode, default_cmode);
 }
 
-int __init valkyriefb_init(void)
+static int __init valkyriefb_init(void)
 {
 	struct fb_info_valkyrie	*p;
 	unsigned long frame_buffer_phys, cmap_regs_phys;
@@ -549,7 +545,7 @@ static int __init valkyrie_init_info(struct fb_info *info,
 /*
  * Parse user specified options (`video=valkyriefb:')
  */
-int __init valkyriefb_setup(char *options)
+static int __init valkyriefb_setup(char *options)
 {
 	char *this_opt;
 
-- 
2.25.1

