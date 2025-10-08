Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70366BC4AF9
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 14:04:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADE6110E7E5;
	Wed,  8 Oct 2025 12:04:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aBeboITv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E44F10E7E5
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 12:04:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 916126120A;
 Wed,  8 Oct 2025 12:04:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E58ABC4CEF4;
 Wed,  8 Oct 2025 12:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759925059;
 bh=yG8BcMGPi99IweSrAJoydmDd2mVH6vqs0FvmEKbC930=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=aBeboITvgdbfJQ6YHPsNNFDKCaEt46JAUeYziG3LLJ7jV428brCs3v6OQpnnQj+KM
 85Njk8VyRGbDqHElEL/QQmgoBizt1KJaRpZXnJWkaPn/j6EiGYLGRzLQrkSfMPNQdZ
 q8qI30MWRDTIQleDF77b919MuXg0pE8JV0NjkyJdzk2JJJk4iG5J4lCtXSikhIt9N1
 p/vLmFrMgin3CYquAYu0/TaHiGH2/JhBHmsn71iFWNNRh2pgf711jvEKMHnQRIPQ3N
 QGIQy8NmnyhUHUdshDeoQ8ClIXyIgsfBf8H7+pAG5m5SVZOHE8LpAWsXBi/RXEXuUZ
 4b8O+8AL93A1A==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 08 Oct 2025 14:04:00 +0200
Subject: [PATCH 02/16] drm/atomic: Add reset to drm_private_obj
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-drm-private-obj-reset-v1-2-805ab43ae65a@kernel.org>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
In-Reply-To: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2796; i=mripard@kernel.org;
 h=from:subject:message-id; bh=yG8BcMGPi99IweSrAJoydmDd2mVH6vqs0FvmEKbC930=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnPgo05FVSsjmRxpfyfUiHPz2zn7SD2fOrhpJAbNUGzm
 MPelZzqmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABNRm89Yp7z5yqptpw7ujp7a
 yqaycfJzU7/JCd5WVjmZK8N3OCuZLVcvtrpy7kLxH5M4/T7vIyeMGBs2WphMVN+fuUrw6BOrBP8
 lkTIz9j1j9EnefNGe/YadiGy8Q25AQMK59+6fyltNut8slAIA
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

The drm_private_obj initialization was inconsistent with the rest of the
KMS objects. Indeed, it required to pass a preallocated state in
drm_private_obj_init(), while all the others objects would have a reset
callback that would be called later on to create the state.

Let's prepare for the migration of all private objs implementation by
introducing a reset callback in drm_private_state_funcs, and by calling
it if the passed state is NULL.

The latter will be removed eventually, once every driver has been
converted.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 15 +++++++++++++--
 include/drm/drm_atomic.h     |  9 +++++++++
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 39cb1479ac4d58cd71cf41d27d0d2a8a58ef5791..45c26294e712fd36b43e87548072c3c0e9af1887 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -791,15 +791,26 @@ drm_atomic_private_obj_init(struct drm_device *dev,
 	memset(obj, 0, sizeof(*obj));
 
 	drm_modeset_lock_init(&obj->lock);
 
 	obj->dev = dev;
-	obj->state = state;
 	obj->funcs = funcs;
 	list_add_tail(&obj->head, &dev->mode_config.privobj_list);
 
-	state->obj = obj;
+	/*
+	 * Not all users of drm_atomic_private_obj_init have been
+	 * converted to using &drm_private_obj_funcs.reset yet. For the
+	 * time being, let's only call reset if the passed state is
+	 * NULL. Otherwise, we will fallback to the previous behaviour.
+	 */
+	if (!state) {
+		if (obj->funcs->reset)
+			obj->funcs->reset(obj);
+	} else {
+		obj->state = state;
+		state->obj = obj;
+	}
 }
 EXPORT_SYMBOL(drm_atomic_private_obj_init);
 
 /**
  * drm_atomic_private_obj_fini - finalize private object
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index dac70f685361d8d29844acd1b0cc2f04f43a9499..fbac6d4c75fc86535cf153745b6132f8705c808a 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -205,10 +205,19 @@ struct drm_private_state;
  * added to the atomic states is expected to have an implementation of these
  * hooks and pass a pointer to its drm_private_state_funcs struct to
  * drm_atomic_get_private_obj_state().
  */
 struct drm_private_state_funcs {
+	/**
+	 * @reset:
+	 *
+	 * Resets the private state to its default state, and the
+	 * hardware to off if any.. This function isn't called by the
+	 * core directly, only through drm_mode_config_reset().
+	 */
+	void (*reset)(struct drm_private_obj *obj);
+
 	/**
 	 * @atomic_duplicate_state:
 	 *
 	 * Duplicate the current state of the private object and return it. It
 	 * is an error to call this before obj->state has been initialized.

-- 
2.51.0

