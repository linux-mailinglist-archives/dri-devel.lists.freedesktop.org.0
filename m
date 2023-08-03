Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1D076F1E6
	for <lists+dri-devel@lfdr.de>; Thu,  3 Aug 2023 20:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5762E10E0D1;
	Thu,  3 Aug 2023 18:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DAB210E0D1;
 Thu,  3 Aug 2023 18:32:54 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-686daaa5f1fso917009b3a.3; 
 Thu, 03 Aug 2023 11:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691087573; x=1691692373;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=KxYWsR/qBx7u0rlGx8cPewdgRo7+05nTk90UjKvSraQ=;
 b=ft0QlCKua4WY9Pn8iWwzQQXBiU+H9dyyhpm/EwB6z2K1YBVlLsPsSk4dwTfih1XIyo
 OcDT94J3GJWIZle2duHYEW4a/sWBSq4uDCPo/zG+cNjussXQF0rJ0VOLxQgqp1uX4KMH
 T4mcfXvSAHT2H5faKOPukAMsmshUpyjQpACw2MKA98KoLxVueYzVprjHj2ELI/grNE6v
 3i5bCKjCB4nA99JE2sXAHynFjiqzTmIP/YFN/1uFJ6cB5zmE3VqZEmarP6PB75w/PuIB
 Fgc/JnGzY7ZEWLgZM+KizCllGoX4VU7TBm/kH9+u1gsjNU2hQmzJmAg+XlUrzaKBHwce
 mRYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691087573; x=1691692373;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KxYWsR/qBx7u0rlGx8cPewdgRo7+05nTk90UjKvSraQ=;
 b=dqSYD1TkbgS6fmTGXGdbEIf7OnvBBtjPWmhdcQ3MqxeOPZJTehIsSP/4oWbAEyE+0p
 MbEQDhQzG6DBRkg+tKqQ5V1rMY9eAZOLdesUy1YP/eafFplR8v40tnefQj9cpyVlQ+/N
 N88s8baHXK/ohLn7mYrQQudHHI9CFVIZAOtCmiE6tttvHGDP0dL7Sa5XOcvMfrw4f1KU
 HgWUfqYjSY2UBX9jbGSq5c0R3UUPIkoKWKMwWRyh5+Gqi773LUmoH0EKpz7dPY3dCvKU
 pAPcQr5vDuRxQH+/LVLgGpKaxtBC1BVyr8AZlzZxNPJImnOGw1qxIjXiy9L5cMi5lXTB
 KFBw==
X-Gm-Message-State: ABy/qLZ/p7oDb1+iYqa92Zp5/utvG7BWBBnlTxEVSn4+N6+vDiCxr1q6
 fU9aQoL9Wsl3I4tEFCeAuuGh8Qo6wqk=
X-Google-Smtp-Source: APBJJlH+WYqSik0uDX9MGJWI3BewG9Fg4j0HvhhNYQcyaBEInV4WF3yaR/S1PhvKAjZwZeROh1BY3g==
X-Received: by 2002:a05:6a00:3916:b0:686:f84d:a4ec with SMTP id
 fh22-20020a056a00391600b00686f84da4ecmr18624822pfb.27.1691087573322; 
 Thu, 03 Aug 2023 11:32:53 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 f26-20020aa782da000000b00682b2fbd20fsm174547pfn.31.2023.08.03.11.32.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 11:32:52 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Disallow relocs on a6xx+
Date: Thu,  3 Aug 2023 11:32:45 -0700
Message-ID: <20230803183247.57492-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Paul <sean@poorly.run>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Mesa stopped using these pretty early in a6xx bringup[1].  Take advantage
of this to disallow some legacy UABI.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/commit/7ef722861b691ce99be3827ed05f8c0ddf2cd66e

Signed-off-by: Rob Clark <robdclark@chromium.org>
Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  2 ++
 drivers/gpu/drm/msm/msm_gem_submit.c    | 10 ++++++++++
 drivers/gpu/drm/msm/msm_gpu.h           |  9 +++++++++
 3 files changed, 21 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index ba35c2a87021..695cce82d914 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1078,6 +1078,8 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	adreno_gpu->info = config->info;
 	adreno_gpu->chip_id = config->chip_id;
 
+	gpu->allow_relocs = config->info->family < ADRENO_6XX_GEN1;
+
 	/* Only handle the core clock when GMU is not in use (or is absent). */
 	if (adreno_has_gmu_wrapper(adreno_gpu) ||
 	    adreno_gpu->info->family < ADRENO_6XX_GEN1) {
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 63c96416e183..3b908f9f5493 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -882,6 +882,16 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		if (submit->valid)
 			continue;
 
+		if (!gpu->allow_relocs) {
+			if (submit->cmd[i].nr_relocs) {
+				DRM_ERROR("relocs not allowed\n");
+				ret = -EINVAL;
+				goto out;
+			}
+
+			continue;
+		}
+
 		ret = submit_reloc(submit, msm_obj, submit->cmd[i].offset * 4,
 				submit->cmd[i].nr_relocs, submit->cmd[i].relocs);
 		if (ret)
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index 7a4fa1b8655b..4252e3839fbc 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -285,6 +285,15 @@ struct msm_gpu {
 	/* True if the hardware supports expanded apriv (a650 and newer) */
 	bool hw_apriv;
 
+	/**
+	 * @allow_relocs: allow relocs in SUBMIT ioctl
+	 *
+	 * Mesa won't use relocs for driver version 1.4.0 and later.  This
+	 * switch-over happened early enough in mesa a6xx bringup that we
+	 * can disallow relocs for a6xx and newer.
+	 */
+	bool allow_relocs;
+
 	struct thermal_cooling_device *cooling;
 };
 
-- 
2.41.0

