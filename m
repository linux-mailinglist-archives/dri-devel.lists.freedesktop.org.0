Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B942C68F58
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 12:01:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A14310E33C;
	Tue, 18 Nov 2025 11:01:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FjaxS92N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CFA610E33C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 11:01:38 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-29844c68068so54111835ad.2
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 03:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1763463698; x=1764068498; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EVmPZwhrzesKcBYZl5KHgQBjgPr6W3bZdX9iA2XOIqs=;
 b=FjaxS92N4IOSIZDngBKZsHYhO1vDRGORMhmQClkNzZ+Mz7jbu5LLLo4guvopEKOkem
 i0IVEwkZ7NPAxdIZDrHvu2q/1WX7ryE5wFfHLeTTtWihDeyGm1oSIkK8u/va6ZKbi8f1
 uI5H4AczaSvqjeCe16+k1zl62d1Qq8Ipi9FPEyMHJj6dvbm1PUTVk53yyTjxuxdmEwd9
 k2eDb+SKGmdOVTjOOJc0WzKd3V0JTKkmSGFSwBzhJzg4nkg2gXWuF+G/xHgip8yyArAk
 doQZICygpCVlhmdYVMjGAif/QuJwglI+8ZDo9NBud4pmZM3mkEwsPI9MLsriJ/JzeUeU
 GPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763463698; x=1764068498;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EVmPZwhrzesKcBYZl5KHgQBjgPr6W3bZdX9iA2XOIqs=;
 b=KECJXFmIG9+RmdI7xL+Fn/swV2nGaI2xi34QxCt/jVZLwT6LOa9LOyc9bGZgOrQw3U
 /0uvLb3WBle5lKVWXr+1f17jPOsc9SXVblNFIwClN40CZEEio4qWdDVDmGYEdwAM4h9N
 JShfKMwE7IN5j//SwC0dfbyGGbbXeSx/vH7Dk0hMeV+ljWYI3PkAB73OFnavQlSAIeNb
 kW9T6/f2OlPD+UGliuQ2x/svYEvCahH7INqYZ9Tl29GtVGTFN/V2hia0GsCxit2Rx35z
 rlbhtGhWF9RkIW9yiNzMX0ZZ2VvMCHo+bwOeyiYxPq8teiSyAjjwF2SEv7gnsk9+wyCg
 uO+A==
X-Gm-Message-State: AOJu0YypgtKfNwoPpMJjFrBoI+82k5YzfgVAAMnSCp0pzSyeOqwJH2Rj
 L5vVTQpuCHjcuMk6ThJ2/2J2fVIZ7wD+k0w6x15Aak1RGtcnSZKvsVd/
X-Gm-Gg: ASbGncu3oDinFwEKbz05HmHaUASeuTgoZ1+uLm6hvbR5GdSTPSrATTF4g9kN+1ROBD+
 eFfpCe5O+KV95G3s9Rci8oj03eahXdwZmwNvECSQIORcWZlH2C1ext2Kn8DhsiDTfHK1CyyeXXq
 LGNeBEV/Ynr+USn7K6RqO6t2dUKgA+VFTHWUX3IIWl4684smj/P+swccZlbyezgZV3+U5ZP1Avb
 XlDqTddW1grqsgUGJSKlrepjlz7UyfgAg8Ceawn4XU6J8Zjoofgasf1HgQWtc3pnN0qhmErTuwD
 UDsLssaxkgkqibvVKzxhADlWdw3aoi5HBvllVUT96deOnXhaqDG508xWX9Tqsz+6Ig/Qhk1s9+X
 DRqncBuFx2VEq20cTTIMOp0/E8m4KSwYKRJrhuhz5BAjfu9ePLKJZBDRogT0YFQ5GH8+RLKXBxr
 ZYMRMEJeYSbrCMJQdJ15OkqwK7bHMtQrQ6c0w=
X-Google-Smtp-Source: AGHT+IE8r9XdpKJ0leW+FWYFvXVO0vUNmqhHEgDh0Jf9mkhR8NYeZWMhMlicbcCwcsfqmv9mbei48w==
X-Received: by 2002:a17:903:2f86:b0:297:c71d:851c with SMTP id
 d9443c01a7336-2986a73ba82mr199327545ad.36.1763463697635; 
 Tue, 18 Nov 2025 03:01:37 -0800 (PST)
Received: from rahul-mintos.ban-spse ([165.204.156.251])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2985c241f89sm168012035ad.28.2025.11.18.03.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 03:01:37 -0800 (PST)
From: Rahul Kumar <rk0006818@gmail.com>
To: liviu.dudau@arm.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rk0006818@gmail.com
Subject: [PATCH v2 2/3] drm/komeda: Convert logging in komeda_pipeline.c to
 drm_* with drm_device parameter
Date: Tue, 18 Nov 2025 16:29:33 +0530
Message-ID: <20251118105934.748955-3-rk0006818@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251118105934.748955-1-rk0006818@gmail.com>
References: <20251118105934.748955-1-rk0006818@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Replace DRM_ERROR/WARN/INFO() and DRM_DEBUG() calls in
drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c with the
drm_err(), drm_warn(), drm_info() and drm_dbg() helpers.

