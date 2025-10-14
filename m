Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEB5BD92BF
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 14:00:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 078DC10E5C9;
	Tue, 14 Oct 2025 12:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="HvgzsiXk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E7610E5C7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 12:00:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B8E7244A42;
 Tue, 14 Oct 2025 12:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42323C4CEE7;
 Tue, 14 Oct 2025 12:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760443222;
 bh=GLcRxwJUlvTj1L8l1iXaapPNAlhOQdVWIQFXJdKAWzc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=HvgzsiXkUrFd32amPNjPmrMq9u0PXd364expAOSvfwZbnSnJ4fDle10K6mb8+hRuE
 3gvI/4nU2PrzyUr7Yw7K3xdwZYHMXiqDKNbAC6Aot8iqdzt9HlyShx3GLYul8n4JkH
 P2yjsG+uMMNkGJWFQw78FqTuq/G5y1mXulFhmIRrz0Ybp30ESLcAvq8Hexoa6wQgwR
 tMeRKq6dEyM3e/bqcqYLSQNmWMk0MkCZYw4rlSzUL2Y7oUTLpgRh/aJpXdXEo5G3LS
 tlBDUwTa5RfEJ3B2TUDcNIk1Jy36zCGp9qMhm7dHr8HIiiedrJurdWWTyNYkS/SDje
 FNzmAuLfbj27Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 14 Oct 2025 11:31:47 +0200
Subject: [PATCH v2 03/16] drm/atomic: Add new atomic_create_state callback
 to drm_private_obj
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-drm-private-obj-reset-v2-3-6dd60e985e9d@kernel.org>
References: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
In-Reply-To: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3465; i=mripard@kernel.org;
 h=from:subject:message-id; bh=GLcRxwJUlvTj1L8l1iXaapPNAlhOQdVWIQFXJdKAWzc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnvrF1S+h1dCwWtXD69UX5a3rc6WjSFXfvQ8iPbHydl7
 qssUbbtmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABMJPcPYsDltcUaGj/ebs15H
 j6eyv31ml7bB7lfd4eszBE5HdBg9eHvjjAN3SsLRlcd+5Qe6i4b4MjZ0vTKc1XJ9c3fvWonHqrr
 uzI9CPRSXR5/b9d2022BvyLkNKpdED7jvmnJZ+eKDB9mrzrAAAA==
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

However, reset really is meant to reset the hardware and software state.
That it creates an initial state is a side-effect that has been used in
all objects but drm_private_obj. This is made more complex since some
drm_private_obj, the DisplayPort ones in particular, need to be
persistent across and suspend/resume cycle, and such a cycle would call
drm_mode_config_reset().

Thus, we need to add a new callback to allocate a pristine state for a
given private object.

This discussion has also came up during the atomic state readout
discussion, so it might be introduced into the other objects later on.

Until all drivers are converted to that new allocation pattern, we will
only call it if the passed state is NULL. This will be removed
eventually.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 20 ++++++++++++++++++--
 include/drm/drm_atomic.h     | 13 +++++++++++++
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index a5c5617266ae1dfe6038baeee6dfa3828c626683..36b56c71cb4e1ddc57577df724efe7d89b4fb6a9 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -793,15 +793,31 @@ int drm_atomic_private_obj_init(struct drm_device *dev,
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
+		if (obj->funcs->atomic_create_state) {
+			state = obj->funcs->atomic_create_state(obj);
+			if (IS_ERR(state))
+				return PTR_ERR(state);
+
+			obj->state = state;
+		}
+	} else {
+		obj->state = state;
+		state->obj = obj;
+	}
 
 	return 0;
 }
 EXPORT_SYMBOL(drm_atomic_private_obj_init);
 
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 9b3fb98b1e88c38877abdcb9df4d1c9540768833..10a71c4b6afc316f07023756be4cd3ed1d1d2974 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -205,10 +205,23 @@ struct drm_private_state;
  * added to the atomic states is expected to have an implementation of these
  * hooks and pass a pointer to its drm_private_state_funcs struct to
  * drm_atomic_get_private_obj_state().
  */
 struct drm_private_state_funcs {
+	/**
+	 * @atomic_create_state:
+	 *
+	 * Allocates a pristine, initialized, state for the private
+	 * object and returns it.
+	 *
+	 * RETURNS:
+	 *
+	 * A new, pristine, private state instance or an error pointer
+	 * on failure.
+	 */
+	struct drm_private_state *(*atomic_create_state)(struct drm_private_obj *obj);
+
 	/**
 	 * @atomic_duplicate_state:
 	 *
 	 * Duplicate the current state of the private object and return it. It
 	 * is an error to call this before obj->state has been initialized.

-- 
2.51.0

