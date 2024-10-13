Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51ADA99B93B
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2024 13:48:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193FB10E084;
	Sun, 13 Oct 2024 11:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="ceZweWE/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msa.smtpout.orange.fr (smtp-82.smtpout.orange.fr [80.12.242.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2494810E084
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2024 11:48:20 +0000 (UTC)
Received: from localhost.localdomain ([90.11.132.44])
 by smtp.orange.fr with ESMTPA
 id zx57stZS2B0YBzx57s7gGf; Sun, 13 Oct 2024 13:48:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1728820098;
 bh=9Lc6fX0KKpmtZvNPSaPJ34kiPy3v/0X/tDjiDGWF2dY=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=ceZweWE/EuyErM1E+TVSsUx4hOQ85BsRXFCl1lED2WNLp/k/StctaCYT9Ws/QuBUk
 64PLvuXLYJlNYzU5ZIHr/m5bD4x9OM9NubRlKKgMoxsX6RnXpgg6eCs8SMU3u4pmbb
 uHMpbTNyxnJgUOiznuUNLJTAXawxEIvAak599o/2aYoeHsOnVocd9d/TkLCxB92HiX
 5kt/CVISv6hcEl4nbt/mHq4+cpwFsa2T7g2hE09+kRKEhTQI0haOuXbRM+hglltmrQ
 k1XWq92lnYYmRKm/iu6oNg+4Xsf5VKWj6qmr47ICTPLbvP/zb2W1QbwpO7HLKVs9R7
 pDCizGssFtvJQ==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 13 Oct 2024 13:48:18 +0200
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] fbdev: Constify struct sbus_mmap_map
Date: Sun, 13 Oct 2024 13:48:01 +0200
Message-ID: <67883bfad5c2c395438bfcef7a319394caca4155.1728820047.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
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

'struct sbus_mmap_map' are not modified in these drivers.

Constifying this structure moves some data to a read-only section, so
increases overall security.

Update sbusfb_mmap_helper() accordingly.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
   2452	    536	     16	   3004	    bbc	drivers/video/fbdev/bw2.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
   2500	    483	     16	   2999	    bb7	drivers/video/fbdev/bw2.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested only with a cross compiler for sparc.
---
 drivers/video/fbdev/bw2.c     | 2 +-
 drivers/video/fbdev/cg14.c    | 2 +-
 drivers/video/fbdev/cg3.c     | 2 +-
 drivers/video/fbdev/cg6.c     | 2 +-
 drivers/video/fbdev/ffb.c     | 2 +-
 drivers/video/fbdev/leo.c     | 2 +-
 drivers/video/fbdev/p9100.c   | 2 +-
 drivers/video/fbdev/sbuslib.c | 2 +-
 drivers/video/fbdev/sbuslib.h | 2 +-
 drivers/video/fbdev/tcx.c     | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/video/fbdev/bw2.c b/drivers/video/fbdev/bw2.c
index 4a64940e0c00..e757462af0a6 100644
--- a/drivers/video/fbdev/bw2.c
+++ b/drivers/video/fbdev/bw2.c
@@ -147,7 +147,7 @@ bw2_blank(int blank, struct fb_info *info)
 	return 0;
 }
 
