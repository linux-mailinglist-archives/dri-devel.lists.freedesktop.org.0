Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E916C7FD2
	for <lists+dri-devel@lfdr.de>; Fri, 24 Mar 2023 15:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B778C10E533;
	Fri, 24 Mar 2023 14:25:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0.riseup.net (mx0.riseup.net [198.252.153.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A6C10E533
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Mar 2023 14:25:50 +0000 (UTC)
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "mail.riseup.net", Issuer "R3" (not verified))
 by mx0.riseup.net (Postfix) with ESMTPS id 4Pjkyk02ctz9sx6;
 Fri, 24 Mar 2023 14:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
 t=1679667950; bh=0aZYGMFA9MsV5s2n9ojDlQvwwNraYa8eq0U/8qjHObI=;
 h=From:To:Cc:Subject:Date:From;
 b=N7oLXDQ9ZPJjR88IgbchYflpdozag8TUiNQx/RSPgiVVb6JV8M9sdBQ8xw8/t6jZT
 GyuWnpSLZlOXOzwG8MvvMyTiabkCf9lF1yZhQiGoQFzr3+PHOnH4FcbXcY9Sr1qfbc
 /roM8t44SsTC4H/9kl/S94MaXfcF5x9reCp7Zp4U=
X-Riseup-User-ID: 6474530C2DBFFB2176AFBA943F60B4E41054962F6EC0FF1CDBDFA39B49D443E2
Received: from [127.0.0.1] (localhost [127.0.0.1])
 by fews1.riseup.net (Postfix) with ESMTPSA id 4Pjkyc05Prz5vZh;
 Fri, 24 Mar 2023 14:25:43 +0000 (UTC)
From: Arthur Grillo <arthurgrillo@riseup.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/overlay: Remove redundant drm_rect_visible() use
Date: Fri, 24 Mar 2023 11:25:33 -0300
Message-Id: <20230324142533.6357-1-arthurgrillo@riseup.net>
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
Cc: tvrtko.ursulin@linux.intel.com, tales.aparecida@gmail.com,
 lucas.demarchi@intel.com, mairacanal@riseup.net, rodrigo.vivi@intel.com,
 andrealmeid@riseup.net, Arthur Grillo <arthurgrillo@riseup.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_rect_intersect() already returns if the intersection is visible
or not, so the use of drm_rect_visible() is duplicate.

Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
---
 drivers/gpu/drm/i915/display/intel_overlay.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_overlay.c b/drivers/gpu/drm/i915/display/intel_overlay.c
index c12bdca8da9b..444d88f418c5 100644
--- a/drivers/gpu/drm/i915/display/intel_overlay.c
+++ b/drivers/gpu/drm/i915/display/intel_overlay.c
@@ -966,9 +966,8 @@ static int check_overlay_dst(struct intel_overlay *overlay,
 		      rec->dst_width, rec->dst_height);
 
 	clipped = req;
-	drm_rect_intersect(&clipped, &crtc_state->pipe_src);
 
-	if (!drm_rect_visible(&clipped) ||
+	if (!drm_rect_intersect(&clipped, &crtc_state->pipe_src) ||
 	    !drm_rect_equals(&clipped, &req))
 		return -EINVAL;
 
-- 
2.39.2

