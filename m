Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282E1BD92DA
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 14:00:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5275710E5CF;
	Tue, 14 Oct 2025 12:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hODl7Rop";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BDF610E5CF;
 Tue, 14 Oct 2025 12:00:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0B8F961E4A;
 Tue, 14 Oct 2025 12:00:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CDFCC4CEFE;
 Tue, 14 Oct 2025 12:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1760443245;
 bh=muR8akMYIBsJHxWXSGrYJ0fpHlj2lMjBV6pX18Dssto=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=hODl7RopVSuYFVJL2sbvmlOw6dRuUzMmuqBhmJS2H8JFF9zSC1KMWrRR4YyXgu7oI
 qVx7J+hZxwiKFgAZxq3/hVBZN9G2MxkKG1WkzIcanJgWFZLv/3V0ZZEgIDQEAABUI1
 6k6jahcVRlhP4cQJMMJl0FmNU+iZSqCi/DUweWeSZTNqMCE82zV+GnrsfcZ/HmHmjb
 YwGIt7JJWj4hUceRzArl8WiT/GYH2Ch2idpapJbnSXo4WUybnBcpsYUSv2R2edaniB
 OLAQrgfDDMfPjCENo2i+ZRXo7pGPVUeuzXZSaRmULfpSPrboncTUB3n4cVRFF8Soys
 viYIjHN7VDVug==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 14 Oct 2025 11:31:55 +0200
Subject: [PATCH v2 11/16] drm/msm: mdp5: Switch private_obj initialization
 to atomic_create_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251014-drm-private-obj-reset-v2-11-6dd60e985e9d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3578; i=mripard@kernel.org;
 h=from:subject:message-id; bh=muR8akMYIBsJHxWXSGrYJ0fpHlj2lMjBV6pX18Dssto=;
 b=kA0DAAkTJ1/OGaI9vnYByyZiAGjuO0ijdNBxMH9YHc6vQGlbS7gX6EPAOxcDevfBhxstAIhUr
 oiVBAATCQAdFiEE5BxWy6eHo3pAP6n4J1/OGaI9vnYFAmjuO0gACgkQJ1/OGaI9vnacMQF/QMzq
 kTd1YPXQjp6fpoDv6eJit32OrH0k07VtsUYpCV24FnxmQmvCdNTKk0TYXR9ZAYCOZvJFtlxJRIn
 GTvXrZ+2VAXzMVj7PAIRlD/NWzIY3L1Dv/ynIvZwq8GAcR0rzX/Y=
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

The MSM mdp5 driver relies on a drm_private_obj, that is initialized by
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
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 41 +++++++++++++++++---------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 5b6ca8dd929e1870b7228af93da03886524f5f20..80e1a331dbf7deae4f039ddcae1e5770e882728d 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -112,41 +112,44 @@ static void mdp5_global_destroy_state(struct drm_private_obj *obj,
 	struct mdp5_global_state *mdp5_state = to_mdp5_global_state(state);
 
 	kfree(mdp5_state);
 }
 
+static struct drm_private_state *
+mdp5_global_create_state(struct drm_private_obj *obj)
+{
+	struct drm_device *dev = obj->dev;
+	struct msm_drm_private *priv = dev->dev_private;
+	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
+	struct mdp5_global_state *mdp5_state;
+
+	mdp5_state = kzalloc(sizeof(*mdp5_state), GFP_KERNEL);
+	if (!mdp5_state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_private_obj_create_state(obj, &mdp5_state->base);
+	mdp5_state->mdp5_kms = mdp5_kms;
+
+	return &mdp5_state->base;
+}
+
 static void mdp5_global_print_state(struct drm_printer *p,
 				    const struct drm_private_state *state)
 {
 	struct mdp5_global_state *mdp5_state = to_mdp5_global_state(state);
 
 	if (mdp5_state->mdp5_kms->smp)
 		mdp5_smp_dump(mdp5_state->mdp5_kms->smp, p, mdp5_state);
 }
 
 static const struct drm_private_state_funcs mdp5_global_state_funcs = {
+	.atomic_create_state = mdp5_global_create_state,
 	.atomic_duplicate_state = mdp5_global_duplicate_state,
 	.atomic_destroy_state = mdp5_global_destroy_state,
 	.atomic_print_state = mdp5_global_print_state,
 };
 
-static int mdp5_global_obj_init(struct mdp5_kms *mdp5_kms)
-{
-	struct mdp5_global_state *state;
-
-	state = kzalloc(sizeof(*state), GFP_KERNEL);
-	if (!state)
-		return -ENOMEM;
-
-	state->mdp5_kms = mdp5_kms;
-
-	drm_atomic_private_obj_init(mdp5_kms->dev, &mdp5_kms->glob_state,
-				    &state->base,
-				    &mdp5_global_state_funcs);
-	return 0;
-}
-
 static void mdp5_enable_commit(struct msm_kms *kms)
 {
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
 	pm_runtime_get_sync(&mdp5_kms->pdev->dev);
 }
@@ -711,13 +714,13 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 	u32 major, minor;
 	int ret;
 
 	mdp5_kms->dev = dev;
 
-	ret = mdp5_global_obj_init(mdp5_kms);
-	if (ret)
-		goto fail;
+	drm_atomic_private_obj_init(mdp5_kms->dev, &mdp5_kms->glob_state,
+				    NULL,
+				    &mdp5_global_state_funcs);
 
 	/* we need to set a default rate before enabling.  Set a safe
 	 * rate first, then figure out hw revision, and then set a
 	 * more optimal rate:
 	 */

-- 
2.51.0

