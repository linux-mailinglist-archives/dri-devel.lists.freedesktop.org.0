Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2734B76F566
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 00:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F27010E691;
	Thu,  3 Aug 2023 22:02:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34F4710E691;
 Thu,  3 Aug 2023 22:02:38 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-56433b1b0e0so991511a12.0; 
 Thu, 03 Aug 2023 15:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691100157; x=1691704957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nXZWjfN9jRVe+H33im5sYKdcYpl83+nexah9W681kvs=;
 b=Af4HYsP21mKSBHrPbKz2NpveemF6uwBT1sqWwDLsPtvM3YsxUwa5D+L114TsYL9LJF
 qGKv+qE5ecIQtCimduvkKUI6DAwH0wMa7scKIszgw/LUohFbIQuwXJNGIghRVtOM+swX
 edw4kN4ZMGakALGBXyEWOX/uJpyC686aQwCNpXvu2KXbMPHNoCZu2m7qCQEO5KdEk3LH
 iAAXYxNpxcu01fJOZJDMeLSftYmzn92ekYN8aRYg5uaLeOcgXqNWcJ5ttwAudypA7dJI
 RtB8bhKQ+DDQRR2XGbZIrrf1GeGXbIPP9rS4tG9gL9H5b/WVdZ+aIaPWaPxDNl/8xyam
 8Cuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691100157; x=1691704957;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nXZWjfN9jRVe+H33im5sYKdcYpl83+nexah9W681kvs=;
 b=f/Iy4DMUC4iZ4J7e4V6HbpduK4gGO8FagP1khefooyogSG1pgyje3Z5yuBHRzhOddV
 wzx/P0FdbDO+asSWPQaFJ090PqdETpfhiJPkNGMhMeqKjH57bdnQjUDxxBb3dqUeIW2s
 LcHoEp9pFzIC/7K/GTWbqlwxhOTlYZCVc7dIesGRSf9QBt0+s/gKT9qHBqVUlrQfZvQg
 scylKYmsGqMsbqXSE4O9i7pvOCnj2CpoLwnOUYlXqIodIABlPB4YGveTc1szPbaecpF4
 MKeuNxNk/MnzzddJCdjk71JdLOpPSkBoZFgjPBk3/2NQoVj15hhRHJ+5YzxIIQ60Fa1J
 qKxw==
X-Gm-Message-State: AOJu0Yzh1sjY6qm6Xi1o7M8EsT4udNPSKeD/E3SCDS5PsLGaRnTQPeTN
 4ZRc+KIP/8YErRm+NFJ+x6MXcJJGf9M=
X-Google-Smtp-Source: AGHT+IGl2tGbAFvssGQqeZ1wP6XLECY7/4WzZoYSgAMqTT2kydzqs2HGdiQ8789wcCkrTEohoNh2QA==
X-Received: by 2002:a17:90a:764a:b0:263:6e10:7cdd with SMTP id
 s10-20020a17090a764a00b002636e107cddmr9864pjl.38.1691100157236; 
 Thu, 03 Aug 2023 15:02:37 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a170902b10900b001b8622c1ad2sm317439plr.130.2023.08.03.15.02.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 15:02:36 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 9/9] drm/msm: Enable fence signalling annotations
Date: Thu,  3 Aug 2023 15:01:57 -0700
Message-ID: <20230803220202.78036-10-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803220202.78036-1-robdclark@gmail.com>
References: <20230803220202.78036-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Now that the runpm/qos/interconnect lockdep vs reclaim issues are
solved, we can enable the fence signalling annotations without lockdep
making it's immediate displeasure known.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_ringbuffer.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c b/drivers/gpu/drm/msm/msm_ringbuffer.c
index 7f5e0a961bba..cb9cf41bcb9b 100644
--- a/drivers/gpu/drm/msm/msm_ringbuffer.c
+++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
@@ -97,6 +97,7 @@ struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
 	 /* currently managing hangcheck ourselves: */
 	sched_timeout = MAX_SCHEDULE_TIMEOUT;
 
+	ring->sched.fence_signalling = true;
 	ret = drm_sched_init(&ring->sched, &msm_sched_ops,
 			num_hw_submissions, 0, sched_timeout,
 			NULL, NULL, to_msm_bo(ring->bo)->name, gpu->dev->dev);
-- 
2.41.0

