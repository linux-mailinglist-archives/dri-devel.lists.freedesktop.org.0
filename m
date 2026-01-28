Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOcGEFoGemlE1gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:51:38 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8705AA197F
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:51:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C26710E2B7;
	Wed, 28 Jan 2026 12:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fY7wHP7m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6AAE10E2B7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 12:51:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 4625760007;
 Wed, 28 Jan 2026 12:44:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D81CC4CEF1;
 Wed, 28 Jan 2026 12:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769604248;
 bh=k4ACM11sFEWSdoReu8ae8/hyKWekLUojKiNLlvhciUU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=fY7wHP7mk4sMU8e99fCQocbjYcOK/KRfyCSzhHJhMG6rT+0k9tNTXHvFHgCou78nY
 NIGFfTObsDpThl+6xJmrTgUPx6PJ6yP0+k9k/OT3QQOeyPih/uIvZ5agwaAheSQNyg
 zhbGGKCzEOgMWw5keqTHIFEqrpAgJmXlsInyd0uPh7GvJJwYK4K8lBpbyk68tZIiNG
 omkZ453+eZ011qj1JtqFXKN6zWjE88Ouh6htBRJWYm4qveiS2l3U3h3Pbr8lDjNmwP
 l1DEblTHDJ6nNkggs/olR3PkJPgsEWNlMAg+m8eq6VrdnjfOO81WglvDb0TKUJl5pL
 GMItcGWbi3c0Q==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 28 Jan 2026 13:43:47 +0100
Subject: [PATCH v4 03/15] drm/atomic-helper: Add private_obj
 atomic_create_state helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-drm-private-obj-reset-v4-3-90891fa3d3b0@redhat.com>
References: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com>
In-Reply-To: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3169; i=mripard@redhat.com;
 h=from:subject:message-id; bh=k4ACM11sFEWSdoReu8ae8/hyKWekLUojKiNLlvhciUU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlVLG0pW2Sk1mcdDvA+8v7aupjs2UH6IqfkKkQmuC6fx
 fb75Ef+jqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRtdMYGz4FKR/p0TqzbOJt
 2U1K25m/PmpoOn+5JXna810T1BlWbYje0OhhaeOe12lbIhT51DjnDWO9k+vZEMX18cniZ5t11x7
 zTa57WpL41kkr+uIBq5/7Jh+/uDNY0/nNT0ddwY2Sz3f1COwAAA==
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
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:mripard@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 8705AA197F
X-Rspamd-Action: no action

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

