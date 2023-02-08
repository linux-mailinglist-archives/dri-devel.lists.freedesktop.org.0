Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4DF68F84B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 20:49:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADF5410E84C;
	Wed,  8 Feb 2023 19:49:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD5D10E850
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 19:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kn107+SXlxAWmhC4HEpIit/pXkRYGFQc+mDnsy3ujr4=; b=BjQChNRgNo05LjogkrCidR+j2F
 S4hsoYMOw1JKEkxxegsFBj7rAeuqhtQNs1elwoJwZZzsJJa6FHsgIH0p3Dii+V+KCgip+++/fNqBC
 7QhgX5XItAEtcuqamaDkEsuiZy+En5PTT/DqOQZq08du/4VGaC/SHhJuVyLp7XdvMNJsWD4wGXU4Q
 T/JCMZgZ5qqOhxl7sgqAdEB0O596057Jp0S7Z3p/DMDFH1qmEZsXu/Re9MouGXUA4Ydm0hDAN+FOA
 VTmr2p+0FrW5j8yMTxnmWwnORRRvIrxrC3vEz/3bsrJAQdkBVR6fqBxgJZ8n6mM42RRx0tMFru+X9
 pjuwqBSw==;
Received: from [187.36.234.139] (helo=bowie..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pPqR8-00DCm6-6X; Wed, 08 Feb 2023 20:48:58 +0100
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
Subject: [PATCH 3/5] drm/msm: Use drm_sched_job_add_syncobj_dependency()
Date: Wed,  8 Feb 2023 16:48:15 -0300
Message-Id: <20230208194817.199932-4-mcanal@igalia.com>
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

As msm_parse_deps() performs the same steps as
drm_sched_job_add_syncobj_dependency(), replace the open-coded
implementation in msm in order to simply, using the DRM function.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 73a2ca122c57..622f1e27fcca 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -570,12 +570,8 @@ static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
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

