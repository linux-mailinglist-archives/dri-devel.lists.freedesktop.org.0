Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D9E68F84D
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 20:49:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 494CB10E854;
	Wed,  8 Feb 2023 19:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F42810E855
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 19:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k0/uxf79xcZGJzJuX9Qph76mcvt2kbY+NPwywTHWTdY=; b=iGUp9blHzq1cH8h2yr/aO111a8
 xGKdtve6rQxSvAPRxx9MclWK4MafZOgOJZyfxJCX16v9mU05nBR59aGwHUhuAXwuO41nZuEIoFEYB
 ijmkwhypDRgvwlshumyErMvG6Zs4VMf4xiw6Wf6AWBUqLg27Rv8mDif+N/H/+qUhUee9i9Kn/hY80
 uqsJinXYvQZm446FtYSO8wn+w6dcu0XDXPxNv8yRvpI6OOdU5crsoY2J/uPACR1FX1ZlWe0rwzGnP
 UW+p5o+nRblUNHYcR3f7URuAFKeJ+ty4BQVRclYKotiSSlqKZnhWBwpoYH+YfSi2hsA8pm+7iRyVF
 7CjLMpQA==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pPqRL-00DCm6-3R; Wed, 08 Feb 2023 20:49:11 +0100
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
Subject: [PATCH 5/5] drm/v3d: Use drm_sched_job_add_syncobj_dependency()
Date: Wed,  8 Feb 2023 16:48:17 -0300
Message-Id: <20230208194817.199932-6-mcanal@igalia.com>
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

As v3d_job_add_deps() performs the same steps as
drm_sched_job_add_syncobj_dependency(), replace the open-coded
implementation in v3d in order to simply, using the DRM function.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_gem.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 5da1806f3969..f149526ec971 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -400,14 +400,7 @@ static int
 v3d_job_add_deps(struct drm_file *file_priv, struct v3d_job *job,
 		 u32 in_sync, u32 point)
 {
-	struct dma_fence *in_fence = NULL;
-	int ret;
-
-	ret = drm_syncobj_find_fence(file_priv, in_sync, point, 0, &in_fence);
-	if (ret == -EINVAL)
-		return ret;
-
-	return drm_sched_job_add_dependency(&job->base, in_fence);
+	return drm_sched_job_add_syncobj_dependency(&job->base, file_priv, in_sync, point);
 }
 
 static int
-- 
2.39.1

