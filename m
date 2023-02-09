Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C8E690938
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 13:46:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFC1510EAC1;
	Thu,  9 Feb 2023 12:46:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71E3410EAC1
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 12:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Inj1IBfV14c20dmyZ/J7NK00GJjIwFxr42LgpgkWDvQ=; b=GBcbDHHbHYZN3vgkVcFmO5yNX9
 KpOpvept3jMZFnUrRAhPYB0IT/3WQLEAy701EC1HANgLkv0YW1IArJcp1SbpMVYlrEp8mA5J/YPbc
 mduXxOjqA2q6Rlad5unNg4DAzpmKID0t07RXhV416FUoYNYvazOseTKuCwvgThZmc+b32DNNQwhTe
 MGmfULV8sHTMGAcw+oFo53f2aVporMlKMmQ5XNvVtDbVDNS3UmcWRxCPx+J3j4Dc8DiKl2++mtmgc
 R3fZCJ6nc+4Q8qQIscEofH5Tqi53pCFuCppdr7KysbqgB+BvaVs/igXCig9NA4yIFlpQTMdTLr5hc
 cpx65ZrA==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pQ6Jn-00DvU2-Js; Thu, 09 Feb 2023 13:46:28 +0100
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
Subject: [PATCH v2 5/5] drm/v3d: Use drm_sched_job_add_syncobj_dependency()
Date: Thu,  9 Feb 2023 09:44:48 -0300
Message-Id: <20230209124447.467867-6-mcanal@igalia.com>
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

As v3d_job_add_deps() performs the same steps as
drm_sched_job_add_syncobj_dependency(), replace the open-coded
implementation in v3d in order to simply use the DRM function.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_gem.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 5da1806f3969..24cc65ffb4df 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -396,20 +396,6 @@ v3d_wait_bo_ioctl(struct drm_device *dev, void *data,
 	return ret;
 }
 
-static int
-v3d_job_add_deps(struct drm_file *file_priv, struct v3d_job *job,
-		 u32 in_sync, u32 point)
-{
-	struct dma_fence *in_fence = NULL;
-	int ret;
-
-	ret = drm_syncobj_find_fence(file_priv, in_sync, point, 0, &in_fence);
-	if (ret == -EINVAL)
-		return ret;
-
-	return drm_sched_job_add_dependency(&job->base, in_fence);
-}
-
 static int
 v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 	     void **container, size_t size, void (*free)(struct kref *ref),
@@ -447,14 +433,14 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file *file_priv,
 					DRM_DEBUG("Failed to copy wait dep handle.\n");
 					goto fail_deps;
 				}
-				ret = v3d_job_add_deps(file_priv, job, in.handle, 0);
-				if (ret)
+				ret = drm_sched_job_add_syncobj_dependency(&job->base, file_priv, in.handle, 0);
+				if (ret && ret != -ENOENT)
 					goto fail_deps;
 			}
 		}
 	} else {
-		ret = v3d_job_add_deps(file_priv, job, in_sync, 0);
-		if (ret)
+		ret = drm_sched_job_add_syncobj_dependency(&job->base, file_priv, in_sync, 0);
+		if (ret && ret != -ENOENT)
 			goto fail_deps;
 	}
 
-- 
2.39.1

