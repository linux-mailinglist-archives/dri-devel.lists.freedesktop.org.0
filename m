Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B244BD3A961
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:50:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C49310E434;
	Mon, 19 Jan 2026 12:50:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NKKeya6I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B329410E43F
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:50:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 3223660174;
 Mon, 19 Jan 2026 12:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87944C19423;
 Mon, 19 Jan 2026 12:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768827019;
 bh=k4ACM11sFEWSdoReu8ae8/hyKWekLUojKiNLlvhciUU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=NKKeya6IovRM6ROOFFnEJ/Zhsnf9Ft+dgO2IIm7CzgwKuxy/oKJtkVRLsOD6KsZpR
 cuTbvUpjzxnplTJkpQ09xNbVxSuEhyBvN8r9vmqEMrQhiSbiVLO9O8yhDAwmkJOlqj
 9YZD0A7ZTUZPKEm6Ofy8UQo4sAvrFdBNqDQJr3QjiftTrsmrXY9mu+vS59CuwCe0oy
 wiMKDM+iFFn+c7gL+SJYhl/R7UaQEaD+bSCdaqaDwlx1rMLUnBz1dwcYn9FVURYJV8
 Nuy0Hj166eY33d2eDczI+WRaRwPt304+rKNdwaw1MgYkwyuB3xhbYskdXYnqW9yleM
 ruMTpmmIhQsJg==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 19 Jan 2026 13:49:59 +0100
Subject: [PATCH v3 03/15] drm/atomic-helper: Add private_obj
 atomic_create_state helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-drm-private-obj-reset-v3-3-b931abe3a5e3@redhat.com>
References: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
In-Reply-To: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3169; i=mripard@redhat.com;
 h=from:subject:message-id; bh=k4ACM11sFEWSdoReu8ae8/hyKWekLUojKiNLlvhciUU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl5GlWiJziKMl1DDN0XMqXYzT3UYZF2tSnNIXLaLw275
 0w+G5Z0TGVhEOZkkBVTZHkiE3Z6efviKgf7lT9g5rAygQxh4OIUgIk4+jI23Jz39v6FKzd3aX4M
 lyjP8/j3ydb0RuSxwiNvUi7/FDLU0/jqEMF47mmp7KTl2/RN4lZmMNaHfD10yGlp6rTTl6Me69y
 fu/KmsUXMzPq31aVOoitV+bpULfUnPl8r5cqZJ8HRt+2BgT8A
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

Now that we have an atomic_create_state callback for drm_private_objs,
we can provide a helper for it.

It's somewhat different from the other similar helpers though, because
we definitely expect drm_private_obj to be subclassed. It wouldn't make
sense for a driver to use it as-is.

So we can't provide a straight implementation of the atomic_create_state
callback, but rather we provide the parts that will deal with the
drm_private_obj initialization, and we will leave the allocation and
initialization of the subclass to drivers.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 22 ++++++++++++++++++++++
 include/drm/drm_atomic_state_helper.h     |  3 +++
 2 files changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index cee6d8fc44adda6895542d33157d965a2d3c815f..d21f32f0ad51f4305f75d01be58dc404acf7674c 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -712,10 +712,32 @@ void drm_atomic_helper_connector_destroy_state(struct drm_connector *connector,
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
2.52.0

