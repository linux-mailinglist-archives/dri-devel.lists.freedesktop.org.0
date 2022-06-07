Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D8A9541115
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 21:33:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DFF710E7F4;
	Tue,  7 Jun 2022 19:33:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E88A310E81C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 19:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654630380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eRq46kAYDt3qC3J5COV22ywbnzIkY0HqgrBcO+W8oJE=;
 b=UmgQTY/oB17l5xYx9BJwvY6Q9cadeOV0/Gllon9kPu1KzB0h8fBrVB3bAKzHikvFZNA0ge
 XBKfGjgIAH+zum7qRuzASNTS/0OySYV5Q9MBNd30bI5oA4/UubI31pidyvO/EZyAKJAAiO
 ybz3/psmz7jUqgnQ9dJjy/ybnklunDY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-EYXGRZ95MNOL6ygMgV0yuA-1; Tue, 07 Jun 2022 15:32:53 -0400
X-MC-Unique: EYXGRZ95MNOL6ygMgV0yuA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 58EF13C11A19;
 Tue,  7 Jun 2022 19:31:27 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.9.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 523C72B94308;
 Tue,  7 Jun 2022 19:30:59 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [RESEND RFC 03/18] drm/display/dp_mst: Rename
 drm_dp_mst_vcpi_allocation
Date: Tue,  7 Jun 2022 15:29:18 -0400
Message-Id: <20220607192933.1333228-4-lyude@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>,
 open list <linux-kernel@vger.kernel.org>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, David Airlie <airlied@linux.ie>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In retrospect, the name I chose for this originally is confusing, as
