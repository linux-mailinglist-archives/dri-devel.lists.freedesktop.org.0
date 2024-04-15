Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 825828A4F76
	for <lists+dri-devel@lfdr.de>; Mon, 15 Apr 2024 14:48:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F97A10E04B;
	Mon, 15 Apr 2024 12:48:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oT6XYkQG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A42410E04B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Apr 2024 12:48:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7AE4F60C5D;
 Mon, 15 Apr 2024 12:48:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F30C113CC;
 Mon, 15 Apr 2024 12:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1713185301;
 bh=j1XiGF7wJM5otUJlpWcs5iW6XgCaVe6/4jEOAbhU2gA=;
 h=Subject:To:Cc:From:Date:From;
 b=oT6XYkQGrO31EFR5fseYjvES5Gin/L0GErzrTU+MY/o/lJmpCa2+MMNXct8QG4rPI
 wLt0VFdbG8+CiDmw3dTL1qPtebfxcrltwOZAvKJwSlPfQrD9UyUyF/9VIvv/XSIR4W
 uitsOkK0yDsfn4XNo6jskMo+8aBl5YzJtab8QQUg=
Subject: Patch "drm/ast: Fix soft lockup" has been added to the 6.6-stable tree
To: airlied@redhat.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jammy_huang@aspeedtech.com, jfalempe@redhat.com,
 kuohsiang_chou@aspeedtech.com, tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 15 Apr 2024 14:47:42 +0200
Message-ID: <2024041542-untying-jawline-1e7d@gregkh>
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

    drm/ast: Fix soft lockup

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-ast-fix-soft-lockup.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From bc004f5038220b1891ef4107134ccae44be55109 Mon Sep 17 00:00:00 2001
From: Jammy Huang <jammy_huang@aspeedtech.com>
Date: Wed, 3 Apr 2024 17:02:46 +0800
Subject: drm/ast: Fix soft lockup

From: Jammy Huang <jammy_huang@aspeedtech.com>

commit bc004f5038220b1891ef4107134ccae44be55109 upstream.

There is a while-loop in ast_dp_set_on_off() that could lead to
infinite-loop. This is because the register, VGACRI-Dx, checked in
this API is a scratch register actually controlled by a MCU, named
DPMCU, in BMC.

These scratch registers are protected by scu-lock. If suc-lock is not
off, DPMCU can not update these registers and then host will have soft
lockup due to never updated status.

DPMCU is used to control DP and relative registers to handshake with
host's VGA driver. Even the most time-consuming task, DP's link
training, is less than 100ms. 200ms should be enough.

Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
Fixes: 594e9c04b586 ("drm/ast: Create the driver for ASPEED proprietory Display-Port")
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Cc: KuoHsiang Chou <kuohsiang_chou@aspeedtech.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.19+
Link: https://patchwork.freedesktop.org/patch/msgid/20240403090246.1495487-1-jammy_huang@aspeedtech.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/ast/ast_dp.c |    3 +++
 1 file changed, 3 insertions(+)

--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -180,6 +180,7 @@ void ast_dp_set_on_off(struct drm_device
 {
 	struct ast_device *ast = to_ast_device(dev);
 	u8 video_on_off = on;
+	u32 i = 0;
 
 	// Video On/Off
 	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xE3, (u8) ~AST_DP_VIDEO_ENABLE, on);
@@ -192,6 +193,8 @@ void ast_dp_set_on_off(struct drm_device
 						ASTDP_MIRROR_VIDEO_ENABLE) != video_on_off) {
 			// wait 1 ms
 			mdelay(1);
+			if (++i > 200)
+				break;
 		}
 	}
 }


Patches currently in stable-queue which might be from jammy_huang@aspeedtech.com are

queue-6.6/drm-ast-fix-soft-lockup.patch
