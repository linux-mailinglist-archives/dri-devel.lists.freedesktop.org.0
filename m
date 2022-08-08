Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC76E58D0ED
	for <lists+dri-devel@lfdr.de>; Tue,  9 Aug 2022 01:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7879EADDFA;
	Mon,  8 Aug 2022 23:55:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F37AF2B082
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 23:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660002923;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=30H6QDzA7I/sBciEdR6Syxy5xFUzveiQOzb7qmpNOVo=;
 b=V//sZ8jx4/HzybdN9VyBuaz+4fIRVkZ/QtYNMfRP70qaGVHG4e7lHz89Kl0b0BAiaaOYBn
 yEvmWc2V6VeTRAAMpNoZTIGFq40RAaLtPaUOdoUsRpbIMMx0SGZLhI9zElVdjwnBJXxll+
 KvGElXuyBajbhcNIjrVV+e8CX7M9X7k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-622-sy2E9R3jO7-cI1sGo2prXg-1; Mon, 08 Aug 2022 19:55:20 -0400
X-MC-Unique: sy2E9R3jO7-cI1sGo2prXg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D16C101AA48;
 Mon,  8 Aug 2022 23:55:20 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.17.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DBDCC15BA1;
 Mon,  8 Aug 2022 23:55:19 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [RFC v2 16/18] drm/display/dp_mst: Maintain time slot allocations
 when deleting payloads
Date: Mon,  8 Aug 2022 19:52:01 -0400
Message-Id: <20220808235203.123892-17-lyude@redhat.com>
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
 Javier Martinez Canillas <javierm@redhat.com>,
 open list <linux-kernel@vger.kernel.org>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, David Airlie <airlied@linux.ie>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently, we set drm_dp_atomic_payload->time_slots to 0 in order to
indicate that we're about to delete a payload in the current atomic state.
Since we're going to be dropping all of the legacy code for handling the
payload table however, we need to be able to ensure that we still keep
track of the current time slot allocations for each payload so we can reuse
this info when asking the root MST hub to delete payloads. We'll also be
using it to recalculate the start slots of each VC.

So, let's keep track of the intent of a payload in drm_dp_atomic_payload by
adding ->delete, which we set whenever we're planning on deleting a payload
during the current atomic commit.

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
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 14 +++++++-------
 include/drm/display/drm_dp_mst_helper.h       |  5 ++++-
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index e9cf09a4b2a4..3fce1ed8d5e8 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4399,7 +4399,7 @@ int drm_dp_atomic_find_time_slots(struct drm_atomic_state *state,
 		 * releasing and allocating the same timeslot allocation,
 		 * which is an error
 		 */
-		if (WARN_ON(!prev_slots)) {
+		if (drm_WARN_ON(mgr->dev, payload->delete)) {
 			drm_err(mgr->dev,
 				"cannot allocate and release time slots on [MST PORT:%p] in the same state\n",
 				port);
@@ -4504,10 +4504,10 @@ int drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
 	}
 
 	drm_dbg_atomic(mgr->dev, "[MST PORT:%p] TU %d -> 0\n", port, payload->time_slots);
-	if (payload->time_slots) {
+	if (!payload->delete) {
 		drm_dp_mst_put_port_malloc(port);
-		payload->time_slots = 0;
 		payload->pbn = 0;
+		payload->delete = true;
 	}
 
 	return 0;
@@ -5222,7 +5222,7 @@ drm_dp_mst_duplicate_state(struct drm_private_obj *obj)
 
 	list_for_each_entry(pos, &old_state->payloads, next) {
 		/* Prune leftover freed timeslot allocations */
-		if (!pos->time_slots)
+		if (pos->delete)
 			continue;
 
 		payload = kmemdup(pos, sizeof(*payload), GFP_KERNEL);
@@ -5254,8 +5254,8 @@ static void drm_dp_mst_destroy_state(struct drm_private_obj *obj,
 	int i;
 
 	list_for_each_entry_safe(pos, tmp, &mst_state->payloads, next) {
-		/* We only keep references to ports with non-zero VCPIs */
-		if (pos->time_slots)
+		/* We only keep references to ports with active payloads */
+		if (!pos->delete)
 			drm_dp_mst_put_port_malloc(pos->port);
 		kfree(pos);
 	}
@@ -5383,7 +5383,7 @@ drm_dp_mst_atomic_check_payload_alloc_limits(struct drm_dp_mst_topology_mgr *mgr
 
 	list_for_each_entry(payload, &mst_state->payloads, next) {
 		/* Releasing payloads is always OK-even if the port is gone */
-		if (!payload->time_slots) {
+		if (payload->delete) {
 			drm_dbg_atomic(mgr->dev, "[MST PORT:%p] releases all time slots\n",
 				       payload->port);
 			continue;
diff --git a/include/drm/display/drm_dp_mst_helper.h b/include/drm/display/drm_dp_mst_helper.h
index b9c361b242ea..8b847836a0b4 100644
--- a/include/drm/display/drm_dp_mst_helper.h
+++ b/include/drm/display/drm_dp_mst_helper.h
@@ -560,8 +560,11 @@ struct drm_dp_mst_atomic_payload {
 	int time_slots;
 	/** @pbn: The payload bandwidth for this payload */
 	int pbn;
+
+	/** @delete: Whether or not we intend to delete this payload during this atomic commit */
+	bool delete : 1;
 	/** @dsc_enabled: Whether or not this payload has DSC enabled */
-	bool dsc_enabled;
+	bool dsc_enabled : 1;
 
 	/** @next: The list node for this payload */
 	struct list_head next;
-- 
2.37.1

