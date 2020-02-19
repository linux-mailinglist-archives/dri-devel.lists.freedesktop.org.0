Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 449D2164C55
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 18:43:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 971B26EC5C;
	Wed, 19 Feb 2020 17:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047D86EC59
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 17:43:14 +0000 (UTC)
Received: by mail-io1-xd44.google.com with SMTP id d15so1507156iog.3
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Feb 2020 09:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mrXEj2PJlu+l+Mv8TBp0HHGrRMadtJAnNxexO0DUVkQ=;
 b=DXFOIbw8AOp+RLHzW2iEmJc5no7yLEskToWfJkoBPA7KtvH/UqUbu6FWbN7Nm7GM14
 8x8FYnt9NHII+BBNNHviKpn9WHCpIXMRFIQvf698bdnECiTeUsJ5MHwesnqKL4L16dBm
 ZLmQosXDSkcKkSCAjoqyfwFuhqTSBJy/XlMug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mrXEj2PJlu+l+Mv8TBp0HHGrRMadtJAnNxexO0DUVkQ=;
 b=kvI6V2boGnbXkq9eTAKZpgWFBkL+gi6rf5sq3JGmt6qb38Xe9ntlJQ6ivF/zkYsCQX
 ERhrnUmXcmF3m1AqUSfwlIBnCDLENS3GeLJlEZxMn2aQ9z0ZJ9Hn0lWXDzj8R8oLMNsd
 LvxsYOEqPGp/BexVkrrGFA6P8iDueO8pi2fiCHDl/5CE5rnD4cxOGKhvpHPCea2txvSG
 3fO8wfKJpI135MgIXZPQ725bMHNcmIa39r19rnrJr/OspHYTtfu5SKeW1GuOCWIOm8Ub
 UT2pW+c2eCYjdpkiDTf5lACq7nqso35b+gfCU7BzSCe7z2qrUZUn6/SXXGClQICyrsFz
 EXRg==
X-Gm-Message-State: APjAAAWPLBByeZDjKiOZj9OWBnVIEvmVz2sdp/Yp3BlOBssv/EYd0ZKi
 dsGogW4m01VXblP6rN4XIWAP/e4NcTk=
X-Google-Smtp-Source: APXvYqwDV5cpXJAFaWfwW5wKVw9A/fLU/gk0gZceL+S5v8n/JjtdysekiBtB9B4VT04H/8uYmAkBUg==
X-Received: by 2002:a05:6602:2209:: with SMTP id
 n9mr6235488ion.62.1582134192441; 
 Wed, 19 Feb 2020 09:43:12 -0800 (PST)
Received: from ddavenport4.bld.corp.google.com
 ([2620:15c:183:0:92f:a80a:519d:f777])
 by smtp.gmail.com with ESMTPSA id a21sm60355ioh.29.2020.02.19.09.43.11
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 19 Feb 2020 09:43:11 -0800 (PST)
From: Drew Davenport <ddavenport@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/msm/dpu: Track resources in global state
Date: Wed, 19 Feb 2020 10:42:27 -0700
Message-Id: <20200219104148.4.I1c945b56a579b35955bea6c26e88086c6e91a17a@changeid>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200219104148.1.I0183a464f2788d41e6902f3535941f69c594b4c1@changeid>
References: <20200219104148.1.I0183a464f2788d41e6902f3535941f69c594b4c1@changeid>
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 Fritz Koenig <frkoenig@google.com>, linux-kernel@vger.kernel.org,
 Jani Nikula <jani.nikula@intel.com>, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-arm-msm@vger.kernel.org,
 Stephen Boyd <swboyd@chromium.org>, zhengbin <zhengbin13@huawei.com>,
 Alexios Zavras <alexios.zavras@intel.com>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Drew Davenport <ddavenport@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move mapping of resources to encoder ids from the resource manager to a
new dpu_global_state struct. Store this struct in global atomic state.

Before this patch, atomic test would be performed by modifying global
state (resource manager), and backing out any changes if the test fails.
By using drm atomic global state, this is not necessary as any changes
to the global state will be discarded if the test fails.

