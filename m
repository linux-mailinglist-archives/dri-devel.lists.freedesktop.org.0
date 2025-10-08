Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A120FBC4B2C
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 14:04:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0A2310E7D7;
	Wed,  8 Oct 2025 12:04:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="dDgd+4ks";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4BB610E7D7
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 12:04:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 51E5561F86;
 Wed,  8 Oct 2025 12:04:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A759DC4CEF4;
 Wed,  8 Oct 2025 12:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759925088;
 bh=kcgztMywCVC5zHgHOWmmvASZINWD+eVeJsx6EDd+h3k=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=dDgd+4ksQswF1l0VlNu2AEEFcmyGQZOmq4gBayro1iLH1zIr/vFmH0Hdes4VUXsFI
 zxoo/i9kJNPrTxD+vuJGXc64EsNb+RlLrIXnqkK8faFIM8IEkqeAgpxCgLqynQLI1t
 Pu8c9L8cS+P3ZxnYBJ9+/xbzX9O19jkdVzwBiOdebEF7aHH/28z1Xd3IZuL3cRM/go
 qPpNDfLPim1S5Dw2mxtWpy7d8huJHZCGNKsp1DLHPj7mWMed9YFAPcJUA3+IjH5oXs
 NClSXKvBQuZddb+Qcqju5dQuseQNbDOzfYdZvaySFaJacEhv2GTvgC4+pQ1JEvX/fa
 6rwdbW6Qv6GVw==
From: Maxime Ripard <mripard@kernel.org>
Date: Wed, 08 Oct 2025 14:04:10 +0200
Subject: [PATCH 12/16] drm/omapdrm: Switch private_obj initialization to reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251008-drm-private-obj-reset-v1-12-805ab43ae65a@kernel.org>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
In-Reply-To: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2104; i=mripard@kernel.org;
 h=from:subject:message-id; bh=kcgztMywCVC5zHgHOWmmvASZINWD+eVeJsx6EDd+h3k=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnPgi0eR1atPrBK09JwzdMscXOrx3y/svfdL/n/4/zxr
 kuMLKVBHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAivOsYG9bzrJ36Trx6/fI3
 zDvrnMvPO6xZV6D8POuVhjZrF3N/aN2/zR4/WQrDbHafecXJN/nCb8aGK4oPbuUzMKc47OnNZ65
 6uqu8dlFATOH2eZG1ZUYrE7tfv7kQJ8QVxC/8iOld+80LEw0B
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

The omapdrm driver relies on a drm_private_obj, that is initialized by
allocating and initializing a state, and then passing it to
drm_private_obj_init.

Since we're gradually moving away from that pattern to the more
established one relying on a reset implementation, let's migrate this
instance to the new pattern.

Signed-off-by: Maxime Ripard <mripard@kernel.org>

---

Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/omap_drv.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 794267f0f007850e43949f93be5c98d0e32a84ea..4c556da5a5cae3685d929679f43260c51459e8a9 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -272,25 +272,37 @@ static void omap_global_destroy_state(struct drm_private_obj *obj,
 	struct omap_global_state *omap_state = to_omap_global_state(state);
 
 	kfree(omap_state);
 }
 
+static void omap_global_reset(struct drm_private_obj *obj)
+{
+	struct omap_global_state *state;
+
+	if (obj->state) {
+		omap_global_destroy_state(obj, obj->state);
+		obj->state = NULL;
+	}
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return;
+
+	__drm_atomic_helper_private_obj_reset(obj, &state->base);
+}
+
 static const struct drm_private_state_funcs omap_global_state_funcs = {
 	.atomic_duplicate_state = omap_global_duplicate_state,
 	.atomic_destroy_state = omap_global_destroy_state,
+	.reset = omap_global_reset,
 };
 
 static int omap_global_obj_init(struct drm_device *dev)
 {
 	struct omap_drm_private *priv = dev->dev_private;
-	struct omap_global_state *state;
 
-	state = kzalloc(sizeof(*state), GFP_KERNEL);
-	if (!state)
-		return -ENOMEM;
-
-	drm_atomic_private_obj_init(dev, &priv->glob_obj, &state->base,
+	drm_atomic_private_obj_init(dev, &priv->glob_obj, NULL,
 				    &omap_global_state_funcs);
 	return 0;
 }
 
 static void omap_global_obj_fini(struct omap_drm_private *priv)

-- 
2.51.0

