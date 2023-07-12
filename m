Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 083C87503AB
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 11:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1F4C10E4A6;
	Wed, 12 Jul 2023 09:47:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BBE010E3F0
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 09:47:17 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWR9-0001G9-4m; Wed, 12 Jul 2023 11:47:07 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWR8-00Dr3C-2z; Wed, 12 Jul 2023 11:47:06 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1qJWR7-004GS3-8E; Wed, 12 Jul 2023 11:47:05 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RFC v1 02/52] drm/core: Use struct drm_crtc::drm_dev instead
 of struct drm_crtc::dev
Date: Wed, 12 Jul 2023 11:46:12 +0200
Message-Id: <20230712094702.1770121-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
References: <20230712094702.1770121-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=32105;
 i=u.kleine-koenig@pengutronix.de; h=from:subject;
 bh=F2xeomIh3MIHMZw/oYiHfznLxwAI/YoNvTp2zqpkzlo=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhpR1ZRF6u26wlFn3KLY68jVvdA3/ZG8e581l9KX9mGZNs
 N6N1NxORmMWBkYuBlkxRRb7xjWZVlVykZ1r/12GGcTKBDKFgYtTACaSXsn+P6vw0JFLkz9uP3/0
 /4vw56tvcW7S52jLbKmdE9hluC6/5fl5B7vsZnXLvLbQhau6Dh1vrW+tDaoqSo4Oe6RcIL/EXbX
 XSupJ9faNP5JmXZocUv83wNalsqU6wFfrnGoa2+Fd1mbnf2re+Vp3dbqOPstU/pqdsz5YTjkyr2
 hH1Mqbl69527pap8lLHXrds65cIaPN3Tgu7viejvu6ptu9uz53XWczrmh5LpXzWbZTuoe9P7al4
 5izv4yp0cTHx22iUix3bIqaNfPmpulWm9Mr8l74/fv4mGPt1WWrbA8rpC7h/ZZq/9lF2y3wscek
 7vny9Znrd5j+6RW4veBHvrnxks0mSzm9f1zyMvOWvtcPAA==
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prepare dropping the alias "dev" for struct drm_crtc::drm_dev. "drm_dev"
is the better name as "dev" is usually a struct device pointer.

No semantic changes.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpu/drm/drm_atomic.c              | 22 ++++++-------
 drivers/gpu/drm/drm_atomic_helper.c       | 20 +++++++-----
 drivers/gpu/drm/drm_atomic_state_helper.c |  2 +-
 drivers/gpu/drm/drm_atomic_uapi.c         | 22 ++++++-------
 drivers/gpu/drm/drm_blend.c               |  2 +-
 drivers/gpu/drm/drm_color_mgmt.c          | 10 +++---
 drivers/gpu/drm/drm_crtc.c                | 19 ++++++-----
 drivers/gpu/drm/drm_crtc_helper.c         | 10 +++---
 drivers/gpu/drm/drm_debugfs.c             |  2 +-
 drivers/gpu/drm/drm_debugfs_crc.c         |  2 +-
 drivers/gpu/drm/drm_fb_helper.c           |  6 ++--
 drivers/gpu/drm/drm_mipi_dbi.c            |  4 +--
 drivers/gpu/drm/drm_plane.c               |  2 +-
 drivers/gpu/drm/drm_plane_helper.c        |  2 +-
 drivers/gpu/drm/drm_self_refresh_helper.c |  2 +-
 drivers/gpu/drm/drm_vblank.c              | 40 +++++++++++------------
 drivers/gpu/drm/drm_vblank_work.c         |  2 +-
 include/drm/drm_atomic_helper.h           |  2 +-
 18 files changed, 87 insertions(+), 84 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 2c454568a607..b607bcfdb616 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -76,7 +76,7 @@ int drm_crtc_commit_wait(struct drm_crtc_commit *commit)
 
 	ret = wait_for_completion_timeout(&commit->hw_done, timeout);
 	if (!ret) {
-		drm_err(commit->crtc->dev, "hw_done timed out\n");
+		drm_err(commit->crtc->drm_dev, "hw_done timed out\n");
 		return -ETIMEDOUT;
 	}
 
@@ -86,7 +86,7 @@ int drm_crtc_commit_wait(struct drm_crtc_commit *commit)
 	 */
 	ret = wait_for_completion_timeout(&commit->flip_done, timeout);
 	if (!ret) {
-		drm_err(commit->crtc->dev, "flip_done timed out\n");
+		drm_err(commit->crtc->drm_dev, "flip_done timed out\n");
 		return -ETIMEDOUT;
 	}
 
