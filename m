Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B02CB04A0C
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jul 2025 00:08:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2578F10E4FE;
	Mon, 14 Jul 2025 22:08:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="i2+5Zf6+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAC6410E4F7;
 Mon, 14 Jul 2025 22:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pOw0801yM9C68yaZo1MVIUGSwSkP2yTYOFKeE7Sn04c=; b=i2+5Zf6+O2OIn0khTdJ/FPXxMW
 MrB1OHdUfD8BYGC2La0Pzk2zVQz02tkgqrX8epE3J7zwO75DydMtw82Au9w4V3jW/TrVxdRO85/rO
 Gvvogs/A8WjyPFk6pQBEjQF4NyUN8jDFHcbsJFcLpbI+SQoPQq7/LxhMA6b9n4BLwqyEVBRfMaEA1
 rzIYaSW5k6OqMN+CG2R9P+FsukTQNuUV0+6R0XDgysdNmtYLrdQ8iU7nbmblI7/j+T1YPuzjtc52X
 P7mLTIRvTnR/5kxGC7wqGo6Vgpc8mEljMG9435iD7y3r3mdQYWXshMTmYfOUry4h1ZaHGOM11XaZR
 EplNSEOg==;
Received: from [187.36.210.68] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ubRLY-00Gaod-SV; Tue, 15 Jul 2025 00:08:29 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Mon, 14 Jul 2025 19:07:08 -0300
Subject: [PATCH v6 7/8] drm/xe: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the
 reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250714-sched-skip-reset-v6-7-5c5ba4f55039@igalia.com>
References: <20250714-sched-skip-reset-v6-0-5c5ba4f55039@igalia.com>
In-Reply-To: <20250714-sched-skip-reset-v6-0-5c5ba4f55039@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1903; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=GpM0Oa1is07nmkmF/J+Uj/TXmYXZdrYuy3XYzI3k/cg=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBodX+bPR763hic+s2yKr7iCgXnH55PPbpA6tWAi
 A4PaI0kI6WJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaHV/mwAKCRA/8w6Kdoj6
 qu9ZCAC36xmqhY3m21yN8umG/VtlTYswHcsH9pk+eB+IErOHljEEBMysYI6t5tEvNjrokGbzPXa
 nxzLUl+chieMkfmjqB6a6Sg0UhNqnh9sPB8fd8LTdfeczbUM6ebLdx4muYu6bXGPnnWeoiVlx3S
 dzeLyCMe/7gcN/ir7XLaAeXFFHdx3ZOj6BUvkQ9M2ZSL8Sqr2FBLZveWwgQfkFocF2Fy4JBLVdy
 +lfwfq5jneSnfHrbpR3sqz5KmYiraDOGCBIAZMAh8LSdBFpAUPMIFlecpbVzWoYhqoPLRn3LNBH
 fQ8dG8S3iHtpkezjnprPouKVLZ9H3V7sRiZl+DYHXu/+n2ik
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
Reviewed-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/xe/xe_guc_submit.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
index ca2344b538c30b26542742ae9ea145836c940bbf..b28bb75e11c162d339186059c1a5d92811728742 100644
--- a/drivers/gpu/drm/xe/xe_guc_submit.c
+++ b/drivers/gpu/drm/xe/xe_guc_submit.c
@@ -1092,12 +1092,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
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
@@ -1275,10 +1271,8 @@ guc_exec_queue_timedout_job(struct drm_sched_job *drm_job)
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
2.50.0

