Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C37926419C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 11:24:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BCF6E8D5;
	Thu, 10 Sep 2020 09:24:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kmu-office.ch (mail.kmu-office.ch [IPv6:2a02:418:6a02::a2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433586E8CF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Sep 2020 09:24:29 +0000 (UTC)
Received: from trochilidae.toradex.int (unknown [IPv6:2a02:169:3df5::edf])
 by mail.kmu-office.ch (Postfix) with ESMTPSA id 346F05C209B;
 Thu, 10 Sep 2020 11:24:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
 t=1599729867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1Wa4Q7+oZYh6upGxYLWCFM+ahN/HhRGTiJp7iLKWQ5k=;
 b=ok+6tmLDRRU/etFp+EmZQe7CrpULpEH+dMXriNUolgU7FFjrE65Vw0b5sVpRkqDPs67/qz
 8av0G42UObp0Q9XR0QdPn+6iINPQ3tDXYg+fpgkj4c8ZGSIFzcA7DEEY0HTYb1Q3nQblu7
 FOWDMbVkS5xAItXeDOOSBSgkl6dUKUc=
From: Stefan Agner <stefan@agner.ch>
To: marex@denx.de, stefan@agner.ch, laurent.pinchart@ideasonboard.com,
 daniel@ffwll.ch
Subject: [RFC PATCH 3/3] drm: mxsfb: enforce framebuffer size matches plane
 size
Date: Thu, 10 Sep 2020 11:24:25 +0200
Message-Id: <20200910092425.1016976-3-stefan@agner.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200910092425.1016976-1-stefan@agner.ch>
References: <20200910092425.1016976-1-stefan@agner.ch>
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
Cc: airlied@linux.ie, tomi.valkeinen@ti.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The plane size must match the CRTC already (enforced by not setting
the CAN_POSTION flag). However, the controller also requires the
framebuffer to be exactly the CRTC size. Make use of the new flag
DRM_PLANE_REQUIRE_MATCHING_FB to match the plane size.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index c24ef330718e..7091da1c73cc 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -410,7 +410,8 @@ static int mxsfb_plane_atomic_check(struct drm_plane *plane,
 	return drm_atomic_helper_check_plane_state(plane_state, crtc_state,
 						   DRM_PLANE_HELPER_NO_SCALING,
 						   DRM_PLANE_HELPER_NO_SCALING,
-						   DRM_PLANE_CAN_UPDATE_DISABLED);
+						   DRM_PLANE_CAN_UPDATE_DISABLED |
+						   DRM_PLANE_REQUIRE_MATCHING_FB);
 }
 
 static void mxsfb_plane_primary_atomic_update(struct drm_plane *plane,
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
