Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E068DB3F87B
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:33:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1687510E5E1;
	Tue,  2 Sep 2025 08:33:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lWexjkhO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F9410E5E1
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:33:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C030760222;
 Tue,  2 Sep 2025 08:33:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FF86C4CEF8;
 Tue,  2 Sep 2025 08:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756802003;
 bh=ymXL3YOVpngIrQ5Uh/MtWSLd5T18BYRz7YHzVv+IsMw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=lWexjkhO/JciMGnbiWpcHeqAA0/F8ypD0TOktIDj+RDkjcoDKh8mjvI/A/ERUTJ7C
 +GstNNrTokBi7tX2wjfOt2pWBVmh6H4fj3FhCtAeEksK2I46WhvbIdYIXMxoHUipZw
 D8k5FzCe67qrR5sYCmpcq27KPHp1rToIO1Gju/323UlXXTeavKFf5/3ge90z1d+qKU
 2KJBYKKo7WMieLXHlIn7ZvoPdxQhWLdksUxQJSZHOO5Cwe4+nDDV7EeihatT/IXwVn
 E9Nvsdqxxszw3cV3f0Sqyt8SXBykbJoVW5HCyLTu1xkNUthrbq3guGcHDt6fxp9thg
 Mtwiq5tAzBklQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 02 Sep 2025 10:32:33 +0200
Subject: [PATCH 05/29] drm/atomic_state_helper: Fix bridge state initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-drm-state-readout-v1-5-14ad5315da3f@kernel.org>
References: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
In-Reply-To: <20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Devarsh Thakkar <devarsht@ti.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2006; i=mripard@kernel.org;
 h=from:subject:message-id; bh=ymXL3YOVpngIrQ5Uh/MtWSLd5T18BYRz7YHzVv+IsMw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnbVm+bbJU35eXunS31k8pcFn1SXpW2fumR36/K5y6fV
 H23sUc4t2MqC4MwJ4OsmCLLE5mw08vbF1c52K/8ATOHlQlkCAMXpwBM5NQUxloR2y2zhB7eUVux
 5aGTJefcv/fDT+0Mnv+2LVinmN8tdKv8rOc/e1Occidtm5RafLrtny5jwwzVFNsQtiM1uQpez0T
 fZIdxr0nN6jiRZhYw48LJ1uaix85VPpsMLer2ax7xUJ4rzjcNAA==
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

Bridges implement their state using a drm_private_obj and an
hand-crafted reset implementation.

Since drm_private_obj doesn't have a set of reset helper like the other
states, __drm_atomic_helper_bridge_reset() was initializing both the
drm_private_state and the drm_bridge_state structures.

This initialization however was missing the drm_private_state.obj
pointer to the drm_private_obj the state was allocated for, creating a
NULL pointer dereference when trying to access it.

Fixes: 751465913f04 ("drm/bridge: Add a drm_bridge_state object")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 7142e163e618ea0d7d9d828e1bd9ff2a6ec0dfeb..b962c342b16aabf4e3bea52a914e5deb1c2080ce 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -707,10 +707,17 @@ void drm_atomic_helper_connector_destroy_state(struct drm_connector *connector,
 	__drm_atomic_helper_connector_destroy_state(state);
 	kfree(state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_destroy_state);
 
+static void __drm_atomic_helper_private_obj_reset(struct drm_private_obj *obj,
+						  struct drm_private_state *state)
+{
+	memset(state, 0, sizeof(*state));
+	state->obj = obj;
+}
+
 /**
  * __drm_atomic_helper_private_obj_duplicate_state - copy atomic private state
  * @obj: CRTC object
  * @state: new private object state
  *
@@ -796,10 +803,11 @@ EXPORT_SYMBOL(drm_atomic_helper_bridge_destroy_state);
  */
 void __drm_atomic_helper_bridge_reset(struct drm_bridge *bridge,
 				      struct drm_bridge_state *state)
 {
 	memset(state, 0, sizeof(*state));
+	__drm_atomic_helper_private_obj_reset(&bridge->base, &state->base);
 	state->bridge = bridge;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_bridge_reset);
 
 /**

-- 
2.50.1

