Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 142E854CECD
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 18:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F159C11238C;
	Wed, 15 Jun 2022 16:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED70D11238C;
 Wed, 15 Jun 2022 16:35:23 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 t3-20020a17090a510300b001ea87ef9a3dso2541727pjh.4; 
 Wed, 15 Jun 2022 09:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NXNiK5CoOd5h/K567StuCdpvu1byZQqmWfR+aD9BoLg=;
 b=m2hmwJKhxnLWptIU4bEaOprXB7AjROw7lct5pUQISGmydnU6CeitFPq3Qc9nBe1MQC
 PaaVmblRPW/g2e460HEqDMv1JWHDx+leQItVlqmFT92ZIOQ4mFuHkp/67ZK/on2CWJ57
 7cHTsZBoqA/i8uP47pfHx3HmdrA3/UMF6T5VWr7Saf5m5cn6uTuD64FNpK99mmvImEJp
 Ccu3KzYFY84/TZ/XWD1T0TNUh7Ldx3ruUETmYEfqVSxkJQHNqP4xxrNI8YMsVfFxYGgb
 FUoek2jo46bd3K8MhP0Z1sx8mK3GTsyfPGDDONzkL2tdDHbiUYLQTk06jL6veFjQXxIi
 a0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NXNiK5CoOd5h/K567StuCdpvu1byZQqmWfR+aD9BoLg=;
 b=nrahkiyXzXMxYn/pFNi+F+pxl5p3+TLv6vRXAxIjeK3f6Q65jGA32jQvaiyrnI3ZyZ
 dZ0kFeDxh2G360Zl0we82oz75fcvmew4lje93Hy8O8aVol+aqu2IfX+e9ngjN2fX0o3T
 8h0L5XdEwa7p6nACb1PDrYjXzr1I+uECrgN0pnRDxSZxcJvtyFKz0bUDuufZ+48fNieQ
 nSg7eKvwdOac7e9fW/iMHWijJ9H4LoEUOcMHmaNXvaBkxOVvsNGAi1FOjzCwCTI6hY7t
 pRETQHsUVVZxNMjoON6G7sjgNJh3HNVjCh2zNGqCL33ZsM6AwovbeiUEP1yDuxrnD23l
 ObJw==
X-Gm-Message-State: AJIora9fUAX85X70RiEyX1vvmzmSyTVW/XaCdCNd69+2J8qurRV93EsF
 0+Lq+U1K/xXoKkDpEGexyLvEjCYSas0=
X-Google-Smtp-Source: AGRyM1tLwthhtZmarB0uyNajKCWDIJw6HY2FWPaSR5DXQjf5zLnQlXHmthoGVTwOVaURRNFowOIaPw==
X-Received: by 2002:a17:90b:2349:b0:1e3:34f9:87e8 with SMTP id
 ms9-20020a17090b234900b001e334f987e8mr11146478pjb.217.1655310922780; 
 Wed, 15 Jun 2022 09:35:22 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 v15-20020a63bf0f000000b003fdb97e6961sm9909464pgf.28.2022.06.15.09.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 09:35:21 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Fix %d vs %u
Date: Wed, 15 Jun 2022 09:35:28 -0700
Message-Id: <20220615163532.3013035-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>, Emma Anholt <emma@anholt.net>,
 Jonathan Marek <jonathan@marek.ca>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

In debugging fence rollover, I noticed that GPU state capture and
devcore dumps were showing me negative fence numbers.  Let's fix that
and some related signed vs unsigned confusion.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index dd044d557c7c..ce3b508b7c2b 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -790,11 +790,11 @@ void adreno_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 	for (i = 0; i < gpu->nr_rings; i++) {
 		drm_printf(p, "  - id: %d\n", i);
 		drm_printf(p, "    iova: 0x%016llx\n", state->ring[i].iova);
-		drm_printf(p, "    last-fence: %d\n", state->ring[i].seqno);
-		drm_printf(p, "    retired-fence: %d\n", state->ring[i].fence);
-		drm_printf(p, "    rptr: %d\n", state->ring[i].rptr);
-		drm_printf(p, "    wptr: %d\n", state->ring[i].wptr);
-		drm_printf(p, "    size: %d\n", MSM_GPU_RINGBUFFER_SZ);
+		drm_printf(p, "    last-fence: %u\n", state->ring[i].seqno);
+		drm_printf(p, "    retired-fence: %u\n", state->ring[i].fence);
+		drm_printf(p, "    rptr: %u\n", state->ring[i].rptr);
+		drm_printf(p, "    wptr: %u\n", state->ring[i].wptr);
+		drm_printf(p, "    size: %u\n", MSM_GPU_RINGBUFFER_SZ);
 
 		adreno_show_object(p, &state->ring[i].data,
 			state->ring[i].data_size, &state->ring[i].encoded);
-- 
2.36.1

