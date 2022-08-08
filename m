Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD5458D0C5
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 01:56:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4E612B7C4;
	Mon,  8 Aug 2022 23:54:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9D012B236
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 23:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660002886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Aq6NMglpEPRzovf1+XPjxFGABsgi/c4kt64B7sXljNA=;
 b=fmjWdnDV6d0NmDsDfOmrj21GH4DcBgGGQfN1HLHZbLCARiC7BdBOmJbPOalvwTTHly5LOa
 tFJAmgJiU3Pf2lxMpTEvj93To9BbcxTa2rL04zwW1f9E9Xb2fweLlS531yn2CQMy/HYH8R
 QVnSXwCRpTIusFCokkBMtrvvGsjto2g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-Ugq8Db6CMmC8mdjZlbYQmw-1; Mon, 08 Aug 2022 19:54:42 -0400
X-MC-Unique: Ugq8Db6CMmC8mdjZlbYQmw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3D3EB18A6523;
 Mon,  8 Aug 2022 23:54:40 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.17.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E60DDC15BA1;
 Mon,  8 Aug 2022 23:54:38 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [RFC v2 08/18] drm/display/dp_mst: Add nonblocking helpers for DP MST
Date: Mon,  8 Aug 2022 19:51:53 -0400
Message-Id: <20220808235203.123892-9-lyude@redhat.com>
In-Reply-To: <20220808235203.123892-1-lyude@redhat.com>
References: <20220808235203.123892-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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
Cc: Karol Herbst <kherbst@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Leo Li <sunpeng.li@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>, Luo Jiaxing <luojiaxing@huawei.com>,
 Sean Paul <seanpaul@chromium.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Paul <sean@poorly.run>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Jude Shih <shenshih@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Roman Li <roman.li@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Fernando Ramos <greenfoo@u92.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As Daniel Vetter pointed out, if we only use the atomic modesetting locks
with MST it's technically possible for a driver with non-blocking modesets
to race when it comes to MST displays - as we make the mistake of not doing
our own CRTC commit tracking in the topology_state object.

This could potentially cause problems if something like this happens:

* User starts non-blocking commit to disable CRTC-1 on MST topology 1
* User starts non-blocking commit to enable CRTC-2 on MST topology 1

There's no guarantee here that the commit for disabling CRTC-2 will only
occur after CRTC-1 has finished, since neither commit shares a CRTC - only
the private modesetting object for MST. Keep in mind this likely isn't a
problem for blocking modesets, only non-blocking.

So, begin fixing this by keeping track of which CRTCs on a topology have
changed by keeping track of which CRTCs we release or allocate timeslots
on. As well, add some helpers for:

* Setting up the drm_crtc_commit structs in the ->commit_setup hook
* Waiting for any CRTC dependencies from the previous topology state

v2:
* Use drm_dp_mst_atomic_setup_commit() directly - Jani

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  5 +-
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 93 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_display.c  |  6 ++
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  7 ++
 include/drm/display/drm_dp_mst_helper.h       | 15 +++
 5 files changed, 124 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 34f0d2f056bb..1739710003a4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2808,7 +2808,8 @@ static const struct drm_mode_config_funcs amdgpu_dm_mode_funcs = {
 };
 
 static struct drm_mode_config_helper_funcs amdgpu_dm_mode_config_helperfuncs = {
-	.atomic_commit_tail = amdgpu_dm_atomic_commit_tail
+	.atomic_commit_tail = amdgpu_dm_atomic_commit_tail,
+	.atomic_commit_setup = drm_dp_mst_atomic_setup_commit,
 };
 
 static void update_connector_ext_caps(struct amdgpu_dm_connector *aconnector)
@@ -7986,6 +7987,7 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 		DRM_ERROR("Waiting for fences timed out!");
 
 	drm_atomic_helper_update_legacy_modeset_state(dev, state);
+	drm_dp_mst_atomic_wait_for_dependencies(state);
 
 	dm_state = dm_atomic_get_new_state(state);
 	if (dm_state && dm_state->context) {
@@ -8384,7 +8386,6 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 		dc_release_state(dc_state_temp);
 }
 
