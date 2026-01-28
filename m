Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qArKALsEemlg1gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:44:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FD1A170E
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:44:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC37B10E6D3;
	Wed, 28 Jan 2026 12:44:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="A4tuKOR3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DA3210E6D3
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 12:44:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E892E41839;
 Wed, 28 Jan 2026 12:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73377C116C6;
 Wed, 28 Jan 2026 12:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769604278;
 bh=jAn+3MMvEqMNU2Vf3TwT6H1wxmToynEwCpygednmDkk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=A4tuKOR3I6lpa9tSM46GIIFTnjp8QH7LPNdgxkEdFEnbKcBTWrDlHkncaHREB8FVD
 zrTokhmmEIyc310oZQQAeeOCYwkhia60JlxMbBYi2fbAwt9QezI3jFd8UG4K4Z8pB5
 sKHxFPBVZLaI6XglI7efZLJ/rfm9PQSHoxl5IEjq8DB6LV2DZNPdlZlgm1jH7w/H9p
 GOdB63n1ufNiawssir09RUbaREnOzxKhPNk2Kjjnl53HOxLHduSMYIxmLj9IYTfnVg
 myjjjSYL9mDIZQ/fHMYbtQ7M8qhNExOPVzPElQi8yLKXJHQTnFVw/gzYqxwsWImVYi
 PDHERCJ501Bog==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 28 Jan 2026 13:43:58 +0100
Subject: [PATCH v4 14/15] drm/vc4: Switch private_obj initialization to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260128-drm-private-obj-reset-v4-14-90891fa3d3b0@redhat.com>
References: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com>
In-Reply-To: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 kernel-list@raspberrypi.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5435; i=mripard@redhat.com;
 h=from:subject:message-id; bh=jAn+3MMvEqMNU2Vf3TwT6H1wxmToynEwCpygednmDkk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlVLN1LJ7d4HTpWoOJTt2i7vpRbkCVvWrf0osybFU0nM
 9/1bXzdMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACZiwM/YsKPj4rOaQHE5D13G
 8IUrOV6KJ3skatw82FqzaUpmwDJG2dnLD24yz5eaFrj72PKd4pVPGBvemr24dt3mu9XPd7+u5jn
 pM85urZu/PSTtVkDCCb7mlZPVn1o26ErNVwjY+fngo7MJZl8A
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
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:mripard@kernel.org,m:dave.stevenson@raspberrypi.com,m:mcanal@igalia.com,m:kernel-list@raspberrypi.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,raspberrypi.com:email,igalia.com:email]
X-Rspamd-Queue-Id: 65FD1A170E
X-Rspamd-Action: no action

The vc4 driver relies on a drm_private_obj, that is initialized by
allocating and initializing a state, and then passing it to
drm_private_obj_init.

Since we're gradually moving away from that pattern to the more
established one relying on a atomic_create_state implementation, let's
migrate this instance to the new pattern.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---

Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: "Maíra Canal" <mcanal@igalia.com>
Cc: kernel-list@raspberrypi.com
---
 drivers/gpu/drm/vc4/vc4_kms.c | 69 ++++++++++++++++++++++++++++++-------------
 1 file changed, 48 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index e563c12109371619605d8e3f78b0f92694dbe5a5..f82c7ea1d74eeaa075296533a1ffe3561f197748 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -83,11 +83,26 @@ static void vc4_ctm_destroy_state(struct drm_private_obj *obj,
 	struct vc4_ctm_state *ctm_state = to_vc4_ctm_state(state);
 
 	kfree(ctm_state);
 }
 
+static struct drm_private_state *
+vc4_ctm_create_state(struct drm_private_obj *obj)
+{
+	struct vc4_ctm_state *ctm_state;
+
+	ctm_state = kzalloc(sizeof(*ctm_state), GFP_KERNEL);
+	if (!ctm_state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &ctm_state->base);
+
+	return &ctm_state->base;
+}
+
 static const struct drm_private_state_funcs vc4_ctm_state_funcs = {
+	.atomic_create_state = vc4_ctm_create_state,
 	.atomic_duplicate_state = vc4_ctm_duplicate_state,
 	.atomic_destroy_state = vc4_ctm_destroy_state,
 };
 
 static void vc4_ctm_obj_fini(struct drm_device *dev, void *unused)
