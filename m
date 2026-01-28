Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDsTOp8Eemlg1gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:44:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2F3A1699
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:44:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9554F10E6C5;
	Wed, 28 Jan 2026 12:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TQvMbGrt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0221910E6C6
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 12:44:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DC5A14377E;
 Wed, 28 Jan 2026 12:44:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64DA4C4CEF1;
 Wed, 28 Jan 2026 12:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769604250;
 bh=3sBgHdtsyiiIEJf+fzXRwFz7yT32CEQgFTkBpdKYOi8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=TQvMbGrtv3L+uj9TM+J9DEWrRevpyRMIqcD+EP0yU/7/hAniXMrTFTwsiFx9zelrD
 9ER4Fh0BXEgm73zjjoC6d33Uj/9ildsIKa+6/PanEApIcJ3lzJFycF5S1PrYJD2Ufk
 8+YBmmhmDszN46W6GUB0Ymt4CywxBgOvwP7qo7C9HJr3VVBoiLzfdKvKDcv6edJ9Lf
 R1KYUrygGCsvvd7Z5CcnV99oa8GeznUZwQDS2G6hTQDwpQQsecSh/EpD8FLgyXG6vM
 AEHzBHbJQSiCz8bdDkYsyba5oNSeSSj0GTYdtvUd1bpRYhL5MachxKeAO6ja/rmF1P
 +pDHTaQoxgZSg==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 28 Jan 2026 13:43:48 +0100
Subject: [PATCH v4 04/15] drm/bridge: Switch private_obj initialization to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-drm-private-obj-reset-v4-4-90891fa3d3b0@redhat.com>
References: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com>
In-Reply-To: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3610; i=mripard@redhat.com;
 h=from:subject:message-id; bh=3sBgHdtsyiiIEJf+fzXRwFz7yT32CEQgFTkBpdKYOi8=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlVLG1mWc/qmA4du8/jv7jJT3Jyw8ebRrO+XRHYamouf
 In7wPbQjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjCRViXGOvWfL1jbk/hXmhtv
 3cGaenWSSlu9p7l378JC3+ls7nduFjOpPIsumsvY4vFx29+HP3jOMtbwn06O2N6u5VP/sTnEJ3x
 2UPMxBQ2emRkztdQucHl+rLnvrfg1+n3n+mPdYq9Vn7qVPgMA
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:maarten.lankhorst@linux.intel.com,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:mripard@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,suse.de,gmail.com,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,kernel.org,oss.qualcomm.com,intel.com,linaro.org,ideasonboard.com,kwiboo.se,gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,ideasonboard.com:email,linaro.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,intel.com:email,kwiboo.se:email]
X-Rspamd-Queue-Id: 4C2F3A1699
X-Rspamd-Action: no action

The bridge implementation relies on a drm_private_obj, that is
initialized by allocating and initializing a state, and then passing it
to drm_private_obj_init.

Since we're gradually moving away from that pattern to the more
established one relying on a atomic_create_state implementation, let's
migrate this instance to the new pattern.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
 drivers/gpu/drm/drm_bridge.c              | 31 ++++++++++++++++---------------
 2 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index d21f32f0ad51f4305f75d01be58dc404acf7674c..716631e8a10a04674ae498b7fcbfc64a668a051e 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -823,10 +823,11 @@ EXPORT_SYMBOL(drm_atomic_helper_bridge_destroy_state);
  */
 void __drm_atomic_helper_bridge_reset(struct drm_bridge *bridge,
 				      struct drm_bridge_state *state)
 {
 	memset(state, 0, sizeof(*state));
+	__drm_atomic_helper_private_obj_create_state(&bridge->base, &state->base);
 	state->bridge = bridge;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_bridge_reset);
 
 /**
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 3b165a0d1e779ebcf7fe710a28ce3d15d7ab9c81..94864e05619d1678ea6c0571e889f951e17d8d16 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -458,11 +458,25 @@ drm_bridge_atomic_destroy_priv_state(struct drm_private_obj *obj,
 	struct drm_bridge *bridge = drm_priv_to_bridge(obj);
 
 	bridge->funcs->atomic_destroy_state(bridge, state);
 }
 
+static struct drm_private_state *
+drm_bridge_atomic_create_priv_state(struct drm_private_obj *obj)
+{
+	struct drm_bridge *bridge = drm_priv_to_bridge(obj);
+	struct drm_bridge_state *state;
+
+	state = bridge->funcs->atomic_reset(bridge);
+	if (IS_ERR(state))
+		return ERR_CAST(state);
+
+	return &state->base;
+}
+
 static const struct drm_private_state_funcs drm_bridge_priv_state_funcs = {
+	.atomic_create_state = drm_bridge_atomic_create_priv_state,
 	.atomic_duplicate_state = drm_bridge_atomic_duplicate_priv_state,
 	.atomic_destroy_state = drm_bridge_atomic_destroy_priv_state,
 };
 
 static bool drm_bridge_is_atomic(struct drm_bridge *bridge)
@@ -535,30 +549,17 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 		ret = bridge->funcs->attach(bridge, encoder, flags);
 		if (ret < 0)
 			goto err_reset_bridge;
 	}
 
-	if (drm_bridge_is_atomic(bridge)) {
-		struct drm_bridge_state *state;
-
-		state = bridge->funcs->atomic_reset(bridge);
-		if (IS_ERR(state)) {
-			ret = PTR_ERR(state);
-			goto err_detach_bridge;
-		}
-
+	if (drm_bridge_is_atomic(bridge))
 		drm_atomic_private_obj_init(bridge->dev, &bridge->base,
-					    &state->base,
+					    NULL,
 					    &drm_bridge_priv_state_funcs);
-	}
 
 	return 0;
 
-err_detach_bridge:
-	if (bridge->funcs->detach)
-		bridge->funcs->detach(bridge);
-
 err_reset_bridge:
 	bridge->dev = NULL;
 	bridge->encoder = NULL;
 	list_del(&bridge->chain_node);
 

-- 
2.52.0

