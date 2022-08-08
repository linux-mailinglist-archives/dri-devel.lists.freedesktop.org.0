Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E08D458D0C1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 01:56:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46C5212B4B7;
	Mon,  8 Aug 2022 23:54:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBE9812A6BA
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 23:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660002870;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3vJzGqg/IjUZIk6i7ZOdYkmAQ/dQ5ApeMoAE+ZJMibg=;
 b=V/GQsVnfZM+TV+qFyI5WoQ40/ooHHIX+m6e2KXH8IIxTJQjgXCm+YLvCLQpjKXA5lZbDNk
 TCSYOCGZQ2oBT19qp+IA+DFex7paNkC4zzMnAcGBYRLQkRqiHG3sfD8hhgf0hlT+t36dD1
 MMEj2qW3hEXXBWlLDJ0c7BquySoOuJU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-458-B_0ZwjjENtqiBltp0-7Njg-1; Mon, 08 Aug 2022 19:54:26 -0400
X-MC-Unique: B_0ZwjjENtqiBltp0-7Njg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CBB958001EA;
 Mon,  8 Aug 2022 23:54:25 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.17.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3787DC15BA1;
 Mon,  8 Aug 2022 23:54:25 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [RFC v2 07/18] drm/display/dp_mst: Add helper for finding payloads in
 atomic MST state
Date: Mon,  8 Aug 2022 19:51:52 -0400
Message-Id: <20220808235203.123892-8-lyude@redhat.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, David Airlie <airlied@linux.ie>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We already open-code this quite often, and will be iterating through
payloads even more once we've moved all of the payload tracking into the
atomic state. So, let's add a helper for doing this.

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
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 109 ++++++++----------
 1 file changed, 45 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 8a2ddfde594a..1c054a5e2e77 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -1738,6 +1738,19 @@ drm_dp_mst_dump_port_topology_history(struct drm_dp_mst_port *port) {}
 #define save_port_topology_ref(port, type)
 #endif
 
