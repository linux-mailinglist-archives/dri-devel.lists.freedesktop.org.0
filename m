Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 550218AE926
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 16:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9BDE112854;
	Tue, 23 Apr 2024 14:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VL1krfI3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EAB5112854
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 14:09:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 54DC4CE1079;
 Tue, 23 Apr 2024 14:09:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B2AFC32786;
 Tue, 23 Apr 2024 14:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1713881358;
 bh=WiVj8J6NxaQMnmkgGWmrDmzsD1BJqTpG6KxBs+LkmKI=;
 h=Subject:To:Cc:From:Date:From;
 b=VL1krfI3YWt4FyeR610ESrktBys381YTzcuv70p4W8eYdc6gcHL+nSZQtvFXBfBLq
 s53R0CCGO2x/NNm2godcXhM7DEKNbqWV8GUwOrpNbeGwYNAsKwCVdWbFijdyGt4AS7
 N4+aE9QLt1owA9Nda7g4YRdQ9uX73vOiwMq/SbTI=
Subject: Patch "drm/vmwgfx: Sort primary plane formats by order of preference"
 has been added to the 6.8-stable tree
To: bcm-kernel-feedback-list@broadcom.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, pekka.paalanen@collabora.com,
 zack.rusin@broadcom.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 23 Apr 2024 07:08:22 -0700
Message-ID: <2024042322-mold-stagnant-71e9@gregkh>
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

    drm/vmwgfx: Sort primary plane formats by order of preference

to the 6.8-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-vmwgfx-sort-primary-plane-formats-by-order-of-preference.patch
and it can be found in the queue-6.8 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From d4c972bff3129a9dd4c22a3999fd8eba1a81531a Mon Sep 17 00:00:00 2001
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Thu, 11 Apr 2024 22:55:11 -0400
Subject: drm/vmwgfx: Sort primary plane formats by order of preference

From: Zack Rusin <zack.rusin@broadcom.com>

commit d4c972bff3129a9dd4c22a3999fd8eba1a81531a upstream.

The table of primary plane formats wasn't sorted at all, leading to
applications picking our least desirable formats by defaults.

Sort the primary plane formats according to our order of preference.

Nice side-effect of this change is that it makes IGT's kms_atomic
plane-invalid-params pass because the test picks the first format
which for vmwgfx was DRM_FORMAT_XRGB1555 and uses fb's with odd sizes
which make Pixman, which IGT depends on assert due to the fact that our
16bpp formats aren't 32 bit aligned like Pixman requires all formats
to be.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Fixes: 36cc79bc9077 ("drm/vmwgfx: Add universal plane support")
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v4.12+
Acked-by: Pekka Paalanen <pekka.paalanen@collabora.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240412025511.78553-6-zack.rusin@broadcom.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
@@ -243,10 +243,10 @@ struct vmw_framebuffer_bo {
 
 
 static const uint32_t __maybe_unused vmw_primary_plane_formats[] = {
-	DRM_FORMAT_XRGB1555,
-	DRM_FORMAT_RGB565,
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_XRGB1555,
 };
 
 static const uint32_t __maybe_unused vmw_cursor_plane_formats[] = {


Patches currently in stable-queue which might be from zack.rusin@broadcom.com are

queue-6.8/drm-vmwgfx-fix-prime-import-export.patch
queue-6.8/drm-vmwgfx-sort-primary-plane-formats-by-order-of-preference.patch
queue-6.8/drm-vmwgfx-fix-crtc-s-atomic-check-conditional.patch
