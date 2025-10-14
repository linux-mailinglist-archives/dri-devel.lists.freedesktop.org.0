Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEFBBD92C2
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 14:00:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD0A610E5CA;
	Tue, 14 Oct 2025 12:00:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lFmKldl6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09C210E5CA
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 12:00:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A6A0B40B38;
 Tue, 14 Oct 2025 12:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30289C4CEE7;
 Tue, 14 Oct 2025 12:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760443225;
 bh=RSaZoICcBujpcuGt/6L2pVjmD/EPbuMMBI87//96Pf4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=lFmKldl6/cljhQAwHoxxHjv63Vg4FUP6zZ7YQau+o2wvCrj6K/vYXolnSnQi0Yw8O
 yDTzgefpsi743vwhMuZMONYjxjMJFXvrMWPc4MnaDGUP2IDrsqJasFy0loXnv5J4kt
 MqQrM4sN0Z8AgyemL3RZVOqGxYCHForeyUJgCaEJrs4GozL3LS3WS71avfrK9LK4+W
 KHWfMJFYlAEgVpPFLAIxbjiz+Dl4LxOejBI438ZLPFRX/QsKmLdtaSAc1iAqC3DaOS
 JTCLgUqSZdtjzIimvVcXNxoU51OZzuPoIbSNBD69RtYMCanTKdVp6kaw3d1U92VRcA
 /YZdPhvyMrIyA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 14 Oct 2025 11:31:48 +0200
Subject: [PATCH v2 04/16] drm/atomic-helper: Add private_obj
 atomic_create_state helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-drm-private-obj-reset-v2-4-6dd60e985e9d@kernel.org>
References: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
In-Reply-To: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3102; i=mripard@kernel.org;
 h=from:subject:message-id; bh=RSaZoICcBujpcuGt/6L2pVjmD/EPbuMMBI87//96Pf4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnvrF2PCQj6NAUf3s+af0+oRWqTImNo59f4z2e51ohzf
 l23TtSjYyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEyEOZCxvt45IjHD1vfCHI29
 PZ+/Cu2ZeJov75n9htzdq1qDLh7140l1kRXmTPpz34JbKaHrWzYPYw13p9HiC3tkLy0+svfX68V
 iD296rpr35QPz2vN3liQ6tBmkML+reWZiukLkl0y1rNKewBMA
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

Now that we have an atomic_create_state callback for drm_private_objs,
we can provide a helper for it.

It's somewhat different from the other similar helpers though, because
we definitely expect drm_private_obj to be subclassed. It wouldn't make
sense for a driver to use it as-is.

So we can't provide a straight implementation of the atomic_create_state
callback, but rather we provide the parts that will deal with the
drm_private_obj initialization, and we will leave the allocation and
initialization of the subclass to drivers.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 22 ++++++++++++++++++++++
 include/drm/drm_atomic_state_helper.h     |  3 +++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 7142e163e618ea0d7d9d828e1bd9ff2a6ec0dfeb..86e368051a21005ee867a555410bf94b1ab6a168 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -707,10 +707,32 @@ void drm_atomic_helper_connector_destroy_state(struct drm_connector *connector,
 	__drm_atomic_helper_connector_destroy_state(state);
 	kfree(state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_destroy_state);
 
+/**
+ * __drm_atomic_helper_private_obj_create_state - initializes private object state
+ * @obj: private object
+ * @state: new state to initialize
+ *
+ * Initializes the newly allocated @state, usually required when
+ * initializing the drivers.
+ *
+ * @obj is assumed to be zeroed.
+ *
+ * This is useful for drivers that use private states.
+ */
+void __drm_atomic_helper_private_obj_create_state(struct drm_private_obj *obj,
+						  struct drm_private_state *state)
+{
+	if (state)
+		state->obj = obj;
+
+	obj->state = state;
+}
+EXPORT_SYMBOL(__drm_atomic_helper_private_obj_create_state);
+
 /**
  * __drm_atomic_helper_private_obj_duplicate_state - copy atomic private state
  * @obj: CRTC object
  * @state: new private object state
  *
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index b9740edb26586d58f99a5223902bb8e333ac75a2..900672c6ea90ba9cb87e38a7c84225972aee43c5 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -82,10 +82,13 @@ struct drm_connector_state *
 drm_atomic_helper_connector_duplicate_state(struct drm_connector *connector);
 void
 __drm_atomic_helper_connector_destroy_state(struct drm_connector_state *state);
 void drm_atomic_helper_connector_destroy_state(struct drm_connector *connector,
 					  struct drm_connector_state *state);
+
+void __drm_atomic_helper_private_obj_create_state(struct drm_private_obj *obj,
+						  struct drm_private_state *state);
 void __drm_atomic_helper_private_obj_duplicate_state(struct drm_private_obj *obj,
 						     struct drm_private_state *state);
 
 void __drm_atomic_helper_bridge_duplicate_state(struct drm_bridge *bridge,
 						struct drm_bridge_state *state);

-- 
2.51.0

