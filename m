Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B56C379CFB0
	for <lists+dri-devel@lfdr.de>; Tue, 12 Sep 2023 13:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2226310E3FC;
	Tue, 12 Sep 2023 11:18:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4768710E3F7;
 Tue, 12 Sep 2023 11:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694517506; x=1726053506;
 h=date:from:to:cc:subject:message-id:reply-to:references:
 mime-version:in-reply-to;
 bh=v/i3taSTWqLhaAP15wksvlM9MkSPryqH2IEvYzbAXd0=;
 b=mSgaO8isAXPavN7fyTPJWTQooMufqw7odqxnN8r4d5i8lmYX6ShJfnWK
 eL1QEz3E5v27lsFdqbl1a23pGH66RaI7112+EyOgUv3LQGJL3TXc/a8Dh
 kEUXOSrnfGCB9TGvyCBVdHwH02SQo8UBi/+u0I8SL2CGQLYOjzvCDHAUj
 16D9Jth4It4CTZR7XWg1VO72wenH1mtNOWgi78yqO6DTqlAubngJx+9sq
 xqeMZtIS2rC+gkWs3BWi3jIvO+2yCwkIIjulWIQSfoAHflM6YV22fezBc
 ebL0Ga5D0kg3VSLVeW0b2t4+n6c55rruKm9ABYb50N4Zdz87XlaWD5A9/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="442360657"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="442360657"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:18:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="917397310"
X-IronPort-AV: E=Sophos;i="6.02,139,1688454000"; d="scan'208";a="917397310"
Received: from ideak-desk.fi.intel.com ([10.237.72.78])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2023 04:18:21 -0700
Date: Tue, 12 Sep 2023 14:18:40 +0300
From: Imre Deak <imre.deak@intel.com>
To: "Lin, Wayne" <Wayne.Lin@amd.com>
Subject: Re: [PATCH 3/3] drm/mst: adjust the function
 drm_dp_remove_payload_part2()
Message-ID: <ZQBJEKg8oHq8sSyN@ideak-desk.fi.intel.com>
References: <ZM0Z3sZEYMcMTnuP@ideak-desk.fi.intel.com>
 <CO6PR12MB5489306FA44F5F107180E57DFC0CA@CO6PR12MB5489.namprd12.prod.outlook.com>
 <ZNEU8j6OR3KirIcS@ideak-desk.fi.intel.com>
 <CO6PR12MB548978FEE8BE8300F43D4486FC0DA@CO6PR12MB5489.namprd12.prod.outlook.com>
 <ZN+uWC1fDKZUmDdL@ideak-desk.fi.intel.com>
 <CO6PR12MB5489E92E7A29CA7285602B20FC1CA@CO6PR12MB5489.namprd12.prod.outlook.com>
 <ZOiywboCeFxJwCCP@ideak-desk.fi.intel.com>
 <CO6PR12MB5489FC7230B9D400EEF5735CFCEEA@CO6PR12MB5489.namprd12.prod.outlook.com>
 <ZPtzhcxqWPB07vfw@ideak-desk.fi.intel.com>
 <CO6PR12MB5489BBC86F6113C5019F3D96FCF1A@CO6PR12MB5489.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CO6PR12MB5489BBC86F6113C5019F3D96FCF1A@CO6PR12MB5489.namprd12.prod.outlook.com>
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
Reply-To: imre.deak@intel.com
Cc: "jani.nikula@intel.com" <jani.nikula@intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Zuo,
 Jerry" <Jerry.Zuo@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 12, 2023 at 07:26:29AM +0000, Lin, Wayne wrote:
> [Public]
> [...]
> >
> > I'd like to be sure that the payload is removed with the size it was added with
> > in the previous commit and as I wrote above not depend for this on the new
> > payload state with a mixture of old/current/new states.
> > Based on that I'd be ok for instance with a new
> >
> > int drm_dp_remove_port_payload(mgr, mst_state, port)
> >
> > function which looks up / removes the payload with the time_slots calculated
> > based on the payload table as in your patch and returns the calculated
> > time_slots.
> >
> > The AMD driver could call the above function and the current
> > drm_dp_remove_payload(mgr, mst_state, old_payload) function would be
> >
> >       time_slots = drm_dp_remove_port_payload(mgr, mst_state,
> > old_payload->port);
> >       WARN_ON(time_slots != old_payload->time_slots);
> >
> > --Imre
> 
> Sorry but I might not fully understand what you suggested here. Would like to know
> if you agree on referring to the time slot number of the payload table at the moment
> is better then referring old_payload->time_slots for drm_dp_remove_payload()? If
> you agree on that, my patch actually is just replacing old_payload->time_slots with
> the more appropriate one. Not adding mixture of old/current but replacing the old
> with the current one. 

