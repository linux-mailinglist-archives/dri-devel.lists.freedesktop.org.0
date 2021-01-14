Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 255962F65B2
	for <lists+dri-devel@lfdr.de>; Thu, 14 Jan 2021 17:24:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5046D6E40D;
	Thu, 14 Jan 2021 16:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EC7689F73
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 16:24:14 +0000 (UTC)
Received: from Q.local (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net
 [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B27BB1231;
 Thu, 14 Jan 2021 17:24:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1610641450;
 bh=gn0G5DUwr+Mh3anbd2zEKHXz4g/E96A9KVC4NNgh3x4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WV1jyflxwYuR+gAEFIrk6EflTEoJYnGi2k3TRrIuV3qRyL7Wu1WBFxbQu4shgf27p
 5QGlv9bElWjURGuMG97Jp2JecvcssI+nWz0P4WO115rK/pBys8ZV07oRl/93ax9l2c
 ljaTg+JqD8jnIWahvZc0QE4yZ/5UvaQ0edDum5jk=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v4 09/10] drm: rcar-du: Perform group setup from the atomic
 tail handler
Date: Thu, 14 Jan 2021 16:22:54 +0000
Message-Id: <20210114162255.705868-10-kieran.bingham+renesas@ideasonboard.com>
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

Create rcar_du_group_atomic_check() and rcar_du_group_atomic_setup()
functions to track and apply group state through the DRM atomic state.
The use_count field is moved from the rcar_du_group structure to an
enabled field in the rcar_du_group_state structure.

This allows separating group setup from the configuration of the CRTCs
that are part of the group, simplifying the CRTC code and improving
overall readability. The existing rcar_du_group_{get,put}() functions
are now redundant and removed.

The groups share clocking with the CRTCs within the group, and so are
accessible only when one of its CRTCs has been powered through
rcar_du_crtc_atomic_exit_standby().

Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
Changes since v3:
- Shorted macro length, and added relevant documentation to its usage
  and function.

Changes since v2:

- Simplify error handling in rcar_du_crtc_enable()
- Rename rcar_du_group_atomic_pre_commit() to
  rcar_du_group_atomic_setup() and turn it into a void function
- Remove rcar_du_group_atomic_post_commit()
- Replace group state use_count field by enabled
- Rename group state variable from rstate to gstate

Changes since v1:

- All register sequences now maintained.
- Clock management is no longer handled by the group
  (_crtc_{exit,enter}_standby handles this for us)

 drivers/gpu/drm/rcar-du/rcar_du_crtc.c  |  18 +----
 drivers/gpu/drm/rcar-du/rcar_du_group.c | 102 ++++++++++++++++--------
 drivers/gpu/drm/rcar-du/rcar_du_group.h |  12 ++-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c   |   5 ++
 4 files changed, 87 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 7ca721e6b9d7..020eb75732a7 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -528,12 +528,10 @@ static int rcar_du_crtc_exit_standby(struct rcar_du_crtc *rcrtc)
 		return ret;
 
 	ret = clk_prepare_enable(rcrtc->extclock);
-	if (ret < 0)
-		goto error_clock;
-
-	ret = rcar_du_group_get(rcrtc->group);
-	if (ret < 0)
-		goto error_group;
+	if (ret < 0) {
+		clk_disable_unprepare(rcrtc->clock);
+		return ret;
+	}
 
 	/* Set display off and background to black. */
 	rcar_du_crtc_write(rcrtc, DOOR, DOOR_RGB(0, 0, 0));
@@ -543,18 +541,10 @@ static int rcar_du_crtc_exit_standby(struct rcar_du_crtc *rcrtc)
 	rcar_du_group_write(rcrtc->group, rcrtc->index % 2 ? DS2PR : DS1PR, 0);
 
 	return 0;
-
-error_group:
-	clk_disable_unprepare(rcrtc->extclock);
-error_clock:
-	clk_disable_unprepare(rcrtc->clock);
-	return ret;
 }
 
 static void rcar_du_crtc_enter_standby(struct rcar_du_crtc *rcrtc)
 {
-	rcar_du_group_put(rcrtc->group);
-
 	clk_disable_unprepare(rcrtc->extclock);
 	clk_disable_unprepare(rcrtc->clock);
 }
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index 7c13def703b7..fdd4a60f5f5e 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -24,6 +24,7 @@
  */
 
 #include <linux/clk.h>
