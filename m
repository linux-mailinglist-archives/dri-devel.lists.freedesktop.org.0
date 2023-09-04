Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9EF791C2D
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 19:51:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFC010E3D1;
	Mon,  4 Sep 2023 17:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D424F10E3C8
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 17:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K48fL1OJrSt/3NkK7o6WRqVZPeK/n/GipA+lTpt/Kek=; b=BIl3Tejwv4wvhx0zDge/gWNaWI
 XjTksqNyevxK6xNoFIZoEeVoWbOTR2ebLnphPI5zcVXyUXA+ugjPTQUCzyhemcupvf/2efPXb9WOY
 K6Cc6XxisTRv2aCvDImBoGxeYvMuZlmfHxSvvXGlZKkgs8hKKrcqAbBRm8tROYeJhPp7nO2ccg9gw
 85p8H185Tcd6dOVxVf4odkqZ7mm+AgswRCT/vcD0qOTU2GZy40saKfhqHlh/4imNZ8hY/MwmMAJU/
 GdsmNSHQjvJ80WUUa1X2Vk+N7bs3cniSfSsqokMVyE+82u/pbf4c3CJMbEp3JAAFrdmxlqU+c7LGh
 DmIEudXQ==;
Received: from [187.36.235.191] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qdDjd-0028nB-67; Mon, 04 Sep 2023 19:51:37 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Emma Anholt <emma@anholt.net>, Melissa Wen <mwen@igalia.com>,
 Iago Toral <itoral@igalia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 10/17] drm/v3d: Detach the CSD job BO setup
Date: Mon,  4 Sep 2023 14:38:58 -0300
Message-ID: <20230904175019.1172713-11-mcanal@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230904175019.1172713-1-mcanal@igalia.com>
References: <20230904175019.1172713-1-mcanal@igalia.com>
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
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Melissa Wen <mwen@igalia.com>

Detach CSD job setup from CSD submission ioctl to reuse it in CPU
submission ioctl for indirect CSD job.

Signed-off-by: Melissa Wen <mwen@igalia.com>
Co-developed-by: Maíra Canal <mcanal@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_submit.c | 52 +++++++++++++++++++++-----------
 1 file changed, 34 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index 5402d8aacb71..72f006738132 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -268,6 +268,37 @@ v3d_attach_fences_and_unlock_reservation(struct drm_file *file_priv,
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
+	ret = v3d_job_init(v3d, file_priv, (void *)job, sizeof(**job),
+			   v3d_job_free, args->in_sync, se, V3D_CSD);
+	if (ret)
+		return ret;
+
+	ret = v3d_job_init(v3d, file_priv, (void *)clean_job, sizeof(**clean_job),
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
@@ -696,24 +727,9 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 		}
 	}
 
-	ret = v3d_job_init(v3d, file_priv, (void *)&job, sizeof(*job),
-			   v3d_job_free, args->in_sync, &se, V3D_CSD);
-	if (ret)
-		goto fail;
-
-	ret = v3d_job_init(v3d, file_priv, (void *)&clean_job, sizeof(*clean_job),
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
2.41.0

