Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5406B365DFC
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 18:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA1A6E87C;
	Tue, 20 Apr 2021 16:57:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 803246E87C
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Apr 2021 16:57:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 22BC5ABED;
 Tue, 20 Apr 2021 16:57:00 +0000 (UTC)
From: Takashi Iwai <tiwai@suse.de>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH] drm/bochs: Add screen blanking support
Date: Tue, 20 Apr 2021 18:56:59 +0200
Message-Id: <20210420165659.23163-1-tiwai@suse.de>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On bochs DRM driver, the execution of "setterm --blank force" results
in a frozen screen instead of a blank screen.  It's due to the lack of
the screen blanking support in its code.

Actually, the QEMU bochs vga side can switch to the blanking mode when
the bit 0x20 is cleared on VGA_ATT_IW register (0x3c0), which updates
ar_index in QEMU side.  So, essentially, we'd just need to clear the
bit at pipe disable callback; that's what this patch does essentially.

However, a tricky part is that the QEMU vga code does treat VGA_ATT_IW
register always as "flip-flop"; the first write is for index and the
second write is for the data like palette.  Meanwhile, in the current
bochs DRM driver, the flip-flop wasn't considered, and it calls only
the register update once with the value 0x20.

So, in this patch, we fix the behavior by simply writing the
VGA_ATT_IW register value twice at each place as well.

Signed-off-by: Takashi Iwai <tiwai@suse.de>
---
 drivers/gpu/drm/bochs/bochs_hw.c  | 13 ++++++++++++-
 drivers/gpu/drm/bochs/bochs_kms.c |  8 ++++++++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bochs/bochs_hw.c b/drivers/gpu/drm/bochs/bochs_hw.c
index 2d7380a9890e..9a6f90216d6c 100644
--- a/drivers/gpu/drm/bochs/bochs_hw.c
+++ b/drivers/gpu/drm/bochs/bochs_hw.c
@@ -213,6 +213,14 @@ void bochs_hw_setmode(struct bochs_device *bochs,
 	if (!drm_dev_enter(bochs->dev, &idx))
 		return;
 
+	if (!mode) {
+		DRM_DEBUG_DRIVER("crtc disabled\n");
+		/* set to blank mode; send twice for ar_flip_flop */
+		bochs_vga_writeb(bochs, 0x3c0, 0);
+		bochs_vga_writeb(bochs, 0x3c0, 0);
+		goto exit;
+	}
+
 	bochs->xres = mode->hdisplay;
 	bochs->yres = mode->vdisplay;
 	bochs->bpp = 32;
@@ -223,7 +231,9 @@ void bochs_hw_setmode(struct bochs_device *bochs,
 			 bochs->xres, bochs->yres, bochs->bpp,
 			 bochs->yres_virtual);
 
-	bochs_vga_writeb(bochs, 0x3c0, 0x20); /* unblank */
+	/* unblank; send twice for ar_flip_flop */
+	bochs_vga_writeb(bochs, 0x3c0, 0x20);
+	bochs_vga_writeb(bochs, 0x3c0, 0x20);
 
 	bochs_dispi_write(bochs, VBE_DISPI_INDEX_ENABLE,      0);
 	bochs_dispi_write(bochs, VBE_DISPI_INDEX_BPP,         bochs->bpp);
@@ -239,6 +249,7 @@ void bochs_hw_setmode(struct bochs_device *bochs,
 	bochs_dispi_write(bochs, VBE_DISPI_INDEX_ENABLE,
 			  VBE_DISPI_ENABLED | VBE_DISPI_LFB_ENABLED);
 
+ exit:
 	drm_dev_exit(idx);
 }
 
diff --git a/drivers/gpu/drm/bochs/bochs_kms.c b/drivers/gpu/drm/bochs/bochs_kms.c
index 853081d186d5..b0d77d6d3ae4 100644
--- a/drivers/gpu/drm/bochs/bochs_kms.c
+++ b/drivers/gpu/drm/bochs/bochs_kms.c
@@ -57,6 +57,13 @@ static void bochs_pipe_enable(struct drm_simple_display_pipe *pipe,
 	bochs_plane_update(bochs, plane_state);
 }
 
+static void bochs_pipe_disable(struct drm_simple_display_pipe *pipe)
+{
+	struct bochs_device *bochs = pipe->crtc.dev->dev_private;
+
+	bochs_hw_setmode(bochs, NULL);
+}
+
 static void bochs_pipe_update(struct drm_simple_display_pipe *pipe,
 			      struct drm_plane_state *old_state)
 {
@@ -67,6 +74,7 @@ static void bochs_pipe_update(struct drm_simple_display_pipe *pipe,
 
 static const struct drm_simple_display_pipe_funcs bochs_pipe_funcs = {
 	.enable	    = bochs_pipe_enable,
+	.disable    = bochs_pipe_disable,
 	.update	    = bochs_pipe_update,
 	.prepare_fb = drm_gem_vram_simple_display_pipe_prepare_fb,
 	.cleanup_fb = drm_gem_vram_simple_display_pipe_cleanup_fb,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
