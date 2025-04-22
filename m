Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C76FA95E0A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Apr 2025 08:22:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A36C910E4FE;
	Tue, 22 Apr 2025 06:22:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sGcDQyKu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A942110E4FE
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Apr 2025 06:22:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A07635C58DA;
 Tue, 22 Apr 2025 06:19:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12CD5C4CEEC;
 Tue, 22 Apr 2025 06:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1745302929;
 bh=cNxygtUbdDNldR1OWReKJPYNFKMBI/DgqVRuMe36Qzc=;
 h=Subject:To:Cc:From:Date:From;
 b=sGcDQyKudXzwIYxIi/7s0zwkvJrJRP+TyMGjPIloOVtLOGBr20eomaJUl9+CLjkg8
 p6Lwa2rLJ0WpKN1jW5csZTLMA2msmw6Hl1ZpPKjPvatxTP4/WQZBGAG0IEEGVkBsdT
 Kg7yLYD3EZDa131HPbngxHlWsoVTQcRYrStHN+N0=
Subject: Patch "drm/ast: Fix ast_dp connection status" has been added to the
 6.12-stable tree
To: airlied@redhat.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, jerry.hoemann@hpe.com, jfalempe@redhat.com,
 jose.lopez@hpe.com, tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 22 Apr 2025 08:21:00 +0200
Message-ID: <2025042200-gauging-pork-7558@gregkh>
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

    drm/ast: Fix ast_dp connection status

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-ast-fix-ast_dp-connection-status.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From c28f72c6ca98e039c2aa5aac6752c416bc31dbab Mon Sep 17 00:00:00 2001
From: Jocelyn Falempe <jfalempe@redhat.com>
Date: Fri, 24 Jan 2025 15:11:31 +0100
Subject: drm/ast: Fix ast_dp connection status

From: Jocelyn Falempe <jfalempe@redhat.com>

commit c28f72c6ca98e039c2aa5aac6752c416bc31dbab upstream.

ast_dp_is_connected() used to also check for link training success
to report the DP connector as connected. Without this check, the
physical_status is always connected. So if no monitor is present, it
will fail to read the EDID and set the default resolution to 640x480
instead of 1024x768.

Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
Fixes: 2281475168d2 ("drm/ast: astdp: Perform link training during atomic_enable")
Reported-by: Jerry Hoemann <jerry.hoemann@hpe.com>
Tested-by: Jose Lopez <jose.lopez@hpe.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dave Airlie <airlied@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.12+
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20250124141142.2434138-1-jfalempe@redhat.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/ast/ast_dp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/ast/ast_dp.c b/drivers/gpu/drm/ast/ast_dp.c
index 0e282b7b167c..30aad5c0112a 100644
--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -17,6 +17,12 @@ static bool ast_astdp_is_connected(struct ast_device *ast)
 {
 	if (!ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDF, AST_IO_VGACRDF_HPD))
 		return false;
+	/*
+	 * HPD might be set even if no monitor is connected, so also check that
+	 * the link training was successful.
+	 */
+	if (!ast_get_index_reg_mask(ast, AST_IO_VGACRI, 0xDC, AST_IO_VGACRDC_LINK_SUCCESS))
+		return false;
 	return true;
 }
 
-- 
2.49.0



Patches currently in stable-queue which might be from jfalempe@redhat.com are

queue-6.12/drm-ast-fix-ast_dp-connection-status.patch
