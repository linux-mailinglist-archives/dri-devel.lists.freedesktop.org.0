Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C237CBB65C6
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 11:26:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027CC10E1E6;
	Fri,  3 Oct 2025 09:26:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="nHfOpo/E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F2810E1E6
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 09:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lIIBhuv8Qcx4BkAVq3ng5V3qtF2O1wVYDC1zh7zMIFY=; b=nHfOpo/E2WquEzhkLBB8splHBr
 NypXqxAhqFVBv7XHPXVKe+kKbfa/eS6sxlO6yulw3Lwg6UZQ/GVCDgNzCf3d48JW0fK46Rdso2+jl
 BYl3VSkXcpntQjqoOjPVmrFcFmF6PmOrQAssDSTW4p7JnwuvraI+sMRZo1M8ksgfZ7dzj8L1aIPrm
 oL8FC0JilkTbsF+MYUAp5EQGQ8C1rx/QT7vZni+2nuq/T3K41/mohClDiP6AwlpQrY+51MXLVkU4A
 zryzkKxatEg2RQ9Zcqjy9Lmvx9EuQcAn7wGoNOZB0jtGrbbscoLM5aTZE4zY6tWQiBkqtQy9YVoky
 pa3r6oMw==;
Received: from [84.66.36.92] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1v4c3s-003ngf-Ky; Fri, 03 Oct 2025 11:26:48 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Rob Clark <robdclark@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 stable@vger.kernel.org
Subject: [PATCH] drm/sched: Fix potential double free in
 drm_sched_job_add_resv_dependencies
Date: Fri,  3 Oct 2025 10:26:41 +0100
Message-ID: <20251003092642.37065-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drm_sched_job_add_dependency() consumes the fence reference both on
success and failure, so in the latter case the dma_fence_put() on the
error path (xarray failed to expand) is a double free.

Interestingly this bug appears to have been present ever since
ebd5f74255b9 ("drm/sched: Add dependency tracking"), since the code back
then looked like this:

drm_sched_job_add_implicit_dependencies():
...
       for (i = 0; i < fence_count; i++) {
               ret = drm_sched_job_add_dependency(job, fences[i]);
               if (ret)
                       break;
       }

       for (; i < fence_count; i++)
               dma_fence_put(fences[i]);

Which means for the failing 'i' the dma_fence_put was already a double
free. Possibly there were no users at that time, or the test cases were
insufficient to hit it.

The bug was then only noticed and fixed after
9c2ba265352a ("drm/scheduler: use new iterator in drm_sched_job_add_implicit_dependencies v2")
landed, with its fixup of
4eaf02d6076c ("drm/scheduler: fix drm_sched_job_add_implicit_dependencies").

At that point it was a slightly different flavour of a double free, which
963d0b356935 ("drm/scheduler: fix drm_sched_job_add_implicit_dependencies harder")
noticed and attempted to fix.

But it only moved the double free from happening inside the
drm_sched_job_add_dependency(), when releasing the reference not yet
obtained, to the caller, when releasing the reference already released by
the former in the failure case.

As such it is not easy to identify the right target for the fixes tag so
lets keep it simple and just continue the chain.

We also drop the misleading comment about additional reference, since it
is not additional but the only one from the point of view of dependency
tracking.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Fixes: 963d0b356935 ("drm/scheduler: fix drm_sched_job_add_implicit_dependencies harder")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Christian König <christian.koenig@amd.com>
Cc: Rob Clark <robdclark@chromium.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: "Christian König" <ckoenig.leichtzumerken@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.16+
---
 drivers/gpu/drm/scheduler/sched_main.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 46119aacb809..aff34240f230 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -960,20 +960,16 @@ int drm_sched_job_add_resv_dependencies(struct drm_sched_job *job,
 {
 	struct dma_resv_iter cursor;
 	struct dma_fence *fence;
-	int ret;
+	int ret = 0;
 
 	dma_resv_assert_held(resv);
 
 	dma_resv_for_each_fence(&cursor, resv, usage, fence) {
-		/* Make sure to grab an additional ref on the added fence */
-		dma_fence_get(fence);
-		ret = drm_sched_job_add_dependency(job, fence);
-		if (ret) {
-			dma_fence_put(fence);
-			return ret;
-		}
+		ret = drm_sched_job_add_dependency(job, dma_fence_get(fence));
+		if (ret)
+			break;
 	}
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL(drm_sched_job_add_resv_dependencies);
 
-- 
2.48.0

