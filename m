Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D2B82F65B6
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 17:24:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7AE76E027;
	Thu, 14 Jan 2021 16:24:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E366E17E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 16:24:14 +0000 (UTC)
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net
 [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 409818D7;
 Thu, 14 Jan 2021 17:24:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1610641449;
 bh=WUVDqOVKjC8/d7VNEAOBw0f9CPhuvr9vlUwSUsdupCg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C28r2MV6+oV8IduYuL7mDkfyWbRSz2NASyy5jWs1U/fQepz/kWUy3c6Wdbz6Qf4oa
 7xm3gxzgXIQj3q+l3f2WsR+U5yoGu5OhaorDurZyv2EtLD26vE+MVGkcmI7VW8V/zx
 wD03NWXMkLLEOf19ld/YlMOaXBNADF486nzslKpY=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 08/10] drm: rcar-du: Create a group state object
Date: Thu, 14 Jan 2021 16:22:53 +0000
Message-Id: <20210114162255.705868-9-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210114162255.705868-1-kieran.bingham+renesas@ideasonboard.com>
References: <20210114162255.705868-1-kieran.bingham+renesas@ideasonboard.com>
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

Create a new private state object for the DU groups, and move the
initialisation of a group object to a new function rcar_du_group_init().

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v3:
- Rebase to v5.11
- Fix pointer passing for drm_atomic_private_obj_init()
- Fix checkpatch.pl --strict warning about if (state == NULL)

Changes since v2:

- Call mutex_destroy() when cleaning up the group
- Include mutex.h and slab.h
- Squash "drm: rcar-du: Add rcar_du_get_{old,new}_group_state()"

 drivers/gpu/drm/rcar-du/rcar_du_group.c | 144 ++++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_group.h |  29 +++++
 drivers/gpu/drm/rcar-du/rcar_du_kms.c   |  27 +----
 3 files changed, 177 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index 88a783ceb3e9..7c13def703b7 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -25,6 +25,11 @@
 
 #include <linux/clk.h>
 #include <linux/io.h>
+#include <linux/slab.h>
+
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_state_helper.h>
+#include <drm/drm_device.h>
 
 #include "rcar_du_drv.h"
 #include "rcar_du_group.h"
@@ -361,3 +366,142 @@ int rcar_du_group_set_routing(struct rcar_du_group *rgrp)
 
 	return rcar_du_set_dpad0_vsp1_routing(rgrp->dev);
 }
+
+/* -----------------------------------------------------------------------------
+ * Group State Handling
+ */
+
+static struct drm_private_state *
+rcar_du_group_atomic_duplicate_state(struct drm_private_obj *obj)
+{
+	struct rcar_du_group_state *state;
+
+	if (WARN_ON(!obj->state))
+		return NULL;
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return NULL;
+
+	__drm_atomic_helper_private_obj_duplicate_state(obj, &state->state);
+
+	return &state->state;
+}
+
+static void rcar_du_group_atomic_destroy_state(struct drm_private_obj *obj,
+					       struct drm_private_state *state)
+{
+	kfree(to_rcar_group_state(state));
+}
+
+static const struct drm_private_state_funcs rcar_du_group_state_funcs = {
+	.atomic_duplicate_state = rcar_du_group_atomic_duplicate_state,
+	.atomic_destroy_state = rcar_du_group_atomic_destroy_state,
+};
+
+/**
+ * rcar_du_get_old_group_state - get old group state, if it exists
+ * @state: global atomic state object
+ * @rgrp: group to grab
+ *
+ * This function returns the old group state for the given group, or
+ * NULL if the group is not part of the global atomic state.
+ */
+struct rcar_du_group_state *
+rcar_du_get_old_group_state(struct drm_atomic_state *state,
+			    struct rcar_du_group *rgrp)
+{
+	struct drm_private_obj *obj = &rgrp->private;
+	struct drm_private_state *pstate;
+	unsigned int i;
+
+	for (i = 0; i < state->num_private_objs; i++) {
+		if (obj == state->private_objs[i].ptr) {
+			pstate = state->private_objs[i].old_state;
+			return to_rcar_group_state(pstate);
+		}
+	}
+
+	return NULL;
+}
+
+/**
+ * rcar_du_get_new_group_state - get new group state, if it exists
+ * @state: global atomic state object
+ * @rgrp: group to grab
+ *
+ * This function returns the new group state for the given group, or
+ * NULL if the group is not part of the global atomic state.
+ */
+struct rcar_du_group_state *
+rcar_du_get_new_group_state(struct drm_atomic_state *state,
+			    struct rcar_du_group *rgrp)
+{
+	struct drm_private_obj *obj = &rgrp->private;
+	struct drm_private_state *pstate;
+	unsigned int i;
+
+	for (i = 0; i < state->num_private_objs; i++) {
+		if (obj == state->private_objs[i].ptr) {
+			pstate = state->private_objs[i].new_state;
+			return to_rcar_group_state(pstate);
+		}
+	}
+
+	return NULL;
+}
+
+/* -----------------------------------------------------------------------------
+ * Init and Cleanup
+ */
+
+/*
+ * rcar_du_group_init - Initialise and reset a group object
+ *
+ * Return 0 in case of success or a negative error code otherwise.
+ */
+int rcar_du_group_init(struct rcar_du_device *rcdu, struct rcar_du_group *rgrp,
+		       unsigned int index)
+{
+	static const unsigned int mmio_offsets[] = {
+		DU0_REG_OFFSET, DU2_REG_OFFSET
+	};
+
+	struct rcar_du_group_state *state;
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return -ENOMEM;
+
+	drm_atomic_private_obj_init(&rcdu->ddev, &rgrp->private, &state->state,
+				    &rcar_du_group_state_funcs);
+
+	mutex_init(&rgrp->lock);
+
+	rgrp->dev = rcdu;
+	rgrp->mmio_offset = mmio_offsets[index];
+	rgrp->index = index;
+	/* Extract the channel mask for this group only. */
+	rgrp->channels_mask = (rcdu->info->channels_mask >> (2 * index))
+			    & GENMASK(1, 0);
+	rgrp->num_crtcs = hweight8(rgrp->channels_mask);
+
+	/*
+	 * If we have more than one CRTC in this group pre-associate
+	 * the low-order planes with CRTC 0 and the high-order planes
+	 * with CRTC 1 to minimize flicker occurring when the
+	 * association is changed.
+	 */
+	rgrp->dptsr_planes = rgrp->num_crtcs > 1
+			   ? (rcdu->info->gen >= 3 ? 0x04 : 0xf0)
+			   : 0;
+
+	return 0;
+}
+
+void rcar_du_group_cleanup(struct rcar_du_group *rgrp)
+{
+	mutex_destroy(&rgrp->lock);
+
+	drm_atomic_private_obj_fini(&rgrp->private);
+}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.h b/drivers/gpu/drm/rcar-du/rcar_du_group.h
index e9906609c635..f0b94eb77746 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.h
@@ -12,12 +12,15 @@
 
 #include <linux/mutex.h>
 
