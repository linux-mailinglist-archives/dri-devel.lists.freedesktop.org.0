Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D7AD3A96F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jan 2026 13:50:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B62CF10E442;
	Mon, 19 Jan 2026 12:50:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ue9Edm/8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A985F10E44D
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jan 2026 12:50:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 90D1643473;
 Mon, 19 Jan 2026 12:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C147C116C6;
 Mon, 19 Jan 2026 12:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768827045;
 bh=7oC2XKGbkpDmkmISSBKtDJ5LWoeUOFQ4Va7igWnjWlY=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Ue9Edm/8oV4RdrLMOHdUnOVM3j+jo1ZlTEa5xXxCbWllyKI15JpgXLheBq00J8jX/
 2S9GkmXiJZXh2ifiAlq6BEHIG5ZgypsEE29V18Q3oT9bV0xq/DWTvKIs3OLc5IFk82
 048twDguPmmZzI9Gi6nzsa32ueZ0oz6VeAwy0l4iWVXYW1qW3BMyKHjG8MiWW0Fhet
 9whi+kU/q00EY9dGFJvowshEDxgeKxc/heJeB/+/HrjgLdb7T8ITMuPQsSzulxtR9P
 OqzD5KxM2TIMfpF71pK6J28cnkyaF6WzdsRTopeOwK3Rem6SipaxIW1aJ9xTs0d2PC
 uXcMI5YJjphqw==
From: Maxime Ripard <mripard@kernel.org>
Date: Mon, 19 Jan 2026 13:50:08 +0100
Subject: [PATCH v3 12/15] drm/omapdrm: Switch private_obj initialization to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-drm-private-obj-reset-v3-12-b931abe3a5e3@redhat.com>
References: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
In-Reply-To: <20260119-drm-private-obj-reset-v3-0-b931abe3a5e3@redhat.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2131; i=mripard@redhat.com;
 h=from:subject:message-id; bh=7oC2XKGbkpDmkmISSBKtDJ5LWoeUOFQ4Va7igWnjWlY=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJl5GnUb+LgVLptIHZYI5+8pcjtwab3U2pDTpYZ/H5woV
 OGc9tS1YyoLgzAng6yYIssTmbDTy9sXVznYr/wBM4eVCWQIAxenAEwk5QRjnfaL01r8K27sjL4d
 Us6eXCsvGC2ru1briVDUJNnF70/M7H74j+etpGRS0YVDsdzLRPkDGRvep3cWTnzUxMQRnPTFa7V
 wx4eAa16nTiebzV+2XD1g8tkoWdX5346LLz2dW1er7ji56iIA
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

The omapdrm driver relies on a drm_private_obj, that is initialized by
allocating and initializing a state, and then passing it to
drm_private_obj_init.

Since we're gradually moving away from that pattern to the more
established one relying on a atomic_create_state implementation, let's
migrate this instance to the new pattern.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---

Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/omap_drv.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 1b96343226a5ed8571bed70200b2af9eccca7c84..febee3fea01dd40faec7d631279b1393a17822ba 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -273,25 +273,35 @@ static void omap_global_destroy_state(struct drm_private_obj *obj,
 	struct omap_global_state *omap_state = to_omap_global_state(state);
 
 	kfree(omap_state);
 }
 
+static struct drm_private_state *
+omap_global_atomic_create_state(struct drm_private_obj *obj)
+{
+	struct omap_global_state *state;
+
+	state = kzalloc(sizeof(*state), GFP_KERNEL);
+	if (!state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &state->base);
+
+	return &state->base;
+}
+
 static const struct drm_private_state_funcs omap_global_state_funcs = {
+	.atomic_create_state = omap_global_atomic_create_state,
 	.atomic_duplicate_state = omap_global_duplicate_state,
 	.atomic_destroy_state = omap_global_destroy_state,
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
2.52.0

