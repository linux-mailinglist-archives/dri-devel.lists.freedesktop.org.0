Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F6CBD92E6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 14:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABF510E5D4;
	Tue, 14 Oct 2025 12:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fS+VbDCl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ADBA10E5D1;
 Tue, 14 Oct 2025 12:00:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A2F4E43603;
 Tue, 14 Oct 2025 12:00:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29059C4CEFE;
 Tue, 14 Oct 2025 12:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760443248;
 bh=jAIW3dBL6UYMjB0mOSoCqB+njMs2MEvG8K+bjNkUqX4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=fS+VbDCllR8PL3z+RrWO/4Xqs5SLYrKDf62ZkV3q0llNEMyBaIOMffpIHxbpLSzp+
 /8m3ggQt+gDcsxJ2VP1QMXhWXKRm3VfKwaW3q1+ai6iDy4cy37QjpI4YHc9zfe+mDx
 6tej2bR/iQKVE73hL9VYQo0o/04f8BUI4z05uXvirSg0BVERyNNuGXufKWTF/Hy35d
 qkUtJqvfT21p8aIrB62qa+wJW0+SF6rhR1mHm4NRdoOdi2LtyWq9eYIKLHd8EaVV7q
 pRBqWKSkJVWEKLEhcV9td4lGGjFolOvJvXPowm8wsv47e7UvadmbypO/Zj2VK2j2z2
 OWT3dU31Uyl3w==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 14 Oct 2025 11:31:56 +0200
Subject: [PATCH v2 12/16] drm/msm: dpu1: Switch private_obj initialization
 to atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-drm-private-obj-reset-v2-12-6dd60e985e9d@kernel.org>
References: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
In-Reply-To: <20251014-drm-private-obj-reset-v2-0-6dd60e985e9d@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3469; i=mripard@kernel.org;
 h=from:subject:message-id; bh=jAIW3dBL6UYMjB0mOSoCqB+njMs2MEvG8K+bjNkUqX4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDBnvrD3ubWFyEA2J5vh3mDes+Nue8sX2pb8sd+lwrd/5j
 j9f8mZ1x1QWBmFOBlkxRZYnMmGnl7cvrnKwX/kDZg4rE8gQBi5OAZjIP0bGejfrxqQnLT7dnV2/
 XSbd3hb73GJ64D3uOcyaa+XOf7gYoNx6rnlJ6uE9zHLpr9/G8G6RZ2xY/uKzoeJLxaaivm/WRxL
 rA/P6Fy/3tO2TWx/Gpx8bf/WAqujSqNpHgWFpSbqp7W3PTAA=
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

The MSM dpu1 driver relies on a drm_private_obj, that is initialized by
allocating and initializing a state, and then passing it to
drm_private_obj_init.

Since we're gradually moving away from that pattern to the more
established one relying on a atomic_create_state implementation, let's
migrate this instance to the new pattern.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---

Cc: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>
Cc: Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: freedreno@lists.freedesktop.org
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 42 +++++++++++++++++----------------
 1 file changed, 22 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index a306077647c317af9345eeff13082230906b5767..28a79e7836c0fb5c3f8a27ea5dda6f677e330bf1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -365,41 +365,43 @@ static void dpu_kms_global_destroy_state(struct drm_private_obj *obj,
 	struct dpu_global_state *dpu_state = to_dpu_global_state(state);
 
 	kfree(dpu_state);
 }
 
+static struct drm_private_state *
+dpu_kms_global_create_state(struct drm_private_obj *obj)
+{
+	struct drm_device *dev = obj->dev;
+	struct msm_drm_private *priv = dev->dev_private;
+	struct dpu_kms *dpu_kms = to_dpu_kms(priv->kms);
+	struct dpu_global_state *dpu_state;
+
+	dpu_state = kzalloc(sizeof(*dpu_state), GFP_KERNEL);
+	if (!dpu_state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &dpu_state->base);
+	dpu_state->rm = &dpu_kms->rm;
+
+	return &dpu_state->base;
+}
+
 static void dpu_kms_global_print_state(struct drm_printer *p,
 				       const struct drm_private_state *state)
 {
 	const struct dpu_global_state *global_state = to_dpu_global_state(state);
 
 	dpu_rm_print_state(p, global_state);
 }
 
 static const struct drm_private_state_funcs dpu_kms_global_state_funcs = {
+	.atomic_create_state = dpu_kms_global_create_state,
 	.atomic_duplicate_state = dpu_kms_global_duplicate_state,
 	.atomic_destroy_state = dpu_kms_global_destroy_state,
 	.atomic_print_state = dpu_kms_global_print_state,
 };
 
-static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
-{
-	struct dpu_global_state *state;
-
-	state = kzalloc(sizeof(*state), GFP_KERNEL);
-	if (!state)
-		return -ENOMEM;
-
-	drm_atomic_private_obj_init(dpu_kms->dev, &dpu_kms->global_state,
-				    &state->base,
-				    &dpu_kms_global_state_funcs);
-
-	state->rm = &dpu_kms->rm;
-
-	return 0;
-}
-
 static void dpu_kms_global_obj_fini(struct dpu_kms *dpu_kms)
 {
 	drm_atomic_private_obj_fini(&dpu_kms->global_state);
 }
 
@@ -1156,13 +1158,13 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 	dev = dpu_kms->dev;
 
 	dev->mode_config.cursor_width = 512;
 	dev->mode_config.cursor_height = 512;
 
-	rc = dpu_kms_global_obj_init(dpu_kms);
-	if (rc)
-		return rc;
+	drm_atomic_private_obj_init(dpu_kms->dev, &dpu_kms->global_state,
+				    NULL,
+				    &dpu_kms_global_state_funcs);
 
 	atomic_set(&dpu_kms->bandwidth_ref, 0);
 
 	rc = pm_runtime_resume_and_get(&dpu_kms->pdev->dev);
 	if (rc < 0)

-- 
2.51.0