The drm_*() logging macros require a struct drm_device * parameter,
which allows the DRM core to prefix log messages with the device
instance. This is important for distinguishing logs when multiple
Komeda or other DRM devices are present.

This conversion follows the DRM TODO entry:
"Convert logging to drm_* functions with drm_device parameter".

Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
---
Changes since v1:
- Fixed incorrect use of dev_get_drvdata(): it returns struct komeda_drv *,
  not struct komeda_kms_dev *, as pointed out by Liviu Dudau.
- Updated DRM device pointer retrieval to use drv->kms.
- Combined both changes into a 0/3 series.
Link to v1:
https://lore.kernel.org/all/aRcKzbV_cKbC6vlV@e110455-lin.cambridge.arm.com/
---
 .../drm/arm/display/komeda/komeda_pipeline.c  | 61 +++++++++++++------
 1 file changed, 42 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
index 81e244f0c0ca..0d1f870c31d9 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_pipeline.c
@@ -12,22 +12,26 @@
 #include "komeda_dev.h"
 #include "komeda_kms.h"
 #include "komeda_pipeline.h"
+#include "komeda_drv.h"
 
 /** komeda_pipeline_add - Add a pipeline to &komeda_dev */
 struct komeda_pipeline *
 komeda_pipeline_add(struct komeda_dev *mdev, size_t size,
 		    const struct komeda_pipeline_funcs *funcs)
 {
+	struct komeda_drv *drv = dev_get_drvdata(mdev->dev);
+	struct komeda_kms_dev *kms = drv->kms;
+	struct drm_device *drm = &kms->base;
 	struct komeda_pipeline *pipe;
 
 	if (mdev->n_pipelines + 1 > KOMEDA_MAX_PIPELINES) {
-		DRM_ERROR("Exceed max support %d pipelines.\n",
-			  KOMEDA_MAX_PIPELINES);
+		drm_err(drm, "Exceed max support %d pipelines.\n",
+			KOMEDA_MAX_PIPELINES);
 		return ERR_PTR(-ENOSPC);
 	}
 
 	if (size < sizeof(*pipe)) {
-		DRM_ERROR("Request pipeline size too small.\n");
+		drm_err(drm, "Request pipeline size too small.\n");
 		return ERR_PTR(-EINVAL);
 	}
 
@@ -71,6 +75,9 @@ static struct komeda_component **
 komeda_pipeline_get_component_pos(struct komeda_pipeline *pipe, int id)
 {
 	struct komeda_dev *mdev = pipe->mdev;
+	struct komeda_drv *drv = dev_get_drvdata(mdev->dev);
+	struct komeda_kms_dev *kms = drv->kms;
+	struct drm_device *drm = &kms->base;
 	struct komeda_pipeline *temp = NULL;
 	struct komeda_component **pos = NULL;
 
@@ -88,7 +95,7 @@ komeda_pipeline_get_component_pos(struct komeda_pipeline *pipe, int id)
 	case KOMEDA_COMPONENT_COMPIZ1:
 		temp = mdev->pipelines[id - KOMEDA_COMPONENT_COMPIZ0];
 		if (!temp) {
-			DRM_ERROR("compiz-%d doesn't exist.\n", id);
+			drm_err(drm, "compiz-%d doesn't exist.\n", id);
 			return NULL;
 		}
 		pos = to_cpos(temp->compiz);
@@ -107,7 +114,7 @@ komeda_pipeline_get_component_pos(struct komeda_pipeline *pipe, int id)
 	case KOMEDA_COMPONENT_IPS1:
 		temp = mdev->pipelines[id - KOMEDA_COMPONENT_IPS0];
 		if (!temp) {
-			DRM_ERROR("ips-%d doesn't exist.\n", id);
+			drm_err(drm, "ips-%d doesn't exist.\n", id);
 			return NULL;
 		}
 		pos = to_cpos(temp->improc);
@@ -117,7 +124,7 @@ komeda_pipeline_get_component_pos(struct komeda_pipeline *pipe, int id)
 		break;
 	default:
 		pos = NULL;
-		DRM_ERROR("Unknown pipeline resource ID: %d.\n", id);
+		drm_err(drm, "Unknown pipeline resource ID: %d.\n", id);
 		break;
 	}
 
@@ -169,6 +176,9 @@ komeda_component_add(struct komeda_pipeline *pipe,
 		     u8 max_active_outputs, u32 __iomem *reg,
 		     const char *name_fmt, ...)
 {
+	struct komeda_drv *drv = dev_get_drvdata(pipe->mdev->dev);
+	struct komeda_kms_dev *kms = drv->kms;
+	struct drm_device *drm = &kms->base;
 	struct komeda_component **pos;
 	struct komeda_component *c;
 	int idx, *num = NULL;
@@ -187,14 +197,14 @@ komeda_component_add(struct komeda_pipeline *pipe,
 		idx = id - KOMEDA_COMPONENT_LAYER0;
 		num = &pipe->n_layers;
 		if (idx != pipe->n_layers) {
-			DRM_ERROR("please add Layer by id sequence.\n");
+			drm_err(drm, "please add Layer by id sequence.\n");
 			return ERR_PTR(-EINVAL);
 		}
 	} else if (has_bit(id,  KOMEDA_PIPELINE_SCALERS)) {
 		idx = id - KOMEDA_COMPONENT_SCALER0;
 		num = &pipe->n_scalers;
 		if (idx != pipe->n_scalers) {
-			DRM_ERROR("please add Scaler by id sequence.\n");
+			drm_err(drm, "please add Scaler by id sequence.\n");
 			return ERR_PTR(-EINVAL);
 		}
 	}
@@ -240,27 +250,34 @@ static void komeda_component_dump(struct komeda_component *c)
 	if (!c)
 		return;
 
-	DRM_DEBUG("	%s: ID %d-0x%08lx.\n",
-		  c->name, c->id, BIT(c->id));
-	DRM_DEBUG("		max_active_inputs:%d, supported_inputs: 0x%08x.\n",
-		  c->max_active_inputs, c->supported_inputs);
-	DRM_DEBUG("		max_active_outputs:%d, supported_outputs: 0x%08x.\n",
-		  c->max_active_outputs, c->supported_outputs);
+	struct komeda_drv *drv = dev_get_drvdata(c->pipeline->mdev->dev);
+	struct komeda_kms_dev *kms = drv->kms;
+	struct drm_device *drm = &kms->base;
+
+	drm_dbg(drm, "	%s: ID %d-0x%08lx.\n",
+		c->name, c->id, BIT(c->id));
+	drm_dbg(drm, "		max_active_inputs:%d, supported_inputs: 0x%08x.\n",
+		c->max_active_inputs, c->supported_inputs);
+	drm_dbg(drm, "		max_active_outputs:%d, supported_outputs: 0x%08x.\n",
+		c->max_active_outputs, c->supported_outputs);
 }
 
 void komeda_pipeline_dump(struct komeda_pipeline *pipe)
 {
+	struct komeda_drv *drv = dev_get_drvdata(pipe->mdev->dev);
+	struct komeda_kms_dev *kms = drv->kms;
+	struct drm_device *drm = &kms->base;
 	struct komeda_component *c;
 	int id;
 	unsigned long avail_comps = pipe->avail_comps;
 
-	DRM_INFO("Pipeline-%d: n_layers: %d, n_scalers: %d, output: %s.\n",
+	drm_info(drm, "Pipeline-%d: n_layers: %d, n_scalers: %d, output: %s.\n",
 		 pipe->id, pipe->n_layers, pipe->n_scalers,
 		 pipe->dual_link ? "dual-link" : "single-link");
-	DRM_INFO("	output_link[0]: %s.\n",
+	drm_info(drm, "	output_link[0]: %s.\n",
 		 pipe->of_output_links[0] ?
 		 pipe->of_output_links[0]->full_name : "none");
-	DRM_INFO("	output_link[1]: %s.\n",
+	drm_info(drm, "	output_link[1]: %s.\n",
 		 pipe->of_output_links[1] ?
 		 pipe->of_output_links[1]->full_name : "none");
 
@@ -274,6 +291,9 @@ void komeda_pipeline_dump(struct komeda_pipeline *pipe)
 static void komeda_component_verify_inputs(struct komeda_component *c)
 {
 	struct komeda_pipeline *pipe = c->pipeline;
+	struct komeda_drv *drv = dev_get_drvdata(pipe->mdev->dev);
+	struct komeda_kms_dev *kms = drv->kms;
+	struct drm_device *drm = &kms->base;
 	struct komeda_component *input;
 	int id;
 	unsigned long supported_inputs = c->supported_inputs;
@@ -282,7 +302,7 @@ static void komeda_component_verify_inputs(struct komeda_component *c)
 		input = komeda_pipeline_get_component(pipe, id);
 		if (!input) {
 			c->supported_inputs &= ~(BIT(id));
-			DRM_WARN("Can not find input(ID-%d) for component: %s.\n",
+			drm_warn(drm, "Can not find input(ID-%d) for component: %s.\n",
 				 id, c->name);
 			continue;
 		}
@@ -306,6 +326,9 @@ komeda_get_layer_split_right_layer(struct komeda_pipeline *pipe,
 
 static void komeda_pipeline_assemble(struct komeda_pipeline *pipe)
 {
+	struct komeda_drv *drv = dev_get_drvdata(pipe->mdev->dev);
+	struct komeda_kms_dev *kms = drv->kms;
+	struct drm_device *drm = &kms->base;
 	struct komeda_component *c;
 	struct komeda_layer *layer;
 	int i, id;
@@ -324,7 +347,7 @@ static void komeda_pipeline_assemble(struct komeda_pipeline *pipe)
 
 	if (pipe->dual_link && !pipe->ctrlr->supports_dual_link) {
 		pipe->dual_link = false;
-		DRM_WARN("PIPE-%d doesn't support dual-link, ignore DT dual-link configuration.\n",
+		drm_warn(drm, "PIPE-%d doesn't support dual-link, ignore DT dual-link configuration.\n",
 			 pipe->id);
 	}
 }
-- 
2.43.0