+#include <drm/drm_atomic.h>
+
 #include "rcar_du_plane.h"
 
 struct rcar_du_device;
 
 /*
  * struct rcar_du_group - CRTCs and planes group
+ * @private: The base drm private object
  * @dev: the DU device
  * @mmio_offset: registers offset in the device memory map
  * @index: group index
@@ -33,6 +36,8 @@ struct rcar_du_device;
  * @need_restart: the group needs to be restarted due to a configuration change
  */
 struct rcar_du_group {
+	struct drm_private_obj private;
+
 	struct rcar_du_device *dev;
 	unsigned int mmio_offset;
 	unsigned int index;
@@ -51,6 +56,19 @@ struct rcar_du_group {
 	bool need_restart;
 };
 
+#define to_rcar_group(s) container_of(s, struct rcar_du_group, private)
+
+/**
+ * struct rcar_du_group_state - Driver-specific group state
+ * @state: base DRM private state
+ */
+struct rcar_du_group_state {
+	struct drm_private_state state;
+};
+
+#define to_rcar_group_state(s) \
+	container_of(s, struct rcar_du_group_state, state)
+
 u32 rcar_du_group_read(struct rcar_du_group *rgrp, u32 reg);
 void rcar_du_group_write(struct rcar_du_group *rgrp, u32 reg, u32 data);
 
@@ -62,4 +80,15 @@ int rcar_du_group_set_routing(struct rcar_du_group *rgrp);
 
 int rcar_du_set_dpad0_vsp1_routing(struct rcar_du_device *rcdu);
 
+struct rcar_du_group_state *
+rcar_du_get_old_group_state(struct drm_atomic_state *state,
+			    struct rcar_du_group *rgrp);
+struct rcar_du_group_state *
+rcar_du_get_new_group_state(struct drm_atomic_state *state,
+			    struct rcar_du_group *rgrp);
+
+int rcar_du_group_init(struct rcar_du_device *rcdu, struct rcar_du_group *rgrp,
+		       unsigned int index);
+void rcar_du_group_cleanup(struct rcar_du_group *rgrp);
+
 #endif /* __RCAR_DU_GROUP_H__ */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 732aac342dab..d3069fb284fb 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -26,6 +26,7 @@
 #include "rcar_du_crtc.h"
 #include "rcar_du_drv.h"
 #include "rcar_du_encoder.h"
+#include "rcar_du_group.h"
 #include "rcar_du_kms.h"
 #include "rcar_du_regs.h"
 #include "rcar_du_vsp.h"
@@ -765,10 +766,6 @@ static void rcar_du_modeset_cleanup(struct drm_device *dev, void *res)
 
 int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 {
-	static const unsigned int mmio_offsets[] = {
-		DU0_REG_OFFSET, DU2_REG_OFFSET
-	};
-
 	struct drm_device *dev = &rcdu->ddev;
 	struct drm_encoder *encoder;
 	struct rcar_du_group *rgrp;
@@ -821,25 +818,9 @@ int rcar_du_modeset_init(struct rcar_du_device *rcdu)
 
 	/* Initialize the groups. */
 	for_each_rcdu_group(rcdu, rgrp, i) {
-		mutex_init(&rgrp->lock);
-
-		rgrp->dev = rcdu;
-		rgrp->mmio_offset = mmio_offsets[i];
-		rgrp->index = i;
-		/* Extract the channel mask for this group only. */
-		rgrp->channels_mask = (rcdu->info->channels_mask >> (2 * i))
-				   & GENMASK(1, 0);
-		rgrp->num_crtcs = hweight8(rgrp->channels_mask);
-
-		/*
-		 * If we have more than one CRTCs in this group pre-associate
-		 * the low-order planes with CRTC 0 and the high-order planes
-		 * with CRTC 1 to minimize flicker occurring when the
-		 * association is changed.
-		 */
-		rgrp->dptsr_planes = rgrp->num_crtcs > 1
-				   ? (rcdu->info->gen >= 3 ? 0x04 : 0xf0)
-				   : 0;
+		ret = rcar_du_group_init(rcdu, rgrp, i);
+		if (ret < 0)
+			return ret;
 
 		if (!rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE)) {
 			ret = rcar_du_planes_init(rgrp);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