-static struct sbus_mmap_map bw2_mmap_map[] = {
+static const struct sbus_mmap_map bw2_mmap_map[] = {
 	{
 		.size = SBUS_MMAP_FBSIZE(1)
 	},
diff --git a/drivers/video/fbdev/cg14.c b/drivers/video/fbdev/cg14.c
index 430e1a7b352b..5389f8f07346 100644
--- a/drivers/video/fbdev/cg14.c
+++ b/drivers/video/fbdev/cg14.c
@@ -360,7 +360,7 @@ static void cg14_init_fix(struct fb_info *info, int linebytes,
 	info->fix.accel = FB_ACCEL_SUN_CG14;
 }
 
-static struct sbus_mmap_map __cg14_mmap_map[CG14_MMAP_ENTRIES] = {
+static const struct sbus_mmap_map __cg14_mmap_map[CG14_MMAP_ENTRIES] = {
 	{
 		.voff	= CG14_REGS,
 		.poff	= 0x80000000,
diff --git a/drivers/video/fbdev/cg3.c b/drivers/video/fbdev/cg3.c
index e4c53c6632ba..a58a483014e6 100644
--- a/drivers/video/fbdev/cg3.c
+++ b/drivers/video/fbdev/cg3.c
@@ -209,7 +209,7 @@ static int cg3_blank(int blank, struct fb_info *info)
 	return 0;
 }
 
-static struct sbus_mmap_map cg3_mmap_map[] = {
+static const struct sbus_mmap_map cg3_mmap_map[] = {
 	{
 		.voff	= CG3_MMAP_OFFSET,
 		.poff	= CG3_RAM_OFFSET,
diff --git a/drivers/video/fbdev/cg6.c b/drivers/video/fbdev/cg6.c
index 0b60df51e7bc..56d74468040a 100644
--- a/drivers/video/fbdev/cg6.c
+++ b/drivers/video/fbdev/cg6.c
@@ -545,7 +545,7 @@ static int cg6_blank(int blank, struct fb_info *info)
 	return 0;
 }
 
-static struct sbus_mmap_map cg6_mmap_map[] = {
+static const struct sbus_mmap_map cg6_mmap_map[] = {
 	{
 		.voff	= CG6_FBC,
 		.poff	= CG6_FBC_OFFSET,
diff --git a/drivers/video/fbdev/ffb.c b/drivers/video/fbdev/ffb.c
index 0b7e7b38c05a..34b6abff9493 100644
--- a/drivers/video/fbdev/ffb.c
+++ b/drivers/video/fbdev/ffb.c
@@ -710,7 +710,7 @@ static int ffb_blank(int blank, struct fb_info *info)
 	return 0;
 }
 
-static struct sbus_mmap_map ffb_mmap_map[] = {
+static const struct sbus_mmap_map ffb_mmap_map[] = {
 	{
 		.voff	= FFB_SFB8R_VOFF,
 		.poff	= FFB_SFB8R_POFF,
diff --git a/drivers/video/fbdev/leo.c b/drivers/video/fbdev/leo.c
index 271e2e8c6a84..b9fb059df2c7 100644
--- a/drivers/video/fbdev/leo.c
+++ b/drivers/video/fbdev/leo.c
@@ -338,7 +338,7 @@ static int leo_blank(int blank, struct fb_info *info)
 	return 0;
 }
 
-static struct sbus_mmap_map leo_mmap_map[] = {
+static const struct sbus_mmap_map leo_mmap_map[] = {
 	{
 		.voff	= LEO_SS0_MAP,
 		.poff	= LEO_OFF_SS0,
diff --git a/drivers/video/fbdev/p9100.c b/drivers/video/fbdev/p9100.c
index 124468f0e9ef..0bc0f78fe4b9 100644
--- a/drivers/video/fbdev/p9100.c
+++ b/drivers/video/fbdev/p9100.c
@@ -206,7 +206,7 @@ p9100_blank(int blank, struct fb_info *info)
 	return 0;
 }
 
-static struct sbus_mmap_map p9100_mmap_map[] = {
+static const struct sbus_mmap_map p9100_mmap_map[] = {
 	{ CG3_MMAP_OFFSET,	0,		SBUS_MMAP_FBSIZE(1) },
 	{ 0,			0,		0		    }
 };
diff --git a/drivers/video/fbdev/sbuslib.c b/drivers/video/fbdev/sbuslib.c
index 634e3d159452..4c79654bda30 100644
--- a/drivers/video/fbdev/sbuslib.c
+++ b/drivers/video/fbdev/sbuslib.c
@@ -38,7 +38,7 @@ static unsigned long sbusfb_mmapsize(long size, unsigned long fbsize)
 	return fbsize * (-size);
 }
 
-int sbusfb_mmap_helper(struct sbus_mmap_map *map,
+int sbusfb_mmap_helper(const struct sbus_mmap_map *map,
 		       unsigned long physbase,
 		       unsigned long fbsize,
 		       unsigned long iospace,
diff --git a/drivers/video/fbdev/sbuslib.h b/drivers/video/fbdev/sbuslib.h
index 6466b4cbcd7b..e9af2dc93f94 100644
--- a/drivers/video/fbdev/sbuslib.h
+++ b/drivers/video/fbdev/sbuslib.h
@@ -19,7 +19,7 @@ struct sbus_mmap_map {
 
 extern void sbusfb_fill_var(struct fb_var_screeninfo *var,
 			    struct device_node *dp, int bpp);
-extern int sbusfb_mmap_helper(struct sbus_mmap_map *map,
+extern int sbusfb_mmap_helper(const struct sbus_mmap_map *map,
 			      unsigned long physbase, unsigned long fbsize,
 			      unsigned long iospace,
 			      struct vm_area_struct *vma);
diff --git a/drivers/video/fbdev/tcx.c b/drivers/video/fbdev/tcx.c
index 6eb8bb2e3501..f9a0085ad72b 100644
--- a/drivers/video/fbdev/tcx.c
+++ b/drivers/video/fbdev/tcx.c
@@ -236,7 +236,7 @@ tcx_blank(int blank, struct fb_info *info)
 	return 0;
 }
 
-static struct sbus_mmap_map __tcx_mmap_map[TCX_MMAP_ENTRIES] = {
+static const struct sbus_mmap_map __tcx_mmap_map[TCX_MMAP_ENTRIES] = {
 	{
 		.voff	= TCX_RAM8BIT,
 		.size	= SBUS_MMAP_FBSIZE(1)
-- 
2.47.0

