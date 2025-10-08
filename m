Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AA6BC4AFC
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 14:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A5C710E7E7;
	Wed,  8 Oct 2025 12:04:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NUeeT74O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78ED310E7E6
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 12:04:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 334AB418FD;
 Wed,  8 Oct 2025 12:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC04C4CEF4;
 Wed,  8 Oct 2025 12:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759925062;
 bh=W7nlhIZMClTOKSFfMT6F2z4s3YZMaC19e7keZZVDaHc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=NUeeT74OAqEv4KipBY1R7eAGjgD9zBIGil4Q5yGgO2rrPuV94+PTVaBBQd6vxMyf4
 caKfgfVma5Y+O2VwzvFC4/fky4TYMRuXOPQ+rnsWvAS1Ie75BxEZjuY7WllNl56832
 kDcnclCcJ0Sa9q+hrY/iutoadLueMNMNB53W2KlN0/cSpqOaU9y3K75meRGQG7A9FU
 tbb+r25gTal8NEtiO59eqZGumrAl4qSP7m1m5eLV8du9WOBLfPYtiAhOTVGzFtPlDk
 +2aBdXenkJIrgEJOPlqYbxcHsKCfdzVZvWHFCqRQazFnMLoQ4EICa9+RvTicc4XUpQ
 cZlH/THNaIwLA==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 08 Oct 2025 14:04:01 +0200
Subject: [PATCH 03/16] drm/atomic-helper: Add private_obj reset helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-drm-private-obj-reset-v1-3-805ab43ae65a@kernel.org>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
In-Reply-To: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3177; i=mripard@kernel.org;
 h=from:subject:message-id; bh=W7nlhIZMClTOKSFfMT6F2z4s3YZMaC19e7keZZVDaHc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnPgk04JnXNDRXI5c171G+b/vJI0/tvwjv2lF7Iyt/c2
 FQw/dK/jqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjAR50OMDTv2BO3zONIkEhCz
 1/mXX6vzlpuTz3y9wftlR3nonrwJzG+rN9ybLhCfxPBEzX/9rd5z3xkrGblKNnswrsvvMJgttWj
 nbuOf5in+P2JtZk9auCls2um3FqXaSbyTw7etqS04G/3jmugnAA==
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

Now that we have a reset callback for drm_private_objs, we can provide a
helper for it.

It's somewhat different from the other similar helpers though, because
we definitely expect drm_private_obj to be subclassed. It wouldn't make
sense for a driver to use it as-is.

So we can't provide a straight implementation of the reset callback, but
rather we provide the parts that will deal with the drm_private_obj
initialization, and we will leave the allocation and initialization of
the subclass to drivers.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 24 ++++++++++++++++++++++++
 include/drm/drm_atomic_state_helper.h     |  3 +++
 2 files changed, 27 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 7142e163e618ea0d7d9d828e1bd9ff2a6ec0dfeb..f88007fe8dba2e79d5942deec3cfdd7757c1a460 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -707,10 +707,34 @@ void drm_atomic_helper_connector_destroy_state(struct drm_connector *connector,
 	__drm_atomic_helper_connector_destroy_state(state);
 	kfree(state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_destroy_state);
 
+/**
+ * __drm_atomic_helper_private_obj_reset - reset state on private objects
+ * @obj: private object
+ * @state: new state to initialize
+ *
+ * Initializes the newly allocated @state and assigns it to the
+ * &drm_private_obj->state pointer of @obj, usually required when
+ * initializing the drivers or when called from the
+ * &drm_private_state_funcs.reset hook.
+ *
+ * @obj is assumed to be zeroed.
+ *
+ * This is useful for drivers that use private states.
+ */
+void __drm_atomic_helper_private_obj_reset(struct drm_private_obj *obj,
+					   struct drm_private_state *state)
+{
+	if (state)
+		state->obj = obj;
+
+	obj->state = state;
+}
+EXPORT_SYMBOL(__drm_atomic_helper_private_obj_reset);
+
 /**
  * __drm_atomic_helper_private_obj_duplicate_state - copy atomic private state
  * @obj: CRTC object
  * @state: new private object state
  *
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index b9740edb26586d58f99a5223902bb8e333ac75a2..150ea227c595eab8c45b106baf09ce5b27a89a5a 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -82,10 +82,13 @@ struct drm_connector_state *
 drm_atomic_helper_connector_duplicate_state(struct drm_connector *connector);
 void
 __drm_atomic_helper_connector_destroy_state(struct drm_connector_state *state);
 void drm_atomic_helper_connector_destroy_state(struct drm_connector *connector,
 					  struct drm_connector_state *state);
+
+void __drm_atomic_helper_private_obj_reset(struct drm_private_obj *obj,
+					   struct drm_private_state *state);
 void __drm_atomic_helper_private_obj_duplicate_state(struct drm_private_obj *obj,
 						     struct drm_private_state *state);
 
 void __drm_atomic_helper_bridge_duplicate_state(struct drm_bridge *bridge,
 						struct drm_bridge_state *state);

-- 
2.51.0

