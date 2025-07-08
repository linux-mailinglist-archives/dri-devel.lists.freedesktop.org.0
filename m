Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F581AFCBF2
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 15:27:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3C310E64D;
	Tue,  8 Jul 2025 13:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="fIn3NDmN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D34910E17F;
 Tue,  8 Jul 2025 13:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=axLLvYBJ2AC6m84mLAxREcNMT9yF2OsbJtMkBZPypXk=; b=fIn3NDmNBeWXM+BGy2gJwAK8jq
 a1TGFyQ22SxMv8P4dbwTXGGgVCX/eGugPHjMQNlNkDOUblGPBWKOWy+PYL6JbLotgLyT6I080yZ2Y
 J1anBfBmjsh3FvQu9IXgdlasrsy+LFFrwdLjavG7cFkK/Gklya0ixFUjdlk5+GPUJOQ60q9X3rQiV
 2fBN6X15B2upCWBVEvuvZQtSQINw+8R3PyU9N3QFJMLMnb5Ez+/rxaEN1o96Aiaw0AvgqjS7DtSzE
 gIT7OBDLat2wkDScwCCTVg9riXwKNGOBqDxL9utGcdRPa5HkJVZtZ7bcxx1Suh4eGGvqfh/Y6adsv
 Pl/cI2Sg==;
Received: from [187.36.210.68] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uZ8LO-00E1hT-9k; Tue, 08 Jul 2025 15:26:46 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Tue, 08 Jul 2025 10:25:45 -0300
Subject: [PATCH v5 5/8] drm/v3d: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the
 reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250708-sched-skip-reset-v5-5-2612b601f01a@igalia.com>
References: <20250708-sched-skip-reset-v5-0-2612b601f01a@igalia.com>
In-Reply-To: <20250708-sched-skip-reset-v5-0-2612b601f01a@igalia.com>
To: Matthew Brost <matthew.brost@intel.com>, 
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>, 
 David Airlie <airlied@gmail.com>, Melissa Wen <mwen@igalia.com>, 
 Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>, 
 Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2153; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=Hkh3UyCr21p1orxDUVLfLwmqi2c52e1B1Sa6EKMTr3c=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBobRxmeB3Z+0TmIH2nJh1ypD2kNoKiJ/F8jdBr0
 zjh7ooYk8KJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaG0cZgAKCRA/8w6Kdoj6
 qkbUB/0YTrLwzTlmJOhUn4JwXXCZH6JEK1vZeH54oaYF61JbOMROo87IgQCmlzBqe3QGAc9DYVj
 tn0HfUrZ4wXBJYi5/yqF2XtJi4XiEy6d9BFGFsuK7mCnG3eVP0bXUypXZ1LSXi7wEnfDpU5L3rR
 csRQiBu84SJay0NmrCvHRWPmoFyQ+HnnA+KXBFZmzhlt1RswYSTHaHSgsdsxAvclRTXUjliDnUr
 B02eeUQaTmZhxq0R52z8pj52UQQOcg3Ib1A8fpswWSarHT1Fa0VKfiVl4ZxUssLnw1LCjVdCz/L
 nu2vCLEuX91C0ZxePS8IMGqZhk2e/QK0/WMp3kHkwa8hHLDg
X-Developer-Key: i=mcanal@igalia.com; a=openpgp;
 fpr=F8E45D7D0116770729A677D13FF30E8A7688FAAA
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

When a CL/CSD job times out, we check if the GPU has made any progress
since the last timeout. If so, instead of resetting the hardware, we skip
the reset and allow the timer to be rearmed. This gives long-running jobs
a chance to complete.

Instead of manipulating scheduler's internals, inform the scheduler that
the job did not actually timeout and no reset was performed through
the new status code DRM_GPU_SCHED_STAT_NO_HANG.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_sched.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index ebbafedef952a575a3ec2e690c1391d3385782a1..cb9df8822472a4602a5cf7a029ee2ca0a9abc28c 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -748,16 +748,6 @@ v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
 	return DRM_GPU_SCHED_STAT_RESET;
 }
 
-static void
-v3d_sched_skip_reset(struct drm_sched_job *sched_job)
-{
-	struct drm_gpu_scheduler *sched = sched_job->sched;
-
-	spin_lock(&sched->job_list_lock);
-	list_add(&sched_job->list, &sched->pending_list);
-	spin_unlock(&sched->job_list_lock);
-}
-
 static enum drm_gpu_sched_stat
 v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
 		    u32 *timedout_ctca, u32 *timedout_ctra)
@@ -776,8 +766,7 @@ v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
 		*timedout_ctca = ctca;
 		*timedout_ctra = ctra;
 
-		v3d_sched_skip_reset(sched_job);
-		return DRM_GPU_SCHED_STAT_RESET;
+		return DRM_GPU_SCHED_STAT_NO_HANG;
 	}
 
 	return v3d_gpu_reset_for_timeout(v3d, sched_job);
@@ -822,8 +811,7 @@ v3d_csd_job_timedout(struct drm_sched_job *sched_job)
 	if (job->timedout_batches != batches) {
 		job->timedout_batches = batches;
 
-		v3d_sched_skip_reset(sched_job);
-		return DRM_GPU_SCHED_STAT_RESET;
+		return DRM_GPU_SCHED_STAT_NO_HANG;
 	}
 
 	return v3d_gpu_reset_for_timeout(v3d, sched_job);

-- 
2.50.0