there's a lot more info in here then just the VCPI. This really should be
called a payload. Let's make it more obvious that this is meant to be
related to the atomic state and is about payloads by renaming it to
drm_dp_mst_atomic_payload. Also, rename various variables throughout the
code that use atomic payloads.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 96 +++++++++----------
 include/drm/display/drm_dp_mst_helper.h       |  4 +-
 2 files changed, 50 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 67b3b9697da7..38eecb89e22d 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4381,7 +4381,7 @@ int drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
 				  int pbn_div)
 {
 	struct drm_dp_mst_topology_state *topology_state;
-	struct drm_dp_vcpi_allocation *pos, *vcpi = NULL;
+	struct drm_dp_mst_atomic_payload *pos, *payload = NULL;
 	int prev_slots, prev_bw, req_slots;
 
 	topology_state = drm_atomic_get_mst_topology_state(state, mgr);
@@ -4389,11 +4389,11 @@ int drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
 		return PTR_ERR(topology_state);
 
 	/* Find the current allocation for this port, if any */
-	list_for_each_entry(pos, &topology_state->vcpis, next) {
+	list_for_each_entry(pos, &topology_state->payloads, next) {
 		if (pos->port == port) {
-			vcpi = pos;
-			prev_slots = vcpi->vcpi;
-			prev_bw = vcpi->pbn;
+			payload = pos;
+			prev_slots = payload->vcpi;
+			prev_bw = payload->pbn;
 
 			/*
 			 * This should never happen, unless the driver tries
@@ -4410,7 +4410,7 @@ int drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
 			break;
 		}
 	}
-	if (!vcpi) {
+	if (!payload) {
 		prev_slots = 0;
 		prev_bw = 0;
 	}
@@ -4428,17 +4428,17 @@ int drm_dp_atomic_find_vcpi_slots(struct drm_atomic_state *state,
 		       port, prev_bw, pbn);
 
 	/* Add the new allocation to the state */
-	if (!vcpi) {
-		vcpi = kzalloc(sizeof(*vcpi), GFP_KERNEL);
-		if (!vcpi)
+	if (!payload) {
+		payload = kzalloc(sizeof(*payload), GFP_KERNEL);
+		if (!payload)
 			return -ENOMEM;
 
 		drm_dp_mst_get_port_malloc(port);
-		vcpi->port = port;
-		list_add(&vcpi->next, &topology_state->vcpis);
+		payload->port = port;
+		list_add(&payload->next, &topology_state->payloads);
 	}
-	vcpi->vcpi = req_slots;
-	vcpi->pbn = pbn;
+	payload->vcpi = req_slots;
+	payload->pbn = pbn;
 
 	return req_slots;
 }
@@ -4475,21 +4475,21 @@ int drm_dp_atomic_release_vcpi_slots(struct drm_atomic_state *state,
 				     struct drm_dp_mst_port *port)
 {
 	struct drm_dp_mst_topology_state *topology_state;
-	struct drm_dp_vcpi_allocation *pos;
+	struct drm_dp_mst_atomic_payload *pos;
 	bool found = false;
 
 	topology_state = drm_atomic_get_mst_topology_state(state, mgr);
 	if (IS_ERR(topology_state))
 		return PTR_ERR(topology_state);
 
-	list_for_each_entry(pos, &topology_state->vcpis, next) {
+	list_for_each_entry(pos, &topology_state->payloads, next) {
 		if (pos->port == port) {
 			found = true;
 			break;
 		}
 	}
 	if (WARN_ON(!found)) {
-		drm_err(mgr->dev, "no VCPI for [MST PORT:%p] found in mst state %p\n",
+		drm_err(mgr->dev, "No payload for [MST PORT:%p] found in mst state %p\n",
 			port, &topology_state->base);
 		return -EINVAL;
 	}
@@ -5072,7 +5072,7 @@ drm_dp_mst_duplicate_state(struct drm_private_obj *obj)
 {
 	struct drm_dp_mst_topology_state *state, *old_state =
 		to_dp_mst_topology_state(obj->state);
-	struct drm_dp_vcpi_allocation *pos, *vcpi;
+	struct drm_dp_mst_atomic_payload *pos, *payload;
 
 	state = kmemdup(old_state, sizeof(*state), GFP_KERNEL);
 	if (!state)
@@ -5080,25 +5080,25 @@ drm_dp_mst_duplicate_state(struct drm_private_obj *obj)
 
 	__drm_atomic_helper_private_obj_duplicate_state(obj, &state->base);
 
-	INIT_LIST_HEAD(&state->vcpis);
+	INIT_LIST_HEAD(&state->payloads);
 
-	list_for_each_entry(pos, &old_state->vcpis, next) {
+	list_for_each_entry(pos, &old_state->payloads, next) {
 		/* Prune leftover freed VCPI allocations */
 		if (!pos->vcpi)
 			continue;
 
-		vcpi = kmemdup(pos, sizeof(*vcpi), GFP_KERNEL);
-		if (!vcpi)
+		payload = kmemdup(pos, sizeof(*payload), GFP_KERNEL);
+		if (!payload)
 			goto fail;
 
-		drm_dp_mst_get_port_malloc(vcpi->port);
-		list_add(&vcpi->next, &state->vcpis);
+		drm_dp_mst_get_port_malloc(payload->port);
+		list_add(&payload->next, &state->payloads);
 	}
 
 	return &state->base;
 
 fail:
-	list_for_each_entry_safe(pos, vcpi, &state->vcpis, next) {
+	list_for_each_entry_safe(pos, payload, &state->payloads, next) {
 		drm_dp_mst_put_port_malloc(pos->port);
 		kfree(pos);
 	}
@@ -5112,9 +5112,9 @@ static void drm_dp_mst_destroy_state(struct drm_private_obj *obj,
 {
 	struct drm_dp_mst_topology_state *mst_state =
 		to_dp_mst_topology_state(state);
-	struct drm_dp_vcpi_allocation *pos, *tmp;
+	struct drm_dp_mst_atomic_payload *pos, *tmp;
 
-	list_for_each_entry_safe(pos, tmp, &mst_state->vcpis, next) {
+	list_for_each_entry_safe(pos, tmp, &mst_state->payloads, next) {
 		/* We only keep references to ports with non-zero VCPIs */
 		if (pos->vcpi)
 			drm_dp_mst_put_port_malloc(pos->port);
@@ -5147,7 +5147,7 @@ static int
 drm_dp_mst_atomic_check_mstb_bw_limit(struct drm_dp_mst_branch *mstb,
 				      struct drm_dp_mst_topology_state *state)
 {
-	struct drm_dp_vcpi_allocation *vcpi;
+	struct drm_dp_mst_atomic_payload *payload;
 	struct drm_dp_mst_port *port;
 	int pbn_used = 0, ret;
 	bool found = false;
@@ -5155,9 +5155,9 @@ drm_dp_mst_atomic_check_mstb_bw_limit(struct drm_dp_mst_branch *mstb,
 	/* Check that we have at least one port in our state that's downstream
 	 * of this branch, otherwise we can skip this branch
 	 */
-	list_for_each_entry(vcpi, &state->vcpis, next) {
-		if (!vcpi->pbn ||
-		    !drm_dp_mst_port_downstream_of_branch(vcpi->port, mstb))
+	list_for_each_entry(payload, &state->payloads, next) {
+		if (!payload->pbn ||
+		    !drm_dp_mst_port_downstream_of_branch(payload->port, mstb))
 			continue;
 
 		found = true;
@@ -5188,7 +5188,7 @@ static int
 drm_dp_mst_atomic_check_port_bw_limit(struct drm_dp_mst_port *port,
 				      struct drm_dp_mst_topology_state *state)
 {
-	struct drm_dp_vcpi_allocation *vcpi;
+	struct drm_dp_mst_atomic_payload *payload;
 	int pbn_used = 0;
 
 	if (port->pdt == DP_PEER_DEVICE_NONE)
@@ -5197,10 +5197,10 @@ drm_dp_mst_atomic_check_port_bw_limit(struct drm_dp_mst_port *port,
 	if (drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
 		bool found = false;
 
-		list_for_each_entry(vcpi, &state->vcpis, next) {
-			if (vcpi->port != port)
+		list_for_each_entry(payload, &state->payloads, next) {
+			if (payload->port != port)
 				continue;
-			if (!vcpi->pbn)
+			if (!payload->pbn)
 				return 0;
 
 			found = true;
@@ -5220,7 +5220,7 @@ drm_dp_mst_atomic_check_port_bw_limit(struct drm_dp_mst_port *port,
 			return -EINVAL;
 		}
 
-		pbn_used = vcpi->pbn;
+		pbn_used = payload->pbn;
 	} else {
 		pbn_used = drm_dp_mst_atomic_check_mstb_bw_limit(port->mstb,
 								 state);
@@ -5245,25 +5245,25 @@ static inline int
 drm_dp_mst_atomic_check_vcpi_alloc_limit(struct drm_dp_mst_topology_mgr *mgr,
 					 struct drm_dp_mst_topology_state *mst_state)
 {
-	struct drm_dp_vcpi_allocation *vcpi;
+	struct drm_dp_mst_atomic_payload *payload;
 	int avail_slots = mst_state->total_avail_slots, payload_count = 0;
 
-	list_for_each_entry(vcpi, &mst_state->vcpis, next) {
-		/* Releasing VCPI is always OK-even if the port is gone */
-		if (!vcpi->vcpi) {
+	list_for_each_entry(payload, &mst_state->payloads, next) {
+		/* Releasing payloads is always OK-even if the port is gone */
+		if (!payload->vcpi) {
 			drm_dbg_atomic(mgr->dev, "[MST PORT:%p] releases all VCPI slots\n",
-				       vcpi->port);
+				       payload->port);
 			continue;
 		}
 
 		drm_dbg_atomic(mgr->dev, "[MST PORT:%p] requires %d vcpi slots\n",
-			       vcpi->port, vcpi->vcpi);
+			       payload->port, payload->vcpi);
 
-		avail_slots -= vcpi->vcpi;
+		avail_slots -= payload->vcpi;
 		if (avail_slots < 0) {
 			drm_dbg_atomic(mgr->dev,
 				       "[MST PORT:%p] not enough VCPI slots in mst state %p (avail=%d)\n",
-				       vcpi->port, mst_state, avail_slots + vcpi->vcpi);
+				       payload->port, mst_state, avail_slots + payload->vcpi);
 			return -ENOSPC;
 		}
 
@@ -5296,7 +5296,7 @@ drm_dp_mst_atomic_check_vcpi_alloc_limit(struct drm_dp_mst_topology_mgr *mgr,
 int drm_dp_mst_add_affected_dsc_crtcs(struct drm_atomic_state *state, struct drm_dp_mst_topology_mgr *mgr)
 {
 	struct drm_dp_mst_topology_state *mst_state;
-	struct drm_dp_vcpi_allocation *pos;
+	struct drm_dp_mst_atomic_payload *pos;
 	struct drm_connector *connector;
 	struct drm_connector_state *conn_state;
 	struct drm_crtc *crtc;
@@ -5307,7 +5307,7 @@ int drm_dp_mst_add_affected_dsc_crtcs(struct drm_atomic_state *state, struct drm
 	if (IS_ERR(mst_state))
 		return -EINVAL;
 
-	list_for_each_entry(pos, &mst_state->vcpis, next) {
+	list_for_each_entry(pos, &mst_state->payloads, next) {
 
 		connector = pos->port->connector;
 
@@ -5361,7 +5361,7 @@ int drm_dp_mst_atomic_enable_dsc(struct drm_atomic_state *state,
 				 bool enable)
 {
 	struct drm_dp_mst_topology_state *mst_state;
-	struct drm_dp_vcpi_allocation *pos;
+	struct drm_dp_mst_atomic_payload *pos;
 	bool found = false;
 	int vcpi = 0;
 
@@ -5370,7 +5370,7 @@ int drm_dp_mst_atomic_enable_dsc(struct drm_atomic_state *state,
 	if (IS_ERR(mst_state))
 		return PTR_ERR(mst_state);
 
-	list_for_each_entry(pos, &mst_state->vcpis, next) {
+	list_for_each_entry(pos, &mst_state->payloads, next) {
 		if (pos->port == port) {
 			found = true;
 			break;
@@ -5557,7 +5557,7 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 	mst_state->start_slot = 1;
 
 	mst_state->mgr = mgr;
-	INIT_LIST_HEAD(&mst_state->vcpis);
+	INIT_LIST_HEAD(&mst_state->payloads);
 
 	drm_atomic_private_obj_init(dev, &mgr->base,
 				    &mst_state->base,
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index 10adec068b7f..5671173f9f37 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -542,7 +542,7 @@ struct drm_dp_payload {
 
 #define to_dp_mst_topology_state(x) container_of(x, struct drm_dp_mst_topology_state, base)
 
-struct drm_dp_vcpi_allocation {
+struct drm_dp_mst_atomic_payload {
 	struct drm_dp_mst_port *port;
 	int vcpi;
 	int pbn;
@@ -552,7 +552,7 @@ struct drm_dp_vcpi_allocation {
 
 struct drm_dp_mst_topology_state {
 	struct drm_private_state base;
-	struct list_head vcpis;
+	struct list_head payloads;
 	struct drm_dp_mst_topology_mgr *mgr;
 	u8 total_avail_slots;
 	u8 start_slot;
-- 
2.35.3

