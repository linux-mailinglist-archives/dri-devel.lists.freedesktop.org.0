Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 664EFBC4B05
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 14:04:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDBB110E7E6;
	Wed,  8 Oct 2025 12:04:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="I2E+lnjC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C490910E7EE
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 12:04:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 47D3561F7F;
 Wed,  8 Oct 2025 12:04:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DD81C4CEF5;
 Wed,  8 Oct 2025 12:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759925071;
 bh=+LUf/ubKInC3WXquKkpXxJFnykBMBKaJ+FHEf+Wj8Vs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=I2E+lnjC3HZTVV5Q1OZF5GZEljsAqO1R8sG9kuFYTOb5Djoe45thigsHfO3hhnS1X
 dTAu0P1gvOmql3hXSCYC/5079GM2GFaq2vUehWuNO+4qVuKkR34+HQip+p3Eg1qkLN
 uZp8IlCSCYdLQ2nirrcSSONTW00r3JB78ar0vah0+F+YnG+8KbUU10Ego2yXRcq0V5
 o7YHTBKnGPIqH6NrU2VUVLIqjmz6sB0cwAtImXJyj7Vn/amWX4XviNPVecoCAd/Qpz
 GtRMQKRADoy5dGJ9hG3jfra7kxpfoLL5tCSqrIa6XgQiGROKL0Cwszr+qhoPn44FLW
 xmQi4c4ylQffQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 08 Oct 2025 14:04:04 +0200
Subject: [PATCH 06/16] drm/dp_tunnel: Switch private_obj initialization to
 reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-drm-private-obj-reset-v1-6-805ab43ae65a@kernel.org>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
In-Reply-To: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2578; i=mripard@kernel.org;
 h=from:subject:message-id; bh=+LUf/ubKInC3WXquKkpXxJFnykBMBKaJ+FHEf+Wj8Vs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnPgk3DP+8MmXqkIOFKyEm+Jt9NjxT/qvVsv8UvvK6lS
 96O/eOejqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRCAPG+qi24xf9whLvyJZc
 Y5bRqWv531Swvtsur/KQf8yXz5NmTlZL/Bk4b32giGvTjMzkP7dPMjace/h5w9bpCf3na+Q+772
 5Q3uhG3uVuGPAlwUth+M5nWdH+e+oiFz3k3vzoxkHcj4ENXsCAA==
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

The DP tunnel implementation relies on a drm_private_obj, that is
initialized by allocating and initializing a state, and then passing it
to drm_private_obj_init.

Since we're gradually moving away from that pattern to the more
established one relying on a reset implementation, let's migrate this
instance to the new pattern.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/drm_dp_tunnel.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_tunnel.c b/drivers/gpu/drm/display/drm_dp_tunnel.c
index 43f13a7c79b931beb230f8afe20afa0ebcf5ed8d..ae6c6ca99417bf7d99186dd2648f0525c633a8d5 100644
--- a/drivers/gpu/drm/display/drm_dp_tunnel.c
+++ b/drivers/gpu/drm/display/drm_dp_tunnel.c
@@ -1495,13 +1495,31 @@ tunnel_group_duplicate_state(struct drm_private_obj *obj)
 static void tunnel_group_destroy_state(struct drm_private_obj *obj, struct drm_private_state *state)
 {
 	free_group_state(to_group_state(state));
 }
 
+static void tunnel_group_reset(struct drm_private_obj *obj)
+{
+	struct drm_dp_tunnel_group_state *group_state;
+
+	if (obj->state) {
+		tunnel_group_destroy_state(obj, obj->state);
+		obj->state = NULL;
+	}
+
+	group_state = kzalloc(sizeof(*group_state), GFP_KERNEL);
+	if (!group_state)
+		return;
+
+	__drm_atomic_helper_private_obj_reset(obj, &group_state->base);
+	INIT_LIST_HEAD(&group_state->tunnel_states);
+}
+
 static const struct drm_private_state_funcs tunnel_group_funcs = {
 	.atomic_duplicate_state = tunnel_group_duplicate_state,
 	.atomic_destroy_state = tunnel_group_destroy_state,
+	.reset = tunnel_group_reset,
 };
 
 /**
  * drm_dp_tunnel_atomic_get_state - get/allocate the new atomic state for a tunnel
  * @state: Atomic state
@@ -1579,23 +1597,15 @@ drm_dp_tunnel_atomic_get_new_state(struct drm_atomic_state *state,
 }
 EXPORT_SYMBOL(drm_dp_tunnel_atomic_get_new_state);
 
 static bool init_group(struct drm_dp_tunnel_mgr *mgr, struct drm_dp_tunnel_group *group)
 {
-	struct drm_dp_tunnel_group_state *group_state;
-
-	group_state = kzalloc(sizeof(*group_state), GFP_KERNEL);
-	if (!group_state)
-		return false;
-
-	INIT_LIST_HEAD(&group_state->tunnel_states);
-
 	group->mgr = mgr;
 	group->available_bw = -1;
 	INIT_LIST_HEAD(&group->tunnels);
 
-	drm_atomic_private_obj_init(mgr->dev, &group->base, &group_state->base,
+	drm_atomic_private_obj_init(mgr->dev, &group->base, NULL,
 				    &tunnel_group_funcs);
 
 	return true;
 }
 

-- 
2.51.0