@@ -381,7 +381,7 @@ static int drm_atomic_crtc_check(const struct drm_crtc_state *old_crtc_state,
 	 */
 
 	if (new_crtc_state->active && !new_crtc_state->enable) {
-		drm_dbg_atomic(crtc->dev,
+		drm_dbg_atomic(crtc->drm_dev,
 			       "[CRTC:%d:%s] active without enabled\n",
 			       crtc->base.id, crtc->name);
 		return -EINVAL;
@@ -391,17 +391,17 @@ static int drm_atomic_crtc_check(const struct drm_crtc_state *old_crtc_state,
 	 * as this is a kernel-internal detail that userspace should never
 	 * be able to trigger.
 	 */
-	if (drm_core_check_feature(crtc->dev, DRIVER_ATOMIC) &&
+	if (drm_core_check_feature(crtc->drm_dev, DRIVER_ATOMIC) &&
 	    WARN_ON(new_crtc_state->enable && !new_crtc_state->mode_blob)) {
-		drm_dbg_atomic(crtc->dev,
+		drm_dbg_atomic(crtc->drm_dev,
 			       "[CRTC:%d:%s] enabled without mode blob\n",
 			       crtc->base.id, crtc->name);
 		return -EINVAL;
 	}
 
-	if (drm_core_check_feature(crtc->dev, DRIVER_ATOMIC) &&
+	if (drm_core_check_feature(crtc->drm_dev, DRIVER_ATOMIC) &&
 	    WARN_ON(!new_crtc_state->enable && new_crtc_state->mode_blob)) {
-		drm_dbg_atomic(crtc->dev,
+		drm_dbg_atomic(crtc->drm_dev,
 			       "[CRTC:%d:%s] disabled with mode blob\n",
 			       crtc->base.id, crtc->name);
 		return -EINVAL;
@@ -419,7 +419,7 @@ static int drm_atomic_crtc_check(const struct drm_crtc_state *old_crtc_state,
 	 */
 	if (new_crtc_state->event &&
 	    !new_crtc_state->active && !old_crtc_state->active) {
-		drm_dbg_atomic(crtc->dev,
+		drm_dbg_atomic(crtc->drm_dev,
 			       "[CRTC:%d:%s] requesting event but off\n",
 			       crtc->base.id, crtc->name);
 		return -EINVAL;
@@ -1294,7 +1294,7 @@ drm_atomic_add_affected_connectors(struct drm_atomic_state *state,
 	if (ret)
 		return ret;
 
-	drm_dbg_atomic(crtc->dev,
+	drm_dbg_atomic(crtc->drm_dev,
 		       "Adding all current connectors for [CRTC:%d:%s] to %p\n",
 		       crtc->base.id, crtc->name, state);
 
@@ -1349,7 +1349,7 @@ drm_atomic_add_affected_planes(struct drm_atomic_state *state,
 
 	WARN_ON(!drm_atomic_get_new_crtc_state(state, crtc));
 
-	drm_dbg_atomic(crtc->dev,
+	drm_dbg_atomic(crtc->drm_dev,
 		       "Adding all current planes for [CRTC:%d:%s] to %p\n",
 		       crtc->base.id, crtc->name, state);
 
@@ -1561,7 +1561,7 @@ EXPORT_SYMBOL(__drm_atomic_helper_disable_plane);
 static int update_output_state(struct drm_atomic_state *state,
 			       struct drm_mode_set *set)
 {
-	struct drm_device *dev = set->crtc->dev;
+	struct drm_device *dev = set->crtc->drm_dev;
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *new_crtc_state;
 	struct drm_connector *connector;
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 41b8066f61ff..d6a375393b63 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -492,7 +492,8 @@ mode_fixup(struct drm_atomic_state *state)
 		ret = funcs->mode_fixup(crtc, &new_crtc_state->mode,
 					&new_crtc_state->adjusted_mode);
 		if (!ret) {
-			drm_dbg_atomic(crtc->dev, "[CRTC:%d:%s] fixup failed\n",
+			drm_dbg_atomic(crtc->drm_dev,
+				       "[CRTC:%d:%s] fixup failed\n",
 				       crtc->base.id, crtc->name);
 			return -EINVAL;
 		}
@@ -939,7 +940,7 @@ EXPORT_SYMBOL(drm_atomic_helper_check_plane_state);
 int drm_atomic_helper_check_crtc_primary_plane(struct drm_crtc_state *crtc_state)
 {
 	struct drm_crtc *crtc = crtc_state->crtc;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_plane *plane;
 
 	/* needs at least one primary plane to be enabled */
@@ -1013,7 +1014,7 @@ drm_atomic_helper_check_planes(struct drm_device *dev,
 
 		ret = funcs->atomic_check(crtc, state);
 		if (ret) {
-			drm_dbg_atomic(crtc->dev,
+			drm_dbg_atomic(crtc->drm_dev,
 				       "[CRTC:%d:%s] atomic driver check failed\n",
 				       crtc->base.id, crtc->name);
 			return ret;
@@ -2139,7 +2140,7 @@ static int stall_checks(struct drm_crtc *crtc, bool nonblock)
 			 */
 			if (!completed && nonblock) {
 				spin_unlock(&crtc->commit_lock);
-				drm_dbg_atomic(crtc->dev,
+				drm_dbg_atomic(crtc->drm_dev,
 					       "[CRTC:%d:%s] busy with a previous commit\n",
 					       crtc->base.id, crtc->name);
 
@@ -2163,7 +2164,8 @@ static int stall_checks(struct drm_crtc *crtc, bool nonblock)
 	ret = wait_for_completion_interruptible_timeout(&stall_commit->cleanup_done,
 							10*HZ);
 	if (ret == 0)
-		drm_err(crtc->dev, "[CRTC:%d:%s] cleanup_done timed out\n",
+		drm_err(crtc->drm_dev,
+			"[CRTC:%d:%s] cleanup_done timed out\n",
 			crtc->base.id, crtc->name);
 
 	drm_crtc_commit_put(stall_commit);
@@ -2398,7 +2400,7 @@ void drm_atomic_helper_wait_for_dependencies(struct drm_atomic_state *old_state)
 	for_each_old_crtc_in_state(old_state, crtc, old_crtc_state, i) {
 		ret = drm_crtc_commit_wait(old_crtc_state->commit);
 		if (ret)
-			drm_err(crtc->dev,
+			drm_err(crtc->drm_dev,
 				"[CRTC:%d:%s] commit wait timed out\n",
 				crtc->base.id, crtc->name);
 	}
@@ -2813,7 +2815,7 @@ drm_atomic_helper_commit_planes_on_crtc(struct drm_crtc_state *old_crtc_state)
 	if (crtc_funcs && crtc_funcs->atomic_begin)
 		crtc_funcs->atomic_begin(crtc, old_state);
 
-	drm_for_each_plane_mask(plane, crtc->dev, plane_mask) {
+	drm_for_each_plane_mask(plane, crtc->drm_dev, plane_mask) {
 		struct drm_plane_state *old_plane_state =
 			drm_atomic_get_old_plane_state(old_state, plane);
 		struct drm_plane_state *new_plane_state =
@@ -3218,7 +3220,7 @@ int drm_atomic_helper_set_config(struct drm_mode_set *set,
 	struct drm_crtc *crtc = set->crtc;
 	int ret = 0;
 
-	state = drm_atomic_state_alloc(crtc->dev);
+	state = drm_atomic_state_alloc(crtc->drm_dev);
 	if (!state)
 		return -ENOMEM;
 
@@ -3605,7 +3607,7 @@ static int page_flip_common(struct drm_atomic_state *state,
 	/* Make sure we don't accidentally do a full modeset. */
 	state->allow_modeset = false;
 	if (!crtc_state->active) {
-		drm_dbg_atomic(crtc->dev,
+		drm_dbg_atomic(crtc->drm_dev,
 			       "[CRTC:%d:%s] disabled, rejecting legacy flip\n",
 			       crtc->base.id, crtc->name);
 		return -EINVAL;
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 784e63d70a42..ec8eb6c959c9 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -96,7 +96,7 @@ __drm_atomic_helper_crtc_reset(struct drm_crtc *crtc,
 	if (crtc_state)
 		__drm_atomic_helper_crtc_state_reset(crtc_state, crtc);
 
-	if (drm_dev_has_vblank(crtc->dev))
+	if (drm_dev_has_vblank(crtc->drm_dev))
 		drm_crtc_vblank_reset(crtc);
 
 	crtc->state = crtc_state;
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index d867e7f9f2cd..61629369dd72 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -80,7 +80,7 @@ int drm_atomic_set_mode_for_crtc(struct drm_crtc_state *state,
 		struct drm_property_blob *blob;
 
 		drm_mode_convert_to_umode(&umode, mode);
-		blob = drm_property_create_blob(crtc->dev,
+		blob = drm_property_create_blob(crtc->drm_dev,
 						sizeof(umode), &umode);
 		if (IS_ERR(blob))
 			return PTR_ERR(blob);
@@ -89,13 +89,13 @@ int drm_atomic_set_mode_for_crtc(struct drm_crtc_state *state,
 
 		state->mode_blob = blob;
 		state->enable = true;
-		drm_dbg_atomic(crtc->dev,
+		drm_dbg_atomic(crtc->drm_dev,
 			       "Set [MODE:%s] for [CRTC:%d:%s] state %p\n",
 			       mode->name, crtc->base.id, crtc->name, state);
 	} else {
 		memset(&state->mode, 0, sizeof(state->mode));
 		state->enable = false;
-		drm_dbg_atomic(crtc->dev,
+		drm_dbg_atomic(crtc->drm_dev,
 			       "Set [NOMODE] for [CRTC:%d:%s] state %p\n",
 			       crtc->base.id, crtc->name, state);
 	}
@@ -134,17 +134,17 @@ int drm_atomic_set_mode_prop_for_crtc(struct drm_crtc_state *state,
 		int ret;
 
 		if (blob->length != sizeof(struct drm_mode_modeinfo)) {
-			drm_dbg_atomic(crtc->dev,
+			drm_dbg_atomic(crtc->drm_dev,
 				       "[CRTC:%d:%s] bad mode blob length: %zu\n",
 				       crtc->base.id, crtc->name,
 				       blob->length);
 			return -EINVAL;
 		}
 
-		ret = drm_mode_convert_umode(crtc->dev,
+		ret = drm_mode_convert_umode(crtc->drm_dev,
 					     &state->mode, blob->data);
 		if (ret) {
-			drm_dbg_atomic(crtc->dev,
+			drm_dbg_atomic(crtc->drm_dev,
 				       "[CRTC:%d:%s] invalid mode (ret=%d, status=%s):\n",
 				       crtc->base.id, crtc->name,
 				       ret, drm_get_mode_status_name(state->mode.status));
@@ -154,13 +154,13 @@ int drm_atomic_set_mode_prop_for_crtc(struct drm_crtc_state *state,
 
 		state->mode_blob = drm_property_blob_get(blob);
 		state->enable = true;
-		drm_dbg_atomic(crtc->dev,
+		drm_dbg_atomic(crtc->drm_dev,
 			       "Set [MODE:%s] for [CRTC:%d:%s] state %p\n",
 			       state->mode.name, crtc->base.id, crtc->name,
 			       state);
 	} else {
 		state->enable = false;
-		drm_dbg_atomic(crtc->dev,
+		drm_dbg_atomic(crtc->drm_dev,
 			       "Set [NOMODE] for [CRTC:%d:%s] state %p\n",
 			       crtc->base.id, crtc->name, state);
 	}
@@ -399,7 +399,7 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 		struct drm_crtc_state *state, struct drm_property *property,
 		uint64_t val)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_mode_config *config = &dev->mode_config;
 	bool replaced = false;
 	int ret;
@@ -453,7 +453,7 @@ static int drm_atomic_crtc_set_property(struct drm_crtc *crtc,
 	} else if (crtc->funcs->atomic_set_property) {
 		return crtc->funcs->atomic_set_property(crtc, state, property, val);
 	} else {
-		drm_dbg_atomic(crtc->dev,
+		drm_dbg_atomic(crtc->drm_dev,
 			       "[CRTC:%d:%s] unknown property [PROP:%d:%s]]\n",
 			       crtc->base.id, crtc->name,
 			       property->base.id, property->name);
@@ -468,7 +468,7 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
 		const struct drm_crtc_state *state,
 		struct drm_property *property, uint64_t *val)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_mode_config *config = &dev->mode_config;
 
 	if (property == config->prop_active)
diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 6e74de833466..5f7a0cb9eedd 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -443,7 +443,7 @@ static int drm_atomic_helper_crtc_normalize_zpos(struct drm_crtc *crtc,
 					  struct drm_crtc_state *crtc_state)
 {
 	struct drm_atomic_state *state = crtc_state->state;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	int total_planes = dev->mode_config.num_total_plane;
 	struct drm_plane_state **states;
 	struct drm_plane *plane;
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index d021497841b8..96c8f8fccd3b 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -166,7 +166,7 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
 				bool has_ctm,
 				uint gamma_lut_size)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_mode_config *config = &dev->mode_config;
 
 	if (degamma_lut_size) {
@@ -241,8 +241,8 @@ EXPORT_SYMBOL(drm_mode_crtc_set_gamma_size);
  */
 static bool drm_crtc_supports_legacy_gamma(struct drm_crtc *crtc)
 {
-	u32 gamma_id = crtc->dev->mode_config.gamma_lut_property->base.id;
-	u32 degamma_id = crtc->dev->mode_config.degamma_lut_property->base.id;
+	u32 gamma_id = crtc->drm_dev->mode_config.gamma_lut_property->base.id;
+	u32 degamma_id = crtc->drm_dev->mode_config.degamma_lut_property->base.id;
 
 	if (!crtc->gamma_size)
 		return false;
@@ -277,7 +277,7 @@ static int drm_crtc_legacy_gamma_set(struct drm_crtc *crtc,
 				     u32 size,
 				     struct drm_modeset_acquire_ctx *ctx)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_atomic_state *state;
 	struct drm_crtc_state *crtc_state;
 	struct drm_property_blob *blob;
@@ -298,7 +298,7 @@ static int drm_crtc_legacy_gamma_set(struct drm_crtc *crtc,
 	else
 		return -ENODEV;
 
-	state = drm_atomic_state_alloc(crtc->dev);
+	state = drm_atomic_state_alloc(crtc->drm_dev);
 	if (!state)
 		return -ENOMEM;
 
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index df9bf3c9206e..15839f2b0ddb 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -102,7 +102,7 @@ int drm_crtc_force_disable(struct drm_crtc *crtc)
 		.crtc = crtc,
 	};
 
-	WARN_ON(drm_drv_uses_atomic_modeset(crtc->dev));
+	WARN_ON(drm_drv_uses_atomic_modeset(crtc->drm_dev));
 
 	return drm_mode_set_config_internal(&set);
 }
@@ -178,7 +178,7 @@ static const char *drm_crtc_fence_get_driver_name(struct dma_fence *fence)
 {
 	struct drm_crtc *crtc = fence_to_crtc(fence);
 
-	return crtc->dev->driver->name;
+	return crtc->drm_dev->driver->name;
 }
 
 static const char *drm_crtc_fence_get_timeline_name(struct dma_fence *fence)
@@ -264,7 +264,7 @@ static int __drm_crtc_init_with_planes(struct drm_device *dev, struct drm_crtc *
 		(!funcs->atomic_destroy_state ||
 		 !funcs->atomic_duplicate_state));
 
-	crtc->dev = dev;
+	crtc->drm_dev = dev;
 	crtc->funcs = funcs;
 
 	INIT_LIST_HEAD(&crtc->commit_list);
@@ -495,7 +495,7 @@ EXPORT_SYMBOL(__drmm_crtc_alloc_with_planes);
  */
 void drm_crtc_cleanup(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 
 	/* Note that the crtc_list is considered to be static; should we
 	 * remove the drm_crtc at runtime we would have to decrement all
@@ -603,14 +603,14 @@ static int __drm_mode_set_config_internal(struct drm_mode_set *set,
 	struct drm_crtc *tmp;
 	int ret;
 
-	WARN_ON(drm_drv_uses_atomic_modeset(crtc->dev));
+	WARN_ON(drm_drv_uses_atomic_modeset(crtc->drm_dev));
 
 	/*
 	 * NOTE: ->set_config can also disable other crtcs (if we steal all
 	 * connectors from it), hence we need to refcount the fbs across all
 	 * crtcs. Atomic modeset will have saner semantics ...
 	 */
-	drm_for_each_crtc(tmp, crtc->dev) {
+	drm_for_each_crtc(tmp, crtc->drm_dev) {
 		struct drm_plane *plane = tmp->primary;
 
 		plane->old_fb = plane->fb;
@@ -626,7 +626,7 @@ static int __drm_mode_set_config_internal(struct drm_mode_set *set,
 		plane->fb = fb;
 	}
 
-	drm_for_each_crtc(tmp, crtc->dev) {
+	drm_for_each_crtc(tmp, crtc->drm_dev) {
 		struct drm_plane *plane = tmp->primary;
 
 		if (plane->fb)
@@ -654,7 +654,7 @@ static int __drm_mode_set_config_internal(struct drm_mode_set *set,
  */
 int drm_mode_set_config_internal(struct drm_mode_set *set)
 {
-	WARN_ON(drm_drv_uses_atomic_modeset(set->crtc->dev));
+	WARN_ON(drm_drv_uses_atomic_modeset(set->crtc->drm_dev));
 
 	return __drm_mode_set_config_internal(set, NULL);
 }
@@ -943,7 +943,8 @@ int drm_crtc_create_scaling_filter_property(struct drm_crtc *crtc,
 					    unsigned int supported_filters)
 {
 	struct drm_property *prop =
-		drm_create_scaling_filter_prop(crtc->dev, supported_filters);
+		drm_create_scaling_filter_prop(crtc->drm_dev,
+					       supported_filters);
 
 	if (IS_ERR(prop))
 		return PTR_ERR(prop);
diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index a209659a996c..e61742fd5866 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -148,7 +148,7 @@ EXPORT_SYMBOL(drm_helper_encoder_in_use);
 bool drm_helper_crtc_in_use(struct drm_crtc *crtc)
 {
 	struct drm_encoder *encoder;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 
 	WARN_ON(drm_drv_uses_atomic_modeset(dev));
 
@@ -285,7 +285,7 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc,
 			      int x, int y,
 			      struct drm_framebuffer *old_fb)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_display_mode *adjusted_mode, saved_mode, saved_hwmode;
 	const struct drm_crtc_helper_funcs *crtc_funcs = crtc->helper_private;
 	const struct drm_encoder_helper_funcs *encoder_funcs;
@@ -462,7 +462,7 @@ EXPORT_SYMBOL(drm_crtc_helper_atomic_check);
 static void
 drm_crtc_helper_disable(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_connector *connector;
 	struct drm_encoder *encoder;
 
@@ -579,7 +579,7 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 
 	crtc_funcs = set->crtc->helper_private;
 
-	dev = set->crtc->dev;
+	dev = set->crtc->drm_dev;
 	WARN_ON(drm_drv_uses_atomic_modeset(dev));
 
 	if (!set->mode)
@@ -869,7 +869,7 @@ static int drm_helper_choose_crtc_dpms(struct drm_crtc *crtc)
 	int dpms = DRM_MODE_DPMS_OFF;
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 
 	drm_connector_list_iter_begin(dev, &conn_iter);
 	drm_for_each_connector_iter(connector, &conn_iter)
diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 4855230ba2c6..b7172681b36e 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -539,7 +539,7 @@ void drm_debugfs_connector_remove(struct drm_connector *connector)
 
 void drm_debugfs_crtc_add(struct drm_crtc *crtc)
 {
-	struct drm_minor *minor = crtc->dev->primary;
+	struct drm_minor *minor = crtc->drm_dev->primary;
 	struct dentry *root;
 	char *name;
 
diff --git a/drivers/gpu/drm/drm_debugfs_crc.c b/drivers/gpu/drm/drm_debugfs_crc.c
index bbc3bc4ba844..736cb71de6f3 100644
--- a/drivers/gpu/drm/drm_debugfs_crc.c
+++ b/drivers/gpu/drm/drm_debugfs_crc.c
@@ -200,7 +200,7 @@ static int crtc_crc_open(struct inode *inode, struct file *filep)
 	size_t values_cnt;
 	int ret = 0;
 
-	if (drm_drv_uses_atomic_modeset(crtc->dev)) {
+	if (drm_drv_uses_atomic_modeset(crtc->drm_dev)) {
 		ret = drm_modeset_lock_single_interruptible(&crtc->mutex);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_helper.c
index 61a5d450cc20..5035554488f2 100644
--- a/drivers/gpu/drm/drm_fb_helper.c
+++ b/drivers/gpu/drm/drm_fb_helper.c
@@ -166,7 +166,7 @@ int drm_fb_helper_debug_enter(struct fb_info *info)
 			if (funcs->mode_set_base_atomic == NULL)
 				continue;
 
-			if (drm_drv_uses_atomic_modeset(mode_set->crtc->dev))
+			if (drm_drv_uses_atomic_modeset(mode_set->crtc->drm_dev))
 				continue;
 
 			funcs->mode_set_base_atomic(mode_set->crtc,
@@ -199,7 +199,7 @@ int drm_fb_helper_debug_leave(struct fb_info *info)
 	mutex_lock(&client->modeset_mutex);
 	drm_client_for_each_modeset(mode_set, client) {
 		crtc = mode_set->crtc;
-		if (drm_drv_uses_atomic_modeset(crtc->dev))
+		if (drm_drv_uses_atomic_modeset(crtc->drm_dev))
 			continue;
 
 		funcs = crtc->helper_private;
@@ -873,7 +873,7 @@ static int setcmap_legacy(struct fb_cmap *cmap, struct fb_info *info)
 static struct drm_property_blob *setcmap_new_gamma_lut(struct drm_crtc *crtc,
 						       struct fb_cmap *cmap)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_property_blob *gamma_lut;
 	struct drm_color_lut *lut;
 	int size = crtc->gamma_size;
diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index c871d9f096b8..2075b968fa74 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -299,7 +299,7 @@ static void mipi_dbi_fb_dirty(struct iosys_map *src, struct drm_framebuffer *fb,
 enum drm_mode_status mipi_dbi_pipe_mode_valid(struct drm_simple_display_pipe *pipe,
 					      const struct drm_display_mode *mode)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.drm_dev);
 
 	return drm_crtc_helper_mode_valid_fixed(&pipe->crtc, mode, &dbidev->mode);
 }
@@ -406,7 +406,7 @@ static void mipi_dbi_blank(struct mipi_dbi_dev *dbidev)
  */
 void mipi_dbi_pipe_disable(struct drm_simple_display_pipe *pipe)
 {
-	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.drm_dev);
 
 	DRM_DEBUG_KMS("\n");
 
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 24e7998d1731..0d82e270054b 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1021,7 +1021,7 @@ static int drm_mode_cursor_universal(struct drm_crtc *crtc,
 				     struct drm_file *file_priv,
 				     struct drm_modeset_acquire_ctx *ctx)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_plane *plane = crtc->cursor;
 	struct drm_framebuffer *fb = NULL;
 	struct drm_mode_fb_cmd2 fbreq = {
diff --git a/drivers/gpu/drm/drm_plane_helper.c b/drivers/gpu/drm/drm_plane_helper.c
index c91e454eba09..e0ce40313982 100644
--- a/drivers/gpu/drm/drm_plane_helper.c
+++ b/drivers/gpu/drm/drm_plane_helper.c
@@ -73,7 +73,7 @@ static int get_connectors_for_crtc(struct drm_crtc *crtc,
 				   struct drm_connector **connector_list,
 				   int num_connectors)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
 	int count = 0;
diff --git a/drivers/gpu/drm/drm_self_refresh_helper.c b/drivers/gpu/drm/drm_self_refresh_helper.c
index dd33fec5aabd..8331e7e6329d 100644
--- a/drivers/gpu/drm/drm_self_refresh_helper.c
+++ b/drivers/gpu/drm/drm_self_refresh_helper.c
@@ -70,7 +70,7 @@ static void drm_self_refresh_helper_entry_work(struct work_struct *work)
 				to_delayed_work(work),
 				struct drm_self_refresh_data, entry_work);
 	struct drm_crtc *crtc = sr_data->crtc;
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	struct drm_modeset_acquire_ctx ctx;
 	struct drm_atomic_state *state;
 	struct drm_connector *conn;
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 877e2067534f..c6ed79b9cd5f 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -402,7 +402,7 @@ u64 drm_vblank_count(struct drm_device *dev, unsigned int pipe)
  */
 u64 drm_crtc_accurate_vblank_count(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned int pipe = drm_crtc_index(crtc);
 	u64 vblank;
 	unsigned long flags;
@@ -589,7 +589,7 @@ EXPORT_SYMBOL(drm_dev_has_vblank);
  */
 wait_queue_head_t *drm_crtc_vblank_waitqueue(struct drm_crtc *crtc)
 {
-	return &crtc->dev->vblank[drm_crtc_index(crtc)].queue;
+	return &crtc->drm_dev->vblank[drm_crtc_index(crtc)].queue;
 }
 EXPORT_SYMBOL(drm_crtc_vblank_waitqueue);
 
@@ -608,7 +608,7 @@ EXPORT_SYMBOL(drm_crtc_vblank_waitqueue);
 void drm_calc_timestamping_constants(struct drm_crtc *crtc,
 				     const struct drm_display_mode *mode)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned int pipe = drm_crtc_index(crtc);
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 	int linedur_ns = 0, framedur_ns = 0;
@@ -693,7 +693,7 @@ drm_crtc_vblank_helper_get_vblank_timestamp_internal(
 	bool in_vblank_irq,
 	drm_vblank_get_scanout_position_func get_scanout_position)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned int pipe = crtc->index;
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 	struct timespec64 ts_etime, ts_vblank_time;
@@ -919,7 +919,7 @@ drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
  */
 u64 drm_crtc_vblank_count(struct drm_crtc *crtc)
 {
-	return drm_vblank_count(crtc->dev, drm_crtc_index(crtc));
+	return drm_vblank_count(crtc->drm_dev, drm_crtc_index(crtc));
 }
 EXPORT_SYMBOL(drm_crtc_vblank_count);
 
@@ -980,7 +980,7 @@ static u64 drm_vblank_count_and_time(struct drm_device *dev, unsigned int pipe,
 u64 drm_crtc_vblank_count_and_time(struct drm_crtc *crtc,
 				   ktime_t *vblanktime)
 {
-	return drm_vblank_count_and_time(crtc->dev, drm_crtc_index(crtc),
+	return drm_vblank_count_and_time(crtc->drm_dev, drm_crtc_index(crtc),
 					 vblanktime);
 }
 EXPORT_SYMBOL(drm_crtc_vblank_count_and_time);
@@ -1000,10 +1000,10 @@ int drm_crtc_next_vblank_start(struct drm_crtc *crtc, ktime_t *vblanktime)
 	struct drm_display_mode *mode;
 	u64 vblank_start;
 
-	if (!drm_dev_has_vblank(crtc->dev))
+	if (!drm_dev_has_vblank(crtc->drm_dev))
 		return -EINVAL;
 
-	vblank = &crtc->dev->vblank[pipe];
+	vblank = &crtc->drm_dev->vblank[pipe];
 	mode = &vblank->hwmode;
 
 	if (!vblank->framedur_ns || !vblank->linedur_ns)
@@ -1098,7 +1098,7 @@ static void send_vblank_event(struct drm_device *dev,
 void drm_crtc_arm_vblank_event(struct drm_crtc *crtc,
 			       struct drm_pending_vblank_event *e)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned int pipe = drm_crtc_index(crtc);
 
 	assert_spin_locked(&dev->event_lock);
@@ -1123,7 +1123,7 @@ EXPORT_SYMBOL(drm_crtc_arm_vblank_event);
 void drm_crtc_send_vblank_event(struct drm_crtc *crtc,
 				struct drm_pending_vblank_event *e)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	u64 seq;
 	unsigned int pipe = drm_crtc_index(crtc);
 	ktime_t now;
@@ -1237,7 +1237,7 @@ int drm_vblank_get(struct drm_device *dev, unsigned int pipe)
  */
 int drm_crtc_vblank_get(struct drm_crtc *crtc)
 {
-	return drm_vblank_get(crtc->dev, drm_crtc_index(crtc));
+	return drm_vblank_get(crtc->drm_dev, drm_crtc_index(crtc));
 }
 EXPORT_SYMBOL(drm_crtc_vblank_get);
 
@@ -1272,7 +1272,7 @@ void drm_vblank_put(struct drm_device *dev, unsigned int pipe)
  */
 void drm_crtc_vblank_put(struct drm_crtc *crtc)
 {
-	drm_vblank_put(crtc->dev, drm_crtc_index(crtc));
+	drm_vblank_put(crtc->drm_dev, drm_crtc_index(crtc));
 }
 EXPORT_SYMBOL(drm_crtc_vblank_put);
 
@@ -1323,7 +1323,7 @@ EXPORT_SYMBOL(drm_wait_one_vblank);
  */
 void drm_crtc_wait_one_vblank(struct drm_crtc *crtc)
 {
-	drm_wait_one_vblank(crtc->dev, drm_crtc_index(crtc));
+	drm_wait_one_vblank(crtc->drm_dev, drm_crtc_index(crtc));
 }
 EXPORT_SYMBOL(drm_crtc_wait_one_vblank);
 
@@ -1340,7 +1340,7 @@ EXPORT_SYMBOL(drm_crtc_wait_one_vblank);
  */
 void drm_crtc_vblank_off(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned int pipe = drm_crtc_index(crtc);
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 	struct drm_pending_vblank_event *e, *t;
@@ -1419,7 +1419,7 @@ EXPORT_SYMBOL(drm_crtc_vblank_off);
  */
 void drm_crtc_vblank_reset(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned int pipe = drm_crtc_index(crtc);
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 
@@ -1459,7 +1459,7 @@ EXPORT_SYMBOL(drm_crtc_vblank_reset);
 void drm_crtc_set_max_vblank_count(struct drm_crtc *crtc,
 				   u32 max_vblank_count)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned int pipe = drm_crtc_index(crtc);
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 
@@ -1482,7 +1482,7 @@ EXPORT_SYMBOL(drm_crtc_set_max_vblank_count);
  */
 void drm_crtc_vblank_on(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
+	struct drm_device *dev = crtc->drm_dev;
 	unsigned int pipe = drm_crtc_index(crtc);
 	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
 
@@ -1568,9 +1568,9 @@ static void drm_vblank_restore(struct drm_device *dev, unsigned int pipe)
 void drm_crtc_vblank_restore(struct drm_crtc *crtc)
 {
 	WARN_ON_ONCE(!crtc->funcs->get_vblank_timestamp);
-	WARN_ON_ONCE(!crtc->dev->vblank_disable_immediate);
+	WARN_ON_ONCE(!crtc->drm_dev->vblank_disable_immediate);
 
-	drm_vblank_restore(crtc->dev, drm_crtc_index(crtc));
+	drm_vblank_restore(crtc->drm_dev, drm_crtc_index(crtc));
 }
 EXPORT_SYMBOL(drm_crtc_vblank_restore);
 
@@ -2047,7 +2047,7 @@ EXPORT_SYMBOL(drm_handle_vblank);
  */
 bool drm_crtc_handle_vblank(struct drm_crtc *crtc)
 {
-	return drm_handle_vblank(crtc->dev, drm_crtc_index(crtc));
+	return drm_handle_vblank(crtc->drm_dev, drm_crtc_index(crtc));
 }
 EXPORT_SYMBOL(drm_crtc_handle_vblank);
 
diff --git a/drivers/gpu/drm/drm_vblank_work.c b/drivers/gpu/drm/drm_vblank_work.c
index bd481fdd6b87..0a483c36f9d3 100644
--- a/drivers/gpu/drm/drm_vblank_work.c
+++ b/drivers/gpu/drm/drm_vblank_work.c
@@ -242,7 +242,7 @@ void drm_vblank_work_init(struct drm_vblank_work *work, struct drm_crtc *crtc,
 {
 	kthread_init_work(&work->base, func);
 	INIT_LIST_HEAD(&work->node);
-	work->vblank = &crtc->dev->vblank[drm_crtc_index(crtc)];
+	work->vblank = &crtc->drm_dev->vblank[drm_crtc_index(crtc)];
 }
 EXPORT_SYMBOL(drm_vblank_work_init);
 
diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_helper.h
index 536a0b0091c3..1a9427d24fe2 100644
--- a/include/drm/drm_atomic_helper.h
+++ b/include/drm/drm_atomic_helper.h
@@ -173,7 +173,7 @@ int drm_atomic_helper_page_flip_target(
  * drm_atomic_crtc_state_for_each_plane().
  */
 #define drm_atomic_crtc_for_each_plane(plane, crtc) \
-	drm_for_each_plane_mask(plane, (crtc)->dev, (crtc)->state->plane_mask)
+	drm_for_each_plane_mask(plane, (crtc)->drm_dev, (crtc)->state->plane_mask)
 
 /**
  * drm_atomic_crtc_state_for_each_plane - iterate over attached planes in new state
-- 
2.39.2

