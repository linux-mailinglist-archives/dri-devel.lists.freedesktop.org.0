Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C10344B88
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 17:36:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB1D26E520;
	Mon, 22 Mar 2021 16:36:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 136A06E520
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 16:35:51 +0000 (UTC)
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net
 [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D5F6410D2;
 Mon, 22 Mar 2021 17:35:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1616430944;
 bh=/icMWPFlTSE37hcm0c7npT8SiUIx9M6PoJKAGFuQ9JA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ba2iaWPw3fQNKv/Qm8IQlVEmclb1+qzl+WELXtGn+48PObtlhTpIbOIzxlyZfdMx5
 +sa0jXy7V1Fmx7QdF060y3ahoNu4vXVs/oRVlMR70qN2xAK/wZ7GCGObpwpn6OZLt1
 8MZJpz3SrgSTrkpi+G0Uug50w7Fyi6hZxzK3jGpo=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v5 07/10] drm: rcar-du: Provide for_each_group helper
Date: Mon, 22 Mar 2021 16:35:32 +0000
Message-Id: <20210322163535.1090570-8-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210322163535.1090570-1-kieran.bingham+renesas@ideasonboard.com>
References: <20210322163535.1090570-1-kieran.bingham+renesas@ideasonboard.com>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Ulrich Hecht <uli+renesas@fpond.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Refactoring of the group control code will soon require more iteration
over the available groups. Simplify this process by introducing a group
iteration helper.

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v2:

- Don't assign __group in the condition part of the for statement of the
  for_each_rcdu_group() macro
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.h |  5 +++++
 drivers/gpu/drm/rcar-du/rcar_du_kms.c | 10 ++--------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 02ca2d0e1b55..e792ba7f5145 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -104,6 +104,11 @@ static inline struct rcar_du_device *to_rcar_du_device(struct drm_device *dev)
 	return container_of(dev, struct rcar_du_device, ddev);
 }
 
+#define for_each_rcdu_group(__rcdu, __group, __i) \
+	for ((__i) = 0, (__group) = &(__rcdu)->groups[0]; \
+	     (__i) < DIV_ROUND_UP((__rcdu)->num_crtcs, 2); \
+	     __i++, __group++)
+
 static inline bool rcar_du_has(struct rcar_du_device *rcdu,
 			       unsigned int feature)
 {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 3c10c329c81c..732aac342dab 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -771,9 +771,9 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 
 	struct drm_device *dev = &rcdu->ddev;
 	struct drm_encoder *encoder;
+	struct rcar_du_group *rgrp;
 	unsigned int dpad0_sources;
 	unsigned int num_encoders;
-	unsigned int num_groups;
 	unsigned int swindex;
 	unsigned int hwindex;
 	unsigned int i;
@@ -820,11 +820,7 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 		return ret;
 
 	/* Initialize the groups. */
-	num_groups = DIV_ROUND_UP(rcdu->num_crtcs, 2);
-
-	for (i = 0; i < num_groups; ++i) {
-		struct rcar_du_group *rgrp = &rcdu->groups[i];
-
+	for_each_rcdu_group(rcdu, rgrp, i) {
 		mutex_init(&rgrp->lock);
 
 		rgrp->dev = rcdu;
@@ -866,8 +862,6 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 
 	/* Create the CRTCs. */
 	for (swindex = 0, hwindex = 0; swindex < rcdu->num_crtcs; ++hwindex) {
-		struct rcar_du_group *rgrp;
-
 		/* Skip unpopulated DU channels. */
 		if (!(rcdu->info->channels_mask & BIT(hwindex)))
 			continue;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
