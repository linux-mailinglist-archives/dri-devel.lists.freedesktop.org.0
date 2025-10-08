Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3133EBC4B02
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 14:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73F3610E7EC;
	Wed,  8 Oct 2025 12:04:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HGvnwSNL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 453AA10E7EE
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 12:04:28 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2C73E43C24;
 Wed,  8 Oct 2025 12:04:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8D8EC4CEF4;
 Wed,  8 Oct 2025 12:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759925068;
 bh=fMb2ZVEwTD1yM2utz5qsn1areqftlRbevos6+mpKzUc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=HGvnwSNLJwpNfxTnrKjl/U8fYmY1P5iZx3V09wXoCFad59I9X6ZEVPH7yBzNe4yMz
 C7jeQCgoIgBNsTIoKU53RU/ECL7DFQGhT9VY4zSQDwj70/6CPQtJp81lVErTeW2hZZ
 vA4xK2zJXkMF1lrJq8BkKe0m59Xjp+whbnO4l7wTrMvpg+3GWrbYe7Psz361N95kDs
 YG+zc370hlb/rMjwNg/bWG7enquTD6F8qOrc047E5szIFRFte8v2KeZrLChhxlT6qv
 UnmG6e/P9UAMcSzqGgrdL33mCnM5XwVeAZ4g01lgAIihm2KLaAMeGGSuKaPo3SFfQD
 DBkHcdqiwMerQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 08 Oct 2025 14:04:03 +0200
Subject: [PATCH 05/16] drm/dp_mst: Switch private_obj initialization to reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-drm-private-obj-reset-v1-5-805ab43ae65a@kernel.org>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
In-Reply-To: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3467; i=mripard@kernel.org;
 h=from:subject:message-id; bh=fMb2ZVEwTD1yM2utz5qsn1areqftlRbevos6+mpKzUc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnPgk3CS/0/8VfPsuCaGJ357f1hFdtQ0eetzVfDZ2pFp
 b40WS7eMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACbiOJOx4a6VmWN1haG7c7nB
 LCupJAP3zxGea798+K0ZVH34siWbd2uMOWuxnffMzY8e33c8qj+PsYZv6vdguU22l5jW6Ge0bHi
 hp7vXVHp3j5TP7nlLz65zq3W89W5pHd/FyTlylr5PmFn3eQEA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

The DP MST implementation relies on a drm_private_obj, that is
initialized by allocating and initializing a state, and then passing it
to drm_private_obj_init.

Since we're gradually moving away from that pattern to the more
established one relying on a reset implementation, let's migrate this
instance to the new pattern.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 39 ++++++++++++++++++---------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 64e5c176d5cce9df9314f77a0b4c97662c30c070..255fbdcea9f0b6376d15439e3da1dc02be472a20 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5181,10 +5181,34 @@ static void drm_dp_mst_destroy_state(struct drm_private_obj *obj,
 
 	kfree(mst_state->commit_deps);
 	kfree(mst_state);
 }
 
+static void drm_dp_mst_reset(struct drm_private_obj *obj)
+{
+	struct drm_dp_mst_topology_mgr *mgr =
+		to_dp_mst_topology_mgr(obj);
+	struct drm_dp_mst_topology_state *mst_state;
+
+	if (obj->state) {
+		drm_dp_mst_destroy_state(obj, obj->state);
+		obj->state = NULL;
+	}
+
+	mst_state = kzalloc(sizeof(*mst_state), GFP_KERNEL);
+	if (!mst_state)
+		return;
+
+	__drm_atomic_helper_private_obj_reset(obj, &mst_state->base);
+
+	mst_state->total_avail_slots = 63;
+	mst_state->start_slot = 1;
+
+	mst_state->mgr = mgr;
+	INIT_LIST_HEAD(&mst_state->payloads);
+}
+
 static bool drm_dp_mst_port_downstream_of_branch(struct drm_dp_mst_port *port,
 						 struct drm_dp_mst_branch *branch)
 {
 	while (port->parent) {
 		if (port->parent == branch)
@@ -5619,10 +5643,11 @@ int drm_dp_mst_atomic_check(struct drm_atomic_state *state)
 EXPORT_SYMBOL(drm_dp_mst_atomic_check);
 
 const struct drm_private_state_funcs drm_dp_mst_topology_state_funcs = {
 	.atomic_duplicate_state = drm_dp_mst_duplicate_state,
 	.atomic_destroy_state = drm_dp_mst_destroy_state,
+	.reset = drm_dp_mst_reset,
 };
 EXPORT_SYMBOL(drm_dp_mst_topology_state_funcs);
 
 /**
  * drm_atomic_get_mst_topology_state: get MST topology state
@@ -5705,12 +5730,10 @@ EXPORT_SYMBOL(drm_atomic_get_new_mst_topology_state);
 int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 				 struct drm_device *dev, struct drm_dp_aux *aux,
 				 int max_dpcd_transaction_bytes, int max_payloads,
 				 int conn_base_id)
 {
-	struct drm_dp_mst_topology_state *mst_state;
-
 	mutex_init(&mgr->lock);
 	mutex_init(&mgr->qlock);
 	mutex_init(&mgr->delayed_destroy_lock);
 	mutex_init(&mgr->up_req_lock);
 	mutex_init(&mgr->probe_lock);
@@ -5740,22 +5763,12 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
 	mgr->aux = aux;
 	mgr->max_dpcd_transaction_bytes = max_dpcd_transaction_bytes;
 	mgr->max_payloads = max_payloads;
 	mgr->conn_base_id = conn_base_id;
 
-	mst_state = kzalloc(sizeof(*mst_state), GFP_KERNEL);
-	if (mst_state == NULL)
-		return -ENOMEM;
-
-	mst_state->total_avail_slots = 63;
-	mst_state->start_slot = 1;
-
-	mst_state->mgr = mgr;
-	INIT_LIST_HEAD(&mst_state->payloads);
-
 	drm_atomic_private_obj_init(dev, &mgr->base,
-				    &mst_state->base,
+				    NULL,
 				    &drm_dp_mst_topology_state_funcs);
 
 	return 0;
 }
 EXPORT_SYMBOL(drm_dp_mst_topology_mgr_init);

-- 
2.51.0