+static struct drm_dp_mst_atomic_payload *
+drm_atomic_get_mst_payload_state(struct drm_dp_mst_topology_state *state,
+				 struct drm_dp_mst_port *port)
+{
+	struct drm_dp_mst_atomic_payload *payload;
+
+	list_for_each_entry(payload, &state->payloads, next)
+		if (payload->port == port)
+			return payload;
+
+	return NULL;
+}
+
 static void drm_dp_destroy_mst_branch_device(struct kref *kref)
 {
 	struct drm_dp_mst_branch *mstb =
@@ -4370,39 +4383,31 @@ int drm_dp_atomic_find_time_slots(struct drm_atomic_state *state,
 				  int pbn_div)
 {
 	struct drm_dp_mst_topology_state *topology_state;
-	struct drm_dp_mst_atomic_payload *pos, *payload = NULL;
-	int prev_slots, prev_bw, req_slots;
+	struct drm_dp_mst_atomic_payload *payload = NULL;
+	int prev_slots = 0, prev_bw = 0, req_slots;
 
 	topology_state = drm_atomic_get_mst_topology_state(state, mgr);
 	if (IS_ERR(topology_state))
 		return PTR_ERR(topology_state);
 
 	/* Find the current allocation for this port, if any */
-	list_for_each_entry(pos, &topology_state->payloads, next) {
-		if (pos->port == port) {
-			payload = pos;
-			prev_slots = payload->time_slots;
-			prev_bw = payload->pbn;
-
-			/*
-			 * This should never happen, unless the driver tries
-			 * releasing and allocating the same timeslot allocation,
-			 * which is an error
-			 */
-			if (WARN_ON(!prev_slots)) {
-				drm_err(mgr->dev,
-					"cannot allocate and release time slots on [MST PORT:%p] in the same state\n",
-					port);
-				return -EINVAL;
-			}
+	payload = drm_atomic_get_mst_payload_state(topology_state, port);
+	if (payload) {
+		prev_slots = payload->time_slots;
+		prev_bw = payload->pbn;
 
-			break;
+		/*
+		 * This should never happen, unless the driver tries
+		 * releasing and allocating the same timeslot allocation,
+		 * which is an error
+		 */
+		if (WARN_ON(!prev_slots)) {
+			drm_err(mgr->dev,
+				"cannot allocate and release time slots on [MST PORT:%p] in the same state\n",
+				port);
+			return -EINVAL;
 		}
 	}
-	if (!payload) {
-		prev_slots = 0;
-		prev_bw = 0;
-	}
 
 	if (pbn_div <= 0)
 		pbn_div = mgr->pbn_div;
@@ -4463,30 +4468,24 @@ int drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
 				     struct drm_dp_mst_port *port)
 {
 	struct drm_dp_mst_topology_state *topology_state;
-	struct drm_dp_mst_atomic_payload *pos;
-	bool found = false;
+	struct drm_dp_mst_atomic_payload *payload;
 
 	topology_state = drm_atomic_get_mst_topology_state(state, mgr);
 	if (IS_ERR(topology_state))
 		return PTR_ERR(topology_state);
 
-	list_for_each_entry(pos, &topology_state->payloads, next) {
-		if (pos->port == port) {
-			found = true;
-			break;
-		}
-	}
-	if (WARN_ON(!found)) {
+	payload = drm_atomic_get_mst_payload_state(topology_state, port);
+	if (WARN_ON(!payload)) {
 		drm_err(mgr->dev, "No payload for [MST PORT:%p] found in mst state %p\n",
 			port, &topology_state->base);
 		return -EINVAL;
 	}
 
-	drm_dbg_atomic(mgr->dev, "[MST PORT:%p] TU %d -> 0\n", port, pos->time_slots);
-	if (pos->time_slots) {
+	drm_dbg_atomic(mgr->dev, "[MST PORT:%p] TU %d -> 0\n", port, payload->time_slots);
+	if (payload->time_slots) {
 		drm_dp_mst_put_port_malloc(port);
-		pos->time_slots = 0;
-		pos->pbn = 0;
+		payload->time_slots = 0;
+		payload->pbn = 0;
 	}
 
 	return 0;
@@ -5182,18 +5181,8 @@ drm_dp_mst_atomic_check_port_bw_limit(struct drm_dp_mst_port *port,
 		return 0;
 
 	if (drm_dp_mst_is_end_device(port->pdt, port->mcs)) {
-		bool found = false;
-
-		list_for_each_entry(payload, &state->payloads, next) {
-			if (payload->port != port)
-				continue;
-			if (!payload->pbn)
-				return 0;
-
-			found = true;
-			break;
-		}
-		if (!found)
+		payload = drm_atomic_get_mst_payload_state(state, port);
+		if (!payload)
 			return 0;
 
 		/*
@@ -5348,34 +5337,26 @@ int drm_dp_mst_atomic_enable_dsc(struct drm_atomic_state *state,
 				 bool enable)
 {
 	struct drm_dp_mst_topology_state *mst_state;
-	struct drm_dp_mst_atomic_payload *pos;
-	bool found = false;
+	struct drm_dp_mst_atomic_payload *payload;
 	int time_slots = 0;
 
 	mst_state = drm_atomic_get_mst_topology_state(state, port->mgr);
-
 	if (IS_ERR(mst_state))
 		return PTR_ERR(mst_state);
 
-	list_for_each_entry(pos, &mst_state->payloads, next) {
-		if (pos->port == port) {
-			found = true;
-			break;
-		}
-	}
-
-	if (!found) {
+	payload = drm_atomic_get_mst_payload_state(mst_state, port);
+	if (!payload) {
 		drm_dbg_atomic(state->dev,
 			       "[MST PORT:%p] Couldn't find payload in mst state %p\n",
 			       port, mst_state);
 		return -EINVAL;
 	}
 
-	if (pos->dsc_enabled == enable) {
+	if (payload->dsc_enabled == enable) {
 		drm_dbg_atomic(state->dev,
 			       "[MST PORT:%p] DSC flag is already set to %d, returning %d time slots\n",
-			       port, enable, pos->time_slots);
-		time_slots = pos->time_slots;
+			       port, enable, payload->time_slots);
+		time_slots = payload->time_slots;
 	}
 
 	if (enable) {
@@ -5387,7 +5368,7 @@ int drm_dp_mst_atomic_enable_dsc(struct drm_atomic_state *state,
 			return -EINVAL;
 	}
 
-	pos->dsc_enabled = enable;
+	payload->dsc_enabled = enable;
 
 	return time_slots;
 }
-- 
2.37.1

