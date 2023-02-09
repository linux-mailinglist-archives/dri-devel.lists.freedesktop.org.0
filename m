Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FE31690937
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 13:46:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF99E10EABE;
	Thu,  9 Feb 2023 12:46:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529F510EABE
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 12:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oeOXjyMQt5ujoJDziirlRNy5dxOS9/taSNuk4Gni6rk=; b=C7d1gGreHnvvirExM9na3PztIs
 Uu6uUjqb44EAoRr5t18e//UtnTKiPCt1G0Bti5vrHBG9n7mlIlrAg8iveGovSkr3OTa1yCs+1tuZu
 Os5bSmYVi6XcUgF8AhMe3TQcJ/Ez5nzCGNVfWFVPKGPg+FCJsdVwTlfmXAP22/9w4ZG/G7m1QCLqE
 P/CBgBp7XWx6QGjx7AVVsVqtoRsU2UyiJegADC8IMxxtmUBiNCuVfnREjOO460dRl1CDujMNMzTRZ
 aWYrNirh4AGyTftuu7AnJo5zqHRqiBHPG2E31U1rx69Y6N3gJcmEqQhXiRzT3IVQC0d7mQ8KeuXJ+
 YaTq8Abw==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pQ6Jh-00DvU2-M8; Thu, 09 Feb 2023 13:46:22 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Luben Tuikov <luben.tuikov@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Qiang Yu <yuq825@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh@kernel.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Melissa Wen <mwen@igalia.com>
Subject: [PATCH v2 4/5] drm/panfrost: Use
 drm_sched_job_add_syncobj_dependency()
Date: Thu,  9 Feb 2023 09:44:47 -0300
Message-Id: <20230209124447.467867-5-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230209124447.467867-1-mcanal@igalia.com>
References: <20230209124447.467867-1-mcanal@igalia.com>
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
 dri-devel@lists.freedesktop.org, Alyssa Rosenzweig <alyssa@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As panfrost_copy_in_sync() performs the same steps as
drm_sched_job_add_syncobj_dependency(), replace the open-coded
implementation in Panfrost in order to simply use the DRM function.

Reviewed-by: Alyssa Rosenzweig <alyssa@collabora.com>
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index abb0dadd8f63..f49096f53141 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -220,15 +220,8 @@ panfrost_copy_in_sync(struct drm_device *dev,
 	}
 
 	for (i = 0; i < in_fence_count; i++) {
-		struct dma_fence *fence;
-
-		ret = drm_syncobj_find_fence(file_priv, handles[i], 0, 0,
-					     &fence);
-		if (ret)
-			goto fail;
-
-		ret = drm_sched_job_add_dependency(&job->base, fence);
-
+		ret = drm_sched_job_add_syncobj_dependency(&job->base, file_priv,
+							   handles[i], 0);
 		if (ret)
 			goto fail;
 	}
-- 
2.39.1

