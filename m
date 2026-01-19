Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C70DAD3A964
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:50:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F15810E43A;
	Mon, 19 Jan 2026 12:50:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="scP7R5li";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D48A10E43A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:50:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A508960131;
 Mon, 19 Jan 2026 12:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0658CC116C6;
 Mon, 19 Jan 2026 12:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768827028;
 bh=1jsKBhsarxzcC0RIOei7Dx5tLzFLI0qDxaVuSF3wykw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=scP7R5liyC+tl+zmW0Z1tiJ+gyxWxXU1G/XUVC34w682lWUobZ6qm7Cr12DobxHYu
 9mcGOrUPW/c5Ctej2hyfGsemILhqiA8S1sPN4wRDAOEjONDLSEFnCtxi4fItnDXV+C
 KHANLj4/ehWqP9l9z6+WunDw1qjVMymCp4c7NWbjOvxLx75C4q22+YyB3NaaPN7S9e
 z2IIAH1XHdf/A9viHuT5Dl6ketWWnbnMSHXwh5loArtnCNGOnh0uMGCdeyJcdJovcI
 9uo1UYVv+Ntnp3ZSWof9D7ywlzsl4TwieX6/Ll/40K/R8975XkXh6UXFXsbPo4xgCN
 10hsSG3NCjT7g==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 19 Jan 2026 13:50:02 +0100
Subject: [PATCH v3 06/15] drm/dp_tunnel: Switch private_obj initialization
 to atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-drm-private-obj-reset-v3-6-b931abe3a5e3@redhat.com>
References: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
In-Reply-To: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2498; i=mripard@redhat.com;
 h=from:subject:message-id; bh=1jsKBhsarxzcC0RIOei7Dx5tLzFLI0qDxaVuSF3wykw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl5GjXvEz7slOxmLGOcrvThGMvZl8lXcz969nC0q6ZvX
 pv1ouB8x1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZiI3wXGhlPKwQejPwstYu56
 ZPGI0/Iu24yEVpbZ62Yo/9rLxzPbm1/40Nau5z+f36z3LnO+v+NeNmOtbHuPo8RivV7p2eKcIVH
 XE7St06588zLakfjO4q7TQZe9a5aGXLFmk96Xufb2f/Hsk5EA
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
2.52.0

