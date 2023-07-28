Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93C337668AF
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 11:19:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC36010E6B8;
	Fri, 28 Jul 2023 09:19:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE86F10E6B8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jul 2023 09:19:51 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:12b0:7b7e:d1ff:7873])
 by baptiste.telenet-ops.be with bizsmtp
 id SZKn2A0040d1nm801ZKnTg; Fri, 28 Jul 2023 11:19:49 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qPJdF-002ltR-W6;
 Fri, 28 Jul 2023 11:19:47 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qPJdT-00AoEo-3k;
 Fri, 28 Jul 2023 11:19:47 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>
Subject: [PATCH v2] Revert "fbcon: Use kzalloc() in fbcon_prepare_logo()"
Date: Fri, 28 Jul 2023 11:19:45 +0200
Message-Id: <bd8b71bb13af21cc48af40349db440f794336d3a.1690535849.git.geert+renesas@glider.be>
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
Cc: Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, linux-fbdev@vger.kernel.org,
 kasan-dev <kasan-dev@googlegroups.com>, linux-kernel@vger.kernel.org,
 Alexander Potapenko <glider@google.com>, dri-devel@lists.freedesktop.org,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This reverts commit a6a00d7e8ffd78d1cdb7a43f1278f081038c638f.

This commit is redundant, as the root cause that resulted in a false
positive was fixed by commit 27f644dc5a77f8d9 ("x86: kmsan: use C
versions of memset16/memset32/memset64").

Closes: https://lore.kernel.org/r/CAMuHMdUH4CU9EfoirSxjivg08FDimtstn7hizemzyQzYeq6b6g@mail.gmail.com/
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Update description, as requested by Handa-san.
---
 drivers/video/fbdev/core/fbcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 62733f118833c6ca..f394c817bc074e0e 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -577,7 +577,7 @@ static void fbcon_prepare_logo(struct vc_data *vc, struct fb_info *info,
 		if (scr_readw(r) != vc->vc_video_erase_char)
 			break;
 	if (r != q && new_rows >= rows + logo_lines) {
-		save = kzalloc(array3_size(logo_lines, new_cols, 2),
+		save = kmalloc(array3_size(logo_lines, new_cols, 2),
 			       GFP_KERNEL);
 		if (save) {
 			int i = min(cols, new_cols);
-- 
2.34.1

