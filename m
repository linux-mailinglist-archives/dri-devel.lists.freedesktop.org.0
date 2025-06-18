Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD3CADF02C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 16:50:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF9210E88E;
	Wed, 18 Jun 2025 14:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="gQkCgLh/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92B9910E884;
 Wed, 18 Jun 2025 14:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h3GZvjq+LMAdabctghUiDZIGyxW6TB8SjDtRYQ+j5Cg=; b=gQkCgLh/LMFRQtYgH0N+Q7/sS2
 EsiXu5Ku6fNJM/HX/NgjTbhipk4NxAfv9zKlfK7mfAGZFRS7ewlR+K2OoVfn6V11TNubQyJFKHl1m
 poq7UllW67/p3vrFjXjVvelsTYI87EIG6impIpvxw7ZtYwopJliVSgdBvdGv6/93Lhu7ORI0ALpwb
 BYIrSJioOZSlES+W4ww2LWlTeWilk7DmMx+TmhktHoJtkTdWB8cqjYk4aD5c8oQrb4C+yjmU/uMYx
 xZkkyBuNkzS3Ra/zAIkmZiEKhU6ulZLbzwyudlY+wMTRMv45pWYzqXl6t1kohs2H0o4dtGXSJoGXM
 cX2ToXGw==;
Received: from [189.7.87.79] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uRu79-0056pP-3x; Wed, 18 Jun 2025 16:50:11 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Wed, 18 Jun 2025 11:47:48 -0300
Subject: [PATCH v3 7/8] drm/xe: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the
 reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250618-sched-skip-reset-v3-7-8be5cca2725d@igalia.com>
References: <20250618-sched-skip-reset-v3-0-8be5cca2725d@igalia.com>
In-Reply-To: <20250618-sched-skip-reset-v3-0-8be5cca2725d@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1849; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=PXHnkRrptRcO/0Z/Rmu1fUp+v5IC6fudPohHJPt1SfE=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoUtHlmclPtakzLTVSuhaAfkktow7Kyqz+O0WKd
 3G8USMmQSWJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaFLR5QAKCRA/8w6Kdoj6
 qh9WCACex8+rvnDRBGj8wOxjvlKaRB37AZocyX1eJ8QUkaKcpMpetzgh+89ayAiT0/V/raCRSXI
 K9th/f8nZniFu7VSDln+0NMmDx7uir4Tva0RSiyqmve4NKwUqlPNsUDjN25idXMXt9nR4a+c27U
 SppQzWDWsSMGmmHv9ea5PJwslTPvGmiWaSZjJQB71pFFvC2a3gR/wzspXtEgC7DnnyIQuVQCC2k
 ULQKMMozmJM0Dji7FEj2ysiTsR5fkVQ+5JXJosV5+tadkV6sv1kEWlOzwg5nHHyQ4y1l3fe06M9
 suOfjRqKOXCP/d60OPGb86wuPpOaDR709B68BRnjiY6Ss0Pm
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

Xe can skip the reset if TDR has fired before the free job worker and can
also re-arm the timeout timer in some scenarios. Instead of manipulating
scheduler's internals, inform the scheduler that the job did not actually
timeout and no reset was performed through the new status code
DRM_GPU_SCHED_STAT_NO_HANG.

Note that, in the first case, there is no need to restart submission if it
hasn't been stopped.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index 9c7e445b9ea7ce7e3610eadca023e6d810e683e9..f6289eeffd852e40b33d0e455d9bcc21a4fb1467 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1078,12 +1078,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * list so job can be freed and kick scheduler ensuring free job is not
 	 * lost.
 	 */
-	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags)) {
-		xe_sched_add_pending_job(sched, job);
-		xe_sched_submission_start(sched);
-
-		return DRM_GPU_SCHED_STAT_RESET;
-	}
+	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &job->fence->flags))
+		return DRM_GPU_SCHED_STAT_NO_HANG;
 
 	/* Kill the run_job entry point */
 	xe_sched_submission_stop(sched);
@@ -1261,10 +1257,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
 	 * but there is not currently an easy way to do in DRM scheduler. With
 	 * some thought, do this in a follow up.
 	 */
-	xe_sched_add_pending_job(sched, job);
 	xe_sched_submission_start(sched);
-
-	return DRM_GPU_SCHED_STAT_RESET;
+	return DRM_GPU_SCHED_STAT_NO_HANG;
 }
 
 static void __guc_exec_queue_fini_async(struct work_struct *w)

-- 
2.49.0

