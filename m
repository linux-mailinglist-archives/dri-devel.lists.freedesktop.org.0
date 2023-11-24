Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 096607F6A1E
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 02:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3244210E786;
	Fri, 24 Nov 2023 01:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AACE210E785
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 01:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bVGnQwXnZq/pKO3cHRMchaCtJ7/T1s8//h3rCHp/alE=; b=CkVEJ/gsxOp+PpvyU9j/IRyMr6
 ePGIHb9+GzMUkUDajfsCKH0GQw+K7rtW+b0Y36OWvrzrhIWrhEjqU7XZDZj5uWn8rzpwBDt8yDGeZ
 4R82M/3Jbw4dlu4LKufo+/I7MdHFzhkK7MO0R2Ei7gscKtFipHaMXyFB/1lUsDr15KxZF5qfG4qqa
 9QVh4RqZAPlb2TmQl6mvz719zKsHayWV2pOUzBusr1bmvBjsIq2dys/nXAMWL/0/OYS603dpg/H33
 4/GW6cnp4A4CWhb8geC2voxS6u2w9vawxIXisg7pGABKbDrvxMmibvUBnjc0bgA3OrqFhDkznfOMr
 AXittiyA==;
Received: from [177.34.168.16] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r6Ky8-006Zga-83; Fri, 24 Nov 2023 02:26:56 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 04/17] drm/v3d: Simplify job refcount handling
Date: Thu, 23 Nov 2023 21:47:00 -0300
Message-ID: <20231124012548.772095-5-mcanal@igalia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231124012548.772095-1-mcanal@igalia.com>
References: <20231124012548.772095-1-mcanal@igalia.com>
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Melissa Wen <mwen@igalia.com>

Instead of checking if the job is NULL every time we call the function,
check it inside the function.

Signed-off-by: Melissa Wen <mwen@igalia.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_submit.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_submit.c b/drivers/gpu/drm/v3d/v3d_submit.c
index f36214002f37..e18e7c963884 100644
--- a/drivers/gpu/drm/v3d/v3d_submit.c
+++ b/drivers/gpu/drm/v3d/v3d_submit.c
@@ -129,6 +129,9 @@ void v3d_job_cleanup(struct v3d_job *job)
 
 void v3d_job_put(struct v3d_job *job)
 {
+	if (!job)
+		return;
+
 	kref_put(&job->refcount, job->free);
 }
 
@@ -517,11 +520,9 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 						 &se,
 						 last_job->done_fence);
 
-	if (bin)
-		v3d_job_put(&bin->base);
-	v3d_job_put(&render->base);
-	if (clean_job)
-		v3d_job_put(clean_job);
+	v3d_job_put((void *)bin);
+	v3d_job_put((void *)render);
+	v3d_job_put((void *)clean_job);
 
 	return 0;
 
@@ -621,7 +622,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
 						 &se,
 						 job->base.done_fence);
 
-	v3d_job_put(&job->base);
+	v3d_job_put((void *)job);
 
 	return 0;
 
@@ -725,7 +726,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 						 &se,
 						 clean_job->done_fence);
 
-	v3d_job_put(&job->base);
+	v3d_job_put((void *)job);
 	v3d_job_put(clean_job);
 
 	return 0;
-- 
2.41.0

