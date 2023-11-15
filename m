Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E7E7ED77E
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 23:44:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C785D10E295;
	Wed, 15 Nov 2023 22:44:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECF4810E284;
 Wed, 15 Nov 2023 22:44:19 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-1f03db0a410so83244fac.1; 
 Wed, 15 Nov 2023 14:44:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700088258; x=1700693058; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=x+9rvLvdX2lnfyBf2vZqm86qvEOYTf/3b77ELh1X624=;
 b=ePFFWLujLtLuQoppO+pj/fgHxwKcwQED2ND8iLIO7r8hkc69TkjHr3KXgXLsOB2Up5
 BEVjyJln0Lyoxai1m2bx52XApisiar4jizfkRq9qe//z/H7bCXduweh6Mm6/v+h+jEph
 qJIqUuw3Ton1Qxnhv0IQhe8SyaIq+yuB0zOWYksNQb0JRU1oYSqHTVzVf1oZCrX9TBZX
 8seDTcSOpBk5HmQYaCE6H3M8084HaWjBECmixNW9TZw1J2Rq8O6XzHqD2xjbQUrQx7jZ
 c9m35oDkJaH+wumn5ROA7B4FRcTQ++GcleTKlccIxUv/5gfNErZl+Khz5Ie++eYam5v5
 eMBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700088258; x=1700693058;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=x+9rvLvdX2lnfyBf2vZqm86qvEOYTf/3b77ELh1X624=;
 b=JYWj6lcot6MMpqrwWRHb0Lm4qZCcMmCEcwCAexLigwRGvXguI54+pSf+k+1CEmEXg9
 FU3bq637Wd4Xyetkj6Ek35bA3Tsv237w9rWwXZu/CPwRzOewLxNjrNCtflA91StX0KZc
 NdyS6fZ+nbqJZ/xSYvQvXbbnW1V1VdrsUTeZyK6elhIC94GLW6eErMhUvpXYidEWRNaG
 4ukZs/WyqtR7RTo18LEQZemjXvqIXl+cckXKHXW8e+MA2cMW7zB5JrUI+buf5dUDmqxI
 sn5VPhiyjUdDuqW9b2Uy6UDZQ50jxII0Mp6Jak6UzNCIn0gpYfaWsT7I1eDSwEkoYRdC
 4cWw==
X-Gm-Message-State: AOJu0Yw6LjD+b8ydivxCeLh6chk2W3gcn3+hw8qlGqLTL4GRQZYo0VxN
 g4MY3CMAhn/dXScvbQ+KfxVp0PiEs7g=
X-Google-Smtp-Source: AGHT+IGGu9YvLECkiUq/lUX8OxBjWJ2MyG6XyX8H/OEa527Kf4K81t3xUlEcdPUh+ltOWMuaIPKgcg==
X-Received: by 2002:a05:6870:b48e:b0:1e9:8182:a29d with SMTP id
 y14-20020a056870b48e00b001e98182a29dmr18474426oap.41.1700088258174; 
 Wed, 15 Nov 2023 14:44:18 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 r4-20020aa78b84000000b006870ed427b2sm3358092pfd.94.2023.11.15.14.44.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 14:44:17 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/gpu: Move gpu devcore's to gpu device
Date: Wed, 15 Nov 2023 14:44:09 -0800
Message-ID: <20231115224409.240935-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

The dpu devcore's are already associated with the dpu device.  So we
should associate the gpu devcore's with the gpu device, for easier
classification.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index cfcb4317afdb..3fad5d58262f 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -292,8 +292,7 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
 	/* Set the active crash state to be dumped on failure */
 	gpu->crashstate = state;
 
-	/* FIXME: Release the crashstate if this errors out? */
-	dev_coredumpm(gpu->dev->dev, THIS_MODULE, gpu, 0, GFP_KERNEL,
+	dev_coredumpm(&gpu->pdev->dev, THIS_MODULE, gpu, 0, GFP_KERNEL,
 		msm_gpu_devcoredump_read, msm_gpu_devcoredump_free);
 }
 #else
-- 
2.41.0

