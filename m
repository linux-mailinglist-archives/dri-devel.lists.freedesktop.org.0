Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 163D2A2EE10
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 14:33:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8251510E53B;
	Mon, 10 Feb 2025 13:33:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WyVteI7B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7115F10E53B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 13:33:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AF040A414D0;
 Mon, 10 Feb 2025 13:31:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E1BCC4CEDF;
 Mon, 10 Feb 2025 13:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1739194425;
 bh=jEE2rRzbQWsQ5WNql+oIYrLVRlbtbYIC//jkwbzbJ0w=;
 h=Subject:To:Cc:From:Date:From;
 b=WyVteI7BhnuDU8Rv29TJXA3TZyPdo8iYfdbUuu2J4q5uO81dTjaGLMNSbcq7sFGV+
 BMlla/BMQ2v3JBnuGuX1bdguWmPXAePkLj2Ndk1IBYIVEsa9xSdsWIBZj9morzj+gZ
 Qqz8SNNVFg2aknU1wlVNkHF0q+ovfIedH3NKULvg=
Subject: Patch "drm/ast: astdp: Fix timeout for enabling video signal" has
 been added to the 6.13-stable tree
To: airlied@redhat.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jfalempe@redhat.com, tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 10 Feb 2025 14:31:45 +0100
Message-ID: <2025021045-bakery-bolt-34f8@gregkh>
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

    drm/ast: astdp: Fix timeout for enabling video signal

to the 6.13-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-ast-astdp-fix-timeout-for-enabling-video-signal.patch
and it can be found in the queue-6.13 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From fd39c41bcd82d5ebaaebadb944eab5598c668a90 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Mon, 27 Jan 2025 14:44:14 +0100
Subject: drm/ast: astdp: Fix timeout for enabling video signal

From: Thomas Zimmermann <tzimmermann@suse.de>

commit fd39c41bcd82d5ebaaebadb944eab5598c668a90 upstream.

The ASTDP transmitter sometimes takes up to 1 second for enabling the
video signal, while the timeout is only 200 msec. This results in a
kernel error message. Increase the timeout to 1 second. An example
of the error message is shown below.

[  697.084433] ------------[ cut here ]------------
[  697.091115] ast 0000:02:00.0: [drm] drm_WARN_ON(!__ast_dp_wait_enable(ast, enabled))
[  697.091233] WARNING: CPU: 1 PID: 160 at drivers/gpu/drm/ast/ast_dp.c:232 ast_dp_set_enable+0x123/0x140 [ast]
[...]
[  697.272469] RIP: 0010:ast_dp_set_enable+0x123/0x140 [ast]
[...]
[  697.415283] Call Trace:
[  697.420727]  <TASK>
[  697.425908]  ? show_trace_log_lvl+0x196/0x2c0
[  697.433304]  ? show_trace_log_lvl+0x196/0x2c0
[  697.440693]  ? drm_atomic_helper_commit_modeset_enables+0x30a/0x470
[  697.450115]  ? ast_dp_set_enable+0x123/0x140 [ast]
[  697.458059]  ? __warn.cold+0xaf/0xca
[  697.464713]  ? ast_dp_set_enable+0x123/0x140 [ast]
[  697.472633]  ? report_bug+0x134/0x1d0
[  697.479544]  ? handle_bug+0x58/0x90
[  697.486127]  ? exc_invalid_op+0x13/0x40
[  697.492975]  ? asm_exc_invalid_op+0x16/0x20
[  697.500224]  ? preempt_count_sub+0x14/0xc0
[  697.507473]  ? ast_dp_set_enable+0x123/0x140 [ast]
[  697.515377]  ? ast_dp_set_enable+0x123/0x140 [ast]
[  697.523227]  drm_atomic_helper_commit_modeset_enables+0x30a/0x470
[  697.532388]  drm_atomic_helper_commit_tail+0x58/0x90
[  697.540400]  ast_mode_config_helper_atomic_commit_tail+0x30/0x40 [ast]
[  697.550009]  commit_tail+0xfe/0x1d0
[  697.556547]  drm_atomic_helper_commit+0x198/0x1c0

This is a cosmetical problem. Enabling the video signal still works
even with the error message. The problem has always been present, but
only recent versions of the ast driver warn about missing the timeout.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 4e29cc7c5c67 ("drm/ast: astdp: Replace ast_dp_set_on_off()")
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.13+
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20250127134423.84266-1-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/ast/ast_dp.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -195,7 +195,7 @@ static bool __ast_dp_wait_enable(struct
 	if (enabled)
 		vgacrdf_test |= AST_IO_VGACRDF_DP_VIDEO_ENABLE;
 
-	for (i = 0; i < 200; ++i) {
+	for (i = 0; i < 1000; ++i) {
 		if (i)
 			mdelay(1);
 		vgacrdf = ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xdf,


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-6.13/drm-rockchip-cdn-dp-use-drm_connector_helper_hpd_irq_event.patch
queue-6.13/drm-client-handle-tiled-displays-better.patch
queue-6.13/drm-modeset-handle-tiled-displays-in-pan_display_atomic.patch
queue-6.13/drm-ast-astdp-fix-timeout-for-enabling-video-signal.patch
queue-6.13/m68k-vga-fix-i-o-defines.patch
