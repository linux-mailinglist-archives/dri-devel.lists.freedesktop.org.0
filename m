Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFdiGKgEemlE1gEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:44:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 089B3A16D4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 13:44:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2927F10E6C8;
	Wed, 28 Jan 2026 12:44:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fHcnj7Du";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 121D310E6C7
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jan 2026 12:44:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 859146011F;
 Wed, 28 Jan 2026 12:44:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDFF7C4CEF1;
 Wed, 28 Jan 2026 12:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769604256;
 bh=nPXNh+/jQ+1khkJDgH6q/bdPZsIWc4qjK7HqZs+R4h0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=fHcnj7DuGcL2+ZAK8E61xXnMiMC+JsnjvykT0Qhms6Ovli0GpXS5wi4XdfEgzLPNe
 Bsj5O2/wh84bdExtNv0VLkz4tTZUW5FUKAXYEsdo3YzarfqGVk9hPLIcjW+58suj4c
 z/M7PLTTuAPirKU1VRamS7QLRgp7q7x87Nohkd+vCirjO+uLrWvOxbIEVrolrgpPji
 A0HfZ5Sp4D2ENzkKHSKKJ76uTrVWy6x5cCtGt/yt7hAPkUZKLRzSkzi97aJFYTNRGt
 g0ecBY52zYiR7ESIweHE5Ojf0KUk5/hUmLTuSq3pAhUcio2SO2VVrvEExGGIblfhaO
 tAbN9wtB4Zs1w==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 28 Jan 2026 13:43:50 +0100
Subject: [PATCH v4 06/15] drm/dp_tunnel: Switch private_obj initialization
 to atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260128-drm-private-obj-reset-v4-6-90891fa3d3b0@redhat.com>
References: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com>
In-Reply-To: <20260128-drm-private-obj-reset-v4-0-90891fa3d3b0@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2565; i=mripard@redhat.com;
 h=from:subject:message-id; bh=nPXNh+/jQ+1khkJDgH6q/bdPZsIWc4qjK7HqZs+R4h0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJlVLO3KyrPFpaKuBh/eo51+avoV6xmrNtiJK/GVOUcs8
 ZbNqT3dMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACYivIqxYZdKyhTuZ6Klr5/X
 HJu9p/zlhtp9GsIyn073C6hJen0551+fO9dtX7nkJvuujVXOH57sYGz4ktErfOb9zuZW9iPvV1z
 ufTiLv/O1S7Rw9DShF6/0DN4W/2r4aPTEwiT+fNQD9m2t3D0A
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
X-Rspamd-Queue-Id: 089B3A16D4
X-Rspamd-Action: no action

The DP tunnel implementation relies on a drm_private_obj, that is
initialized by allocating and initializing a state, and then passing it
to drm_private_obj_init.

Since we're gradually moving away from that pattern to the more
established one relying on a atomic_create_state implementation, let's
migrate this instance to the new pattern.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_dp_tunnel.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_tunnel.c b/drivers/gpu/drm/display/drm_dp_tunnel.c
index 43f13a7c79b931beb230f8afe20afa0ebcf5ed8d..2abd714efd19f27697770813b38194e384be87ce 100644
--- a/drivers/gpu/drm/display/drm_dp_tunnel.c
+++ b/drivers/gpu/drm/display/drm_dp_tunnel.c
@@ -1495,11 +1495,26 @@ tunnel_group_duplicate_state(struct drm_private_obj *obj)
 static void tunnel_group_destroy_state(struct drm_private_obj *obj, struct drm_private_state *state)
 {
 	free_group_state(to_group_state(state));
 }
 
+static struct drm_private_state * tunnel_group_atomic_create_state(struct drm_private_obj *obj)
+{
+	struct drm_dp_tunnel_group_state *group_state;
+
+	group_state = kzalloc(sizeof(*group_state), GFP_KERNEL);
+	if (!group_state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &group_state->base);
+	INIT_LIST_HEAD(&group_state->tunnel_states);
+
+	return &group_state->base;
+}
+
 static const struct drm_private_state_funcs tunnel_group_funcs = {
+	.atomic_create_state = tunnel_group_atomic_create_state,
 	.atomic_duplicate_state = tunnel_group_duplicate_state,
 	.atomic_destroy_state = tunnel_group_destroy_state,
 };
 
 /**
@@ -1579,23 +1594,15 @@ drm_dp_tunnel_atomic_get_new_state(struct drm_atomic_state *state,
 }
 EXPORT_SYMBOL(drm_dp_tunnel_atomic_get_new_state);
 
 static bool init_group(struct drm_dp_tunnel_mgr *mgr, struct drm_dp_tunnel_group *group)
 {
-	struct drm_dp_tunnel_group_state *group_state;
-
-	group_state = kzalloc(sizeof(*group_state), GFP_KERNEL);
-	if (!group_state)
-		return false;
-
-	INIT_LIST_HEAD(&group_state->tunnel_states);
-
 	group->mgr = mgr;
 	group->available_bw = -1;
 	INIT_LIST_HEAD(&group->tunnels);
 
-	drm_atomic_private_obj_init(mgr->dev, &group->base, &group_state->base,
+	drm_atomic_private_obj_init(mgr->dev, &group->base, NULL,
 				    &tunnel_group_funcs);
 
 	return true;
 }
 

-- 
2.52.0

