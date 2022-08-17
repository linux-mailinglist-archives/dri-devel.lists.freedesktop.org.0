Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6490C5976E8
	for <lists+dri-devel@lfdr.de>; Wed, 17 Aug 2022 21:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AFB7A5384;
	Wed, 17 Aug 2022 19:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27A3A533F
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Aug 2022 19:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660765221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yFuI9l5h91DZudC/kp5qPp1NJKZ67KzBNjAbMhUbReQ=;
 b=QehJcnvfdQfXXwJ9vTl9qc2zRyEgeMIwrpczO+iYiyW4bIFdr0D0JIJ7CeaW8/83RFf/Av
 ZdLE0GVPVljPIAl2PCETfexe1IdkN/SlVezrU5smgBY+Vtu1vLkOVHJFA7VjLIv1Q2+TzR
 E2ETvRDR2F5VhA9xgA7mMP3/lwMWHGA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-522-P4vaN6nJM2GKxBdJz231mw-1; Wed, 17 Aug 2022 15:40:18 -0400
X-MC-Unique: P4vaN6nJM2GKxBdJz231mw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EE7B5101A588;
 Wed, 17 Aug 2022 19:40:16 +0000 (UTC)
Received: from emerald.redhat.com (unknown [10.22.18.168])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 55E7F492CA4;
 Wed, 17 Aug 2022 19:40:16 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Subject: [RFC v4 10/17] drm/display/dp_mst: Fix modeset tracking in
 drm_dp_atomic_release_vcpi_slots()
Date: Wed, 17 Aug 2022 15:38:39 -0400
Message-Id: <20220817193847.557945-11-lyude@redhat.com>
In-Reply-To: <20220817193847.557945-1-lyude@redhat.com>
References: <20220817193847.557945-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 open list <linux-kernel@vger.kernel.org>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>, David Airlie <airlied@linux.ie>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Wayne Lin <Wayne.Lin@amd.com>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently with the MST helpers we avoid releasing payloads _and_ avoid
pulling in the MST state if there aren't any actual payload changes. While
we want to keep the first step, we need to now make sure that we're always
pulling in the MST state on all modesets that can modify payloads - even if
the resulting payloads in the atomic state are identical to the previous
ones.

This is mainly to make it so that if a CRTC is still assigned to a
connector but is set to DPMS off, the CRTC still holds it's payload
allocation in the atomic state and still appropriately pulls in the MST
state for commit tracking. Otherwise, we'll occasionally forget to update
MST payloads from changes caused by non-atomic DPMS changes. Doing this
also allows us to track bandwidth limitations in a state correctly even
between DPMS changes, so that there's no chance of a simple ->active change
being rejected by the atomic check.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: Wayne Lin <Wayne.Lin@amd.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Imre Deak <imre.deak@intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sean Paul <sean@poorly.run>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/display/drm_dp_mst_topology.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index aa6dcd9ff6a5..2f7c43f88d74 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -4474,6 +4474,7 @@ int drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
 	struct drm_dp_mst_topology_state *topology_state;
 	struct drm_dp_mst_atomic_payload *payload;
 	struct drm_connector_state *old_conn_state, *new_conn_state;
+	bool update_payload = true;
 
 	old_conn_state = drm_atomic_get_old_connector_state(state, port->connector);
 	if (!old_conn_state->crtc)
@@ -4485,10 +4486,12 @@ int drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
 		struct drm_crtc_state *crtc_state =
 			drm_atomic_get_new_crtc_state(state, new_conn_state->crtc);
 
-		if (!crtc_state ||
-		    !drm_atomic_crtc_needs_modeset(crtc_state) ||
-		    crtc_state->enable)
+		/* No modeset means no payload changes, so it's safe to not pull in the MST state */
+		if (!crtc_state || !drm_atomic_crtc_needs_modeset(crtc_state))
 			return 0;
+
+		if (!crtc_state->mode_changed && !crtc_state->connectors_changed)
+			update_payload = false;
 	}
 
 	topology_state = drm_atomic_get_mst_topology_state(state, mgr);
@@ -4496,6 +4499,8 @@ int drm_dp_atomic_release_time_slots(struct drm_atomic_state *state,
 		return PTR_ERR(topology_state);
 
 	topology_state->pending_crtc_mask |= drm_crtc_mask(old_conn_state->crtc);
+	if (!update_payload)
+		return 0;
 
 	payload = drm_atomic_get_mst_payload_state(topology_state, port);
 	if (WARN_ON(!payload)) {
-- 
2.37.1

