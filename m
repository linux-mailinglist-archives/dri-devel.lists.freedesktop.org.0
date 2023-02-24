Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED2E46A23EB
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 22:42:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76A1110E3B4;
	Fri, 24 Feb 2023 21:42:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA1DE10E3B4;
 Fri, 24 Feb 2023 21:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9O/89xKQoXtVMv1QuGR2Fq+VjTxKJ6+kDaOP7mTVub8=; b=qpsOfSf6LUPEE9JrqsczXO6dVZ
 c57QWi4f1LWf57yy0E5yy+wDZPsJKJWlxHiZTIKGFUI4nM+k/BvKzjllNc3Aci4QwX6nlQ+y6o8+4
 XAAuHuxpFBQXsz/NQzrBjz0Gz7oHAmFWmUVl3Vs6WRLK4KliYy79/sZLsqbqHCGIj7sVjMTo/2WtG
 +MIppz4+sDZrOLwnHw+KceIagXx3FQJAtk6HRcPFuGfGkm1Tve8edD12oZT0RhklVTG+SgSrZKZX8
 c3k15+s1RLqoLDDg1tQP3GSxpoeAnNTxYF3qhpeTiAj5Y+VjgPqnv6fAEe8wQZMmqdIO+7DBhLUGZ
 Q6ux7a5w==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pVfp9-00Dulq-9G; Fri, 24 Feb 2023 22:41:51 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Melissa Wen <mwen@igalia.com>
Subject: [PATCH 1/2] drm/lima: Use drm_sched_job_add_syncobj_dependency()
Date: Fri, 24 Feb 2023 18:41:32 -0300
Message-Id: <20230224214133.411966-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.2
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
 freedreno@lists.freedesktop.org, lima@lists.freedesktop.org,
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
2.39.2

