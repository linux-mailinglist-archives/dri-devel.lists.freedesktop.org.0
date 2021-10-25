Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7670243A6AF
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 00:38:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6039B6E270;
	Mon, 25 Oct 2021 22:38:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79EC06E250
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 22:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635201528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4J1AonQCB7/aY+/rh+NKkrPlHas0envKCkSFtgpA41M=;
 b=Uxdl8GyNPFj2Una9/ndpHpdtMpmI4sQ4h5Ghut/IS4As7KXhPX3fHeXxaxCbrAEqjT44r5
 sTao3UCpbEvJtABLL9Rkmh1L3OehN9Cxl1I7Qdskz/Qf/oGo4EKJKgV1fMGff4xhWt5jGW
 xMsxpaEdyqVzdzboAntfVKvslyGlm2M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-377-sr4H7PwePi6FC-nuJqLrWw-1; Mon, 25 Oct 2021 18:38:47 -0400
X-MC-Unique: sr4H7PwePi6FC-nuJqLrWw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5468A0CAC;
 Mon, 25 Oct 2021 22:38:42 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.9.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A5CA60BF1;
 Mon, 25 Oct 2021 22:38:37 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Mikita Lipski <mikita.lipski@amd.com>,
 Jude Shih <shenshih@amd.com>, Colin Ian King <colin.king@canonical.com>,
 "Leo (Hanghong) Ma" <hanghong.ma@amd.com>, Zhan Liu <zhan.liu@amd.com>,
 Roman Li <Roman.Li@amd.com>, Bing Guo <bing.guo@amd.com>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Nikola Cornij <nikola.cornij@amd.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 He Ying <heying24@huawei.com>, Sean Paul <seanpaul@chromium.org>,
 Karol Herbst <kherbst@redhat.com>,
 linux-kernel@vger.kernel.org (open list),
 intel-gfx@lists.freedesktop.org (open list:INTEL DRM DRIVERS (excluding
 Poulsbo, Moorestow...), 
 nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO
 GPUS)
Subject: [PATCH RESEND v5 2/4] drm: Update MST First Link Slot Information
 Based on Encoding Format
Date: Mon, 25 Oct 2021 18:38:22 -0400
Message-Id: <20211025223825.301703-3-lyude@redhat.com>
In-Reply-To: <20211025223825.301703-1-lyude@redhat.com>
References: <20211025223825.301703-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>

8b/10b encoding format requires to reserve the first slot for
recording metadata. Real data transmission starts from the second slot,
with a total of available 63 slots available.

In 128b/132b encoding format, metadata is transmitted separately
in LLCP packet before MTP. Real data transmission starts from
the first slot, with a total of 64 slots available.

v2:
* Move total/start slots to mst_state, and copy it to mst_mgr in
atomic_check

v3:
* Only keep the slot info on the mst_state
* add a start_slot parameter to the payload function, to facilitate non
  atomic drivers (this is a temporary workaround and should be removed when
  we are moving out the non atomic driver helpers)

v4:
*fixed typo and formatting

v5: (no functional changes)
* Fixed formatting in drm_dp_mst_update_slots()
* Reference mst_state instead of mst_state->mgr for debugging info

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
[v5 nitpicks]
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  2 +-
 drivers/gpu/drm/drm_dp_mst_topology.c         | 36 ++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  4 +--
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  2 +-
 drivers/gpu/drm/radeon/radeon_dp_mst.c        |  4 +--
 include/drm/drm_dp_mst_helper.h               |  5 ++-
 6 files changed, 42 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index ff0f91c93ba4..6169488e2011 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -251,7 +251,7 @@ bool dm_helpers_dp_mst_write_payload_allocation_table(
 	}
 
 	/* It's OK for this to fail */
