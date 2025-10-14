Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3438BD92C5
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 14:00:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECD7510E5C7;
	Tue, 14 Oct 2025 12:00:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="trWLrogs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C58410E5C8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 12:00:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 62D5940B4C;
 Tue, 14 Oct 2025 12:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0A36C4CEE7;
 Tue, 14 Oct 2025 12:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760443231;
 bh=cI5qQeOm5yORhjXOXvQC2r6xSFlKKMzlfu3eSVX9uRY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=trWLrogsaXvDqWtBxGscXAXo1e0iuCowMO60HkegTB6uHkHiqCv2oOaYYo94NaiyX
 VewVtQK9Vdeb7UMQRVOJG6XD/c5A9ePgHFDNz3PVbz8DCK2tCbeHqL85P4sBK35qZ0
 OOHkxfixH9y0n/6zhGxICyJoDG0b8/+bqgO3bhDjcXNQHGwpZD740izkCjRaCRsE5O
 9sf7TOHrxBzGgzMQYE2jZNi6Iu3/1xEJtQfXv1H3bPX7q0j/oi81oelR0sIMYDPSK5
 xVe7uNF7Cmr+mH3fgwFmws0zuwxarO9KE+3OZQw83xQGU1s5M4mFNqfWPaXGxFG0lu
 5E7KD7+0z3Pow==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 14 Oct 2025 11:31:50 +0200
Subject: [PATCH v2 06/16] drm/dp_mst: Switch private_obj initialization to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-drm-private-obj-reset-v2-6-6dd60e985e9d@kernel.org>
References: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
In-Reply-To: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3453; i=mripard@kernel.org;
 h=from:subject:message-id; bh=cI5qQeOm5yORhjXOXvQC2r6xSFlKKMzlfu3eSVX9uRY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnvrN0CbD3qt034d2nKBbszzwVVZnk/ntazfXHYObv7l
 5JMnb8v6pjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATyVNirFNIqddoeVa35Pcb
 +aA9EbziS/VNV+X8Uv2dYLYudfam2+Ir8/uLhF8nT4g0ncLx4o3IT8b6mnN/zL82ZOmHt9+Kvnd
 g/YGSmX0sQQEH/oXYqKotsMg3VNzO0/7tQuOmcz7GLQlfM44DAA==
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
established one relying on a atomic_create_state implementation, let's
migrate this instance to the new pattern.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 37 +++++++++++++++++----------
 1 file changed, 24 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 64e5c176d5cce9df9314f77a0b4c97662c30c070..3e3ad6941742680179a9ecd8c07c0bf6adcd215f 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5181,10 +5181,32 @@ static void drm_dp_mst_destroy_state(struct drm_private_obj *obj,
 
 	kfree(mst_state->commit_deps);
 	kfree(mst_state);
 }
 
+static struct drm_private_state *
+drm_dp_mst_atomic_create_state(struct drm_private_obj *obj)
+{
+	struct drm_dp_mst_topology_mgr *mgr =
+		to_dp_mst_topology_mgr(obj);
+	struct drm_dp_mst_topology_state *mst_state;
+
+	mst_state = kzalloc(sizeof(*mst_state), GFP_KERNEL);
+	if (!mst_state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &mst_state->base);
+
+	mst_state->total_avail_slots = 63;
+	mst_state->start_slot = 1;
+
+	mst_state->mgr = mgr;
+	INIT_LIST_HEAD(&mst_state->payloads);
+
+	return &mst_state->base;
+}
+
 static bool drm_dp_mst_port_downstream_of_branch(struct drm_dp_mst_port *port,
 						 struct drm_dp_mst_branch *branch)
 {
 	while (port->parent) {
 		if (port->parent == branch)
@@ -5617,10 +5639,11 @@ int drm_dp_mst_atomic_check(struct drm_atomic_state *state)
 	return ret;
 }
 EXPORT_SYMBOL(drm_dp_mst_atomic_check);
 
 const struct drm_private_state_funcs drm_dp_mst_topology_state_funcs = {
+	.atomic_create_state = drm_dp_mst_atomic_create_state,
 	.atomic_duplicate_state = drm_dp_mst_duplicate_state,
 	.atomic_destroy_state = drm_dp_mst_destroy_state,
 };
 EXPORT_SYMBOL(drm_dp_mst_topology_state_funcs);
 
@@ -5705,12 +5728,10 @@ EXPORT_SYMBOL(drm_atomic_get_new_mst_topology_state);
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
@@ -5740,22 +5761,12 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
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

