Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BACBD92BC
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 14:00:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F68410E5C6;
	Tue, 14 Oct 2025 12:00:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kx5+hKD5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1780610E5C6
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 12:00:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F20FE40B38;
 Tue, 14 Oct 2025 12:00:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AB4EC113D0;
 Tue, 14 Oct 2025 12:00:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760443219;
 bh=5w7dsEXq6uLzcp6kn7WPnYzsPdDCXepq/bbcxFElxKo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=kx5+hKD5I7rBNync2Zqyqy9Qp9zIPeeJtZzhrMjKBGQIQpVgYO3nnQBy+hwdnHeil
 EsPReilRUm7PLjmshE06PAbQCad0DI5fAwre46DzWzgZIrb9uZL6+6HMUKBUqCHa9s
 UUQOwkmecljjQRtVozd9aah7dn6C9YXrGOe9h8ASiRY7eD0T5OFPic9NOlJHpAlsBE
 wK0BEKxfhNeNfLqZ0UWDe1M98fbXCMbuxPa284aspOwwLfFc3dNgpgWYNTIaEjgCc0
 qZlpKxU5blwkkR9Lt2f+2zm97xvgsMPxoEkRKUcio5sgeNI5SoP+8FiqECIoS6CvSm
 VL/R9cIqyWSvg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 14 Oct 2025 11:31:46 +0200
Subject: [PATCH v2 02/16] drm/atomic: Make drm_atomic_private_obj_init fallible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251014-drm-private-obj-reset-v2-2-6dd60e985e9d@kernel.org>
References: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
In-Reply-To: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2991; i=mripard@kernel.org;
 h=from:subject:message-id; bh=5w7dsEXq6uLzcp6kn7WPnYzsPdDCXepq/bbcxFElxKo=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnvrF3sHq7NWc9v4DErZaJu48eO4p9z+JpCNdZbNGudX
 fch7dnkjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCR86sY60PnLHqs/UnC+biY
 0Lxzcz5XsJ0pFC6a6Fu0lv1q0m+pao6fnqybtptIRH043xeVsqYyirHh4eOvC+vDe/dXrLu3jU2
 pyDS/Wu0M87XzKie/bP4klDTBpkR7zcUqK723sw608p4r3fQCAA==
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

Since we're going to move the drm_private_obj state allocation to a
callback, we need to be able to deal with its possible failure.

Make drm_private_obj_init return an error code on failure.

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 14 +++++++++-----
 include/drm/drm_atomic.h     |  8 ++++----
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 39cb1479ac4d58cd71cf41d27d0d2a8a58ef5791..a5c5617266ae1dfe6038baeee6dfa3828c626683 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -779,16 +779,18 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
  * @funcs: pointer to the struct of function pointers that identify the object
  * type
  *
  * Initialize the private object, which can be embedded into any
  * driver private object that needs its own atomic state.
+ *
+ * RETURNS:
+ * Zero on success, error code on failure
  */
-void
-drm_atomic_private_obj_init(struct drm_device *dev,
-			    struct drm_private_obj *obj,
-			    struct drm_private_state *state,
-			    const struct drm_private_state_funcs *funcs)
+int drm_atomic_private_obj_init(struct drm_device *dev,
+				struct drm_private_obj *obj,
+				struct drm_private_state *state,
+				const struct drm_private_state_funcs *funcs)
 {
 	memset(obj, 0, sizeof(*obj));
 
 	drm_modeset_lock_init(&obj->lock);
 
@@ -796,10 +798,12 @@ drm_atomic_private_obj_init(struct drm_device *dev,
 	obj->state = state;
 	obj->funcs = funcs;
 	list_add_tail(&obj->head, &dev->mode_config.privobj_list);
 
 	state->obj = obj;
+
+	return 0;
 }
 EXPORT_SYMBOL(drm_atomic_private_obj_init);
 
 /**
  * drm_atomic_private_obj_fini - finalize private object
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index dac70f685361d8d29844acd1b0cc2f04f43a9499..9b3fb98b1e88c38877abdcb9df4d1c9540768833 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -606,14 +606,14 @@ drm_atomic_get_plane_state(struct drm_atomic_state *state,
 			   struct drm_plane *plane);
 struct drm_connector_state * __must_check
 drm_atomic_get_connector_state(struct drm_atomic_state *state,
 			       struct drm_connector *connector);
 
-void drm_atomic_private_obj_init(struct drm_device *dev,
-				 struct drm_private_obj *obj,
-				 struct drm_private_state *state,
-				 const struct drm_private_state_funcs *funcs);
+int drm_atomic_private_obj_init(struct drm_device *dev,
+				struct drm_private_obj *obj,
+				struct drm_private_state *state,
+				const struct drm_private_state_funcs *funcs);
 void drm_atomic_private_obj_fini(struct drm_private_obj *obj);
 
 struct drm_private_state * __must_check
 drm_atomic_get_private_obj_state(struct drm_atomic_state *state,
 				 struct drm_private_obj *obj);

-- 
2.51.0