The new_payload state contains a mixture of old/current/new state at the
moment and this patch adds more dependency on that, recalculating the
old payload size from that state. For i915 this recalculation isn't
needed, the size is already available in the old payload state.

> And like what I explained in previous example, when calling
> drm_dp_remove_payload(), the time slot number to be removed shouldn't be
> constrained to the one in previous commit. The number in the payload table when
> we're about to remove the payload might be a better choice. Could you elaborate
> more what's the mixture that this patch is adding on, please?
>
> As for the changing suggestion, are you suggesting to create a new function
> drm_dp_remove_port_payload() to wrap up the calculation in my patch? If so, I think
> that's the consensus to use current time slot number to replace the one in old_payload.
> Therefore, it doesn't have to pass old_payload to drm_dp_remove_port_payload(), and
> "WARN_ON(time_slots != old_payload->time_slots);" is not appropriate as for the
> example that I gave previously.

I meant something like the following:

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index cbef4ff28cd8a..0555433d8050b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -343,7 +343,7 @@ bool dm_helpers_dp_mst_send_payload_allocation(
 	struct amdgpu_dm_connector *aconnector;
 	struct drm_dp_mst_topology_state *mst_state;
 	struct drm_dp_mst_topology_mgr *mst_mgr;
-	struct drm_dp_mst_atomic_payload *new_payload, *old_payload;
+	struct drm_dp_mst_atomic_payload *new_payload;
 	enum mst_progress_status set_flag = MST_ALLOCATE_NEW_PAYLOAD;
 	enum mst_progress_status clr_flag = MST_CLEAR_ALLOCATED_PAYLOAD;
 	int ret = 0;
@@ -366,9 +366,8 @@ bool dm_helpers_dp_mst_send_payload_allocation(
 	if (enable) {
 		ret = drm_dp_add_payload_part2(mst_mgr, mst_state->base.state, new_payload);
 	} else {
-		dm_helpers_construct_old_payload(stream->link, mst_state->pbn_div,
-						 new_payload, old_payload);
-		drm_dp_remove_payload_part2(mst_mgr, mst_state, old_payload, new_payload);
+		drm_dp_remove_current_payload_part2(mst_mgr, mst_state->base.state,
+						    aconnector->mst_output_port);
 	}
 
 	if (ret) {
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index e04f87ff755ac..4d25dba789e91 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3382,37 +3382,70 @@ EXPORT_SYMBOL(drm_dp_remove_payload_part1);
  * drm_dp_remove_payload_part2() - Remove an MST payload locally
  * @mgr: Manager to use.
  * @mst_state: The MST atomic state
- * @old_payload: The payload with its old state
- * @new_payload: The payload with its latest state
+ * @port: MST port
  *
  * Updates the starting time slots of all other payloads which would have been shifted towards
  * the start of the payload ID table as a result of removing a payload. Driver should call this
  * function whenever it removes a payload in its HW. It's independent to the result of payload
  * allocation/deallocation at branch devices along the virtual channel.
  */
-void drm_dp_remove_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
-				 struct drm_dp_mst_topology_state *mst_state,
-				 const struct drm_dp_mst_atomic_payload *old_payload,
-				 struct drm_dp_mst_atomic_payload *new_payload)
+int drm_dp_remove_current_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
+					struct drm_atomic_state *state,
+					struct drm_dp_mst_port *port)
 {
 	struct drm_dp_mst_atomic_payload *pos;
+	struct drm_dp_mst_topology_state *mst_state =
+		drm_atomic_get_new_mst_topology_state(state, mgr);
+	struct drm_dp_mst_atomic_payload *new_payload =
+		drm_atomic_get_mst_payload_state(mst_state, port);
+	int time_slots_to_remove;
+	u8 next_payload_vc_start = mgr->next_start_slot;
+
+	/* Find the current allocated time slot number of the payload */
+	list_for_each_entry(pos, &mst_state->payloads, next) {
+		if (pos != new_payload &&
+		    pos->vc_start_slot > new_payload->vc_start_slot &&
+		    pos->vc_start_slot < next_payload_vc_start)
+			next_payload_vc_start = pos->vc_start_slot;
+	}
+
+	time_slots_to_remove = next_payload_vc_start - new_payload->vc_start_slot;
 
 	/* Remove local payload allocation */
 	list_for_each_entry(pos, &mst_state->payloads, next) {
 		if (pos != new_payload && pos->vc_start_slot > new_payload->vc_start_slot)
-			pos->vc_start_slot -= old_payload->time_slots;
+			pos->vc_start_slot -= time_slots_to_remove;
 	}
 	new_payload->vc_start_slot = -1;
 
 	mgr->payload_count--;
-	mgr->next_start_slot -= old_payload->time_slots;
+	mgr->next_start_slot -= time_slots_to_remove;
 
 	if (new_payload->delete)
 		drm_dp_mst_put_port_malloc(new_payload->port);
 
 	new_payload->payload_allocation_status = DRM_DP_MST_PAYLOAD_ALLOCATION_NONE;
+
+	return time_slots_to_remove;
+}
+EXPORT_SYMBOL(drm_dp_remove_current_payload_part2);
+
+void drm_dp_remove_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
+				 struct drm_atomic_state *state,
+				 struct drm_dp_mst_port *port)
+{
+	struct drm_dp_mst_topology_state *old_mst_state =
+		drm_atomic_get_old_mst_topology_state(state, mgr);
+	struct drm_dp_mst_atomic_payload *old_payload =
+		drm_atomic_get_mst_payload_state(old_mst_state, port);
+	int time_slots;
+
+	time_slots = drm_dp_remove_current_payload_part2(mgr, state, port);
+
+	drm_WARN_ON(mgr->dev, time_slots != old_payload->time_slots);
 }
 EXPORT_SYMBOL(drm_dp_remove_payload_part2);