-	drm_dp_update_payload_part1(mst_mgr);
+	drm_dp_update_payload_part1(mst_mgr, 1);
 
 	/* mst_mgr->->payloads are VC payload notify MST branch using DPCD or
 	 * AUX message. The sequence is slot 1-63 allocated sequence for each
diff --git a/drivers/gpu/drm/drm_dp_mst_topology.c b/drivers/gpu/drm/drm_dp_mst_topology.c
index 04ed34a7f71c..571da0c2f39f 100644
--- a/drivers/gpu/drm/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/drm_dp_mst_topology.c
@@ -3355,6 +3355,10 @@ static int drm_dp_destroy_payload_step2(struct drm_dp_mst_topology_mgr *mgr,
 /**
  * drm_dp_update_payload_part1() - Execute payload update part 1
  * @mgr: manager to use.
+ * @start_slot: this is the cur slot
+ *
+ * NOTE: start_slot is a temporary workaround for non-atomic drivers,
+ * this will be removed when non-atomic mst helpers are moved out of the helper
  *
  * This iterates over all proposed virtual channels, and tries to
  * allocate space in the link for them. For 0->slots transitions,
@@ -3365,12 +3369,12 @@ static int drm_dp_destroy_payload_step2(struct drm_dp_mst_topology_mgr *mgr,
  * after calling this the driver should generate ACT and payload
  * packets.
  */
-int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr)
+int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr, int start_slot)
 {
 	struct drm_dp_payload req_payload;
 	struct drm_dp_mst_port *port;
 	int i, j;
-	int cur_slots = 1;
+	int cur_slots = start_slot;
 	bool skip;
 
 	mutex_lock(&mgr->payload_lock);
@@ -4505,6 +4509,27 @@ int drm_dp_atomic_release_vcpi_slots(struct drm_atomic_state *state,
 }
 EXPORT_SYMBOL(drm_dp_atomic_release_vcpi_slots);
 
+/**
+ * drm_dp_mst_update_slots() - updates the slot info depending on the DP ecoding format
+ * @mst_state: mst_state to update
+ * @link_encoding_cap: the ecoding format on the link
+ */
+void drm_dp_mst_update_slots(struct drm_dp_mst_topology_state *mst_state, uint8_t link_encoding_cap)
+{
+	if (link_encoding_cap == DP_CAP_ANSI_128B132B) {
+		mst_state->total_avail_slots = 64;
+		mst_state->start_slot = 0;
+	} else {
+		mst_state->total_avail_slots = 63;
+		mst_state->start_slot = 1;
+	}
+
+	DRM_DEBUG_KMS("%s encoding format on mst_state 0x%p\n",
+		      (link_encoding_cap == DP_CAP_ANSI_128B132B) ? "128b/132b":"8b/10b",
+		      mst_state);
+}
+EXPORT_SYMBOL(drm_dp_mst_update_slots);
+
 /**
  * drm_dp_mst_allocate_vcpi() - Allocate a virtual channel
  * @mgr: manager for this port
@@ -5224,7 +5249,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct drm_dp_mst_topology_mgr *mgr,
 					 struct drm_dp_mst_topology_state *mst_state)
 {
 	struct drm_dp_vcpi_allocation *vcpi;
-	int avail_slots = 63, payload_count = 0;
+	int avail_slots = mst_state->total_avail_slots, payload_count = 0;
 
 	list_for_each_entry(vcpi, &mst_state->vcpis, next) {
 		/* Releasing VCPI is always OK-even if the port is gone */
@@ -5253,7 +5278,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct drm_dp_mst_topology_mgr *mgr,
 		}
 	}
 	drm_dbg_atomic(mgr->dev, "[MST MGR:%p] mst state %p VCPI avail=%d used=%d\n",
-		       mgr, mst_state, avail_slots, 63 - avail_slots);
+		       mgr, mst_state, avail_slots, mst_state->total_avail_slots - avail_slots);
 
 	return 0;
 }
@@ -5530,6 +5555,9 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 	if (mst_state == NULL)
 		return -ENOMEM;
 
+	mst_state->total_avail_slots = 63;
+	mst_state->start_slot = 1;
+
 	mst_state->mgr = mgr;
 	INIT_LIST_HEAD(&mst_state->vcpis);
 
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 16620172abf7..6007a79c3938 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -376,7 +376,7 @@ static void intel_mst_disable_dp(struct intel_atomic_state *state,
 
 	drm_dp_mst_reset_vcpi_slots(&intel_dp->mst_mgr, connector->port);
 
-	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr);
+	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr, 1);
 	if (ret) {
 		drm_dbg_kms(&i915->drm, "failed to update payload %d\n", ret);
 	}
