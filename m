Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C6055411A7
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 21:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B1110E9D8;
	Tue,  7 Jun 2022 19:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF6D210E9E0
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 19:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654630798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dn1ww0KfMFOGUbZ1NH8nrMAwiHe2/j0lpu+3L3aq8vo=;
 b=hJqZnnTpdHxsooTpiPhkm5sSIRBRG9hEBkZ6DxdRhJhm0xbi7eH4DpnUT4jMyfxD1IpZYv
 HKhOMNQQVeMHJQ52gKIxiw/+6H4UxuHgbxhWGZP5peYxx3Ud3fyTTRb795ZYdgiw8O0qX5
 ZoH8O3mfchFyxrF9EBNjQZO32U/1H3I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-15-XAZTDBmQMQKyEJbWJei65A-1; Tue, 07 Jun 2022 15:39:47 -0400
X-MC-Unique: XAZTDBmQMQKyEJbWJei65A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B78A618A653E;
 Tue,  7 Jun 2022 19:36:29 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.9.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07BBE2BB8DE3;
 Tue,  7 Jun 2022 19:35:35 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [RESEND RFC 13/18] drm/display/dp_mst: Add helpers for serializing
 SST <-> MST transitions
Date: Tue,  7 Jun 2022 15:29:28 -0400
Message-Id: <20220607192933.1333228-14-lyude@redhat.com>
In-Reply-To: <20220607192933.1333228-1-lyude@redhat.com>
References: <20220607192933.1333228-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
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
Cc: Randy Dunlap <rdunlap@infradead.org>, Karol Herbst <kherbst@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 open list <linux-kernel@vger.kernel.org>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Javier Martinez Canillas <javierm@redhat.com>, Leo Li <sunpeng.li@amd.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Uma Shankar <uma.shankar@intel.com>,
 Ben Skeggs <bskeggs@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>,
 "open list:INTEL DRM DRIVERS" <intel-gfx@lists.freedesktop.org>,
 Luo Jiaxing <luojiaxing@huawei.com>, Sean Paul <seanpaul@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Jude Shih <shenshih@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Roman Li <Roman.Li@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Fernando Ramos <greenfoo@u92.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's another kind of situation where we could potentially race with
nonblocking modesets and MST, especially if we were to only use the locking
provided by atomic modesetting:

* Display 1 begins as enabled on DP-1 in SST mode
* Display 1 switches to MST mode, exposes one sink in MST mode
* Userspace does non-blocking modeset to disable the SST display
* Userspace does non-blocking modeset to enable the MST display with a
  different CRTC, but the SST display hasn't been fully taken down yet
* Execution order between the last two commits isn't guaranteed since they
  share no drm resources

We can fix this however, by ensuring that we always pull in the atomic
topology state whenever a connector capable of driving an MST display
performs its atomic check - and then tracking CRTC commits happening on the
SST connector in the MST topology state. So, let's add some simple helpers
for doing that and hook them up in various drivers.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  7 +++
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 59 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_dp.c       |  9 +++
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.h       |  2 +
 drivers/gpu/drm/nouveau/nouveau_connector.c   | 14 +++++
 include/drm/display/drm_dp_mst_helper.h       |  2 +
 7 files changed, 94 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index d9c7393ef151..ac8648e3c1c9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7177,10 +7177,17 @@ amdgpu_dm_connector_atomic_check(struct drm_connector *conn,
 		drm_atomic_get_old_connector_state(state, conn);
 	struct drm_crtc *crtc = new_con_state->crtc;
 	struct drm_crtc_state *new_crtc_state;
+	struct amdgpu_dm_connector *aconn = to_amdgpu_dm_connector(conn);
 	int ret;
 
 	trace_amdgpu_dm_connector_atomic_check(new_con_state);
 
+	if (conn->connector_type == DRM_MODE_CONNECTOR_DisplayPort) {
+		ret = drm_dp_mst_root_conn_atomic_check(new_con_state, &aconn->mst_mgr);
+		if (ret < 0)
+			return ret;
+	}
+
 	if (!crtc)
 		return 0;
 
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index c5edcf2a26c8..a775f9437868 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4608,6 +4608,65 @@ void drm_dp_mst_atomic_wait_for_dependencies(struct drm_atomic_state *state)
 }
 EXPORT_SYMBOL(drm_dp_mst_atomic_wait_for_dependencies);
 