+#include <linux/err.h>
 #include <linux/io.h>
 #include <linux/slab.h>
 
@@ -183,38 +184,6 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
 	mutex_unlock(&rgrp->lock);
 }
 
-/*
- * rcar_du_group_get - Acquire a reference to the DU channels group
- *
- * Acquiring the first reference setups core registers. A reference must be held
- * before accessing any hardware registers.
- *
- * This function must be called with the DRM mode_config lock held.
- *
- * Return 0 in case of success or a negative error code otherwise.
- */
-int rcar_du_group_get(struct rcar_du_group *rgrp)
-{
-	if (rgrp->use_count)
-		goto done;
-
-	rcar_du_group_setup(rgrp);
-
-done:
-	rgrp->use_count++;
-	return 0;
-}
-
-/*
- * rcar_du_group_put - Release a reference to the DU
- *
- * This function must be called with the DRM mode_config lock held.
- */
-void rcar_du_group_put(struct rcar_du_group *rgrp)
-{
-	--rgrp->use_count;
-}
-
 static void __rcar_du_group_start_stop(struct rcar_du_group *rgrp, bool start)
 {
 	struct rcar_du_device *rcdu = rgrp->dev;
@@ -399,6 +368,34 @@ static const struct drm_private_state_funcs rcar_du_group_state_funcs = {
 	.atomic_destroy_state = rcar_du_group_atomic_destroy_state,
 };
 
+/**
+ * for_each_oldnew_group_in_state - iterate over all groups in an atomic update
+ * @__state: &struct drm_atomic_state pointer
+ * @__obj: &struct drm_private_obj iteration cursor
+ * @__old: &struct drm_private_state iteration cursor for the old state
+ * @__new: &struct drm_private_state iteration cursor for the new state
+ * @__i: unsigned int iteration cursor, for macro-internal use
+ *
+ * Iterate over all private objects in an atomic update, processing only those
+ * which represent rcar_du_group_state, tracking both old and new state.
+ */
+#define for_each_oldnew_group_in_state(__state, __obj, __old, __new, __i) \
+	for_each_oldnew_private_obj_in_state((__state), (__obj), (__old), (__new), (__i)) \
+		for_each_if((__obj)->funcs == &rcar_du_group_state_funcs)
+
+static struct rcar_du_group_state *
+rcar_du_get_group_state(struct drm_atomic_state *state,
+			struct rcar_du_group *rgrp)
+{
+	struct drm_private_state *pstate;
+
+	pstate = drm_atomic_get_private_obj_state(state, &rgrp->private);
+	if (IS_ERR(pstate))
+		return ERR_CAST(pstate);
+
+	return to_rcar_group_state(pstate);
+}
+
 /**
  * rcar_du_get_old_group_state - get old group state, if it exists
  * @state: global atomic state object
@@ -451,6 +448,47 @@ rcar_du_get_new_group_state(struct drm_atomic_state *state,
 	return NULL;
 }
 
+int rcar_du_group_atomic_check(struct drm_device *dev,
+			       struct drm_atomic_state *state)
+{
+	struct drm_crtc_state *crtc_state;
+	struct drm_crtc *crtc;
+	unsigned int i;
+
+	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+		struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
+		struct rcar_du_group_state *gstate;
+
+		gstate = rcar_du_get_group_state(state, rcrtc->group);
+		if (IS_ERR(gstate))
+			return PTR_ERR(gstate);
+
+		if (crtc_state->active)
+			gstate->enabled = true;
+	}
+
+	return 0;
+}
+
+void rcar_du_group_atomic_setup(struct drm_device *dev,
+				struct drm_atomic_state *state)
+{
+	struct drm_private_state *old_pstate, *new_pstate;
+	struct drm_private_obj *obj;
+	unsigned int i;
+
+	for_each_oldnew_group_in_state(state, obj, old_pstate, new_pstate, i) {
+		struct rcar_du_group *rgrp = to_rcar_group(obj);
+		struct rcar_du_group_state *old_state, *new_state;
+
+		old_state = to_rcar_group_state(old_pstate);
+		new_state = to_rcar_group_state(new_pstate);
+
+		if (!old_state->enabled && new_state->enabled)
+			rcar_du_group_setup(rgrp);
+	}
+}
+
 /* -----------------------------------------------------------------------------
  * Init and Cleanup
  */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.h b/drivers/gpu/drm/rcar-du/rcar_du_group.h
index f0b94eb77746..c6e0ae79ede9 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.h
@@ -27,7 +27,6 @@ struct rcar_du_device;
  * @channels_mask: bitmask of populated DU channels in this group
  * @cmms_mask: bitmask of available CMMs in this group
  * @num_crtcs: number of CRTCs in this group (1 or 2)
- * @use_count: number of users of the group (rcar_du_group_(get|put))
  * @used_crtcs: number of CRTCs currently in use
  * @lock: protects the dptsr_planes field and the DPTSR register
  * @dptsr_planes: bitmask of planes driven by dot-clock and timing generator 1
@@ -45,7 +44,6 @@ struct rcar_du_group {
 	unsigned int channels_mask;
 	unsigned int cmms_mask;
 	unsigned int num_crtcs;
-	unsigned int use_count;
 	unsigned int used_crtcs;
 
 	struct mutex lock;
@@ -61,9 +59,12 @@ struct rcar_du_group {
 /**
  * struct rcar_du_group_state - Driver-specific group state
  * @state: base DRM private state
+ * @enabled: true if at least one CRTC in the group is enabled
  */
 struct rcar_du_group_state {
 	struct drm_private_state state;
+
+	bool enabled;
 };
 
 #define to_rcar_group_state(s) \
@@ -72,8 +73,6 @@ struct rcar_du_group_state {
 u32 rcar_du_group_read(struct rcar_du_group *rgrp, u32 reg);
 void rcar_du_group_write(struct rcar_du_group *rgrp, u32 reg, u32 data);
 
-int rcar_du_group_get(struct rcar_du_group *rgrp);
-void rcar_du_group_put(struct rcar_du_group *rgrp);
 void rcar_du_group_start_stop(struct rcar_du_group *rgrp, bool start);
 void rcar_du_group_restart(struct rcar_du_group *rgrp);
 int rcar_du_group_set_routing(struct rcar_du_group *rgrp);
@@ -87,6 +86,11 @@ struct rcar_du_group_state *
 rcar_du_get_new_group_state(struct drm_atomic_state *state,
 			    struct rcar_du_group *rgrp);
 
+int rcar_du_group_atomic_check(struct drm_device *dev,
+			       struct drm_atomic_state *state);
+void rcar_du_group_atomic_setup(struct drm_device *dev,
+				struct drm_atomic_state *state);
+
 int rcar_du_group_init(struct rcar_du_device *rcdu, struct rcar_du_group *rgrp,
 		       unsigned int index);
 void rcar_du_group_cleanup(struct rcar_du_group *rgrp);
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index d3069fb284fb..8a0c26939de2 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -430,6 +430,10 @@ static int rcar_du_atomic_check(struct drm_device *dev,
 	if (ret)
 		return ret;
 
+	ret = rcar_du_group_atomic_check(dev, state);
+	if (ret)
+		return ret;
+
 	if (rcar_du_has(rcdu, RCAR_DU_FEATURE_VSP1_SOURCE))
 		return 0;
 
@@ -464,6 +468,7 @@ static void rcar_du_atomic_commit_tail(struct drm_atomic_state *old_state)
 
 	/* Apply the atomic update. */
 	rcar_du_crtc_atomic_exit_standby(dev, old_state);
+	rcar_du_group_atomic_setup(dev, old_state);
 
 	drm_atomic_helper_commit_modeset_disables(dev, old_state);
 	rcar_du_crtc_atomic_modeset(dev, old_state);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
