Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4968654CC0F
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jun 2022 17:01:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E41B10F713;
	Wed, 15 Jun 2022 15:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7223910E1CD;
 Wed, 15 Jun 2022 15:01:07 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id z14so7476774pgh.0;
 Wed, 15 Jun 2022 08:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oZ4C/2pH/xtflOzIMAJ169l+TNeby43rC2FOPbSEEZs=;
 b=nojPL5UaGkmux0gCu7JOJqxhwy1lqtFptyfnXTMFceVdPL2Rxobub2I3oVJ78AtmFb
 +bxryzTBDxDkecuOV+d5DIJNeSXPxGjnCIy8peSr6Zzju4bWjrlmC14dbkg0RJgzM49Y
 cKr976plCRJjpRBAYYPnhi+X03BBEYPdI+xzPzHMfZyMrWq4HR0XRTo/TLXX6SHVJwy7
 Lk82MdXUTdp52hzlrVgeQZKZuyRad/oYjLydlLYnj+yuxvqDYv7TqHFdjPjnniOcrsc0
 arz2nwYUYoEsieX7Drp5TKN5rrm9iEPvY6dpl+51IfD6oiEyNc/28QbRwGH4H783PdDX
 qeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oZ4C/2pH/xtflOzIMAJ169l+TNeby43rC2FOPbSEEZs=;
 b=vzJQoTlD00Nl87xrOWIWVS4/RTceV+nDF1a+nBuMa4reEJUUu0ZdFoCERSZolL6Joh
 ghiFoOS4pNKJfpQgLsNhFxRKSjPAQRXc2NU//dLiVLWJw8sTkx7Hx11tfmkufWdw+tvQ
 dE8D/ol/Uq5uVSDFi3AMvDeXlxtaA+NlxqkScMzqv0gv0FBloDnzTHLWUEae1gqBY8cM
 xG29d8LPyzBE5/yVpvZtItYX3KQSxcZmVHUC2M37hxEqGmgiHwPr4srg240YW1T05nFk
 J2EuwOws+m9ZXvC762ZU/6g9Y5sRTdhQ9zZ/tD9BvYb7r63YTx6/qQNzxVacq7+TGIUw
 GofQ==
X-Gm-Message-State: AJIora+Qca9CDeYto+43vKqBe0g934ZGh2k8RwJXJBNBJsTPiQj9Wktb
 vwpikISLebRnBTwmWqrRYyG6JCe7xrI=
X-Google-Smtp-Source: AGRyM1uVmXm2LijmpDnabCBZB64cAjzssYoJ5LFqFHbcXkw1POVaPkDuu3znkGzi5uOvf/VCeg9V5Q==
X-Received: by 2002:a63:ec14:0:b0:401:9e3e:7d23 with SMTP id
 j20-20020a63ec14000000b004019e3e7d23mr190083pgh.235.1655305266249; 
 Wed, 15 Jun 2022 08:01:06 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 d4-20020a62f804000000b0050dc76281d9sm10341671pfh.179.2022.06.15.08.01.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 08:01:02 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/msm: Don't overwrite hw fence in hw_init
Date: Wed, 15 Jun 2022 08:01:07 -0700
Message-Id: <20220615150107.2969593-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220615150107.2969593-1-robdclark@gmail.com>
References: <20220615150107.2969593-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Steev Klimaszewski <steev@kali.org>, open list <linux-kernel@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Prior to the last commit, this could result in setting the GPU
written fence value back to an older value, if we had missed
updating completed_fence prior to suspend.  This was mostly
harmless as the GPU would eventually overwrite it again with
the correct value.  But we should just not do this.  Instead
just leave a sanity check that the fence looks plausible (in
case the GPU scribbled on memory).

Reported-by: Steev Klimaszewski <steev@kali.org>
Fixes: 95d1deb02a9c ("drm/msm/gem: Add fenced vma unpin")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 ++++++++---
 drivers/gpu/drm/msm/msm_gpu.c           |  2 +-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index e1aef4875e2f..dd044d557c7c 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -498,10 +498,15 @@ int adreno_hw_init(struct msm_gpu *gpu)
 
 		ring->cur = ring->start;
 		ring->next = ring->start;
-
-		/* reset completed fence seqno: */
-		ring->memptrs->fence = ring->fctx->completed_fence;
 		ring->memptrs->rptr = 0;
+
+		/* Detect and clean up an impossible fence, ie. if GPU managed
+		 * to scribble something invalid, we don't want that to confuse
+		 * us into mistakingly believing that submits have completed.
+		 */
+		if (fence_before(ring->fctx->last_fence, ring->memptrs->fence)) {
+			ring->memptrs->fence = ring->fctx->last_fence;
+		}
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index b61078f0cd0f..8c00f9187c03 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -430,7 +430,7 @@ static void recover_worker(struct kthread_work *work)
 		 * one more to clear the faulting submit
 		 */
 		if (ring == cur_ring)
-			fence++;
+			ring->memptrs->fence = ++fence;
 
 		msm_update_fence(ring->fctx, fence);
 	}
-- 
2.36.1

