Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 348B2550609
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jun 2022 18:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB08111B8F6;
	Sat, 18 Jun 2022 16:11:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3CB11B8F3;
 Sat, 18 Jun 2022 16:11:17 +0000 (UTC)
Received: by mail-pl1-x62c.google.com with SMTP id h1so6228110plf.11;
 Sat, 18 Jun 2022 09:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=101twesbPuze1J2X5qjELU4Po4+yCThzT6Am7N5Pye8=;
 b=Nz/mSiNmtorVh9k+ROHp/waVo3dX9+KbqBDiCsTJlM17uOzyAItBYDPHngSpv2DtnN
 Pubj2Jb3HZgktpWgYKl+lgrd0ZcBza9f+qvi6LkqtNAaxYLRbnV0OsN23IARMt3nLKku
 j59HB2AIC+sw3fYMssFU+LtuZdIhuGljhvOh7Kcd67d4NbM4ZtOsQnohn+7zVHIC7s6g
 FCirQkMAjiEcetIzTO38OuqU3FDZpJD/EA6xFtBGP2rpU44R1DbYFL/8ZNaqicz/lZ8N
 xsjM2lrqNVuIhVnUgQDvrSJsZa2fxwfkEHTqFpJyPAV3AD8hRnBn0jPY8O6W8lOu06y/
 wRaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=101twesbPuze1J2X5qjELU4Po4+yCThzT6Am7N5Pye8=;
 b=bTwJGjvBJHokSr8/7ujwYj4i09SUZs1UPNuV/NX9laMGSKuiQ+lqlnq9LNoOP9z2iK
 sSlF8fCghT892/H75D5ehm6QlED/STF/ZgFQpJ5i1+x4Cw8SV0knt1UPxT1SK4FDf3Lt
 pUvz4QniVGXPguz11Fg2Wex/6xdevOEOUiXm5Pg+CPm1GP22+ks20nRxIavUb4Vj7OI5
 cT5qB5GdkWSlBZ0hshauRAGU0rZI95/miyqHKJsYTeob/b/pT2F4EFcgXToTpVsDxY9C
 9AZ3tam8HCOrDB5JhCOHKWob50jorYM8Usj3i8HgWGUe4OdqB4wGV++4rnCMu7y6Nqat
 2dlA==
X-Gm-Message-State: AJIora/exBGfQs5+yTP6WdhJMcBXrbAigbxKBiwsckm5Gb9HXOUEw4EW
 Pz3hazimftr6no0k5NxGLJSHM8gRRuc=
X-Google-Smtp-Source: AGRyM1sSvnoyQNvRjK2a8Qm0nOcDlP48BDcSiSUglqXkGLCfqP6NEX/Epf0W2Qs4KFG+L6n7ZN1HoQ==
X-Received: by 2002:a17:902:da8d:b0:165:7c1b:6803 with SMTP id
 j13-20020a170902da8d00b001657c1b6803mr15249813plx.157.1655568676007; 
 Sat, 18 Jun 2022 09:11:16 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 h2-20020a170902f70200b001622c377c3esm5542437plo.117.2022.06.18.09.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Jun 2022 09:11:14 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/msm: Don't overwrite hw fence in hw_init
Date: Sat, 18 Jun 2022 09:11:19 -0700
Message-Id: <20220618161120.3451993-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618161120.3451993-1-robdclark@gmail.com>
References: <20220618161120.3451993-1-robdclark@gmail.com>
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
 open list <linux-kernel@vger.kernel.org>, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Steev Klimaszewski <steev@kali.org>, Jordan Crouse <jordan@cosmicpenguin.net>,
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
Tested-by: Steev Klimaszewski <steev@kali.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 11 ++++++++---
 drivers/gpu/drm/msm/msm_gpu.c           |  2 +-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index f944b69e2a25..efe9840e28fa 100644
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
index cedc88cf8083..c8cd9bfa3eeb 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -418,7 +418,7 @@ static void recover_worker(struct kthread_work *work)
 		 * one more to clear the faulting submit
 		 */
 		if (ring == cur_ring)
-			fence++;
+			ring->memptrs->fence = ++fence;
 
 		msm_update_fence(ring->fctx, fence);
 	}
-- 
2.36.1

