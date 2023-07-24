Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B34F75FCE0
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 19:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A83910E0F9;
	Mon, 24 Jul 2023 17:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADB9F10E0F9
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jul 2023 17:03:58 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:2d50:2ea4:d4e1:2af3])
 by xavier.telenet-ops.be with bizsmtp
 id R53t2A00F2TBYXr0153tLe; Mon, 24 Jul 2023 19:03:56 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qNyyD-002PJX-Ku;
 Mon, 24 Jul 2023 19:03:53 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qNyyP-007DmR-NR;
 Mon, 24 Jul 2023 19:03:53 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Daniel Vetter <daniel@ffwll.ch>, Helge Deller <deller@gmx.de>
Subject: [PATCH] Revert "fbcon: Use kzalloc() in fbcon_prepare_logo()"
Date: Mon, 24 Jul 2023 19:03:48 +0200
Message-Id: <98b79fbdde69a4a203096eb9c8801045c5a055fb.1690218016.git.geert+renesas@glider.be>
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

The syzbot report turned out to be a false possitive, caused by a KMSAN
problem.  Indeed, after allocating the buffer, it is fully initialized
using scr_memsetw().  Hence there is no point in allocating zeroed
memory, while this does incur some overhead.

Closes: https://lore.kernel.org/r/CAMuHMdUH4CU9EfoirSxjivg08FDimtstn7hizemzyQzYeq6b6g@mail.gmail.com/
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/video/fbdev/core/fbcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 8e76bc246b3871b0..0246948f3c81a7a6 100644
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

