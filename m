Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B8F4E3271
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 22:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FAAE10E493;
	Mon, 21 Mar 2022 21:49:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 47D5A10E493
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 21:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=piBh/tjqMdJH263YcMC5WTs7iuvgu1VQYTi2OHIKUPI=; b=WrfLJoy9GqnP0b9IGqTfhorFFL
 NLgE3SSkCmJFiE2jmoWtPp/q7asjGMrwBubHYS2DcgLTuDgsNOHcbrIQ1fQbcn18jZlgLOYpKUBFD
 jAX7SuOaZrYOVQSvuzbOwiPfTV/zKOH9c3XeabYAFBOGCzmttLBvTzeknlHCWCQVIPckPqgbZukfT
 m+CtO0eM2upoLqAd9Bb5ncNkuBLRInBZxYXq1Ozpee4jPjhlejhLSbE7rgNc7/triT0cM4+WwjgnW
 p5lLcaTPfAsLL+E+4EqTeVbM1OMznVTtZmBNwBQJuCWS4iQrQwTKTK6bvk9ewPA/XFOXWwGQYKU4n
 DTVk60LA==;
Received: from [165.90.126.25] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1nWPLc-0000ww-5f; Mon, 21 Mar 2022 22:13:52 +0100
From: Melissa Wen <mwen@igalia.com>
To: emma@anholt.net,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 1/2] drm/v3d: cleanup BOs properly when lookup_bos fails
Date: Mon, 21 Mar 2022 20:13:15 -0100
Message-Id: <20220321211316.1423294-2-mwen@igalia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220321211316.1423294-1-mwen@igalia.com>
References: <20220321211316.1423294-1-mwen@igalia.com>
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
Cc: Melissa Wen <mwen@igalia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When v3d_lookup_bos fails to `allocate validated BO pointers`,
job->bo_count was already set to args->bo_count, but job->bo points to
NULL. In this scenario, we must verify that job->bo is not NULL before
iterating on it to proper clean up a job. Also, drm_gem_object_put
already checks that the object passed is not NULL, doing the job->bo[i]
checker redundant.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_gem.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index 92bc0faee84f..926bfc7e07fb 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -358,11 +358,11 @@ v3d_job_free(struct kref *ref)
 	struct v3d_job *job = container_of(ref, struct v3d_job, refcount);
 	int i;
 
-	for (i = 0; i < job->bo_count; i++) {
-		if (job->bo[i])
+	if (job->bo) {
+		for (i = 0; i < job->bo_count; i++)
 			drm_gem_object_put(job->bo[i]);
+		kvfree(job->bo);
 	}
-	kvfree(job->bo);
 
 	dma_fence_put(job->irq_fence);
 	dma_fence_put(job->done_fence);
-- 
2.35.1

