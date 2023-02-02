Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F2A68870F
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 19:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F76810E1F1;
	Thu,  2 Feb 2023 18:49:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09EF610E1F1
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Feb 2023 18:49:09 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id o13so2773460pjg.2
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Feb 2023 10:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LS+eL8j93Bm2Dqlju3KsjlMYi6jTYAL0RYTxmxzvITo=;
 b=LKgu3eaNLjrg1DzjepWTEDeJ1VXBUGPr3gGeBSIaXfoosj4qpgIF7p9od55q4tE6sD
 vehqP6S833+SVY3qLvgoWZquo9JIwLZRqcHtQ4wFQxs0qqX78kCLTVyNhhE+ybBhLxVa
 yhDvP6Gj/IcGVTjtrsU8Mb9CiydIL6kuk4oJc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LS+eL8j93Bm2Dqlju3KsjlMYi6jTYAL0RYTxmxzvITo=;
 b=lzn8xHVnjvvJhZ2uh2HQLE5SA6ZMvPWTcOz9o048MhbgQ1hYYjJVMltEehTAxElfI0
 7kFsKWrKm6U4ngNuBlN9CuBINjK7lLmU7ZQDcBOczf6pt83vsCisWfIjB7sG15nJQpH5
 5Y0o8lGvBRgy8wlwrOawadv8pXnouIFScX/f+Uz6su5OOIxGuZ8vvY+kP++S7phThW4n
 np6quBIdc91yAxI9hMWnf8F/QuKF3v3oPmh/pZWtGQH0IiV57faS9nCz3JreSGtQJHUl
 uv/q9hooxGV2oS4VLbrBpysHa5FKd46OV/cb72dQhJcFPVMDVq97SbOu636vx6dB+wth
 ZfFA==
X-Gm-Message-State: AO0yUKVhSDuG/SoxwFLMA0+SjtxiET+QkZrbmDQwH6IogND1hyWTl5fx
 zdpOMbbHvBkBlb7ENWQK58UB7w==
X-Google-Smtp-Source: AK7set8+tzva0Ro0cvmF7RzvMsh/1xs0ka7mFEuFCBLl9n4ZQkczf3w4G6LCKwF5u8qsV1+Gi0HAQA==
X-Received: by 2002:a05:6a20:1612:b0:b8:c659:9d51 with SMTP id
 l18-20020a056a20161200b000b8c6599d51mr10020404pzj.56.1675363748616; 
 Thu, 02 Feb 2023 10:49:08 -0800 (PST)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:f71:fcf9:d3e0:e9c0])
 by smtp.gmail.com with ESMTPSA id
 h68-20020a628347000000b005772d55df03sm18282pfe.35.2023.02.02.10.49.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Feb 2023 10:49:08 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH] drm/msm/a6xx: Make GPU destroy a bit safer
Date: Thu,  2 Feb 2023 10:48:43 -0800
Message-Id: <20230202104822.1.I0e49003bf4dd1dead9be4a29dbee41f3b1236e48@changeid>
X-Mailer: git-send-email 2.39.1.519.gcb327c4b5f-goog
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If, for whatever reason, we're trying process adreno_runtime_resume()
at the same time that a6xx_destroy() is running then things can go
boom. Specifically adreno_runtime_resume() will eventually call
a6xx_pm_resume() and that may try to resume the gmu.

Let's grab the GMU lock as we're destroying the GMU. That will solve
the race because a6xx_pm_resume() grabs the same lock. That makes the
access of `gmu->initialized` in a6xx_gmu_resume() safe.

We'll also return an error code in a6xx_gmu_resume() if we see that
`gmu->initialized` was false. If this happens we'll bail out of the
rest of a6xx_pm_resume(), which is good because the rest of that
function is also not good to do if we're racing with a6xx_destroy().

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This doesn't _really_ matter for upstream, but downstream in ChromeOS
we have a GPU inputboost patch. That inputboost patch was related to
adreno_runtime_resume() getting called at the same time that
a6xx_destroy() was running. This was seen at bootup when the panel
failed to probe.

Despite the fact that this isn't truly fixing any bugs upstream, it
still seems like a general improvement for the GPU driver.

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index f3c9600221d4..7f5bc73b2040 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -974,7 +974,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
 	int status, ret;
 
 	if (WARN(!gmu->initialized, "The GMU is not set up yet\n"))
-		return 0;
+		return -EINVAL;
 
 	gmu->hung = false;
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index aae60cbd9164..6faea5049f76 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1746,7 +1746,9 @@ static void a6xx_destroy(struct msm_gpu *gpu)
 
 	a6xx_llc_slices_destroy(a6xx_gpu);
 
+	mutex_lock(&a6xx_gpu->gmu.lock);
 	a6xx_gmu_remove(a6xx_gpu);
+	mutex_unlock(&a6xx_gpu->gmu.lock);
 
 	adreno_gpu_cleanup(adreno_gpu);
 
-- 
2.39.1.519.gcb327c4b5f-goog

