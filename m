Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C04E168F84C
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 20:49:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6E8610E84D;
	Wed,  8 Feb 2023 19:49:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEA410E850
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 19:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0pGl79w6iXpODRxnsOAlv49cl0bK3ENT/e5Yifg/O84=; b=oVrb+7FKAIU2bAUFeUytFNkemI
 jcfCK/71aBm1JcHrIwWu3hfDkECAIOm5WmnMiOTaG0TsAbvrC7UK44V3Ikf1ai0hxuPE6bADCICDF
 fNASgtIwM9wRzpwt1OT0ZsmONSP15CQMquXKQ5QbtfbeHZ8CjohZSi1OytnXTOhgLIgCDGkjowxIF
 mKW4FSiMv5ZNNANxgdDLwbsSXoyN+Utpf2VpmHbWQ2L6Dc78eveoCS2UahWXhjKGEHTTEinn/xkEm
 Lxw76eIdglx1o1kXcxt+ahRQlkfC0nLjCTLySEqISOtW0zzHLCZr0fGfbgzjV8i9uW5KGtJ+7pNwe
 CqJquv9w==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pPqRE-00DCm6-Eb; Wed, 08 Feb 2023 20:49:04 +0100
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
Subject: [PATCH 4/5] drm/panfrost: Use drm_sched_job_add_syncobj_dependency()
Date: Wed,  8 Feb 2023 16:48:16 -0300
Message-Id: <20230208194817.199932-5-mcanal@igalia.com>
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

As panfrost_copy_in_sync() performs the same steps as
drm_sched_job_add_syncobj_dependency(), replace the open-coded
implementation in Panfrost in order to simply, using the DRM function.

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

