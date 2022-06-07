Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E2B54117C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 21:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FB010F050;
	Tue,  7 Jun 2022 19:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F67710EFF7
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 19:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654630692;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hKE/h82CPv0u0XoKS7MJOdRnsMSzYWemhQRHX7aHBZI=;
 b=hDwRAJT2tslXJzbc7WCr4DcZl5k01ebhB4/Eh2DBNB0CyKpwMYyWmrp3kJZzzdVn198Fx6
 rckYClohlU76R8ZONLEvJ3Xca/5j5np5LizpCx6lNCEUvoLTwDY+gxVLu6UfrrGv5Fiksm
 T93KZLZFa98KHxknF9l3pD2XIebEieg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-584-LUSfwX0XNF24XFxgHDPxmg-1; Tue, 07 Jun 2022 15:38:07 -0400
X-MC-Unique: LUSfwX0XNF24XFxgHDPxmg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3ED93382ECD1;
 Tue,  7 Jun 2022 19:34:55 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.9.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 318E72BFD953;
 Tue,  7 Jun 2022 19:34:03 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [RESEND RFC 09/18] drm/display/dp_mst: Don't open code modeset checks
 for releasing time slots
Date: Tue,  7 Jun 2022 15:29:24 -0400
Message-Id: <20220607192933.1333228-10-lyude@redhat.com>
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
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Hersen Wu <hersenwu@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>,
 "open list:INTEL DRM DRIVERS" <intel-gfx@lists.freedesktop.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Sean Paul <seanpaul@chromium.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 He Ying <heying24@huawei.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, Roman Li <Roman.Li@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Fernando Ramos <greenfoo@u92.eu>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I'm not sure why, but at the time I originally wrote the find/release time
slot helpers I thought we should avoid keeping modeset tracking out of the
MST helpers. In retrospect though there's no actual good reason to do
this, and the logic has ended up being identical across all the drivers
using the helpers. Also, it needs to be fixed anyway so we don't break
things when going atomic-only with MST.

So, let's just move this code into drm_dp_atomic_release_time_slots() and
stop open coding it.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>
---
 .../display/amdgpu_dm/amdgpu_dm_mst_types.c   | 29 +++----------------
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 21 ++++++++++++--
 drivers/gpu/drm/i915/display/intel_dp_mst.c   | 24 +--------------
 drivers/gpu/drm/nouveau/dispnv50/disp.c       | 21 --------------
 4 files changed, 23 insertions(+), 72 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
