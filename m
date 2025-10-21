Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C185BF6B02
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 15:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36CEA10E5E1;
	Tue, 21 Oct 2025 13:12:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Jaevhp3o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CBE010E5E1
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 13:12:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0F56746060;
 Tue, 21 Oct 2025 13:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 997DFC4CEF1;
 Tue, 21 Oct 2025 13:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761052373;
 bh=8oRM8KNv9EpBZEUAjSUMO/IEtmvTcNa9qeko5xoXvMA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Jaevhp3oMGrB0GYTEE6HDJ7F1JG1S/T3W89avJUeQp7zOWWEVL2drgrbtJSmfrK79
 lfQwfKz2yVhvHxD/g9o/RIxQtlcvP51Eb43xe0SnLu9ZotfSTFEmZ/lbCkWCWgQ9r7
 9oqc9o8rSvFvWi18HlyZ4GKPME0OIzzAYufL0AsLjwOOaCyGZeawsVDnpiNNiaQm7O
 WdjE9HjIKyNXQ6sk5fltMoJxKsxD/a7JjE+wS4VmFAziydBlang6sBfg+/yXGT0wMu
 aIsfSWaGlBpCVtj1SSSbCA89lwUoWr3Lb5NLeu9DGQH2JO0KgpYd560sQ38+pG2+kJ
 UHI10pQg3MGMA==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org
Cc: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Rob Clark <robdclark@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, Sasha Levin <sashal@kernel.org>
Subject: [PATCH 6.1.y] drm/sched: Fix potential double free in
 drm_sched_job_add_resv_dependencies
Date: Tue, 21 Oct 2025 09:12:50 -0400
Message-ID: <20251021131250.2072371-1-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <2025102034-voltage-truck-aeff@gregkh>
References: <2025102034-voltage-truck-aeff@gregkh>
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

[ Upstream commit 5801e65206b065b0b2af032f7f1eef222aa2fd83 ]

When adding dependencies with drm_sched_job_add_dependency(), that
function consumes the fence reference both on success and failure, so in
the latter case the dma_fence_put() on the error path (xarray failed to
expand) is a double free.

Interestingly this bug appears to have been present ever since
commit ebd5f74255b9 ("drm/sched: Add dependency tracking"), since the code
back then looked like this:

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
commit 9c2ba265352a ("drm/scheduler: use new iterator in drm_sched_job_add_implicit_dependencies v2")
landed, with its fixup of
commit 4eaf02d6076c ("drm/scheduler: fix drm_sched_job_add_implicit_dependencies").

At that point it was a slightly different flavour of a double free, which
commit 963d0b356935 ("drm/scheduler: fix drm_sched_job_add_implicit_dependencies harder")
noticed and attempted to fix.

But it only moved the double free from happening inside the
drm_sched_job_add_dependency(), when releasing the reference not yet
obtained, to the caller, when releasing the reference already released by
the former in the failure case.

As such it is not easy to identify the right target for the fixes tag so
lets keep it simple and just continue the chain.

While fixing we also improve the comment and explain the reason for taking
the reference and not dropping it.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Fixes: 963d0b356935 ("drm/scheduler: fix drm_sched_job_add_implicit_dependencies harder")
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/dri-devel/aNFbXq8OeYl3QSdm@stanley.mountain/
Cc: Christian König <christian.koenig@amd.com>
Cc: Rob Clark <robdclark@chromium.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: Christian König <ckoenig.leichtzumerken@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: stable@vger.kernel.org # v5.16+
Signed-off-by: Philipp Stanner <phasta@kernel.org>
Link: https://lore.kernel.org/r/20251015084015.6273-1-tvrtko.ursulin@igalia.com
[ applied to drm_sched_job_add_implicit_dependencies instead of drm_sched_job_add_resv_dependencies ]
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index dbdd00c61315b..a80001350411a 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -719,13 +719,14 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
 
 	dma_resv_for_each_fence(&cursor, obj->resv, dma_resv_usage_rw(write),
 				fence) {
-		/* Make sure to grab an additional ref on the added fence */
-		dma_fence_get(fence);
-		ret = drm_sched_job_add_dependency(job, fence);
-		if (ret) {
-			dma_fence_put(fence);
+		/*
+		 * As drm_sched_job_add_dependency always consumes the fence
+		 * reference (even when it fails), and dma_resv_for_each_fence
+		 * is not obtaining one, we need to grab one before calling.
+		 */
+		ret = drm_sched_job_add_dependency(job, dma_fence_get(fence));
+		if (ret)
 			return ret;
-		}
 	}
 	return 0;
 }
-- 
2.51.0

