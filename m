Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C8E690935
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 13:46:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF0110EAB8;
	Thu,  9 Feb 2023 12:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CE410EAB8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 12:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rNUEXqoODhXPBUInTmCiAwVWDHFRnHDxTjsYEuYJ+30=; b=ASOb9XEXpQl6/HbBXTUshlaE3e
 3wzqQnCyDDK9gFd6Vh9bMuqjLTIuCtVT6tfyJJWlHzLdUZsm4YbJqsLDdmozz8n2YZumobnKk5Oq7
 28q4Zri6ydyQzKEeD72NHYJB6zIsfS8llYrQVF967en//fzE069lfZQcti5fSK1XErb+qGO66zeeu
 u5B7REVZbRSA7AFWxEGaGrIOBdhtfsYTxzyg1D6p/ppXeIb7jn2fchzArhsNyB4tz+CHcs4g5yBVW
 8Ev+ga5n4/wF7GRHrhBajs2J4bnJDt5X+I6rAdN5zWD9WVbOGpok19byfeotYPxX1KUzt8V54ofnE
 I4fd/3gw==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pQ6JU-00DvU2-Ov; Thu, 09 Feb 2023 13:46:09 +0100
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
Subject: [PATCH v2 2/5] drm/lima: Use drm_sched_job_add_syncobj_dependency()
Date: Thu,  9 Feb 2023 09:44:45 -0300
Message-Id: <20230209124447.467867-3-mcanal@igalia.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As lima_gem_add_deps() performs the same steps as
drm_sched_job_add_syncobj_dependency(), replace the open-coded
implementation in Lima in order to simply use the DRM function.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/lima/lima_gem.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_gem.c b/drivers/gpu/drm/lima/lima_gem.c
index 0f1ca0b0db49..10252dc11a22 100644
--- a/drivers/gpu/drm/lima/lima_gem.c
+++ b/drivers/gpu/drm/lima/lima_gem.c
@@ -277,21 +277,13 @@ static int lima_gem_add_deps(struct drm_file *file, struct lima_submit *submit)
 	int i, err;
 
 	for (i = 0; i < ARRAY_SIZE(submit->in_sync); i++) {
-		struct dma_fence *fence = NULL;
-
 		if (!submit->in_sync[i])
 			continue;
 
-		err = drm_syncobj_find_fence(file, submit->in_sync[i],
-					     0, 0, &fence);
+		err = drm_sched_job_add_syncobj_dependency(&submit->task->base, file,
+							   submit->in_sync[i], 0);
 		if (err)
 			return err;
-
-		err = drm_sched_job_add_dependency(&submit->task->base, fence);
-		if (err) {
-			dma_fence_put(fence);
-			return err;
-		}
 	}
 
 	return 0;
-- 
2.39.1

