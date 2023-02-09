Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E450690936
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 13:46:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 589E810EABD;
	Thu,  9 Feb 2023 12:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48FB10EAB8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 12:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iyV22XRyKOfL+ReLvq9qxEA5sWL1NnSlJU35bZwKPTg=; b=cVbB5QL2xB4pjpJjiDJZXELLGd
 l1Vn8TzlER9lmvr7E0gFYSEE+2YShUjRzxyX/BONrRzgK1IpDqixl3vz5T5h1uYRVjnGAQbV83MWJ
 8lJUZJgeDfQ5UpcqcQHqT59OXF09sThmJ3ruFQ08LKA5jKKFUzyzBanQZ74vi5w45muOhg7M/nvBk
 Z2Ub9ydSYWERmevSMe42/TBFKO1PQJ+cbsRTxp8Paa3UXkMyVwRQSfXa9kwsIKNQk7hDUYAOtjimY
 bdKfDSXbJJyb1dYRI8P2WvfGitIHgsd/97ZlMoUX2r9+PnpMomGq+a/YmLcYTQz5Bjtrg0L/YChsD
 UY7ifopw==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pQ6Ja-00DvU2-SC; Thu, 09 Feb 2023 13:46:15 +0100
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
Subject: [PATCH v2 3/5] drm/msm: Use drm_sched_job_add_syncobj_dependency()
Date: Thu,  9 Feb 2023 09:44:46 -0300
Message-Id: <20230209124447.467867-4-mcanal@igalia.com>
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

As msm_parse_deps() performs the same steps as
drm_sched_job_add_syncobj_dependency(), replace the open-coded
implementation in msm in order to simply use the DRM function.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 73a2ca122c57..d360277809f2 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -550,7 +550,6 @@ static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
 
 	for (i = 0; i < nr_in_syncobjs; ++i) {
 		uint64_t address = in_syncobjs_addr + i * syncobj_stride;
-		struct dma_fence *fence;
 
 		if (copy_from_user(&syncobj_desc,
 			           u64_to_user_ptr(address),
@@ -570,12 +569,8 @@ static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
 			break;
 		}
 
-		ret = drm_syncobj_find_fence(file, syncobj_desc.handle,
-		                             syncobj_desc.point, 0, &fence);
-		if (ret)
-			break;
-
-		ret = drm_sched_job_add_dependency(&submit->base, fence);
+		ret = drm_sched_job_add_syncobj_dependency(&submit->base, file,
+							   syncobj_desc.handle, syncobj_desc.point);
 		if (ret)
 			break;
 
-- 
2.39.1