+/**
+ * drm_dp_mst_root_conn_atomic_check() - Serialize CRTC commits on MST-capable connectors operating
+ * in SST mode
+ * @new_conn_state: The new connector state of the &drm_connector
+ * @mgr: The MST topology manager for the &drm_connector
+ *
+ * Since MST uses fake &drm_encoder structs, the generic atomic modesetting code isn't able to
+ * serialize non-blocking commits happening on the real DP connector of an MST topology switching
+ * into/away from MST mode - as the CRTC on the real DP connector and the CRTCs on the connector's
+ * MST topology will never share the same &drm_encoder.
+ *
+ * This function takes care of this serialization issue, by checking a root MST connector's atomic
+ * state to determine if it is about to have a modeset - and then pulling in the MST topology state
+ * if so, along with adding any relevant CRTCs to &drm_dp_mst_topology_state.pending_crtc_mask.
+ *
+ * Drivers implementing MST must call this function from the
+ * &drm_connector_helper_funcs.atomic_check hook of any physical DP &drm_connector capable of
+ * driving MST sinks.
+ *
+ * Returns:
+ * 0 on success, negative error code otherwise
+ */
+int drm_dp_mst_root_conn_atomic_check(struct drm_connector_state *new_conn_state,
+				      struct drm_dp_mst_topology_mgr *mgr)
+{
+	struct drm_atomic_state *state = new_conn_state->state;
+	struct drm_connector_state *old_conn_state =
+		drm_atomic_get_old_connector_state(state, new_conn_state->connector);
+	struct drm_crtc_state *crtc_state;
+	struct drm_dp_mst_topology_state *mst_state = NULL;
+
+	if (new_conn_state->crtc) {
+		crtc_state = drm_atomic_get_new_crtc_state(state, new_conn_state->crtc);
+		if (crtc_state && drm_atomic_crtc_needs_modeset(crtc_state)) {
+			mst_state = drm_atomic_get_mst_topology_state(state, mgr);
+			if (IS_ERR(mst_state))
+				return PTR_ERR(mst_state);
+
+			mst_state->pending_crtc_mask |= drm_crtc_mask(new_conn_state->crtc);
+		}
+	}
+
+	if (old_conn_state->crtc) {
+		crtc_state = drm_atomic_get_new_crtc_state(state, old_conn_state->crtc);
+		if (crtc_state && drm_atomic_crtc_needs_modeset(crtc_state)) {
+			if (!mst_state) {
+				mst_state = drm_atomic_get_mst_topology_state(state, mgr);
+				if (IS_ERR(mst_state))
+					return PTR_ERR(mst_state);
+			}
+
+			mst_state->pending_crtc_mask |= drm_crtc_mask(old_conn_state->crtc);
+		}
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_dp_mst_root_conn_atomic_check);
+
 /**
  * drm_dp_mst_update_slots() - updates the slot info depending on the DP ecoding format
  * @mst_state: mst_state to update
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index b8e2d3cd4d68..943b7c0acc04 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4954,12 +4954,21 @@ static int intel_dp_connector_atomic_check(struct drm_connector *conn,
 {
 	struct drm_i915_private *dev_priv = to_i915(conn->dev);
 	struct intel_atomic_state *state = to_intel_atomic_state(_state);
+	struct drm_connector_state *conn_state = drm_atomic_get_new_connector_state(_state, conn);
+	struct intel_connector *intel_conn = to_intel_connector(conn);
+	struct intel_dp *intel_dp = enc_to_intel_dp(intel_conn->encoder);
 	int ret;
 
 	ret = intel_digital_connector_atomic_check(conn, &state->base);
 	if (ret)
 		return ret;
 
+	if (HAS_DP_MST(dev_priv) && !intel_dp_is_edp(intel_dp)) {
+		ret = drm_dp_mst_root_conn_atomic_check(conn_state, &intel_dp->mst_mgr);
+		if (ret)
+			return ret;
+	}
+
 	/*
 	 * We don't enable port sync on BDW due to missing w/as and
 	 * due to not having adjusted the modeset sequence appropriately.
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 834a5c5b77d5..57f74cfcdebf 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1815,7 +1815,7 @@ nv50_sor_func = {
 	.destroy = nv50_sor_destroy,
 };
 
-static bool nv50_has_mst(struct nouveau_drm *drm)
+bool nv50_has_mst(struct nouveau_drm *drm)
 {
 	struct nvkm_bios *bios = nvxx_bios(&drm->client.device);
 	u32 data;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/drm/nouveau/dispnv50/disp.h
index 38dec11e7dda..9d66c9c726c3 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
@@ -106,6 +106,8 @@ void nv50_dmac_destroy(struct nv50_dmac *);
  */
 struct nouveau_encoder *nv50_real_outp(struct drm_encoder *encoder);
 
+bool nv50_has_mst(struct nouveau_drm *drm);
+
 u32 *evo_wait(struct nv50_dmac *, int nr);
 void evo_kick(u32 *, struct nv50_dmac *);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index ffbd8a9cf2af..1c8235f97737 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1104,11 +1104,25 @@ nouveau_connector_best_encoder(struct drm_connector *connector)
 	return NULL;
 }
 
+static int
+nouveau_connector_atomic_check(struct drm_connector *connector, struct drm_atomic_state *state)
+{
+	struct nouveau_connector *nv_conn = nouveau_connector(connector);
+	struct drm_connector_state *conn_state =
+		drm_atomic_get_new_connector_state(state, connector);
+
+	if (!nv_conn->dp_encoder || !nv50_has_mst(nouveau_drm(connector->dev)))
+		return 0;
+
+	return drm_dp_mst_root_conn_atomic_check(conn_state, &nv_conn->dp_encoder->dp.mstm->mgr);
+}
+
 static const struct drm_connector_helper_funcs
 nouveau_connector_helper_funcs = {
 	.get_modes = nouveau_connector_get_modes,
 	.mode_valid = nouveau_connector_mode_valid,
 	.best_encoder = nouveau_connector_best_encoder,
+	.atomic_check = nouveau_connector_atomic_check,
 };
 
 static const struct drm_connector_funcs
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index dd74afcee888..690ebcabb51f 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -906,6 +906,8 @@ int drm_dp_send_query_stream_enc_status(struct drm_dp_mst_topology_mgr *mgr,
 		struct drm_dp_mst_port *port,
 		struct drm_dp_query_stream_enc_status_ack_reply *status);
 int __must_check drm_dp_mst_atomic_check(struct drm_atomic_state *state);
+int __must_check drm_dp_mst_root_conn_atomic_check(struct drm_connector_state *new_conn_state,
+						   struct drm_dp_mst_topology_mgr *mgr);
 
 void drm_dp_mst_get_port_malloc(struct drm_dp_mst_port *port);
 void drm_dp_mst_put_port_malloc(struct drm_dp_mst_port *port);
-- 
2.35.3