@@ -97,19 +112,13 @@ static void vc4_ctm_obj_fini(struct drm_device *dev, void *unused)
 	drm_atomic_private_obj_fini(&vc4->ctm_manager);
 }
 
 static int vc4_ctm_obj_init(struct vc4_dev *vc4)
 {
-	struct vc4_ctm_state *ctm_state;
-
 	drm_modeset_lock_init(&vc4->ctm_state_lock);
 
-	ctm_state = kzalloc(sizeof(*ctm_state), GFP_KERNEL);
-	if (!ctm_state)
-		return -ENOMEM;
-
-	drm_atomic_private_obj_init(&vc4->base, &vc4->ctm_manager, &ctm_state->base,
+	drm_atomic_private_obj_init(&vc4->base, &vc4->ctm_manager, NULL,
 				    &vc4_ctm_state_funcs);
 
 	return drmm_add_action_or_reset(&vc4->base, vc4_ctm_obj_fini, NULL);
 }
 
@@ -716,13 +725,28 @@ static void vc4_load_tracker_destroy_state(struct drm_private_obj *obj,
 
 	load_state = to_vc4_load_tracker_state(state);
 	kfree(load_state);
 }
 
+static struct drm_private_state *
+vc4_load_tracker_create_state(struct drm_private_obj *obj)
+{
+	struct vc4_load_tracker_state *load_state;
+
+	load_state = kzalloc(sizeof(*load_state), GFP_KERNEL);
+	if (!load_state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &load_state->base);
+
+	return &load_state->base;
+}
+
 static const struct drm_private_state_funcs vc4_load_tracker_state_funcs = {
 	.atomic_duplicate_state = vc4_load_tracker_duplicate_state,
 	.atomic_destroy_state = vc4_load_tracker_destroy_state,
+	.atomic_create_state = vc4_load_tracker_create_state,
 };
 
 static void vc4_load_tracker_obj_fini(struct drm_device *dev, void *unused)
 {
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
@@ -730,18 +754,12 @@ static void vc4_load_tracker_obj_fini(struct drm_device *dev, void *unused)
 	drm_atomic_private_obj_fini(&vc4->load_tracker);
 }
 
 static int vc4_load_tracker_obj_init(struct vc4_dev *vc4)
 {
-	struct vc4_load_tracker_state *load_state;
-
-	load_state = kzalloc(sizeof(*load_state), GFP_KERNEL);
-	if (!load_state)
-		return -ENOMEM;
-
 	drm_atomic_private_obj_init(&vc4->base, &vc4->load_tracker,
-				    &load_state->base,
+				    NULL,
 				    &vc4_load_tracker_state_funcs);
 
 	return drmm_add_action_or_reset(&vc4->base, vc4_load_tracker_obj_fini, NULL);
 }
 
@@ -798,11 +816,26 @@ static void vc4_hvs_channels_print_state(struct drm_printer *p,
 		drm_printf(p, "\t\tin use=%d\n", hvs_state->fifo_state[i].in_use);
 		drm_printf(p, "\t\tload=%lu\n", hvs_state->fifo_state[i].fifo_load);
 	}
 }
 
+static struct drm_private_state *
+vc4_hvs_channels_create_state(struct drm_private_obj *obj)
+{
+	struct vc4_hvs_state *hvs_state;
+
+	hvs_state = kzalloc(sizeof(*hvs_state), GFP_KERNEL);
+	if (!hvs_state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &hvs_state->base);
+
+	return &hvs_state->base;
+}
+
 static const struct drm_private_state_funcs vc4_hvs_state_funcs = {
+	.atomic_create_state = vc4_hvs_channels_create_state,
 	.atomic_duplicate_state = vc4_hvs_channels_duplicate_state,
 	.atomic_destroy_state = vc4_hvs_channels_destroy_state,
 	.atomic_print_state = vc4_hvs_channels_print_state,
 };
 
@@ -813,18 +846,12 @@ static void vc4_hvs_channels_obj_fini(struct drm_device *dev, void *unused)
 	drm_atomic_private_obj_fini(&vc4->hvs_channels);
 }
 
 static int vc4_hvs_channels_obj_init(struct vc4_dev *vc4)
 {
-	struct vc4_hvs_state *state;
-
-	state = kzalloc(sizeof(*state), GFP_KERNEL);
-	if (!state)
-		return -ENOMEM;
-
 	drm_atomic_private_obj_init(&vc4->base, &vc4->hvs_channels,
-				    &state->base,
+				    NULL,
 				    &vc4_hvs_state_funcs);
 
 	return drmm_add_action_or_reset(&vc4->base, vc4_hvs_channels_obj_fini, NULL);
 }
 

-- 
2.52.0

