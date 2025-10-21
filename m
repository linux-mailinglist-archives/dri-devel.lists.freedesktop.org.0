Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BECBF86D7
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 21:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFAB810E33B;
	Tue, 21 Oct 2025 19:58:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XyjSFsDM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0916D10E33E
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 19:58:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E466449F55;
 Tue, 21 Oct 2025 19:58:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7680EC4CEF7;
 Tue, 21 Oct 2025 19:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1761076730;
 bh=UOIsUDf0bWg8bN5aUvYoKqc7KkF+Lv7GW7IFuztqZ80=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XyjSFsDM0HQPYjwtrnl1mFkUVc8346ZjDY2+K+VCzlIogXo9COM6QOU9wHLiitfmV
 WrFgUxxZYxzJ8h/hAwZjs4SG5x5mm66ibe0mgPtTT39ZxicTiihvUrb5kkIw5LmO52
 yKeQjYx9nOqL5j1M1tHFCaLbcIs1k4HiFD2RL/14=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>, Nick Bowler <nbowler@draconx.ca>,
 Douglas Anderson <dianders@chromium.org>, Dave Airlie <airlied@redhat.com>,
 Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH 6.12 020/136] drm/ast: Blank with VGACR17 sync enable,
 always clear VGACRB6 sync off
Date: Tue, 21 Oct 2025 21:50:08 +0200
Message-ID: <20251021195036.457336682@linuxfoundation.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251021195035.953989698@linuxfoundation.org>
References: <20251021195035.953989698@linuxfoundation.org>
User-Agent: quilt/0.69
X-stable: review
X-Patchwork-Hint: ignore
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

6.12-stable review patch.  If anyone has any objections, please let me know.

------------------

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 6f719373b943a955fee6fc2012aed207b65e2854 upstream.

Blank the display by disabling sync pulses with VGACR17<7>. Unblank
by reenabling them. This VGA setting should be supported by all Aspeed
hardware.

Ast currently blanks via sync-off bits in VGACRB6. Not all BMCs handle
VGACRB6 correctly. After disabling sync during a reboot, some BMCs do
not reenable it after the soft reset. The display output remains dark.
When the display is off during boot, some BMCs set the sync-off bits in
VGACRB6, so the display remains dark. Observed with  Blackbird AST2500
BMCs. Clearing the sync-off bits unconditionally fixes these issues.

Also do not modify VGASR1's SD bit for blanking, as it only disables GPU
access to video memory.

v2:
- init vgacrb6 correctly (Jocelyn)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: ce3d99c83495 ("drm: Call drm_atomic_helper_shutdown() at shutdown time for misc drivers")
Tested-by: Nick Bowler <nbowler@draconx.ca>
Reported-by: Nick Bowler <nbowler@draconx.ca>
Closes: https://lore.kernel.org/dri-devel/wpwd7rit6t4mnu6kdqbtsnk5bhftgslio6e2jgkz6kgw6cuvvr@xbfswsczfqsi/
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.7+
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Link: https://lore.kernel.org/r/20251014084743.18242-1-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/ast/ast_mode.c |   18 ++++++++++--------
 drivers/gpu/drm/ast/ast_reg.h  |    1 +
 2 files changed, 11 insertions(+), 8 deletions(-)

--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1195,22 +1195,24 @@ ast_crtc_helper_atomic_flush(struct drm_
 static void ast_crtc_helper_atomic_enable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
 	struct ast_device *ast = to_ast_device(crtc->dev);
+	u8 vgacr17 = 0x00;
+	u8 vgacrb6 = 0xff;
 
-	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, 0x00);
-	ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xdf, 0x00);
+	vgacr17 |= AST_IO_VGACR17_SYNC_ENABLE;
+	vgacrb6 &= ~(AST_IO_VGACRB6_VSYNC_OFF | AST_IO_VGACRB6_HSYNC_OFF);
+
+	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x17, 0x7f, vgacr17);
+	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, vgacrb6);
 }
 
 static void ast_crtc_helper_atomic_disable(struct drm_crtc *crtc, struct drm_atomic_state *state)
 {
 	struct drm_crtc_state *old_crtc_state = drm_atomic_get_old_crtc_state(state, crtc);
 	struct ast_device *ast = to_ast_device(crtc->dev);
-	u8 vgacrb6;
+	u8 vgacr17 = 0xff;
 
-	ast_set_index_reg_mask(ast, AST_IO_VGASRI, 0x01, 0xdf, AST_IO_VGASR1_SD);
-
-	vgacrb6 = AST_IO_VGACRB6_VSYNC_OFF |
-		  AST_IO_VGACRB6_HSYNC_OFF;
-	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0xb6, 0xfc, vgacrb6);
+	vgacr17 &= ~AST_IO_VGACR17_SYNC_ENABLE;
+	ast_set_index_reg_mask(ast, AST_IO_VGACRI, 0x17, 0x7f, vgacr17);
 
 	/*
 	 * HW cursors require the underlying primary plane and CRTC to
--- a/drivers/gpu/drm/ast/ast_reg.h
+++ b/drivers/gpu/drm/ast/ast_reg.h
@@ -29,6 +29,7 @@
 #define AST_IO_VGAGRI			(0x4E)
 
 #define AST_IO_VGACRI			(0x54)
+#define AST_IO_VGACR17_SYNC_ENABLE	BIT(7) /* called "Hardware reset" in docs */
 #define AST_IO_VGACR80_PASSWORD		(0xa8)
 #define AST_IO_VGACRA1_VGAIO_DISABLED	BIT(1)
 #define AST_IO_VGACRA1_MMIO_ENABLED	BIT(2)


