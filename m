Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJgCKZcEemlg1gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:44:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C1A9A168A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:44:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 803BA10E6BE;
	Wed, 28 Jan 2026 12:44:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LHNxOVAV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDDB10E6BE
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 12:44:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3430B600AD;
 Wed, 28 Jan 2026 12:44:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A82CC16AAE;
 Wed, 28 Jan 2026 12:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769604241;
 bh=Ekf+oXhzSU/gP59CKx2w6AC6rD/g3uXkS/Y2vrm32mA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=LHNxOVAVy6jNlOQFfg0rh035S0mU9S5LFg/XK5zpTdiNPmdSyayrU2uQrshL7PuLD
 pz13gYn1ef7UWJtN5Q48BJOxUx2iqjG+Udd6dn+0Mf4hU8B/bPJyCSUyUBiz1tM9fl
 rFuF1mccm02NTWdbvNva0jQn+ZK0YNvoZgzDjBMp+g5wROr+N37wcdzNUH4VBj+AHS
 Q1TzHRsdHwE2JfrRCYY9lwKXmdfwlVZN41kmERA4Fcqv+elyA566V0OBKk/9PKoxhg
 IqZ/jQ4fkh0Z1WeEShGthX1Bo/qEGpPFo/Yo3Ed5ILvWgPw4n9t3Dhk59rLShdshdo
 eC4A12aZMgTFw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 28 Jan 2026 13:43:45 +0100
Subject: [PATCH v4 01/15] drm/atomic: Make drm_atomic_private_obj_init fallible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260128-drm-private-obj-reset-v4-1-90891fa3d3b0@redhat.com>
References: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com>
In-Reply-To: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2966; i=mripard@redhat.com;
 h=from:subject:message-id; bh=Ekf+oXhzSU/gP59CKx2w6AC6rD/g3uXkS/Y2vrm32mA=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlVLK36Ub/O8p35J2v+zP9CXMLi9wWWvAGLZLQsj+2p9
 1dUkDrUMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACZSqM7Y0OkT7HPczuPSrsen
 9Hv0Jj9exHDn7tQittvL8jcsOho/vVzcf9W67PKcbo3MT5cnfpw9l7Hh20yHriALmZvXvYXdX0r
 1zdrLyjlhvfe/+yr72IQmfS7b38vQwKGU+njWpuL6WVM0XpkBAA==
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:mripard@kernel.org,m:ville.syrjala@linux.intel.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 2C1A9A168A
X-Rspamd-Action: no action

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

