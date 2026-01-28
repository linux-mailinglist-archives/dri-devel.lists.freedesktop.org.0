Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HuVJ6MEemlg1gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:44:19 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 513E4A16B8
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:44:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFE110E6C7;
	Wed, 28 Jan 2026 12:44:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="K3vnME2f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8BB210E6C6
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 12:44:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A0826402D9;
 Wed, 28 Jan 2026 12:44:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B851C4CEF1;
 Wed, 28 Jan 2026 12:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769604253;
 bh=l9Vv9UBt4DIr2XrHGDWSfE1pmvfjHpd7sHx5Mz8Kf1g=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=K3vnME2ftkw0nS1upKKBeKbXVCAwlfz6LTOVzDxhlUINc7JsbKJwpDskoOBuYUGqS
 HJP5VYAMyEY8+ebrt+JyGp8dt2YrZ6GpWpUVhhA4Tu64q7ZJyZbA6Xj9u5pKQHkBGx
 GDsyf5QgmsYrR6OCdkIM7bSc9LunijOKuW/+6UXe0/wyyfRmUqA9MdaQDDLxZVY+xc
 ikk2RPhhI+YftVmpquls0S90NF65kxxph8ZcPJlacu7bn6vm39EdF+IRYDC9xXAlQ2
 Ekq5BkaidRXJYoEQIdUJ0c4UOW5QAz9VEl89JRHCavaKsCYAzAExE5Gr7WB9ziN28J
 n5bUWj4e/aVDg==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 28 Jan 2026 13:43:49 +0100
Subject: [PATCH v4 05/15] drm/dp_mst: Switch private_obj initialization to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-drm-private-obj-reset-v4-5-90891fa3d3b0@redhat.com>
References: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com>
In-Reply-To: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3520; i=mripard@redhat.com;
 h=from:subject:message-id; bh=l9Vv9UBt4DIr2XrHGDWSfE1pmvfjHpd7sHx5Mz8Kf1g=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlVLO03z6fnH/NO3VOT9ZB5MdPbbcEFrC1nj17pncr3w
 n3/FSWfjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjARrkeMDXOeKc9yPjmB8e/q
 xO5NlR0i4pPifxdtebfJhddWZP6lT9emml7nOvlzZk/jxs1uZ2pXlzDWmS9ctvXt9lUWC4Mefz7
 RtEJXQJxHNIpdRis0SGrWaofNyvUrpu3yXPM4bl+o0qrjre3rAQ==
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:mripard@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 513E4A16B8
X-Rspamd-Action: no action

The DP MST implementation relies on a drm_private_obj, that is
initialized by allocating and initializing a state, and then passing it
to drm_private_obj_init.

Since we're gradually moving away from that pattern to the more
established one relying on a atomic_create_state implementation, let's
migrate this instance to the new pattern.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

