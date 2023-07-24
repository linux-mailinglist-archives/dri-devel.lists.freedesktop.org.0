Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4344E760080
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jul 2023 22:30:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BA1010E366;
	Mon, 24 Jul 2023 20:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A5E210E11F;
 Mon, 24 Jul 2023 20:30:26 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-666e64e97e2so2819586b3a.1; 
 Mon, 24 Jul 2023 13:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690230625; x=1690835425;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5BNJAl+/HhqKVjKjPfAnVjqY/TXaSAI5ioNVIBm58zc=;
 b=V08awoeOFINLWgkwJiIGQEkxIFgOAXzVoZZVOMR0m9IvHfUx6aaoTVdGq4f7Q/yjbI
 RkEZSFPXrZgtPgWc2pDSWqMVwbTLYCs6eQ3+RjYvRRYGAvvNeqYz6oLy88lByUGsCor1
 lFaUgWaS46DPsQjFbUrhhM5quQ1n7TaFkCt1nUz+ACrhJ2YEJI68eEo492eROfD73+iG
 LNNobDyLMLOpnbYGvY6ikQ4wZhb2WprhRQ3c4kKSAVa4BreGIzXGZIDMRGmDk9H9ZMCS
 YAaoeUS3NvSvJXtTPFPJCSnbQLnmvpJCYItEnESJgDBcc9ualKvA+qS15JPe4mEWfLnW
 Rtag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690230625; x=1690835425;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5BNJAl+/HhqKVjKjPfAnVjqY/TXaSAI5ioNVIBm58zc=;
 b=CYJOVBTsHmpL2ZKMbtcHaMemKHBomBj4P5eVoSLoMCCWGFKcn2ODCccZPTuYNTYYNZ
 UJkAHQEIjCfwb6i2q5AxKsEDgzO+ETpyO3auqd1KL52Psf5VL/uVuflF32hy8ocqmDeQ
 b/dhgtpydZIC/VLbdtgoJCz1mkPf5dDpaqy/XStOIdbTUFPITKcE923EEPmeulBVyfzq
 aYM7CNalXUMeCqHb4AdD6hGpzWKCDnN1rqzHBEMe4u3xL1TQ8QERCNgtURXYkEY83dHL
 PsWR5d+5Qa5hM5cTJw1iEshddPwyhL0LmW2cOWMffdHRcAqX72tZsJDCGeld9uzbGZ+Y
 bTOg==
X-Gm-Message-State: ABy/qLZXqNU8l8N+EQM+nn74u/tKm6vJ7VT0eQ1smgDh9gtnSp6jV/dr
 d1cSCnv47GKF52zxEbIYqzxXGQYUOzw=
X-Google-Smtp-Source: APBJJlEb6W5sHnwrtOUP5D6oZIB3+ii60YRuLGHeoKQ0bJ1BZdGpTI+paNOSv1EpR4gfYJv6xXW25A==
X-Received: by 2002:a05:6a21:78a3:b0:138:198f:65ca with SMTP id
 bf35-20020a056a2178a300b00138198f65camr12337920pzc.13.1690230625436; 
 Mon, 24 Jul 2023 13:30:25 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a62a50b000000b00682a16f0b00sm8057046pfm.210.2023.07.24.13.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 13:30:24 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Disallow submit with fence id 0
Date: Mon, 24 Jul 2023 13:30:21 -0700
Message-ID: <20230724203021.147819-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

A fence id of zero is expected to be invalid, and is not removed from
the fence_idr table.  If userspace is requesting to specify the fence
id with the FENCE_SN_IN flag, we need to reject a zero fence id value.

Fixes: 17154addc5c1 ("drm/msm: Add MSM_SUBMIT_FENCE_SN_IN")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 9d66498cdc04..63c96416e183 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -901,7 +901,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 	 * after the job is armed
 	 */
 	if ((args->flags & MSM_SUBMIT_FENCE_SN_IN) &&
-			idr_find(&queue->fence_idr, args->fence)) {
+			(!args->fence || idr_find(&queue->fence_idr, args->fence))) {
 		spin_unlock(&queue->idr_lock);
 		idr_preload_end();
 		ret = -EINVAL;
-- 
2.41.0