+
 /**
  * drm_dp_add_payload_part2() - Execute payload update part 2
  * @mgr: Manager to use.
diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/drm/i915/display/intel_dp_mst.c
index 1c7f0b6afe475..3ab491d9c8d27 100644
--- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
+++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
@@ -576,14 +576,6 @@ static void intel_mst_post_disable_dp(struct intel_atomic_state *state,
 	struct intel_dp *intel_dp = &dig_port->dp;
 	struct intel_connector *connector =
 		to_intel_connector(old_conn_state->connector);
-	struct drm_dp_mst_topology_state *old_mst_state =
-		drm_atomic_get_old_mst_topology_state(&state->base, &intel_dp->mst_mgr);
-	struct drm_dp_mst_topology_state *new_mst_state =
-		drm_atomic_get_new_mst_topology_state(&state->base, &intel_dp->mst_mgr);
-	const struct drm_dp_mst_atomic_payload *old_payload =
-		drm_atomic_get_mst_payload_state(old_mst_state, connector->port);
-	struct drm_dp_mst_atomic_payload *new_payload =
-		drm_atomic_get_mst_payload_state(new_mst_state, connector->port);
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	bool last_mst_stream;
 
@@ -604,8 +596,7 @@ static void intel_mst_post_disable_dp(struct intel_atomic_state *state,
 
 	wait_for_act_sent(encoder, old_crtc_state);
 
-	drm_dp_remove_payload_part2(&intel_dp->mst_mgr, new_mst_state,
-				    old_payload, new_payload);
+	drm_dp_remove_payload_part2(&intel_dp->mst_mgr, &state->base, connector->port);
 
 	intel_ddi_disable_transcoder_func(old_crtc_state);
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index bba01fa0780c9..1ed724fe11f96 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -889,17 +889,13 @@ nv50_msto_cleanup(struct drm_atomic_state *state,
 	struct nouveau_drm *drm = nouveau_drm(msto->encoder.dev);
 	struct drm_dp_mst_atomic_payload *new_payload =
 		drm_atomic_get_mst_payload_state(new_mst_state, msto->mstc->port);
-	struct drm_dp_mst_topology_state *old_mst_state =
-		drm_atomic_get_old_mst_topology_state(state, mgr);
-	const struct drm_dp_mst_atomic_payload *old_payload =
-		drm_atomic_get_mst_payload_state(old_mst_state, msto->mstc->port);
 
 	NV_ATOMIC(drm, "%s: msto cleanup\n", msto->encoder.name);
 
 	if (msto->disabled) {
 		msto->mstc = NULL;
 		msto->disabled = false;
-		drm_dp_remove_payload_part2(mgr, new_mst_state, old_payload, new_payload);
+		drm_dp_remove_payload_part2(mgr, state, msto->mstc->port);
 	} else if (msto->enabled) {
 		drm_dp_add_payload_part2(mgr, state, new_payload);
 		msto->enabled = false;
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index 4429d3b1745b6..9288501ffe8d2 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -856,9 +856,11 @@ void drm_dp_remove_payload_part1(struct drm_dp_mst_topology_mgr *mgr,
 				 struct drm_dp_mst_topology_state *mst_state,
 				 struct drm_dp_mst_atomic_payload *payload);
 void drm_dp_remove_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
-				 struct drm_dp_mst_topology_state *mst_state,
-				 const struct drm_dp_mst_atomic_payload *old_payload,
-				 struct drm_dp_mst_atomic_payload *new_payload);
+				 struct drm_atomic_state *state,
+				 struct drm_dp_mst_port *port);
+int drm_dp_remove_current_payload_part2(struct drm_dp_mst_topology_mgr *mgr,
+					struct drm_atomic_state *state,
+					struct drm_dp_mst_port *port);
 
 int drm_dp_check_act_status(struct drm_dp_mst_topology_mgr *mgr);
 
> Thanks for helping me out here.
