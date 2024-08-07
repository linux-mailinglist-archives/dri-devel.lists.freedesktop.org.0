Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E69A994AA47
	for <lists+dri-devel@lfdr.de>; Wed,  7 Aug 2024 16:37:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59EB010E54A;
	Wed,  7 Aug 2024 14:37:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="BYTGm/V+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D32010E54A
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Aug 2024 14:37:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D6BB46102A;
 Wed,  7 Aug 2024 14:37:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5896FC32781;
 Wed,  7 Aug 2024 14:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1723041451;
 bh=y7k0RJyhsvbSIfdTtKwYFCCoUj3Jp3IMcp4f0rHYaWU=;
 h=Subject:To:Cc:From:Date:From;
 b=BYTGm/V+klzhfh6F/AMcBmDqbg0njGvd29j/CbNUP+MfciP9CCfwSwapRENbGlOwf
 Ge5R/AIr5dF8w3mrlLZi7Rf6HvFjfixZcVJSjGJuicxBplWzshpWLYFwVVSMvXVC1T
 K0i2R1GmuFXBcTOEBRkTVVGzSWUBWKMSKE3m4uZo=
Subject: Patch "drm/ast: Fix black screen after resume" has been added to the
 6.6-stable tree
To: 8ce1e1cc351153a890b65e62fed93b54ccd43f6a.camel@gmail.com,
 airlied@redhat.com, cogarre@gmail.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jammy_huang@aspeedtech.com, jfalempe@redhat.com,
 tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 07 Aug 2024 16:35:57 +0200
Message-ID: <2024080757-chariot-perfume-b871@gregkh>
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

    drm/ast: Fix black screen after resume

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-ast-fix-black-screen-after-resume.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 12c35c5582acb0fd8f7713ffa75f450766022ff1 Mon Sep 17 00:00:00 2001
From: Jammy Huang <jammy_huang@aspeedtech.com>
Date: Thu, 18 Jul 2024 11:03:52 +0800
Subject: drm/ast: Fix black screen after resume

From: Jammy Huang <jammy_huang@aspeedtech.com>

commit 12c35c5582acb0fd8f7713ffa75f450766022ff1 upstream.

Suspend will disable pcie device. Thus, resume should do full hw
initialization again.
Add some APIs to ast_drm_thaw() before ast_post_gpu() to fix the issue.

v2:
- fix function-call arguments

Fixes: 5b71707dd13c ("drm/ast: Enable and unlock device access early during init")
Reported-by: Cary Garrett <cogarre@gmail.com>
Closes: https://lore.kernel.org/dri-devel/8ce1e1cc351153a890b65e62fed93b54ccd43f6a.camel@gmail.com/
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.6+
Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20240718030352.654155-1-jammy_huang@aspeedtech.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/ast/ast_drv.c |    5 +++++
 1 file changed, 5 insertions(+)

--- a/drivers/gpu/drm/ast/ast_drv.c
+++ b/drivers/gpu/drm/ast/ast_drv.c
@@ -138,6 +138,11 @@ static int ast_drm_freeze(struct drm_dev
 
 static int ast_drm_thaw(struct drm_device *dev)
 {
+	struct ast_device *ast = to_ast_device(dev);
+
+	ast_enable_vga(ast->ioregs);
+	ast_open_key(ast->ioregs);
+	ast_enable_mmio(dev->dev, ast->ioregs);
 	ast_post_gpu(dev);
 
 	return drm_mode_config_helper_resume(dev);


Patches currently in stable-queue which might be from jammy_huang@aspeedtech.com are

queue-6.6/drm-ast-fix-black-screen-after-resume.patch
