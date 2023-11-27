Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C11D97FA970
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 20:00:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5C6C10E3E7;
	Mon, 27 Nov 2023 19:00:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC9BE10E3DB
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 19:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HMnP0nsUbp8jy9rjF58RVwPtyVIB0xPs3y4AvaHil6c=; b=f/dwvuvQCaWEs5ZKT5G1hHmJx9
 Dm8IuFdOnrvpLQkXwzgf7rUAUVbnkSRzTcXnwdHg4PRyevPfNNlrE9lmq0oZU0p/elDej0jP1GhbK
 4UcqJ/4BlnX10o2rsSXynbxi219fv0+u/dUsdBP+ufs23Jc6XX47sIR7OjDepo5yOmW0/yaDOFMNV
 aSWojTuLxp0uE+eYg2fRVbKOiP4HBZM+qvlKb7nhI2VGhKo5wE+0hGlB1+dhnjTri8lt9xWVZriln
 OtIc94qeyR5Tr1FMBl/p0TaKt3/FKtnz0D5F6H5hMdc1Mey6h9WIb9jcMyXbDjIha5IEJ8JuWeORl
 ouRqErow==;
Received: from [177.34.168.16] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r7gq2-007jiM-9G; Mon, 27 Nov 2023 20:00:10 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 10/17] drm/v3d: Detach the CSD job BO setup
Date: Mon, 27 Nov 2023 15:48:28 -0300
Message-ID: <20231127185723.10348-12-mcanal@igalia.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231127185723.10348-2-mcanal@igalia.com>
References: <20231127185723.10348-2-mcanal@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Melissa Wen <mwen@igalia.com>

Detach CSD job setup from CSD submission ioctl to reuse it in CPU
submission ioctl for indirect CSD job.

Signed-off-by: Melissa Wen <mwen@igalia.com>
Co-developed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_submit.c | 68 ++++++++++++++++++++------------
 1 file changed, 42 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index c134b113b181..eb26fe1e27e3 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -256,6 +256,45 @@ v3d_attach_fences_and_unlock_reservation(struct drm_file *file_priv,
 	}
 }
 
+static int
+v3d_setup_csd_jobs_and_bos(struct drm_file *file_priv,
+			   struct v3d_dev *v3d,
+			   struct drm_v3d_submit_csd *args,
+			   struct v3d_csd_job **job,
+			   struct v3d_job **clean_job,
+			   struct v3d_submit_ext *se,
+			   struct ww_acquire_ctx *acquire_ctx)
+{
+	int ret;
+
+	ret = v3d_job_allocate((void *)job, sizeof(**job));
+	if (ret)
+		return ret;
+
+	ret = v3d_job_init(v3d, file_priv, &(*job)->base,
+			   v3d_job_free, args->in_sync, se, V3D_CSD);
+	if (ret)
+		return ret;
+
+	ret = v3d_job_allocate((void *)clean_job, sizeof(**clean_job));
+	if (ret)
+		return ret;
+
+	ret = v3d_job_init(v3d, file_priv, *clean_job,
+			   v3d_job_free, 0, NULL, V3D_CACHE_CLEAN);
+	if (ret)
+		return ret;
+
+	(*job)->args = *args;
+
+	ret = v3d_lookup_bos(&v3d->drm, file_priv, *clean_job,
+			     args->bo_handles, args->bo_handle_count);
+	if (ret)
+		return ret;
+
+	return v3d_lock_bo_reservations(*clean_job, acquire_ctx);
+}
+
 static void
 v3d_put_multisync_post_deps(struct v3d_submit_ext *se)
 {
@@ -700,32 +739,9 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 		}
 	}
 
-	ret = v3d_job_allocate((void *)&job, sizeof(*job));
-	if (ret)
-		return ret;
-
-	ret = v3d_job_init(v3d, file_priv, &job->base,
-			   v3d_job_free, args->in_sync, &se, V3D_CSD);
-	if (ret)
-		goto fail;
-
-	ret = v3d_job_allocate((void *)&clean_job, sizeof(*clean_job));
-	if (ret)
-		goto fail;
-
-	ret = v3d_job_init(v3d, file_priv, clean_job,
-			   v3d_job_free, 0, NULL, V3D_CACHE_CLEAN);
-	if (ret)
-		goto fail;
-
-	job->args = *args;
-
-	ret = v3d_lookup_bos(dev, file_priv, clean_job,
-			     args->bo_handles, args->bo_handle_count);
-	if (ret)
-		goto fail;
-
-	ret = v3d_lock_bo_reservations(clean_job, &acquire_ctx);
+	ret = v3d_setup_csd_jobs_and_bos(file_priv, v3d, args,
+					 &job, &clean_job, &se,
+					 &acquire_ctx);
 	if (ret)
 		goto fail;
 
-- 
2.42.0

