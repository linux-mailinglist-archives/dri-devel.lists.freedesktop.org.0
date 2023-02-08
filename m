Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFB968F84A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 20:49:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03D1E10E84A;
	Wed,  8 Feb 2023 19:49:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB39910E850
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 19:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wAVkk88UB+qmi2JVNKR/kpIZ2+DOKPhGRy3Uq4cU4R0=; b=T9WyGxyIJCejL/SUsHc4fefiPv
 sROw3VK86V18rY4OeI5F+ruQYBgtWHA8DpPA8G9/SQeFn5jSecsL37EDgIA3Gz9UNKZksOCdrPbL2
 ePC4KwBbNulw0EL19de5QEPfab5D9p2u/I8srX89dHbfBTfJU6Ee2xLYzft59VvqtoN1o68SEE3Ll
 TvjirDfUxzXOvXZo6YKnpu8vxDvSJ1Z8CjslOIDYH9nDDIExWktWreaZ3GhrOkELR7c4d9YMB8Mcq
 eioNnDx3rxEgO0apfYe3mIwSKfx8OdVpQHKUJHXjpm6E9vTOa5XqE6cXcftfkyeMLJTOAzTvDCxoN
 WADKaxvg==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pPqR2-00DCm6-6T; Wed, 08 Feb 2023 20:48:52 +0100
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
Subject: [PATCH 2/5] drm/lima: Use drm_sched_job_add_syncobj_dependency()
Date: Wed,  8 Feb 2023 16:48:14 -0300
Message-Id: <20230208194817.199932-3-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208194817.199932-1-mcanal@igalia.com>
References: <20230208194817.199932-1-mcanal@igalia.com>
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
implementation in Lima in order to simply, using the DRM function.

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

