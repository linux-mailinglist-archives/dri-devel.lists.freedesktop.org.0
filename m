Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD55AD3A95F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725F410E43D;
	Mon, 19 Jan 2026 12:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dYN9XZC2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B77D10E43A
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:50:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5D96D43473;
 Mon, 19 Jan 2026 12:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB646C19424;
 Mon, 19 Jan 2026 12:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768827014;
 bh=Ekf+oXhzSU/gP59CKx2w6AC6rD/g3uXkS/Y2vrm32mA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=dYN9XZC2EciyOZf5TR1+f78Q2S327PK3ZpvGNUqKv/jUHM7Q4SmQTsCEHcNGGrvCB
 CuE7db0875buOsDRtt4rLpOGpuwYW3LkAhE8nDduMueu9mtEkvi7+234PBarE5TQ4j
 S1xOmyxvHt0ab+7mPET0SmxGF7pxrhzx7B38h1OwF+9jABkk89Ma/3KkSnU/QPdo2/
 2HMeoPmcC5JcrlG1Jv2VaYyWt+J38CnSVk2AwBumnCy6rQyVF3pVfwcOL1Jg8I0Njy
 TisL3JxgMX0YEZx1VtaeL4ASxfFFsOD2EslMHQuEo+oAm0nb7zbKa/00hKFK4658b0
 ssK5gOEfPoZig==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 19 Jan 2026 13:49:57 +0100
Subject: [PATCH v3 01/15] drm/atomic: Make drm_atomic_private_obj_init fallible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260119-drm-private-obj-reset-v3-1-b931abe3a5e3@redhat.com>
References: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
In-Reply-To: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2966; i=mripard@redhat.com;
 h=from:subject:message-id; bh=Ekf+oXhzSU/gP59CKx2w6AC6rD/g3uXkS/Y2vrm32mA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl5GlX5N+5lWYjLXnT1yGxOPjtd+jyH4p8HseErNwT/P
 ySU3KXSMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACYi8Imx4a9zoYnf/aDN/dVP
 azYfWee84ul/16mVxe53BS5/W1O5seGiNrPchOlsW+/wxk56lFnny1ifvmOZit2D2TqfmN8tST1
 wd3UCq/Hq2pr86SsdpXe4RO9oijq6+eg207mr470WKq7809YNAA==
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
index 52738b80ddbeb124896f6124df5628e2ac27faa4..4191a8333fc4ebdfc10f664c837a3f1693eff022 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -925,16 +925,18 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
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
 
@@ -942,10 +944,12 @@ drm_atomic_private_obj_init(struct drm_device *dev,
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
index 178f8f62c80fc58fe42e8564a716da1a99ddb7da..712f5fb977bff8a15592a3949444d9ac306e6c54 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -721,14 +721,14 @@ drm_atomic_get_new_colorop_state(struct drm_atomic_state *state,
 
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
2.52.0