index e40ff51e7be0..b447c453b58d 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
@@ -353,34 +353,13 @@ dm_dp_mst_detect(struct drm_connector *connector,
 }
 
 static int dm_dp_mst_atomic_check(struct drm_connector *connector,
-				struct drm_atomic_state *state)
+				  struct drm_atomic_state *state)
 {
-	struct drm_connector_state *new_conn_state =
-			drm_atomic_get_new_connector_state(state, connector);
-	struct drm_connector_state *old_conn_state =
-			drm_atomic_get_old_connector_state(state, connector);
 	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
-	struct drm_crtc_state *new_crtc_state;
-	struct drm_dp_mst_topology_mgr *mst_mgr;
-	struct drm_dp_mst_port *mst_port;
+	struct drm_dp_mst_topology_mgr *mst_mgr = &aconnector->mst_port->mst_mgr;
+	struct drm_dp_mst_port *mst_port = aconnector->port;
 
-	mst_port = aconnector->port;
-	mst_mgr = &aconnector->mst_port->mst_mgr;
-
-	if (!old_conn_state->crtc)
-		return 0;
-
-	if (new_conn_state->crtc) {
-		new_crtc_state = drm_atomic_get_new_crtc_state(state, new_conn_state->crtc);
-		if (!new_crtc_state ||
-		    !drm_atomic_crtc_needs_modeset(new_crtc_state) ||
-		    new_crtc_state->enable)
-			return 0;
-		}
-
-	return drm_dp_atomic_release_time_slots(state,
-						mst_mgr,
-						mst_port);
+	return drm_dp_atomic_release_time_slots(state, mst_mgr, mst_port);
 }
 
 static const struct drm_connector_helper_funcs dm_dp_mst_connector_helper_funcs = {
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index a0ed29f83556..e73b34c0cc9e 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4484,14 +4484,29 @@ int drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
 {
 	struct drm_dp_mst_topology_state *topology_state;
 	struct drm_dp_mst_atomic_payload *payload;
-	struct drm_connector_state *conn_state;
+	struct drm_connector_state *old_conn_state, *new_conn_state;
+
+	old_conn_state = drm_atomic_get_old_connector_state(state, port->connector);
+	if (!old_conn_state->crtc)
+		return 0;
+
+	/* If the CRTC isn't disabled by this state, don't release it's payload */
+	new_conn_state = drm_atomic_get_new_connector_state(state, port->connector);
+	if (new_conn_state->crtc) {
+		struct drm_crtc_state *crtc_state =
+			drm_atomic_get_new_crtc_state(state, new_conn_state->crtc);
+
+		if (!crtc_state ||
+		    !drm_atomic_crtc_needs_modeset(crtc_state) ||
+		    crtc_state->enable)
+			return 0;
+	}
 
 	topology_state = drm_atomic_get_mst_topology_state(state, mgr);
 	if (IS_ERR(topology_state))
 		return PTR_ERR(topology_state);
 
-	conn_state = drm_atomic_get_old_connector_state(state, port->connector);
-	topology_state->pending_crtc_mask |= drm_crtc_mask(conn_state->crtc);
+	topology_state->pending_crtc_mask |= drm_crtc_mask(old_conn_state->crtc);
 
 	payload = drm_atomic_get_mst_payload_state(topology_state, port);
 	if (WARN_ON(!payload)) {
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 0c922667398a..4b0af3c26176 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -308,13 +308,10 @@ intel_dp_mst_atomic_check(struct drm_connector *connector,
 			  struct drm_atomic_state *_state)
 {
 	struct intel_atomic_state *state = to_intel_atomic_state(_state);
-	struct drm_connector_state *new_conn_state =
-		drm_atomic_get_new_connector_state(&state->base, connector);
 	struct drm_connector_state *old_conn_state =
 		drm_atomic_get_old_connector_state(&state->base, connector);
 	struct intel_connector *intel_connector =
 		to_intel_connector(connector);
-	struct drm_crtc *new_crtc = new_conn_state->crtc;
 	struct drm_dp_mst_topology_mgr *mgr;
 	int ret;
 
@@ -326,27 +323,8 @@ intel_dp_mst_atomic_check(struct drm_connector *connector,
 	if (ret)
 		return ret;
 
-	if (!old_conn_state->crtc)
-		return 0;
-
-	/* We only want to free VCPI if this state disables the CRTC on this
-	 * connector
-	 */
-	if (new_crtc) {
-		struct intel_crtc *crtc = to_intel_crtc(new_crtc);
-		struct intel_crtc_state *crtc_state =
-			intel_atomic_get_new_crtc_state(state, crtc);
-
-		if (!crtc_state ||
-		    !drm_atomic_crtc_needs_modeset(&crtc_state->uapi) ||
-		    crtc_state->uapi.enable)
-			return 0;
-	}
-
 	mgr = &enc_to_mst(to_intel_encoder(old_conn_state->best_encoder))->primary->dp.mst_mgr;
-	ret = drm_dp_atomic_release_time_slots(&state->base, mgr, intel_connector->port);
-
-	return ret;
+	return drm_dp_atomic_release_time_slots(&state->base, mgr, intel_connector->port);
 }
 
 static void clear_act_sent(struct intel_encoder *encoder,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 768312607fdb..461e5e3345f8 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -1260,27 +1260,6 @@ nv50_mstc_atomic_check(struct drm_connector *connector,
 {
 	struct nv50_mstc *mstc = nv50_mstc(connector);
 	struct drm_dp_mst_topology_mgr *mgr = &mstc->mstm->mgr;
-	struct drm_connector_state *new_conn_state =
-		drm_atomic_get_new_connector_state(state, connector);
-	struct drm_connector_state *old_conn_state =
-		drm_atomic_get_old_connector_state(state, connector);
-	struct drm_crtc_state *crtc_state;
-	struct drm_crtc *new_crtc = new_conn_state->crtc;
-
-	if (!old_conn_state->crtc)
-		return 0;
-
-	/* We only want to free VCPI if this state disables the CRTC on this
-	 * connector
-	 */
-	if (new_crtc) {
-		crtc_state = drm_atomic_get_new_crtc_state(state, new_crtc);
-
-		if (!crtc_state ||
-		    !drm_atomic_crtc_needs_modeset(crtc_state) ||
-		    crtc_state->enable)
-			return 0;
-	}
 
 	return drm_dp_atomic_release_time_slots(state, mgr, mstc->port);
 }
-- 
2.35.3