Signed-off-by: Drew Davenport <ddavenport@chromium.org>
---

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  65 +++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  84 ++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  26 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 121 ++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  22 ++--
 5 files changed, 207 insertions(+), 111 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 6cadeff456f09..5afde2e7fef08 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -164,7 +164,6 @@ enum dpu_enc_rc_states {
  *				clks and resources after IDLE_TIMEOUT time.
  * @vsync_event_work:		worker to handle vsync event for autorefresh
  * @topology:                   topology of the display
- * @mode_set_complete:          flag to indicate modeset completion
  * @idle_timeout:		idle timeout duration in milliseconds
  */
 struct dpu_encoder_virt {
@@ -202,7 +201,6 @@ struct dpu_encoder_virt {
 	struct delayed_work delayed_off_work;
 	struct kthread_work vsync_event_work;
 	struct msm_display_topology topology;
-	bool mode_set_complete;
 
 	u32 idle_timeout;
 };
@@ -563,6 +561,7 @@ static int dpu_encoder_virt_atomic_check(
 	const struct drm_display_mode *mode;
 	struct drm_display_mode *adj_mode;
 	struct msm_display_topology topology;
+	struct dpu_global_state *global_state;
 	int i = 0;
 	int ret = 0;
 
@@ -579,6 +578,7 @@ static int dpu_encoder_virt_atomic_check(
 	dpu_kms = to_dpu_kms(priv->kms);
 	mode = &crtc_state->mode;
 	adj_mode = &crtc_state->adjusted_mode;
+	global_state = dpu_kms_get_existing_global_state(dpu_kms);
 	trace_dpu_enc_atomic_check(DRMID(drm_enc));
 
 	/*
@@ -610,17 +610,15 @@ static int dpu_encoder_virt_atomic_check(
 
 	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
 
-	/* Reserve dynamic resources now. Indicating AtomicTest phase */
+	/* Reserve dynamic resources now. */
 	if (!ret) {
 		/*
 		 * Avoid reserving resources when mode set is pending. Topology
 		 * info may not be available to complete reservation.
 		 */
-		if (drm_atomic_crtc_needs_modeset(crtc_state)
-				&& dpu_enc->mode_set_complete) {
-			ret = dpu_rm_reserve(&dpu_kms->rm, drm_enc, crtc_state,
-					     topology, true);
-			dpu_enc->mode_set_complete = false;
+		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
+			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
+					drm_enc, crtc_state, topology);
 		}
 	}
 
@@ -957,12 +955,13 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 	struct drm_connector *conn = NULL, *conn_iter;
 	struct drm_crtc *drm_crtc;
 	struct dpu_crtc_state *cstate;
+	struct dpu_global_state *global_state;
 	struct msm_display_topology topology;
 	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
 	int num_lm, num_ctl, num_pp;
-	int i, j, ret;
+	int i, j;
 
 	if (!drm_enc) {
 		DPU_ERROR("invalid encoder\n");
@@ -976,6 +975,12 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 	dpu_kms = to_dpu_kms(priv->kms);
 	connector_list = &dpu_kms->dev->mode_config.connector_list;
 
+	global_state = dpu_kms_get_existing_global_state(dpu_kms);
+	if (IS_ERR_OR_NULL(global_state)) {
+		DPU_ERROR("Failed to get global state");
+		return;
+	}
+
 	trace_dpu_enc_mode_set(DRMID(drm_enc));
 
 	list_for_each_entry(conn_iter, connector_list, head)
@@ -996,21 +1001,14 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 
 	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode);
 
-	/* Reserve dynamic resources now. Indicating non-AtomicTest phase */
-	ret = dpu_rm_reserve(&dpu_kms->rm, drm_enc, drm_crtc->state,
-			     topology, false);
-	if (ret) {
-		DPU_ERROR_ENC(dpu_enc,
-				"failed to reserve hw resources, %d\n", ret);
-		return;
-	}
-
-	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, drm_enc->base.id,
-		DPU_HW_BLK_PINGPONG, hw_pp, ARRAY_SIZE(hw_pp));
-	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, drm_enc->base.id,
-		DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
-	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, drm_enc->base.id,
-		DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
+	/* Query resource that have been reserved in atomic check step. */
+	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+		drm_enc->base.id, DPU_HW_BLK_PINGPONG, hw_pp,
+		ARRAY_SIZE(hw_pp));
+	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+		drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
+	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+		drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
 
 	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
 		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
@@ -1035,21 +1033,21 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 		if (!dpu_enc->hw_pp[i]) {
 			DPU_ERROR_ENC(dpu_enc,
 				"no pp block assigned at idx: %d\n", i);
-			goto error;
+			return;
 		}
 
 		if (!hw_ctl[i]) {
 			DPU_ERROR_ENC(dpu_enc,
 				"no ctl block assigned at idx: %d\n", i);
-			goto error;
+			return;
 		}
 
 		phys->hw_pp = dpu_enc->hw_pp[i];
 		phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
 
 		num_blk = dpu_rm_get_assigned_resources(&dpu_kms->rm,
-			drm_enc->base.id, DPU_HW_BLK_INTF, hw_blk,
-			ARRAY_SIZE(hw_blk));
+			global_state, drm_enc->base.id, DPU_HW_BLK_INTF,
+			hw_blk, ARRAY_SIZE(hw_blk));
 		for (j = 0; j < num_blk; j++) {
 			struct dpu_hw_intf *hw_intf;
 
@@ -1061,18 +1059,13 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 		if (!phys->hw_intf) {
 			DPU_ERROR_ENC(dpu_enc,
 				      "no intf block assigned at idx: %d\n", i);
-				goto error;
+			return;
 		}
 
 		phys->connector = conn->state->connector;
 		if (phys->ops.mode_set)
 			phys->ops.mode_set(phys, mode, adj_mode);
 	}
