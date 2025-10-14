Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 046A6BD92E9
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 14:00:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C0D10E5D5;
	Tue, 14 Oct 2025 12:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BIasCBjy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EE7E10E5D1
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 12:00:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 64BF843BC8;
 Tue, 14 Oct 2025 12:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F4EC4CEFE;
 Tue, 14 Oct 2025 12:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760443251;
 bh=XULlCEdbaQ2dOPXTPjWq40F9jPv0n6zL0i8Nd1c22g0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=BIasCBjyzaM23nx3xASNDuFb+rTynCojAyejEwbVPm8n0CQh9636OpLdq1OIXWtpS
 ZATIIGUcfCfEPT9vxVBv/erQlsK2J7kOEI5gx1SX1XG3gOfFVYMmW11TIwrSNcwYUW
 EwTnk1aio80kII8T5nO5Lb9zaE8IDJIhcK0WB7JaYGkbAlqFYO9NyS4/ZGCxXPhXYd
 7apf9I6gju/9tjwtMIrU6mXDlyb0AFldz5N78kFdLPTAykkx4Txb/I3+J7l1S5uKjM
 0IRj5Tv73STIsDqKHqLmVUrcGJIZtvKjIdCtxYZIbzgSwUBtLLokhXr2ePwdDnQimb
 yH1uAofdXbo7A==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 14 Oct 2025 11:31:57 +0200
Subject: [PATCH v2 13/16] drm/omapdrm: Switch private_obj initialization to
 atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-drm-private-obj-reset-v2-13-6dd60e985e9d@kernel.org>
References: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
In-Reply-To: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2131; i=mripard@kernel.org;
 h=from:subject:message-id; bh=XULlCEdbaQ2dOPXTPjWq40F9jPv0n6zL0i8Nd1c22g0=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnvrD25fDjPHer2bN6tPs+2gnkDQ1Dq7Tqxe3dKTpobb
 HUq4//XMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACZS9Yex4ZD7F/3Fc6df3vdZ
 cI337wqd/hif3jgR6b9np/NcObbB6eqbuGdyfvMd42NOXzfMTbmSzNiwglXu+KIF5qGFJY65bTc
 72UQSone6WtSKBmyL/BSdxzDtF+um8hMXr+ivlOsXuJX+3g0A
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
established one relying on a atomic_create_state implementation, let's
migrate this instance to the new pattern.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---

Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/omap_drv.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 794267f0f007850e43949f93be5c98d0e32a84ea..7a2d7aa5438a519c876033801da5cd5c411bd5fa 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -272,25 +272,35 @@ static void omap_global_destroy_state(struct drm_private_obj *obj,
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
2.51.0

