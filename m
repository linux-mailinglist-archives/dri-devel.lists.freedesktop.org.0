Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10068BD92C8
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 14:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B76A10E5C8;
	Tue, 14 Oct 2025 12:00:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TtOoi9qB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD9110E5CD
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 12:00:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5869161E4A;
 Tue, 14 Oct 2025 12:00:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F48C4CEFE;
 Tue, 14 Oct 2025 12:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760443234;
 bh=vh13pW4fAteB8c1po7bhFaVUT/9haMj/GtR4Ms+u8eU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=TtOoi9qBs74g5Xnz7XeVlFkgSE7Q7evVN7VS66XBHtuoweLboM3k1NyjLTXSa93uG
 NI1oGA0b9mFx+7Um4AatuU3xYWikSKqmc3Ch5kb1g+cOCzuRVX762hOyfEgpku1XFJ
 30FuGbSuwNvkeOme5pwNz6w8jhPvfYL/AsPQB6LcI/f+uq5yalaKyPdrTzeqBhDvJZ
 eIe++YhYMmYqwPkX9vNtYKRSrSF7O410NdBEuLPw1zGsryqggjtuokv3O3W4sLau9/
 8FH1izghDk63yUtpuoPTiDSrBlzkhoR52i/IZxO/CSZSBRVq+YRgGNHXzlC5P65PI3
 W6KHUfEiaYGpA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 14 Oct 2025 11:31:51 +0200
Subject: [PATCH v2 07/16] drm/dp_tunnel: Switch private_obj initialization
 to atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-drm-private-obj-reset-v2-7-6dd60e985e9d@kernel.org>
References: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
In-Reply-To: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2498; i=mripard@kernel.org;
 h=from:subject:message-id; bh=vh13pW4fAteB8c1po7bhFaVUT/9haMj/GtR4Ms+u8eU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnvrN2EpzV/f9QxvTJdr3W66Kn8Z9rXt3VZWOff/2D/0
 9/0t4Ryx1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiI/kPGhmvd8fPiq1mS6158
 3vP6ioFQ2r0jx99/0S8Pm665R22nsofDpAl8Ev8St62IuWe54azzb8aGhpoyFsc95etFDpmeLDb
 KX7ngZX3o5UT/1suMiXtSbocLTU8zv6ikduaU9q2qiONJHscA
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
established one relying on a atomic_create_state implementation, let's
migrate this instance to the new pattern.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/display/drm_dp_tunnel.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_tunnel.c b/drivers/gpu/drm/display/drm_dp_tunnel.c
index 43f13a7c79b931beb230f8afe20afa0ebcf5ed8d..2abd714efd19f27697770813b38194e384be87ce 100644
--- a/drivers/gpu/drm/display/drm_dp_tunnel.c
+++ b/drivers/gpu/drm/display/drm_dp_tunnel.c
@@ -1495,11 +1495,26 @@ tunnel_group_duplicate_state(struct drm_private_obj *obj)
 static void tunnel_group_destroy_state(struct drm_private_obj *obj, struct drm_private_state *state)
 {
 	free_group_state(to_group_state(state));
 }
 
+static struct drm_private_state * tunnel_group_atomic_create_state(struct drm_private_obj *obj)
+{
+	struct drm_dp_tunnel_group_state *group_state;
+
+	group_state = kzalloc(sizeof(*group_state), GFP_KERNEL);
+	if (!group_state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &group_state->base);
+	INIT_LIST_HEAD(&group_state->tunnel_states);
+
+	return &group_state->base;
+}
+
 static const struct drm_private_state_funcs tunnel_group_funcs = {
+	.atomic_create_state = tunnel_group_atomic_create_state,
 	.atomic_duplicate_state = tunnel_group_duplicate_state,
 	.atomic_destroy_state = tunnel_group_destroy_state,
 };
 
 /**
@@ -1579,23 +1594,15 @@ drm_dp_tunnel_atomic_get_new_state(struct drm_atomic_state *state,
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