-
 static int dm_force_atomic_commit(struct drm_connector *connector)
 {
 	int ret = 0;
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 1c054a5e2e77..d701e5b819b8 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4384,12 +4384,16 @@ int drm_dp_atomic_find_time_slots(struct drm_atomic_state *state,
 {
 	struct drm_dp_mst_topology_state *topology_state;
 	struct drm_dp_mst_atomic_payload *payload = NULL;
+	struct drm_connector_state *conn_state;
 	int prev_slots = 0, prev_bw = 0, req_slots;
 
 	topology_state = drm_atomic_get_mst_topology_state(state, mgr);
 	if (IS_ERR(topology_state))
 		return PTR_ERR(topology_state);
 
+	conn_state = drm_atomic_get_new_connector_state(state, port->connector);
+	topology_state->pending_crtc_mask |= drm_crtc_mask(conn_state->crtc);
+
 	/* Find the current allocation for this port, if any */
 	payload = drm_atomic_get_mst_payload_state(topology_state, port);
 	if (payload) {
@@ -4469,11 +4473,15 @@ int drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
 {
 	struct drm_dp_mst_topology_state *topology_state;
 	struct drm_dp_mst_atomic_payload *payload;
+	struct drm_connector_state *conn_state;
 
 	topology_state = drm_atomic_get_mst_topology_state(state, mgr);
 	if (IS_ERR(topology_state))
 		return PTR_ERR(topology_state);
 
+	conn_state = drm_atomic_get_old_connector_state(state, port->connector);
+	topology_state->pending_crtc_mask |= drm_crtc_mask(conn_state->crtc);
+
 	payload = drm_atomic_get_mst_payload_state(topology_state, port);
 	if (WARN_ON(!payload)) {
 		drm_err(mgr->dev, "No payload for [MST PORT:%p] found in mst state %p\n",
@@ -4492,6 +4500,83 @@ int drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
 }
 EXPORT_SYMBOL(drm_dp_atomic_release_time_slots);
 
+/**
+ * drm_dp_mst_atomic_setup_commit() - setup_commit hook for MST helpers
+ * @state: global atomic state
+ *
+ * This function saves all of the &drm_crtc_commit structs in an atomic state that touch any CRTCs
+ * currently assigned to an MST topology. Drivers must call this hook from their
+ * &drm_mode_config_helper_funcs.atomic_commit_setup hook.
+ *
+ * Returns:
+ * 0 if all CRTC commits were retrieved successfully, negative error code otherwise
+ */
+int drm_dp_mst_atomic_setup_commit(struct drm_atomic_state *state)
+{
+	struct drm_dp_mst_topology_mgr *mgr;
+	struct drm_dp_mst_topology_state *mst_state;
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *crtc_state;
+	int i, j, commit_idx, num_commit_deps;
+
+	for_each_new_mst_mgr_in_state(state, mgr, mst_state, i) {
+		if (!mst_state->pending_crtc_mask)
+			continue;
+
+		num_commit_deps = hweight32(mst_state->pending_crtc_mask);
+		mst_state->commit_deps = kmalloc_array(num_commit_deps,
+						       sizeof(*mst_state->commit_deps), GFP_KERNEL);
+		if (!mst_state->commit_deps)
+			return -ENOMEM;
+		mst_state->num_commit_deps = num_commit_deps;
+
+		commit_idx = 0;
+		for_each_new_crtc_in_state(state, crtc, crtc_state, j) {
+			if (mst_state->pending_crtc_mask & drm_crtc_mask(crtc)) {
+				mst_state->commit_deps[commit_idx++] =
+					drm_crtc_commit_get(crtc_state->commit);
+			}
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_dp_mst_atomic_setup_commit);
+
+/**
+ * drm_dp_mst_atomic_wait_for_dependencies() - Wait for all pending commits on MST topologies
+ * @state: global atomic state
+ *
+ * Goes through any MST topologies in this atomic state, and waits for any pending commits which
+ * touched CRTCs that were/are on an MST topology to be programmed to hardware and flipped to before
+ * returning. This is to prevent multiple non-blocking commits affecting an MST topology from racing
+ * with eachother by forcing them to be executed sequentially in situations where the only resources
+ * the modeset objects in these commits share are an MST topology.
+ *
+ * This function also prepares the new MST state for commit by performing some state preparation
+ * which can't be done until this point, such as reading back the final VC start slots (which are
+ * determined at commit-time) from the previous state.
+ *
+ * All MST drivers must call this function after calling drm_atomic_helper_wait_for_dependencies(),
+ * or whatever their equivalent of that is.
+ */
+void drm_dp_mst_atomic_wait_for_dependencies(struct drm_atomic_state *state)
+{
+	struct drm_dp_mst_topology_state *old_mst_state;
+	struct drm_dp_mst_topology_mgr *mgr;
+	int i, j, ret;
+
+	for_each_old_mst_mgr_in_state(state, mgr, old_mst_state, i) {
+		for (j = 0; j < old_mst_state->num_commit_deps; j++) {
+			ret = drm_crtc_commit_wait(old_mst_state->commit_deps[j]);
+			if (ret < 0)
+				drm_err(state->dev, "Failed to wait for %s: %d\n",
+					old_mst_state->commit_deps[j]->crtc->name, ret);
+		}
+	}
+}
+EXPORT_SYMBOL(drm_dp_mst_atomic_wait_for_dependencies);
+
 /**
  * drm_dp_mst_update_slots() - updates the slot info depending on the DP ecoding format
  * @mst_state: mst_state to update
@@ -5067,6 +5152,9 @@ drm_dp_mst_duplicate_state(struct drm_private_obj *obj)
 	__drm_atomic_helper_private_obj_duplicate_state(obj, &state->base);
 
 	INIT_LIST_HEAD(&state->payloads);
+	state->commit_deps = NULL;
+	state->num_commit_deps = 0;
+	state->pending_crtc_mask = 0;
 
 	list_for_each_entry(pos, &old_state->payloads, next) {
 		/* Prune leftover freed timeslot allocations */
@@ -5099,6 +5187,7 @@ static void drm_dp_mst_destroy_state(struct drm_private_obj *obj,
 	struct drm_dp_mst_topology_state *mst_state =
 		to_dp_mst_topology_state(state);
 	struct drm_dp_mst_atomic_payload *pos, *tmp;
+	int i;
 
 	list_for_each_entry_safe(pos, tmp, &mst_state->payloads, next) {
 		/* We only keep references to ports with non-zero VCPIs */
@@ -5107,6 +5196,10 @@ static void drm_dp_mst_destroy_state(struct drm_private_obj *obj,
 		kfree(pos);
 	}
 
+	for (i = 0; i < mst_state->num_commit_deps; i++)
+		drm_crtc_commit_put(mst_state->commit_deps[i]);
+
+	kfree(mst_state->commit_deps);
 	kfree(mst_state);
 }
 
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index f143adefdf38..87511ffeb809 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7530,6 +7530,7 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 	intel_atomic_commit_fence_wait(state);
 
 	drm_atomic_helper_wait_for_dependencies(&state->base);
+	drm_dp_mst_atomic_wait_for_dependencies(&state->base);
 
 	if (state->modeset)
 		wakeref = intel_display_power_get(dev_priv, POWER_DOMAIN_MODESET);
@@ -8598,6 +8599,10 @@ static int intel_initial_commit(struct drm_device *dev)
 	return ret;
 }
 
+static const struct drm_mode_config_helper_funcs intel_mode_config_funcs = {
+	.atomic_commit_setup = drm_dp_mst_atomic_setup_commit,
+};
+
 static void intel_mode_config_init(struct drm_i915_private *i915)
 {
 	struct drm_mode_config *mode_config = &i915->drm.mode_config;
@@ -8612,6 +8617,7 @@ static void intel_mode_config_init(struct drm_i915_private *i915)
 	mode_config->prefer_shadow = 1;
 
 	mode_config->funcs = &intel_mode_funcs;
+	mode_config->helper_private = &intel_mode_config_funcs;
 
 	mode_config->async_page_flip = HAS_ASYNC_FLIPS(i915);
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 1d54f2cd38b2..c55af5d78ea2 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2136,6 +2136,7 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 	nv50_crc_atomic_stop_reporting(state);
 	drm_atomic_helper_wait_for_fences(dev, state, false);
 	drm_atomic_helper_wait_for_dependencies(state);
+	drm_dp_mst_atomic_wait_for_dependencies(state);
 	drm_atomic_helper_update_legacy_modeset_state(dev, state);
 	drm_atomic_helper_calc_timestamping_constants(state);
 
@@ -2616,6 +2617,11 @@ nv50_disp_func = {
 	.atomic_state_free = nv50_disp_atomic_state_free,
 };
 
+static const struct drm_mode_config_helper_funcs
+nv50_disp_helper_func = {
+	.atomic_commit_setup = drm_dp_mst_atomic_setup_commit,
+};
+
 /******************************************************************************
  * Init
  *****************************************************************************/
@@ -2699,6 +2705,7 @@ nv50_display_create(struct drm_device *dev)
 	nouveau_display(dev)->fini = nv50_display_fini;
 	disp->disp = &nouveau_display(dev)->disp;
 	dev->mode_config.funcs = &nv50_disp_func;
+	dev->mode_config.helper_private = &nv50_disp_helper_func;
 	dev->mode_config.quirk_addfb_prefer_xbgr_30bpp = true;
 	dev->mode_config.normalize_zpos = true;
 
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index 3b155ad3eee4..0ef7d0e6cf0c 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -581,6 +581,19 @@ struct drm_dp_mst_topology_state {
 	/** @mgr: The topology manager */
 	struct drm_dp_mst_topology_mgr *mgr;
 
+	/**
+	 * @pending_crtc_mask: A bitmask of all CRTCs this topology state touches, drivers may
+	 * modify this to add additional dependencies if needed.
+	 */
+	u32 pending_crtc_mask;
+	/**
+	 * @commit_deps: A list of all CRTC commits affecting this topology, this field isn't
+	 * populated until drm_dp_mst_atomic_wait_for_dependencies() is called.
+	 */
+	struct drm_crtc_commit **commit_deps;
+	/** @num_commit_deps: The number of CRTC commits in @commit_deps */
+	size_t num_commit_deps;
+
 	/** @total_avail_slots: The total number of slots this topology can handle (63 or 64) */
 	u8 total_avail_slots;
 	/** @start_slot: The first usable time slot in this topology (1 or 0) */
@@ -890,6 +903,8 @@ int __must_check
 drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
 				 struct drm_dp_mst_topology_mgr *mgr,
 				 struct drm_dp_mst_port *port);
+void drm_dp_mst_atomic_wait_for_dependencies(struct drm_atomic_state *state);
+int __must_check drm_dp_mst_atomic_setup_commit(struct drm_atomic_state *state);
 int drm_dp_send_power_updown_phy(struct drm_dp_mst_topology_mgr *mgr,
 				 struct drm_dp_mst_port *port, bool power_up);
 int drm_dp_send_query_stream_enc_status(struct drm_dp_mst_topology_mgr *mgr,
-- 
2.37.1

