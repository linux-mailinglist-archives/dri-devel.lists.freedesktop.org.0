Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F185A98FE7
	for <lists+dri-devel@lfdr.de>; Wed, 23 Apr 2025 17:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793F910E6D8;
	Wed, 23 Apr 2025 15:15:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="yVmP/NId";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC7CD10E6D8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Apr 2025 15:15:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BAAC1614B6;
 Wed, 23 Apr 2025 15:14:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13FCDC4CEE2;
 Wed, 23 Apr 2025 15:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1745421301;
 bh=3RIPUDv0iKGPfWWlGzN4ygKt+lL+ONGy5THcJlWU4Ew=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=yVmP/NId2VJ3Rlgl7ohskcSdFhQqMmnRM/llRnDGFBHRDOAfqE3GaIdd1IHLaiIHC
 S4tO22lLLncpMXn7kgrzSz70nAK9u1cSFPluiCvrtq/qH91Mvuma9Q9VQN77LeXfs8
 8IeTYWDT0wPsYBeFWxJ+utpyosXjamEwRvnoExA4=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Jerry Hoemann <jerry.hoemann@hpe.com>, Jose Lopez <jose.lopez@hpe.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 6.14 173/241] drm/ast: Fix ast_dp connection status
Date: Wed, 23 Apr 2025 16:43:57 +0200
Message-ID: <20250423142627.598204027@linuxfoundation.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250423142620.525425242@linuxfoundation.org>
References: <20250423142620.525425242@linuxfoundation.org>
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

6.14-stable review patch.  If anyone has any objections, please let me know.

------------------

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
 drivers/gpu/drm/ast/ast_dp.c |    6 ++++++
 1 file changed, 6 insertions(+)

--- a/drivers/gpu/drm/ast/ast_dp.c
+++ b/drivers/gpu/drm/ast/ast_dp.c
@@ -17,6 +17,12 @@ static bool ast_astdp_is_connected(struc
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
 


