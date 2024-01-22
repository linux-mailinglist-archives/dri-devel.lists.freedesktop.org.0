Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5A5A83605E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jan 2024 12:04:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98A5F10ED59;
	Mon, 22 Jan 2024 11:04:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 204D110ED58
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jan 2024 11:04:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D3267B80D5C;
 Mon, 22 Jan 2024 11:04:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD82EC433C7;
 Mon, 22 Jan 2024 11:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705921449;
 bh=w11xF62sAxvtyjUlJ/rSiBQfEK5Y+txgHz5Oan2+3RE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RorKlUKXOU0HXGIbHwA3D1eu6b6uOCFIO0NbntcqGmiqq2jKeMIbukB47qafwvq3J
 sov5oD8T9Z14gKMNTLAMoq7WxT8CmQehZd8hW03OGCiTSeT6arBnIoaGjbffUZKwYr
 TJNsvO6qZJe1AO1LyyiF3MY1wRSi3Nt2V2V2auNZ2DSwipP0wbsGSuSCr9uuEQx2yk
 N0W9D+bdZ0fY2bk0qvi8oQLsuIcueIfaK/ln4Nlt3KB0FEH8Vo+4OXLrbEpqWq/qfM
 Co+3xCxO31St3hn03kvqBdpTuyuMwlJk6NDm/X7DLb4TIhfcF2RHUF8WCxEgVivGhu
 iVmPS9Ur3qm+A==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Subject: [PATCH v2 01/47] vgacon: inline vc_scrolldelta_helper() into
 vgacon_scrolldelta()
Date: Mon, 22 Jan 2024 12:03:15 +0100
Message-ID: <20240122110401.7289-2-jirislaby@kernel.org>
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

Since commit 74d58cd48a8f ("USB: sisusbvga: remove console support"),
vgacon_scrolldelta() is the only user of vc_scrolldelta_helper().

Inline the helper into vgacon_scrolldelta() and drop it.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/tty/vt/vt.c            | 40 ----------------------------------
 drivers/video/console/vgacon.c | 36 ++++++++++++++++++++++++++++--
 include/linux/vt_kern.h        |  3 ---
 3 files changed, 34 insertions(+), 45 deletions(-)

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index 156efda7c80d..3f3f7c216819 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -4748,43 +4748,3 @@ void vcs_scr_updated(struct vc_data *vc)
 {
 	notify_update(vc);
 }
-
-void vc_scrolldelta_helper(struct vc_data *c, int lines,
-		unsigned int rolled_over, void *base, unsigned int size)
-{
-	unsigned long ubase = (unsigned long)base;
-	ptrdiff_t scr_end = (void *)c->vc_scr_end - base;
-	ptrdiff_t vorigin = (void *)c->vc_visible_origin - base;
-	ptrdiff_t origin = (void *)c->vc_origin - base;
-	int margin = c->vc_size_row * 4;
-	int from, wrap, from_off, avail;
-
-	/* Turn scrollback off */
-	if (!lines) {
-		c->vc_visible_origin = c->vc_origin;
-		return;
-	}
-
-	/* Do we have already enough to allow jumping from 0 to the end? */
-	if (rolled_over > scr_end + margin) {
-		from = scr_end;
-		wrap = rolled_over + c->vc_size_row;
-	} else {
-		from = 0;
-		wrap = size;
-	}
-
-	from_off = (vorigin - from + wrap) % wrap + lines * c->vc_size_row;
-	avail = (origin - from + wrap) % wrap;
-
-	/* Only a little piece would be left? Show all incl. the piece! */
-	if (avail < 2 * margin)
-		margin = 0;
-	if (from_off < margin)
-		from_off = 0;
-	if (from_off > avail - margin)
-		from_off = avail;
-
-	c->vc_visible_origin = ubase + (from + from_off) % wrap;
-}
-EXPORT_SYMBOL_GPL(vc_scrolldelta_helper);
diff --git a/drivers/video/console/vgacon.c b/drivers/video/console/vgacon.c
index 8ef1579fa57f..9176fff9ce6e 100644
--- a/drivers/video/console/vgacon.c
+++ b/drivers/video/console/vgacon.c
@@ -138,8 +138,40 @@ static inline void vga_set_mem_top(struct vc_data *c)
 
 static void vgacon_scrolldelta(struct vc_data *c, int lines)
 {
-	vc_scrolldelta_helper(c, lines, vga_rolled_over, (void *)vga_vram_base,
-			vga_vram_size);
+	unsigned long scr_end = c->vc_scr_end - vga_vram_base;
+	unsigned long vorigin = c->vc_visible_origin - vga_vram_base;
+	unsigned long origin = c->vc_origin - vga_vram_base;
+	int margin = c->vc_size_row * 4;
+	int from, wrap, from_off, avail;
+
+	/* Turn scrollback off */
+	if (!lines) {
+		c->vc_visible_origin = c->vc_origin;
+		return;
+	}
+
+	/* Do we have already enough to allow jumping from 0 to the end? */
+	if (vga_rolled_over > scr_end + margin) {
+		from = scr_end;
+		wrap = vga_rolled_over + c->vc_size_row;
+	} else {
+		from = 0;
+		wrap = vga_vram_size;
+	}
+
+	from_off = (vorigin - from + wrap) % wrap + lines * c->vc_size_row;
+	avail = (origin - from + wrap) % wrap;
+
+	/* Only a little piece would be left? Show all incl. the piece! */
+	if (avail < 2 * margin)
+		margin = 0;
+	if (from_off < margin)
+		from_off = 0;
+	if (from_off > avail - margin)
+		from_off = avail;
+
+	c->vc_visible_origin = vga_vram_base + (from + from_off) % wrap;
+
 	vga_set_mem_top(c);
 }
 
diff --git a/include/linux/vt_kern.h b/include/linux/vt_kern.h
index c1f5aebef170..a789ea3ed2a0 100644
--- a/include/linux/vt_kern.h
+++ b/include/linux/vt_kern.h
@@ -168,7 +168,4 @@ void vt_set_led_state(unsigned int console, int leds);
 void vt_kbd_con_start(unsigned int console);
 void vt_kbd_con_stop(unsigned int console);
 
-void vc_scrolldelta_helper(struct vc_data *c, int lines,
-		unsigned int rolled_over, void *_base, unsigned int size);
-
 #endif /* _VT_KERN_H */
-- 
2.43.0