-
-	dpu_enc->mode_set_complete = true;
-
-error:
-	dpu_rm_release(&dpu_kms->rm, drm_enc);
 }
 
 static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
@@ -1169,6 +1162,7 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	struct dpu_encoder_virt *dpu_enc = NULL;
 	struct msm_drm_private *priv;
 	struct dpu_kms *dpu_kms;
+	struct dpu_global_state *global_state;
 	int i = 0;
 
 	if (!drm_enc) {
@@ -1187,6 +1181,7 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 
 	priv = drm_enc->dev->dev_private;
 	dpu_kms = to_dpu_kms(priv->kms);
+	global_state = dpu_kms_get_existing_global_state(dpu_kms);
 
 	trace_dpu_enc_disable(DRMID(drm_enc));
 
@@ -1216,7 +1211,7 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 
 	DPU_DEBUG_ENC(dpu_enc, "encoder disabled\n");
 
-	dpu_rm_release(&dpu_kms->rm, drm_enc);
+	dpu_rm_release(global_state, drm_enc);
 
 	mutex_unlock(&dpu_enc->enc_lock);
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index cb08fafb1dc14..59d42ff9da645 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -228,6 +228,85 @@ static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 }
 #endif
 
+/* Global/shared object state funcs */
+
+/*
+ * This is a helper that returns the private state currently in operation.
+ * Note that this would return the "old_state" if called in the atomic check
+ * path, and the "new_state" after the atomic swap has been done.
+ */
+struct dpu_global_state *
+dpu_kms_get_existing_global_state(struct dpu_kms *dpu_kms)
+{
+	return to_dpu_global_state(dpu_kms->global_state.state);
+}
+
+/*
+ * This acquires the modeset lock set aside for global state, creates
+ * a new duplicated private object state.
+ */
+struct dpu_global_state *dpu_kms_get_global_state(struct drm_atomic_state *s)
+{
+	struct msm_drm_private *priv = s->dev->dev_private;
+	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
+	struct drm_private_state *priv_state;
+	int ret;
+
+	ret = drm_modeset_lock(&dpu_kms->global_state_lock, s->acquire_ctx);
+	if (ret)
+		return ERR_PTR(ret);
+
+	priv_state = drm_atomic_get_private_obj_state(s,
+						&dpu_kms->global_state);
+	if (IS_ERR(priv_state))
+		return ERR_CAST(priv_state);
+
+	return to_dpu_global_state(priv_state);
+}
+
+static struct drm_private_state *
+dpu_kms_global_duplicate_state(struct drm_private_obj *obj)
+{
+	struct dpu_global_state *state;
+
+	state = kmemdup(obj->state, sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return NULL;
+
+	__drm_atomic_helper_private_obj_duplicate_state(obj, &state->base);
+
+	return &state->base;
+}
+
+static void dpu_kms_global_destroy_state(struct drm_private_obj *obj,
+				      struct drm_private_state *state)
+{
+	struct dpu_global_state *dpu_state = to_dpu_global_state(state);
+
+	kfree(dpu_state);
+}
+
+static const struct drm_private_state_funcs dpu_kms_global_state_funcs = {
+	.atomic_duplicate_state = dpu_kms_global_duplicate_state,
+	.atomic_destroy_state = dpu_kms_global_destroy_state,
+};
+
+static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
+{
+	struct dpu_global_state *state;
+
+	drm_modeset_lock_init(&dpu_kms->global_state_lock);
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return -ENOMEM;
+
+	drm_atomic_private_obj_init(dpu_kms->dev, &dpu_kms->global_state,
+				    &state->base,
+				    &dpu_kms_global_state_funcs);
+	return 0;
+}
+
 static int dpu_kms_enable_vblank(struct msm_kms *kms, struct drm_crtc *crtc)
 {
 	return dpu_crtc_vblank(crtc, true);
@@ -770,6 +849,11 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 	dpu_kms = to_dpu_kms(kms);
 	dev = dpu_kms->dev;
+
+	rc = dpu_kms_global_obj_init(dpu_kms);
+	if (rc)
+		return rc;
+
 	priv = dev->dev_private;
 
 	atomic_set(&dpu_kms->bandwidth_ref, 0);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index c6169e7df19de..211f5de99a441 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -111,6 +111,13 @@ struct dpu_kms {
 
 	struct dpu_core_perf perf;
 
+	/*
+	 * Global private object state, Do not access directly, use
+	 * dpu_kms_global_get_state()
+	 */
+	struct drm_modeset_lock global_state_lock;
+	struct drm_private_obj global_state;
+
 	struct dpu_rm rm;
 	bool rm_init;
 
@@ -139,6 +146,25 @@ struct vsync_info {
 
 #define to_dpu_kms(x) container_of(x, struct dpu_kms, base)
 
+#define to_dpu_global_state(x) container_of(x, struct dpu_global_state, base)
+
+/* Global private object state for tracking resources that are shared across
+ * multiple kms objects (planes/crtcs/etc).
+ */
+struct dpu_global_state {
+	struct drm_private_state base;
+
+	uint32_t pingpong_to_enc_id[PINGPONG_MAX - PINGPONG_0];
+	uint32_t mixer_to_enc_id[LM_MAX - LM_0];
+	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
+	uint32_t intf_to_enc_id[INTF_MAX - INTF_0];
+};
+
+struct dpu_global_state
+	*dpu_kms_get_existing_global_state(struct dpu_kms *dpu_kms);
+struct dpu_global_state
+	*__must_check dpu_kms_get_global_state(struct drm_atomic_state *s);
+
 /**
  * Debugfs functions - extra helper functions for debugfs support
  *
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f1483b00b7423..bc940f9b12d7e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -66,8 +66,6 @@ int dpu_rm_destroy(struct dpu_rm *rm)
 		}
 	}
 
-	mutex_destroy(&rm->rm_lock);
-
 	return 0;
 }
 
@@ -85,8 +83,6 @@ int dpu_rm_init(struct dpu_rm *rm,
 	/* Clear, setup lists */
 	memset(rm, 0, sizeof(*rm));
 
-	mutex_init(&rm->rm_lock);
-
 	/* Interrogate HW catalog and create tracking items for hw blocks */
 	for (i = 0; i < cat->mixer_count; i++) {
 		struct dpu_hw_mixer *hw;
@@ -230,13 +226,14 @@ static bool _dpu_rm_check_lm_peer(struct dpu_rm *rm, int primary_idx,
  * @Return: true if lm matches all requirements, false otherwise
  */
 static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
+		struct dpu_global_state *global_state,
 		uint32_t enc_id, int lm_idx, int *pp_idx)
 {
 	const struct dpu_lm_cfg *lm_cfg;
 	int idx;
 
 	/* Already reserved? */
-	if (reserved_by_other(rm->mixer_to_enc_id, lm_idx, enc_id)) {
+	if (reserved_by_other(global_state->mixer_to_enc_id, lm_idx, enc_id)) {
 		DPU_DEBUG("lm %d already reserved\n", lm_idx + LM_0);
 		return false;
 	}
@@ -248,7 +245,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 		return false;
 	}
 
-	if (reserved_by_other(rm->pingpong_to_enc_id, idx, enc_id)) {
+	if (reserved_by_other(global_state->pingpong_to_enc_id, idx, enc_id)) {
 		DPU_DEBUG("lm %d pp %d already reserved\n", lm_cfg->id,
 				lm_cfg->pingpong);
 		return false;
@@ -257,7 +254,9 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 	return true;
 }
 
-static int _dpu_rm_reserve_lms(struct dpu_rm *rm, uint32_t enc_id,
+static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
+			       struct dpu_global_state *global_state,
+			       uint32_t enc_id,
 			       struct dpu_rm_requirements *reqs)
 
 {
@@ -279,8 +278,8 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm, uint32_t enc_id,
 		lm_count = 0;
 		lm_idx[lm_count] = i;
 
-		if (!_dpu_rm_check_lm_and_get_connected_blks(
-				rm, enc_id, i, &pp_idx[lm_count])) {
+		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,
+				enc_id, i, &pp_idx[lm_count])) {
 			continue;
 		}
 
@@ -298,8 +297,9 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm, uint32_t enc_id,
 				continue;
 			}
 
-			if (!_dpu_rm_check_lm_and_get_connected_blks(
-					rm, enc_id, j, &pp_idx[lm_count])) {
+			if (!_dpu_rm_check_lm_and_get_connected_blks(rm,
+					global_state, enc_id, j,
+					&pp_idx[lm_count])) {
 				continue;
 			}
 
@@ -314,8 +314,8 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm, uint32_t enc_id,
 	}
 
 	for (i = 0; i < lm_count; i++) {
-		rm->mixer_to_enc_id[lm_idx[i]] = enc_id;
-		rm->pingpong_to_enc_id[pp_idx[i]] = enc_id;
+		global_state->mixer_to_enc_id[lm_idx[i]] = enc_id;
+		global_state->pingpong_to_enc_id[pp_idx[i]] = enc_id;
 
 		trace_dpu_rm_reserve_lms(lm_idx[i] + LM_0, enc_id,
 					 pp_idx[i] + PINGPONG_0);
@@ -326,6 +326,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm, uint32_t enc_id,
 
 static int _dpu_rm_reserve_ctls(
 		struct dpu_rm *rm,
+		struct dpu_global_state *global_state,
 		uint32_t enc_id,
 		const struct msm_display_topology *top)
 {
@@ -345,7 +346,7 @@ static int _dpu_rm_reserve_ctls(
 
 		if (!rm->ctl_blks[j])
 			continue;
-		if (reserved_by_other(rm->ctl_to_enc_id, j, enc_id))
+		if (reserved_by_other(global_state->ctl_to_enc_id, j, enc_id))
 			continue;
 
 		ctl = to_dpu_hw_ctl(rm->ctl_blks[j]);
@@ -369,7 +370,7 @@ static int _dpu_rm_reserve_ctls(
 		return -ENAVAIL;
 
 	for (i = 0; i < ARRAY_SIZE(ctl_idx) && i < num_ctls; i++) {
-		rm->ctl_to_enc_id[ctl_idx[i]] = enc_id;
+		global_state->ctl_to_enc_id[ctl_idx[i]] = enc_id;
 		trace_dpu_rm_reserve_ctls(i + CTL_0, enc_id);
 	}
 
@@ -378,27 +379,34 @@ static int _dpu_rm_reserve_ctls(
 
 static int _dpu_rm_reserve_intf(
 		struct dpu_rm *rm,
+		struct dpu_global_state *global_state,
 		uint32_t enc_id,
 		uint32_t id)
 {
 	int idx = id - INTF_0;
 
+	if (idx < 0 || idx >= ARRAY_SIZE(rm->intf_blks)) {
+		DPU_ERROR("invalid intf id: %d", id);
+		return -EINVAL;
+	}
+
 	if (!rm->intf_blks[idx]) {
 		DPU_ERROR("couldn't find intf id %d\n", id);
 		return -EINVAL;
 	}
 
-	if (reserved_by_other(rm->intf_to_enc_id, idx, enc_id)) {
+	if (reserved_by_other(global_state->intf_to_enc_id, idx, enc_id)) {
 		DPU_ERROR("intf id %d already reserved\n", id);
 		return -ENAVAIL;
 	}
 
-	rm->intf_to_enc_id[idx] = enc_id;
+	global_state->intf_to_enc_id[idx] = enc_id;
 	return 0;
 }
 
 static int _dpu_rm_reserve_intf_related_hw(
 		struct dpu_rm *rm,
+		struct dpu_global_state *global_state,
 		uint32_t enc_id,
 		struct dpu_encoder_hw_resources *hw_res)
 {
@@ -409,7 +417,7 @@ static int _dpu_rm_reserve_intf_related_hw(
 		if (hw_res->intfs[i] == INTF_MODE_NONE)
 			continue;
 		id = i + INTF_0;
-		ret = _dpu_rm_reserve_intf(rm, enc_id, id);
+		ret = _dpu_rm_reserve_intf(rm, global_state, enc_id, id);
 		if (ret)
 			return ret;
 	}
@@ -419,24 +427,27 @@ static int _dpu_rm_reserve_intf_related_hw(
 
 static int _dpu_rm_make_reservation(
 		struct dpu_rm *rm,
+		struct dpu_global_state *global_state,
 		struct drm_encoder *enc,
 		struct dpu_rm_requirements *reqs)
 {
 	int ret;
 
-	ret = _dpu_rm_reserve_lms(rm, enc->base.id, reqs);
+	ret = _dpu_rm_reserve_lms(rm, global_state, enc->base.id, reqs);
 	if (ret) {
 		DPU_ERROR("unable to find appropriate mixers\n");
 		return ret;
 	}
 
-	ret = _dpu_rm_reserve_ctls(rm, enc->base.id, &reqs->topology);
+	ret = _dpu_rm_reserve_ctls(rm, global_state, enc->base.id,
+				&reqs->topology);
 	if (ret) {
 		DPU_ERROR("unable to find appropriate CTL\n");
 		return ret;
 	}
 
-	ret = _dpu_rm_reserve_intf_related_hw(rm, enc->base.id, &reqs->hw_res);
+	ret = _dpu_rm_reserve_intf_related_hw(rm, global_state, enc->base.id,
+				&reqs->hw_res);
 	if (ret)
 		return ret;
 
@@ -470,33 +481,25 @@ static void _dpu_rm_clear_mapping(uint32_t *res_mapping, int cnt,
 	}
 }
 
-static void _dpu_rm_release_reservation(struct dpu_rm *rm, uint32_t enc_id)
-{
-	_dpu_rm_clear_mapping(rm->pingpong_to_enc_id,
-		ARRAY_SIZE(rm->pingpong_to_enc_id), enc_id);
-	_dpu_rm_clear_mapping(rm->mixer_to_enc_id,
-		ARRAY_SIZE(rm->mixer_to_enc_id), enc_id);
-	_dpu_rm_clear_mapping(rm->ctl_to_enc_id,
-		ARRAY_SIZE(rm->ctl_to_enc_id), enc_id);
-	_dpu_rm_clear_mapping(rm->intf_to_enc_id,
-		ARRAY_SIZE(rm->intf_to_enc_id), enc_id);
-}
-
-void dpu_rm_release(struct dpu_rm *rm, struct drm_encoder *enc)
+void dpu_rm_release(struct dpu_global_state *global_state,
+		    struct drm_encoder *enc)
 {
-	mutex_lock(&rm->rm_lock);
-
-	_dpu_rm_release_reservation(rm, enc->base.id);
-
-	mutex_unlock(&rm->rm_lock);
+	_dpu_rm_clear_mapping(global_state->pingpong_to_enc_id,
+		ARRAY_SIZE(global_state->pingpong_to_enc_id), enc->base.id);
+	_dpu_rm_clear_mapping(global_state->mixer_to_enc_id,
+		ARRAY_SIZE(global_state->mixer_to_enc_id), enc->base.id);
+	_dpu_rm_clear_mapping(global_state->ctl_to_enc_id,
+		ARRAY_SIZE(global_state->ctl_to_enc_id), enc->base.id);
+	_dpu_rm_clear_mapping(global_state->intf_to_enc_id,
+		ARRAY_SIZE(global_state->intf_to_enc_id), enc->base.id);
 }
 
 int dpu_rm_reserve(
 		struct dpu_rm *rm,
+		struct dpu_global_state *global_state,
 		struct drm_encoder *enc,
 		struct drm_crtc_state *crtc_state,
-		struct msm_display_topology topology,
-		bool test_only)
+		struct msm_display_topology topology)
 {
 	struct dpu_rm_requirements reqs;
 	int ret;
@@ -505,35 +508,31 @@ int dpu_rm_reserve(
 	if (!drm_atomic_crtc_needs_modeset(crtc_state))
 		return 0;
 
-	DRM_DEBUG_KMS("reserving hw for enc %d crtc %d test_only %d\n",
-		      enc->base.id, crtc_state->crtc->base.id, test_only);
+	if (IS_ERR(global_state)) {
+		DPU_ERROR("failed to global state\n");
+		return PTR_ERR(global_state);
+	}
 
-	mutex_lock(&rm->rm_lock);
+	DRM_DEBUG_KMS("reserving hw for enc %d crtc %d\n",
+		      enc->base.id, crtc_state->crtc->base.id);
 
 	ret = _dpu_rm_populate_requirements(enc, &reqs, topology);
 	if (ret) {
 		DPU_ERROR("failed to populate hw requirements\n");
-		goto end;
+		return ret;
 	}
 
-	ret = _dpu_rm_make_reservation(rm, enc, &reqs);
-	if (ret) {
+	ret = _dpu_rm_make_reservation(rm, global_state, enc, &reqs);
+	if (ret)
 		DPU_ERROR("failed to reserve hw resources: %d\n", ret);
-		_dpu_rm_release_reservation(rm, enc->base.id);
-	} else if (test_only) {
-		 /* test_only: test the reservation and then undo */
-		DPU_DEBUG("test_only: discard test [enc: %d]\n",
-				enc->base.id);
-		_dpu_rm_release_reservation(rm, enc->base.id);
-	}
 
-end:
-	mutex_unlock(&rm->rm_lock);
+
 
 	return ret;
 }
 
-int dpu_rm_get_assigned_resources(struct dpu_rm *rm, uint32_t enc_id,
+int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
+	struct dpu_global_state *global_state, uint32_t enc_id,
 	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size)
 {
 	struct dpu_hw_blk **hw_blks;
@@ -543,22 +542,22 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm, uint32_t enc_id,
 	switch (type) {
 	case DPU_HW_BLK_PINGPONG:
 		hw_blks = rm->pingpong_blks;
-		hw_to_enc_id = rm->pingpong_to_enc_id;
+		hw_to_enc_id = global_state->pingpong_to_enc_id;
 		max_blks = ARRAY_SIZE(rm->pingpong_blks);
 		break;
 	case DPU_HW_BLK_LM:
 		hw_blks = rm->mixer_blks;
-		hw_to_enc_id = rm->mixer_to_enc_id;
+		hw_to_enc_id = global_state->mixer_to_enc_id;
 		max_blks = ARRAY_SIZE(rm->mixer_blks);
 		break;
 	case DPU_HW_BLK_CTL:
 		hw_blks = rm->ctl_blks;
-		hw_to_enc_id = rm->ctl_to_enc_id;
+		hw_to_enc_id = global_state->ctl_to_enc_id;
 		max_blks = ARRAY_SIZE(rm->ctl_blks);
 		break;
 	case DPU_HW_BLK_INTF:
 		hw_blks = rm->intf_blks;
-		hw_to_enc_id = rm->intf_to_enc_id;
+		hw_to_enc_id = global_state->intf_to_enc_id;
 		max_blks = ARRAY_SIZE(rm->intf_blks);
 		break;
 	default:
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 9c8a436ba6cc1..6d2b04f306f09 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -11,6 +11,7 @@
 #include "msm_kms.h"
 #include "dpu_hw_top.h"
 
+struct dpu_global_state;
 
 /**
  * struct dpu_rm - DPU dynamic hardware resource manager
@@ -18,10 +19,6 @@
  * @mixer_blks: array of layer mixer hardware resources
  * @ctl_blks: array of ctl hardware resources
  * @intf_blks: array of intf hardware resources
- * @pingpong_to_enc_id: mapping of pingpong hardware resources to an encoder ID
- * @mixer_to_enc_id: mapping of mixer hardware resources to an encoder ID
- * @ctl_to_enc_id: mapping of ctl hardware resources to an encoder ID
- * @intf_to_enc_id: mapping of intf hardware resources to an encoder ID
  * @lm_max_width: cached layer mixer maximum width
  * @rm_lock: resource manager mutex
  */
@@ -31,13 +28,7 @@ struct dpu_rm {
 	struct dpu_hw_blk *ctl_blks[CTL_MAX - CTL_0];
 	struct dpu_hw_blk *intf_blks[INTF_MAX - INTF_0];
 
-	uint32_t pingpong_to_enc_id[PINGPONG_MAX - PINGPONG_0];
-	uint32_t mixer_to_enc_id[LM_MAX - LM_0];
-	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
-	uint32_t intf_to_enc_id[INTF_MAX - INTF_0];
-
 	uint32_t lm_max_width;
-	struct mutex rm_lock;
 };
 
 /**
@@ -70,14 +61,13 @@ int dpu_rm_destroy(struct dpu_rm *rm);
  * @drm_enc: DRM Encoder handle
  * @crtc_state: Proposed Atomic DRM CRTC State handle
  * @topology: Pointer to topology info for the display
- * @test_only: Atomic-Test phase, discard results (unless property overrides)
  * @Return: 0 on Success otherwise -ERROR
  */
 int dpu_rm_reserve(struct dpu_rm *rm,
+		struct dpu_global_state *global_state,
 		struct drm_encoder *drm_enc,
 		struct drm_crtc_state *crtc_state,
-		struct msm_display_topology topology,
-		bool test_only);
+		struct msm_display_topology topology);
 
 /**
  * dpu_rm_reserve - Given the encoder for the display chain, release any
@@ -86,12 +76,14 @@ int dpu_rm_reserve(struct dpu_rm *rm,
  * @enc: DRM Encoder handle
  * @Return: 0 on Success otherwise -ERROR
  */
-void dpu_rm_release(struct dpu_rm *rm, struct drm_encoder *enc);
+void dpu_rm_release(struct dpu_global_state *global_state,
+		struct drm_encoder *enc);
 
 /**
  * Get hw resources of the given type that are assigned to this encoder.
  */
-int dpu_rm_get_assigned_resources(struct dpu_rm *rm, uint32_t enc_id,
+int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
+	struct dpu_global_state *global_state, uint32_t enc_id,
 	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size);
 #endif /* __DPU_RM_H__ */
 
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
