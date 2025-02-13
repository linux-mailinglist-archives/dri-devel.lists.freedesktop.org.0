Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E335CA34481
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 16:05:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6138010EB09;
	Thu, 13 Feb 2025 15:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Nqwa45+c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5845310EB08
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 15:05:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 45DCA5C537D;
 Thu, 13 Feb 2025 15:05:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22F6CC4CED1;
 Thu, 13 Feb 2025 15:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1739459142;
 bh=g8LzZoJekrd9c5VnX6i59jyXHKXQuXWdgXiDLxgD8fI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Nqwa45+cLVt67yVqUNOI5CDAHc+fpMeyzP4wy7N5TnM+TEX8kqvSmLQjgV0jbi1iE
 XZbKmmV31Bb61pYUhsxQOeVwWg/6I3Pk4XQIb/IS4F4p+wwRZkaRRLo9mlct5vpfdi
 ZQLBmdcbQ+JJx14AKzNci/KqBA8Qr+AW9TwfoqbY=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jocelyn Falempe <jfalempe@redhat.com>, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 6.13 181/443] drm/ast: astdp: Fix timeout for enabling video
 signal
Date: Thu, 13 Feb 2025 15:25:46 +0100
Message-ID: <20250213142447.600494500@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213142440.609878115@linuxfoundation.org>
References: <20250213142440.609878115@linuxfoundation.org>
User-Agent: quilt/0.68
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

6.13-stable review patch.  If anyone has any objections, please let me know.

------------------

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


