Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B1E6C1530
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 15:45:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1680510E5B3;
	Mon, 20 Mar 2023 14:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B9610E5A9;
 Mon, 20 Mar 2023 14:44:54 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id k2so12656619pll.8;
 Mon, 20 Mar 2023 07:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679323493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ldFupt5wrZbRxkmdbQJ7PqzJnkF6w4MSZ/CZLw9J9jU=;
 b=nLqncyImNrlz2RYRgSTcGk81CIP+FxeIhwn8gsHuejhfPlvxGvZoYbDo0a811aEXK9
 V1LlsnULXd0sVZPzFucY4idd1TfEuzWSGRr8oLl/nGNtw0w61RogcCNsUN5LYoaVQgy8
 A9Zjp7rXg0KtTQarA5j7PNz52fbJgT60Emcaw3O4Td7B/lgNjsxPkom0BwnCRmFdnQOz
 ay5YoqOYuFncYBGa78Ckg/Fc8t6MF4OaZhtzlc9O16bNsgB0fKDDkrlbvblGBXx62ZqL
 kkIj3+KSXWEXR+AMbc3PB0j7Fhhv2yHH3MBrVP4JTcpba0E8hu6lf6FUt8KEpiKFKbzS
 Nr0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679323493;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ldFupt5wrZbRxkmdbQJ7PqzJnkF6w4MSZ/CZLw9J9jU=;
 b=01y/5jA0c2bBi5p5siNY4LPDZEMnzu8jiWAIMZhfijz1AH21C3ZoUio1SOKBKXGmnD
 GvOMWTA4SJFxH3mzPlJCstOK5AUwvaj2zXp5Fwlv/MpwPqPwiQ1mEKRTRG7g+yxCxD5i
 8yJfwrEwsm/94UtRzb8TLslbAMzTQDgqORMGXkIYrlDuXsbk7nOgBrU2AWD2I1VfYLP9
 uxf4oZIApkqIrL6NclULkFojKlXz3X1ogO/FtM4E4Ow1JR5LJ7JoDsWq2hOHtDSs/Ey1
 8XrIXSpg3Xsr6lwN2I3+/f8i5TVMIY2q6qbL8BW6JIHbszAPoGvzxEFoDawu2SfKjCbl
 PjIw==
X-Gm-Message-State: AO0yUKXahEuya2taSj0eK14JCOFk5a41Vdfmurn2zKs+KC01StkDyXmS
 cKTzXN8IGvXNVJUgRE1DCKWs/KdLj4o=
X-Google-Smtp-Source: AK7set8ban8EVPY/GlOSyVWpuGWIu9Ktpe8j0t2q1ieP66G7xMsPkz9aTzAfar0y6DwailYRK/6igQ==
X-Received: by 2002:a05:6a20:bc9e:b0:d9:f086:e756 with SMTP id
 fx30-20020a056a20bc9e00b000d9f086e756mr1931648pzb.39.1679323493697; 
 Mon, 20 Mar 2023 07:44:53 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:61b:48ed:72ab:435b])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78dc8000000b00571f66721aesm6454473pfr.42.2023.03.20.07.44.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 07:44:53 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 12/23] drm/msm/gpu: Move fw loading out of hw_init() path
Date: Mon, 20 Mar 2023 07:43:34 -0700
Message-Id: <20230320144356.803762-13-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320144356.803762-1-robdclark@gmail.com>
References: <20230320144356.803762-1-robdclark@gmail.com>
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
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Luca Weiss <luca@z3ntu.xyz>,
 Sean Paul <sean@poorly.run>, Maximilian Luz <luzmaximilian@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

It is already a no-op, since we've already loaded the fw from
adreno_load_gpu(), so drop the redundant call.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 817599766329..28cc5685ba96 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -503,16 +503,9 @@ struct drm_gem_object *adreno_fw_create_bo(struct msm_gpu *gpu,
 
 int adreno_hw_init(struct msm_gpu *gpu)
 {
-	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
-	int ret, i;
-
 	VERB("%s", gpu->name);
 
-	ret = adreno_load_fw(adreno_gpu);
-	if (ret)
-		return ret;
-
-	for (i = 0; i < gpu->nr_rings; i++) {
+	for (int i = 0; i < gpu->nr_rings; i++) {
 		struct msm_ringbuffer *ring = gpu->rb[i];
 
 		if (!ring)
-- 
2.39.2

