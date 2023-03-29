Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 075146CCF22
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 02:55:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95E2E10E488;
	Wed, 29 Mar 2023 00:55:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B49110E11A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 00:55:34 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id z42so14405863ljq.13
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 17:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680051332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B3QWtwCpJWCtNwbopMCBhlb/eX5Lt6OWuzbQyL+529U=;
 b=vi6NQbtWRKOHnONykj6hYunJ45FGrQc/U+pXgje1r8U/v24mBupjNskP85Nbn9Hir2
 B9ZhhHMSTZCuV2X3UzNQJKQMLShuKLAVcCvW6Ro3oUgjqYjEn2i2vjMVjII6BXPG1RtV
 ZBmH+YdZ1jTJ3cU0pMOkwEFjB3ReUiKvEWGB2RTCPPynKIZcf+vyYIFBsjK5zQMp+xpt
 b8Zd5QAd1LTib2xpuCkcg+daSSqhkVBgMMvzlhshBMmcNSYZ0TDQap7uHvZitiWANwT5
 zMQFvvJb/c+zjaMZis0L4yOxbf3fI8nFFhNM09p9xMF3isY0xPqGgvTaJHS7LfPUkqdG
 /4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680051332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B3QWtwCpJWCtNwbopMCBhlb/eX5Lt6OWuzbQyL+529U=;
 b=4uxP25kOEpDkQfP1xfXJr7XjhoeufOt31Hpw2S9BsHLqE9XI2ylHwDCQgdvf4s0R/N
 litaF64PfsnSsd+fNXkjIbf7OtJ8XJHzHRaafWg737/P0TuxbPE1RMIR21wVqRZHMeMA
 bty40iYx+7zQoJ4/I38hh8zJfOa6nQ6bTO6VV1oAIGZRHJ/U7vK9c2Vep78Xwa0qeBTT
 OG33T35zkfve8VwQV6/ml+Xwv9JXM8dGlOV4tIBMNcnAS3yh+JQ0SqCHYDmtNoS/gwpu
 bCdaJOpFSfrWqevGPLmbdaMreZUAoEvyJ9lOYdnaDNJ65N97Xs6Gb4OrddkBILhmycjh
 o59A==
X-Gm-Message-State: AAQBX9d2bnpJLv6cCCPiKF89nX9WfanjE7Gimai+HQi1pNApXqb9nTqC
 OVPU2kiHBbvn991hk6neEXs6WQ==
X-Google-Smtp-Source: AKy350boACpnTgN9FtbnZSYhmXfWiLUrmwJjIKp0oD59NFvzwtfWOEcN8QobmftFmb5nwehjacLh6w==
X-Received: by 2002:a2e:9193:0:b0:293:34f1:73f9 with SMTP id
 f19-20020a2e9193000000b0029334f173f9mr5683044ljg.13.1680051332456; 
 Tue, 28 Mar 2023 17:55:32 -0700 (PDT)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 a4-20020a2e9804000000b002a03f9ffecesm3007181ljj.89.2023.03.28.17.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Mar 2023 17:55:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 1/2] drm/msm: drop unused ring variable in
 msm_ioctl_gem_submit()
Date: Wed, 29 Mar 2023 03:55:29 +0300
Message-Id: <20230329005530.1077468-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230329005530.1077468-1-dmitry.baryshkov@linaro.org>
References: <20230329005530.1077468-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The variable ring is not used by msm_parse_deps() and
msm_ioctl_gem_submit() and thus can be dropped.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index 514ff5245c8a..f2a6775a10eb 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -550,8 +550,7 @@ static struct drm_syncobj **msm_parse_deps(struct msm_gem_submit *submit,
                                            struct drm_file *file,
                                            uint64_t in_syncobjs_addr,
                                            uint32_t nr_in_syncobjs,
-                                           size_t syncobj_stride,
-                                           struct msm_ringbuffer *ring)
+                                           size_t syncobj_stride)
 {
 	struct drm_syncobj **syncobjs = NULL;
 	struct drm_msm_gem_submit_syncobj syncobj_desc = {0};
@@ -798,7 +797,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
 		syncobjs_to_reset = msm_parse_deps(submit, file,
 		                                   args->in_syncobjs,
 		                                   args->nr_in_syncobjs,
-		                                   args->syncobj_stride, ring);
+		                                   args->syncobj_stride);
 		if (IS_ERR(syncobjs_to_reset)) {
 			ret = PTR_ERR(syncobjs_to_reset);
 			goto out_unlock;
-- 
2.39.2