@@ -516,7 +516,7 @@ static void intel_mst_pre_enable_dp(struct intel_atomic_state *state,
 
 	intel_dp->active_mst_links++;
 
-	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr);
+	ret = drm_dp_update_payload_part1(&intel_dp->mst_mgr, 1);
 
 	/*
 	 * Before Gen 12 this is not done as part of
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index d7b9f7f8c9e3..8e28403ea9b1 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1414,7 +1414,7 @@ nv50_mstm_prepare(struct nv50_mstm *mstm)
 	int ret;
 
 	NV_ATOMIC(drm, "%s: mstm prepare\n", mstm->outp->base.base.name);
-	ret = drm_dp_update_payload_part1(&mstm->mgr);
+	ret = drm_dp_update_payload_part1(&mstm->mgr, 1);
 
 	drm_for_each_encoder(encoder, mstm->outp->base.base.dev) {
 		if (encoder->encoder_type == DRM_MODE_ENCODER_DPMST) {
diff --git a/drivers/gpu/drm/radeon/radeon_dp_mst.c b/drivers/gpu/drm/radeon/radeon_dp_mst.c
index ec867fa880a4..751c2c075e09 100644
--- a/drivers/gpu/drm/radeon/radeon_dp_mst.c
+++ b/drivers/gpu/drm/radeon/radeon_dp_mst.c
@@ -423,7 +423,7 @@ radeon_mst_encoder_dpms(struct drm_encoder *encoder, int mode)
 		drm_dp_mst_allocate_vcpi(&radeon_connector->mst_port->mst_mgr,
 					 radeon_connector->port,
 					 mst_enc->pbn, slots);
-		drm_dp_update_payload_part1(&radeon_connector->mst_port->mst_mgr);
+		drm_dp_update_payload_part1(&radeon_connector->mst_port->mst_mgr, 1);
 
 		radeon_dp_mst_set_be_cntl(primary, mst_enc,
 					  radeon_connector->mst_port->hpd.hpd, true);
@@ -452,7 +452,7 @@ radeon_mst_encoder_dpms(struct drm_encoder *encoder, int mode)
 			return;
 
 		drm_dp_mst_reset_vcpi_slots(&radeon_connector->mst_port->mst_mgr, mst_enc->port);
-		drm_dp_update_payload_part1(&radeon_connector->mst_port->mst_mgr);
+		drm_dp_update_payload_part1(&radeon_connector->mst_port->mst_mgr, 1);
 
 		drm_dp_check_act_status(&radeon_connector->mst_port->mst_mgr);
 		/* and this can also fail */
diff --git a/include/drm/drm_dp_mst_helper.h b/include/drm/drm_dp_mst_helper.h
index ddb9231d0309..78044ac5b59b 100644
--- a/include/drm/drm_dp_mst_helper.h
+++ b/include/drm/drm_dp_mst_helper.h
@@ -554,6 +554,8 @@ struct drm_dp_mst_topology_state {
 	struct drm_private_state base;
 	struct list_head vcpis;
 	struct drm_dp_mst_topology_mgr *mgr;
+	u8 total_avail_slots;
+	u8 start_slot;
 };
 
 #define to_dp_mst_topology_mgr(x) container_of(x, struct drm_dp_mst_topology_mgr, base)
@@ -806,6 +808,7 @@ int drm_dp_mst_get_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, struct drm_dp
 
 void drm_dp_mst_reset_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr, struct drm_dp_mst_port *port);
 
+void drm_dp_mst_update_slots(struct drm_dp_mst_topology_state *mst_state, uint8_t link_encoding_cap);
 
 void drm_dp_mst_deallocate_vcpi(struct drm_dp_mst_topology_mgr *mgr,
 				struct drm_dp_mst_port *port);
@@ -815,7 +818,7 @@ int drm_dp_find_vcpi_slots(struct drm_dp_mst_topology_mgr *mgr,
 			   int pbn);
 
 
-int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr);
+int drm_dp_update_payload_part1(struct drm_dp_mst_topology_mgr *mgr, int start_slot);
 
 
 int drm_dp_update_payload_part2(struct drm_dp_mst_topology_mgr *mgr);
-- 
2.31.1

