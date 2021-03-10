Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A698F33367C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Mar 2021 08:39:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3451E6E9CB;
	Wed, 10 Mar 2021 07:39:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22F166E9CB
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Mar 2021 07:39:24 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DwP716CmXzrT1f;
 Wed, 10 Mar 2021 15:37:33 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Wed, 10 Mar 2021 15:39:16 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <marex@denx.de>, <stefan@agner.ch>, <airlied@linux.ie>, <daniel@ffwll.ch>, 
 <shawnguo@kernel.org>, <s.hauer@pengutronix.de>
Subject: [PATCH] drm: mxsfb: Use simple encoder
Date: Wed, 10 Mar 2021 15:40:00 +0800
Message-ID: <1615362000-27989-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver uses empty implementations for its encoders. Replace
the code with the generic simple encoder.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 300e7bab..0975930 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -25,6 +25,7 @@
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_plane.h>
 #include <drm/drm_plane_helper.h>
+#include <drm/drm_simple_kms_helper.h>
 #include <drm/drm_vblank.h>
 
 #include "mxsfb_drv.h"
@@ -390,14 +391,6 @@ static const struct drm_crtc_funcs mxsfb_crtc_funcs = {
 };
 
 /* -----------------------------------------------------------------------------
- * Encoder
- */
-
-static const struct drm_encoder_funcs mxsfb_encoder_funcs = {
-	.destroy = drm_encoder_cleanup,
-};
-
-/* -----------------------------------------------------------------------------
  * Planes
  */
 
@@ -584,6 +577,5 @@ int mxsfb_kms_init(struct mxsfb_drm_private *mxsfb)
 		return ret;
 
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
-	return drm_encoder_init(mxsfb->drm, encoder, &mxsfb_encoder_funcs,
-				DRM_MODE_ENCODER_NONE, NULL);
+	return drm_simple_encoder_init(mxsfb->drm, encoder, DRM_MODE_ENCODER_NONE);
 }
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
