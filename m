Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGHcJpsEemlE1gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:44:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35942A1692
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:44:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80AEF10E6C1;
	Wed, 28 Jan 2026 12:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZX5m6TVM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5081010E6BE
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 12:44:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 37F4643483;
 Wed, 28 Jan 2026 12:44:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B73DFC4CEF1;
 Wed, 28 Jan 2026 12:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769604245;
 bh=V7Ma3X7LG48w9HTyefbNoIpfRHkOODEjeQOmUZZ1GVs=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ZX5m6TVM0FK3X4z161c2bgcLSZ74aELxkaV+3Pamr9vblG9jdC+o/I9j4ZV3DBA/L
 ptz/HiE6nNlyq7XZWKzy2uB3YevKucADcBjLSrNXhLLLuwkEU29dBRGCSVis8QTqk/
 8KrwCFiFHAiKOx0YvtWhQLDR7JqOWsXXxZFPsJh+F7QJKIpflGgVvFtm8uf+lMzVf1
 3xitfaQmk+IQjjXaa9ixT8mJN9RPvXxDHZhWPOESPOE2JoVKx6CXPpYw9BkPawKRxS
 r5LMD66jFkGdQgMXoK3Kn2JQN/DPW39vd8oFj5SvZHcdEONTplVUlGOcdTSc0rrVdb
 VYertN/wbPxsA==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 28 Jan 2026 13:43:46 +0100
Subject: [PATCH v4 02/15] drm/atomic: Add new atomic_create_state callback
 to drm_private_obj
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-drm-private-obj-reset-v4-2-90891fa3d3b0@redhat.com>
References: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com>
In-Reply-To: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3491; i=mripard@redhat.com;
 h=from:subject:message-id; bh=V7Ma3X7LG48w9HTyefbNoIpfRHkOODEjeQOmUZZ1GVs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlVLK0PZT98Vo+Tmsxm0HpxNytD80v5hLR0nzdxtSYSU
 aG6E053TGVhEOZkkBVTZHkiE3Z6efviKgf7lT9g5rAygQxh4OIUgIm0ZDPW8LDpaMv57Z9+2Xdn
 ydqDWyouKHo+zpzbV6W56623i8Nhc9WIIvn7FXxKy6vlcpW2JD9mbNi5vO+W8ztDcc83UXEiqyR
 Pfr3qFZ16b8OtmRVv3t9nlLrQ71iufjepafVDsSJ7a7eAVAA=
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
X-Rspamd-Queue-Id: 35942A1692
X-Rspamd-Action: no action

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
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

