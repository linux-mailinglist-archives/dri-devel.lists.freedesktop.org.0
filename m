Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44448BEFE2C
	for <lists+dri-devel@lfdr.de>; Mon, 20 Oct 2025 10:19:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF0AA10E277;
	Mon, 20 Oct 2025 08:19:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Bb7RiB9F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125E710E26C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Oct 2025 08:19:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A8E6A61C65;
 Mon, 20 Oct 2025 08:19:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE9DAC4CEF9;
 Mon, 20 Oct 2025 08:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1760948375;
 bh=qkJwebQoMJLdqDq4BoKHtJ92sNRSXA+q4CEM9dQ4Rds=;
 h=Subject:To:Cc:From:Date:From;
 b=Bb7RiB9F8+9w5394BOYaD25dRTSc3iq5DCTMt7YCJytBmLJwwXmTep8FQyE3uty4X
 h0kRopKUNUHv6W001cEnwaihWG70g+uMAlNBQA3CthLjXi7cNSeSBlF9Ak/909PvnZ
 lFeQqyH3G+bwv1tnKfshSgbAGIY9DjiIglc/NkKk=
Subject: Patch "drm/ast: Blank with VGACR17 sync enable,
 always clear VGACRB6 sync off" has been added to the 6.17-stable tree
To: airlied@redhat.com, dianders@chromium.org, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jfalempe@redhat.com, nbowler@draconx.ca,
 tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 20 Oct 2025 10:18:43 +0200
Message-ID: <2025102043-stellar-stability-7341@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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


This is a note to let you know that I've just added the patch titled

    drm/ast: Blank with VGACR17 sync enable, always clear VGACRB6 sync off

to the 6.17-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-ast-blank-with-vgacr17-sync-enable-always-clear-vgacrb6-sync-off.patch
and it can be found in the queue-6.17 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 6f719373b943a955fee6fc2012aed207b65e2854 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Tue, 14 Oct 2025 10:46:34 +0200
Subject: drm/ast: Blank with VGACR17 sync enable, always clear VGACRB6 sync off

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
@@ -836,22 +836,24 @@ ast_crtc_helper_atomic_flush(struct drm_
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
 #define AST_IO_VGACR99_VGAMEM_RSRV_MASK	GENMASK(1, 0)
 #define AST_IO_VGACRA1_VGAIO_DISABLED	BIT(1)


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-6.17/drm-ast-blank-with-vgacr17-sync-enable-always-clear-vgacrb6-sync-off.patch
