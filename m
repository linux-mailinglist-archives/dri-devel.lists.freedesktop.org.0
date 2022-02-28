Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 246C44C776B
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 19:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAB9C10E228;
	Mon, 28 Feb 2022 18:17:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35E8A10E228
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 18:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YR1/jlTZSQPxD81csOAIAfLa4i4Sxv2/d+YrNe2qW7A=; b=mgQm10fUVc9kgc4Wgk3J5S1tEy
 ZVUa9ujYT89jNZnWgbg+tdJuwBTdMkj+8bNxgSeW+YjGu9U95HEFEiPsVx8HpRRUwXJKpSOQIuBoW
 Jll8UiiMU3grQc+McvEtzRjq+gxZQwFXWQKk+F1tl9rqSj8hyf5GD4cPMgvhm9iVJcAqjWtT16qIh
 3uvZlrB1WXoLyRY4wJ062pjDfnfJNui/VQuor4H3YNeAVf6kD9E0Aneyz0n0VEQmrzILEjCyDsJxU
 T4NJtSeRNjnF+dgUEsd/AyEbPxQjzshS4Zx53VgwcJDLtTjUNv4lLw8QVA9blj3CBzO8FuEXA7XV4
 W9R2PLYg==;
Received: from [165.90.126.25] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nOkaE-0003pp-3P; Mon, 28 Feb 2022 19:17:18 +0100
From: Melissa Wen <mwen@igalia.com>
To: emma@anholt.net,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/v3d: centralize error handling when init scheduler fails
Date: Mon, 28 Feb 2022 17:16:47 -0100
Message-Id: <20220228181647.3794298-1-mwen@igalia.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Jiawei.Gu@amd.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Melissa Wen <mwen@igalia.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Remove redundant error message (since now it is very similar to what
we do in drm_sched_init) and centralize all error handling in a
unique place, as we follow the same steps in any case of failure.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_sched.c | 40 +++++++++++----------------------
 1 file changed, 13 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 39459ae96f30..06238e6d7f5c 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -392,34 +392,24 @@ v3d_sched_init(struct v3d_dev *v3d)
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
 			     NULL, "v3d_bin", v3d->drm.dev);
-	if (ret) {
-		dev_err(v3d->drm.dev, "Failed to create bin scheduler: %d.", ret);
+	if (ret)
 		return ret;
-	}
 
 	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
 			     &v3d_render_sched_ops,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
 			     NULL, "v3d_render", v3d->drm.dev);
-	if (ret) {
-		dev_err(v3d->drm.dev, "Failed to create render scheduler: %d.",
-			ret);
-		v3d_sched_fini(v3d);
-		return ret;
-	}
+	if (ret)
+		goto fail;
 
 	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
 			     &v3d_tfu_sched_ops,
 			     hw_jobs_limit, job_hang_limit,
 			     msecs_to_jiffies(hang_limit_ms), NULL,
 			     NULL, "v3d_tfu", v3d->drm.dev);
-	if (ret) {
-		dev_err(v3d->drm.dev, "Failed to create TFU scheduler: %d.",
-			ret);
-		v3d_sched_fini(v3d);
-		return ret;
-	}
+	if (ret)
+		goto fail;
 
 	if (v3d_has_csd(v3d)) {
 		ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
@@ -427,27 +417,23 @@ v3d_sched_init(struct v3d_dev *v3d)
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
 				     NULL, "v3d_csd", v3d->drm.dev);
-		if (ret) {
-			dev_err(v3d->drm.dev, "Failed to create CSD scheduler: %d.",
-				ret);
-			v3d_sched_fini(v3d);
-			return ret;
-		}
+		if (ret)
+			goto fail;
 
 		ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
 				     &v3d_cache_clean_sched_ops,
 				     hw_jobs_limit, job_hang_limit,
 				     msecs_to_jiffies(hang_limit_ms), NULL,
 				     NULL, "v3d_cache_clean", v3d->drm.dev);
-		if (ret) {
-			dev_err(v3d->drm.dev, "Failed to create CACHE_CLEAN scheduler: %d.",
-				ret);
-			v3d_sched_fini(v3d);
-			return ret;
-		}
+		if (ret)
+			goto fail;
 	}
 
 	return 0;
+
+fail:
+	v3d_sched_fini(v3d);
+	return ret;
 }
 
 void
-- 
2.34.1

