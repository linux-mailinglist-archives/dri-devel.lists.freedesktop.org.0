Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 034D1A06499
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 19:35:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A26210EC6B;
	Wed,  8 Jan 2025 18:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="r883Brad";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B718310EC67
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 18:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s/0jm0JB8zkbbHDXmGdAJq1Z0vIx6PoGvPBEEqiq8JU=; b=r883BradOH+i1xMYo8mmUYt1Oo
 Q/FpYwziHeZVn24+0kxuJplGryS+0BxHZJW5AJNf7uNGjeMJLrX+YTik5uEyngD2FfngOmP6XypXo
 t87f7otS+OpWwt6J41PZBvsSbs1m9knp2X2agcIxziM8vL3dlWTFbrumw809HxRHCKRPR2nvKMjYh
 AH3tuDo+WIoVa2nvPMy/0Fr2UJUYVqWfw4TIyu72xYMOqhadreTAmFlxU0WjuueGIUt2/EVHeI9Lx
 DzTU1fiyXIIYpNQiFxkgX39nvt5E2lTJ17PWXwBTL+jK+Eu3TfXGBO6E6ttAPrLFsgnFL+pubGNP+
 aYn7MHnQ==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tVau1-00DFFE-V6; Wed, 08 Jan 2025 19:35:38 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>
Subject: [RFC 07/18] drm/imagination: Use the drm_sched_job_has_dependency
 helper
Date: Wed,  8 Jan 2025 18:35:17 +0000
Message-ID: <20250108183528.41007-8-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
References: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
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

Instead of manually peeking into the DRM scheduler implementation details
lets use the previously added helper.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
Cc: Frank Binns <frank.binns@imgtec.com>
Cc: Matt Coster <matt.coster@imgtec.com>
---
 drivers/gpu/drm/imagination/pvr_job.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/imagination/pvr_job.c b/drivers/gpu/drm/imagination/pvr_job.c
index 618503a212a7..1cdb3cfd058d 100644
--- a/drivers/gpu/drm/imagination/pvr_job.c
+++ b/drivers/gpu/drm/imagination/pvr_job.c
@@ -597,8 +597,6 @@ update_job_resvs_for_each(struct pvr_job_data *job_data, u32 job_count)
 static bool can_combine_jobs(struct pvr_job *a, struct pvr_job *b)
 {
 	struct pvr_job *geom_job = a, *frag_job = b;
-	struct dma_fence *fence;
-	unsigned long index;
 
 	/* Geometry and fragment jobs can be combined if they are queued to the
 	 * same context and targeting the same HWRT.
@@ -609,13 +607,9 @@ static bool can_combine_jobs(struct pvr_job *a, struct pvr_job *b)
 	    a->hwrt != b->hwrt)
 		return false;
 
-	xa_for_each(&frag_job->base.dependencies, index, fence) {
-		/* We combine when we see an explicit geom -> frag dep. */
-		if (&geom_job->base.s_fence->scheduled == fence)
-			return true;
-	}
-
-	return false;
+	/* We combine when we see an explicit geom -> frag dep. */
+	return drm_sched_job_has_dependency(&frag_job->base,
+					    &geom_job->base.s_fence->scheduled);
 }
 
 static struct dma_fence *
-- 
2.47.1

