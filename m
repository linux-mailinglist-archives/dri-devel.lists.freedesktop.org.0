Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A4AD3A963
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07D0A10E43F;
	Mon, 19 Jan 2026 12:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="E5IRF8Vm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F9610E440
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:50:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B140543473;
 Mon, 19 Jan 2026 12:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AB7BC19423;
 Mon, 19 Jan 2026 12:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768827025;
 bh=YrU935JhRPvzX1+FGvtzw0rwguZU9OKkLohNw7btRvU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=E5IRF8VmebCKcdSgGym6l+wyEXFYjZ6af/+9Sg90HuJ4bYyCqgx+4aLFpFTbeLrVJ
 c0Lkk8QRh2A4WYTr0xmf5SODlAtqR4jk6QDTTBfAGt5lT1JMRB07eiuZ/Aq4RKbSQA
 NMP8FzcfNz2YXPGGhceiJOLMJeHpUrDfOn7yKugDawl2vj0GIO5iRrdoiofrhZsFig
 2yFQjeAulf76XHVWj5WdBREvevjLiBoxUZAa+p4CaHeMqu3DwVD7tzMdIcf3ApmE/k
 svqaP8bJ2eInbJ8YVDbZ3DBGT3tdTTU3rgoNJl8al5Ntq03b65ZhVNgODa9CxNPXsW
 +3bLV6gMqU+zA==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 19 Jan 2026 13:50:01 +0100
Subject: [PATCH v3 05/15] drm/dp_mst: Switch private_obj initialization to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-drm-private-obj-reset-v3-5-b931abe3a5e3@redhat.com>
References: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
In-Reply-To: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3453; i=mripard@redhat.com;
 h=from:subject:message-id; bh=YrU935JhRPvzX1+FGvtzw0rwguZU9OKkLohNw7btRvU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl5GtVedvHCS7ataVHeEaY8x/LGZNf1EsHb3DxUK/8+u
 bdJZeuRjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRm08YG5pzH5z71J7bXhm3
 KfG11s/gSS9YLSde6fb8WsX6iM3N/MDE+4ujGPtm2chMzjlmfsF/O2OdXdEvyf+651dcvSvEWPv
 08JHkWLlLNf56Rb8FLXZrbK18EfLSZ/+kvYs5f589++2s2JTnAA==
X-Developer-Key: i=mripard@redhat.com; a=openpgp;
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
index be749dcad3b585d475730c4246b0eb9f2759dd27..1ab0233a2a18f784d8c43e61b94e40a06bd4baf6 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -5182,10 +5182,32 @@ static void drm_dp_mst_destroy_state(struct drm_private_obj *obj,
 
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
@@ -5618,10 +5640,11 @@ int drm_dp_mst_atomic_check(struct drm_atomic_state *state)
 	return ret;
 }
 EXPORT_SYMBOL(drm_dp_mst_atomic_check);
 
 const struct drm_private_state_funcs drm_dp_mst_topology_state_funcs = {
+	.atomic_create_state = drm_dp_mst_atomic_create_state,
 	.atomic_duplicate_state = drm_dp_mst_duplicate_state,
 	.atomic_destroy_state = drm_dp_mst_destroy_state,
 };
 EXPORT_SYMBOL(drm_dp_mst_topology_state_funcs);
 
@@ -5706,12 +5729,10 @@ EXPORT_SYMBOL(drm_atomic_get_new_mst_topology_state);
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
@@ -5741,22 +5762,12 @@ int drm_dp_mst_topology_mgr_init(struct drm_dp_mst_topology_mgr *mgr,
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
2.52.0

