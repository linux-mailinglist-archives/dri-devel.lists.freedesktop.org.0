Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D154E1B1F08
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 08:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266EA6E889;
	Tue, 21 Apr 2020 06:48:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 426 seconds by postgrey-1.36 at gabe;
 Mon, 20 Apr 2020 12:52:10 UTC
Received: from forwardcorp1p.mail.yandex.net (forwardcorp1p.mail.yandex.net
 [77.88.29.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB9F6E54C
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Apr 2020 12:52:10 +0000 (UTC)
Received: from mxbackcorp1j.mail.yandex.net (mxbackcorp1j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::162])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 0BE5D2E14F4;
 Mon, 20 Apr 2020 15:45:02 +0300 (MSK)
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net [2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by mxbackcorp1j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 EtuQCSZgVK-j0MapW8c; Mon, 20 Apr 2020 15:45:01 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1587386701; bh=T947b66npBF+lhx1Tm3Zuu80eoQBmoC7sHhaWKhVtX8=;
 h=Message-ID:Date:To:From:Subject;
 b=wh3geY0bOLiEUTZJMZgcBexeZYWn83rmoW7RJP4UKJaue2vAc8nPrfiwLI4piZarb
 wna1iFzrN/NUHxFNZgfkwF05dP+A3ZmJJJRsiaQlJkEK1E7rJKuU8SELxb4ClV3ey6
 kcxNxqTYFyGL0sfA80r3MTlJptfBJESJ4X/yoAH8=
Authentication-Results: mxbackcorp1j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from unknown (unknown [2a02:6b8:b080:8201::1:2])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 PJQqGb4Oah-j0Wmabn9; Mon, 20 Apr 2020 15:45:00 +0300
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client certificate not present)
Subject: [PATCH] drm/ast: Allocate initial CRTC state of the correct size
From: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
To: David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Date: Mon, 20 Apr 2020 15:45:00 +0300
Message-ID: <158738670022.7365.11535132795669408878.stgit@buzz>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 21 Apr 2020 06:48:39 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I've stumbled upon this too. Trivial fix was posted but stuck in review.
This is patch from Thomas Zimmermann changed according to suggestions by
Daniel Vetter from https://patchwork.kernel.org/patch/11356157/


The ast driver inherits from DRM's CRTC state, but still uses the atomic
helper for struct drm_crtc_funcs.reset, drm_atomic_helper_crtc_reset().

The helper only allocates enough memory for the core CRTC state. That
results in an out-ouf-bounds access when duplicating the initial CRTC
state. Simplified backtrace shown below:

[   21.469321] ==================================================================
[   21.469434] BUG: KASAN: slab-out-of-bounds in ast_crtc_atomic_duplicate_state+0x84/0x100 [ast]
[   21.469445] Read of size 8 at addr ffff888036c1c5f8 by task systemd-udevd/382
[   21.469451]
[   21.469464] CPU: 2 PID: 382 Comm: systemd-udevd Tainted: G            E     5.5.0-rc6-1-default+ #214
[   21.469473] Hardware name: Sun Microsystems SUN FIRE X2270 M2/SUN FIRE X2270 M2, BIOS 2.05    07/01/2010
[   21.469480] Call Trace:
[   21.469501]  dump_stack+0xb8/0x110
[   21.469528]  print_address_description.constprop.0+0x1b/0x1e0
[   21.469557]  ? ast_crtc_atomic_duplicate_state+0x84/0x100 [ast]
[   21.469581]  ? ast_crtc_atomic_duplicate_state+0x84/0x100 [ast]
[   21.469597]  __kasan_report.cold+0x1a/0x35
[   21.469640]  ? ast_crtc_atomic_duplicate_state+0x84/0x100 [ast]
[   21.469665]  kasan_report+0xe/0x20
[   21.469693]  ast_crtc_atomic_duplicate_state+0x84/0x100 [ast]
[   21.469733]  drm_atomic_get_crtc_state+0xbf/0x1c0
[   21.469768]  __drm_atomic_helper_set_config+0x81/0x5a0
[   21.469803]  ? drm_atomic_plane_check+0x690/0x690
[   21.469843]  ? drm_client_rotation+0xae/0x240
[   21.469876]  drm_client_modeset_commit_atomic+0x230/0x390
[   21.469888]  ? __mutex_lock+0x8f0/0xbe0
[   21.469929]  ? drm_client_firmware_config.isra.0+0xa60/0xa60
[   21.469948]  ? drm_client_modeset_commit_force+0x28/0x230
[   21.470031]  ? memset+0x20/0x40
[   21.470078]  drm_client_modeset_commit_force+0x90/0x230
[   21.470110]  drm_fb_helper_restore_fbdev_mode_unlocked+0x5f/0xc0
[   21.470132]  drm_fb_helper_set_par+0x59/0x70
[   21.470155]  fbcon_init+0x61d/0xad0
[   21.470185]  ? drm_fb_helper_restore_fbdev_mode_unlocked+0xc0/0xc0
[   21.470232]  visual_init+0x187/0x240
[   21.470266]  do_bind_con_driver+0x2e3/0x460
[   21.470321]  do_take_over_console+0x20a/0x290
[   21.470371]  do_fbcon_takeover+0x85/0x100
[   21.470402]  register_framebuffer+0x2fd/0x490
[   21.470425]  ? kzalloc.constprop.0+0x10/0x10
[   21.470503]  __drm_fb_helper_initial_config_and_unlock+0xf2/0x140
[   21.470533]  drm_fbdev_client_hotplug+0x162/0x250
[   21.470563]  drm_fbdev_generic_setup+0xd2/0x155
[   21.470602]  ast_driver_load+0x688/0x850 [ast]
<...>
[   21.472625] ==================================================================

Allocating enough memory for struct ast_crtc_state in a custom ast CRTC
reset handler fixes the problem.

Signed-off-by: Konstantin Khlebnikov <khlebnikov@yandex-team.ru>
Fixes: 83be6a3ceb11 ("drm/ast: Introduce struct ast_crtc_state")
Link: https://patchwork.kernel.org/patch/11356157/
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/ast/ast_mode.c |   13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index cdd6c46d6557..17143e6bbfec 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -918,8 +918,19 @@ static void ast_crtc_atomic_destroy_state(struct drm_crtc *crtc,
 	kfree(ast_state);
 }
 
+static void ast_crtc_reset(struct drm_crtc *crtc)
+{
+	struct ast_crtc_state *state =
+		kzalloc(sizeof(*state), GFP_KERNEL);
+
+	if (crtc->state)
+		ast_crtc_atomic_destroy_state(crtc, crtc->state);
+
+	__drm_atomic_helper_crtc_reset(crtc, &state->base);
+}
+
 static const struct drm_crtc_funcs ast_crtc_funcs = {
-	.reset = drm_atomic_helper_crtc_reset,
+	.reset = ast_crtc_reset,
 	.set_config = drm_crtc_helper_set_config,
 	.gamma_set = drm_atomic_helper_legacy_gamma_set,
 	.destroy = ast_crtc_destroy,

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
