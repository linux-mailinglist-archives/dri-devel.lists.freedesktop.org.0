Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 916C0D3A960
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:50:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47A810E43E;
	Mon, 19 Jan 2026 12:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tGV4YbpJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF11210E43E
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:50:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6DA6360131;
 Mon, 19 Jan 2026 12:50:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3582C19424;
 Mon, 19 Jan 2026 12:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768827017;
 bh=yngKePmNPi4a04QnDn6NYoQpo503jul+ZDitbHR00Rk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=tGV4YbpJjiHL3abogdw8cp5rQW+QKmncJZm8r+Ry1YkOqZdoe5ESEFUAqW05NIOpf
 uT6U44WgtKgkYzkXzKq/p4cWa32F4iIwS0HADkcU8yO/q1kteTM/FFaN3R45pK70H+
 B1rRQcpnHVPIWR3aLE4BEMVeV9PRcKZB4p+rXXiwmE2/zZ1YzBi0oRht7VFPgRgHU9
 yKmpxIOR6Gj9+VZbAndrNYRLT23Us8unJg2GhycnS3EX5o7+zIIFnr6nS2++LDUpLJ
 ykwlQZ39GJ2ciuHC21+FnA+D7Xc2bz1cgf/fkfUZilnimi0nu/NpYk2eMnf6Atoy31
 WTcSs/uVGni+Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 19 Jan 2026 13:49:58 +0100
Subject: [PATCH v3 02/15] drm/atomic: Add new atomic_create_state callback
 to drm_private_obj
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-drm-private-obj-reset-v3-2-b931abe3a5e3@redhat.com>
References: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
In-Reply-To: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3424; i=mripard@redhat.com;
 h=from:subject:message-id; bh=yngKePmNPi4a04QnDn6NYoQpo503jul+ZDitbHR00Rk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl5GlVsmXmVR0xXz1/6sazot8NJk/+/H0+8u9T9r3r+7
 Ku8vBFZHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiS2MY67PPfP3w5bmnatCB
 8L7Qn42qx5u279nl/sJg4YInkxbezz1yrypbdoflUfUPPAvmpVl8XcLY0CXbutT6V4ycwK//W/l
 n9Rxa2VOsOu319USF6asM92x42yDZtfhyquJ0DvHfYVH/TCeZAwA=
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
 drivers/gpu/drm/drm_atomic.c | 18 ++++++++++++++++--
 include/drm/drm_atomic.h     | 13 +++++++++++++
 2 files changed, 29 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 4191a8333fc4ebdfc10f664c837a3f1693eff022..e3029c8f02e5a3698781117bcc80eff98407cf16 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -939,15 +939,29 @@ int drm_atomic_private_obj_init(struct drm_device *dev,
 	memset(obj, 0, sizeof(*obj));
 
 	drm_modeset_lock_init(&obj->lock);
 
 	obj->dev = dev;
-	obj->state = state;
 	obj->funcs = funcs;
 	list_add_tail(&obj->head, &dev->mode_config.privobj_list);
 
-	state->obj = obj;
+	/*
+	 * Not all users of drm_atomic_private_obj_init have been
+	 * converted to using &drm_private_obj_funcs.atomic_create_state yet.
+	 * For the time being, let's only call reset if the passed state is
+	 * NULL. Otherwise, we will fallback to the previous behaviour.
+	 */
+	if (!state) {
+		state = obj->funcs->atomic_create_state(obj);
+		if (IS_ERR(state))
+			return PTR_ERR(state);
+
+		obj->state = state;
+	} else {
+		obj->state = state;
+		state->obj = obj;
+	}
 
 	return 0;
 }
 EXPORT_SYMBOL(drm_atomic_private_obj_init);
 
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index 712f5fb977bff8a15592a3949444d9ac306e6c54..0b1b32bcd2bda1b92299fd369ba7c23b1c2d3dfa 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -259,10 +259,23 @@ struct drm_private_state;
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
2.52.0

