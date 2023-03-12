Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 760EC6B6B37
	for <lists+dri-devel@lfdr.de>; Sun, 12 Mar 2023 21:42:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F44D10E285;
	Sun, 12 Mar 2023 20:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1105E10E27E;
 Sun, 12 Mar 2023 20:42:30 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id k2so2956973pll.8;
 Sun, 12 Mar 2023 13:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678653749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ldFupt5wrZbRxkmdbQJ7PqzJnkF6w4MSZ/CZLw9J9jU=;
 b=P84pUSjCzIkoIgYt6UU3SmvPeySB6ogMNrsJYWlXc0yv0avhsPHyrha1RV5D6jPn+t
 fm16v1cSybQ37reDja2ftceIuj0n/NtUyjdfmKc4FkbI2hdI/v64GTOXXFtNbTTEhMy5
 Q985CWQSQECgz84X+f9QcqdWs8NyQMS9AFjoStBniiatTpnMvkcBwTqiCkrC42Mj28IV
 wxBKqDvaqhb13LSXfgvBVsQpPSM9AbK25LXHmXVPtGKnw6PRo4+FnzT0dKijzME3LuJ+
 V2yCLUuXZ8nRTgsn43U38HZJMCAGRhyaPrLZdPUpX9f579n//KAgRAGsIaKOSwh4arsN
 MrsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678653749;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ldFupt5wrZbRxkmdbQJ7PqzJnkF6w4MSZ/CZLw9J9jU=;
 b=jyllTO30/1kuM1p+oql2jHNZG5VzCGiyOxV73GVi7vYCzCgTyUDGOZkn0g0l8VR0L9
 guvMcJZ6Wx7sdfCykHhu2kHUKS5csmdvueDpQbW7xfPbbsGnJwLPljH5h/mO9yoyBNq8
 wt3HwOZeVXHhOZxF1UVk/EZee5rcCLF4UtrC2BwxL2kYcUDfjlO2HHeVuRUcyEauxbl/
 DHJLgTa6Dsl59oBEvI6OeyuXlpQhxmJLDLj4O4BJBRqTeSUFqddQJceEkH/ZRNDv5CQ9
 Ahr74rALHabi7wnJ7skeOqZOHzvk2jVBcEI6t8PUyc4f3zvIM4o/nc/OI1Ksibdz1QWJ
 5DZg==
X-Gm-Message-State: AO0yUKXkMoBmvuoFMgK88io68pDsWhTcWvZ+gi2JoD7amwn7Uknj0s/g
 z7F/jpkVE8yedJ4tnzbPTGiP1L3s+V8=
X-Google-Smtp-Source: AK7set9/7KEDfLzBe8WkK2HrHKScy9T+IM0KGWqvIFfBBs3XnCWMJP6sQw+8lQsHMGjDnBzY8pgELQ==
X-Received: by 2002:a05:6a20:4422:b0:cd:bd86:318e with SMTP id
 ce34-20020a056a20442200b000cdbd86318emr41689013pzb.26.1678653749407; 
 Sun, 12 Mar 2023 13:42:29 -0700 (PDT)
Received: from localhost ([2601:1c0:5080:d9fa:9b45:95de:f47d:f85e])
 by smtp.gmail.com with ESMTPSA id
 131-20020a630289000000b004f1cb6ffe81sm3089968pgc.64.2023.03.12.13.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 13:42:28 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/13] drm/msm/gpu: Move fw loading out of hw_init() path
Date: Sun, 12 Mar 2023 13:41:31 -0700
Message-Id: <20230312204150.1353517-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230312204150.1353517-1-robdclark@gmail.com>
References: <20230312204150.1353517-1-robdclark@gmail.com>
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Luca Weiss <luca@z3ntu.xyz>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
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

