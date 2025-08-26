Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB83AB368CF
	for <lists+dri-devel@lfdr.de>; Tue, 26 Aug 2025 16:19:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B35110E669;
	Tue, 26 Aug 2025 14:19:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ReQFdsyF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF28210E66C
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 14:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=05ETz9vvDLQFERljCAnvp8PAssHcttjI610ihrDMjY8=; b=ReQFdsyFvjcumBbZXOSyGH6n9R
 yzRqSsiD7wC9fbQVGGbGfNpWFKha+BpP7BkWqAb3+zTt8AZR4pXOfypFrQ/CsHRk+1rjyr5KnNLZn
 HxtYjZaREJaGWcr2gEd+2UTNo+fPhVaasQXnFEUtYBvIkvf2tjAs2JyQIDM6sNkBK4H4DDHHhBKcg
 GBjuVNlvcBZjW79OveUTSM5xg3KmEqnSAC12dX2Rw3jYldUNFGGwmPVpfYXv0S8n9JhXL+tDjlPxE
 jDp6pN0uMnch4cwdFuRAVugER7eDCPwNiNB4cNi3Kk91QKmvBXk8x5ccP4WH3VecWr8kHT5rgrSxM
 Gjd1nZWQ==;
Received: from [189.7.87.79] (helo=[192.168.0.8])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uquWB-001wrM-Je; Tue, 26 Aug 2025 16:19:23 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Tue, 26 Aug 2025 11:19:02 -0300
Subject: [PATCH v3 5/6] drm/v3d: Synchronous operations can't timeout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250826-v3d-queue-lock-v3-5-979efc43e490@igalia.com>
References: <20250826-v3d-queue-lock-v3-0-979efc43e490@igalia.com>
In-Reply-To: <20250826-v3d-queue-lock-v3-0-979efc43e490@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2326; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=QXSe3gEf1VicmUAL+bQJWVa5/H/EDb766ny43Uokxjs=;
 b=owEBbQGS/pANAwAKAT/zDop2iPqqAcsmYgBorcJYPP/Jles8/IJKsaw/hEVMxi6Zot4djm6qV
 sy30VTOPWyJATMEAAEKAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaK3CWAAKCRA/8w6Kdoj6
 qjgSB/9qqPe+1oX5cfLMushoEoR/AGu5EU3992zfm5fw4HH/4d2870BV4zm00DNjeB4oyVQ4AdI
 NNIFALkl8f8Yj8R9bhN7sdtkBA7tymEvT3dnVosDehAjSTsHdLkY3dw/dHSRl/amwsTfdo4utx8
 CSm97igJIC0cIFq8tQGxr1ehZKsIXjjhv9LmL3a4M1Pme7c7N6zWiSfliRWZSeyqzjShPrhQZM+
 S2S/hGO39VS6RYlCg+R9bQ0sa8YWc2guEeA8JEKTMjy16rr5EhGxN7/F6g3WFmaIRDgcgbZUlpz
 si1lHY/SEHQ6gNEAZ3bpNR8rUbeazlPdc42ZarnsiykL9A/6
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

CPU jobs and CACHE CLEAN jobs execute synchronously once the DRM
scheduler starts running them. Therefore, there is no fence to wait on,
neither are those jobs able to timeout.

Hence, remove the `timedout_job` hook from the CPU and CACHE CLEAN
scheduler ops.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_sched.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index ad72be7c5d50da3d722a21fad71027d1790448fa..b8984e608547cf3e3a4f06bd0b8340b804a0f821 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -701,6 +701,7 @@ v3d_cpu_job_run(struct drm_sched_job *sched_job)
 	trace_v3d_cpu_job_end(&v3d->drm, job->job_type);
 	v3d_job_update_stats(&job->base, V3D_CPU);
 
+	/* Synchronous operation, so no fence to wait on. */
 	return NULL;
 }
 
@@ -716,6 +717,7 @@ v3d_cache_clean_job_run(struct drm_sched_job *sched_job)
 
 	v3d_job_update_stats(job, V3D_CACHE_CLEAN);
 
+	/* Synchronous operation, so no fence to wait on. */
 	return NULL;
 }
 
@@ -797,7 +799,7 @@ v3d_render_job_timedout(struct drm_sched_job *sched_job)
 }
 
 static enum drm_gpu_sched_stat
-v3d_generic_job_timedout(struct drm_sched_job *sched_job)
+v3d_tfu_job_timedout(struct drm_sched_job *sched_job)
 {
 	struct v3d_job *job = to_v3d_job(sched_job);
 
@@ -837,7 +839,7 @@ static const struct drm_sched_backend_ops v3d_render_sched_ops = {
 
 static const struct drm_sched_backend_ops v3d_tfu_sched_ops = {
 	.run_job = v3d_tfu_job_run,
-	.timedout_job = v3d_generic_job_timedout,
+	.timedout_job = v3d_tfu_job_timedout,
 	.free_job = v3d_sched_job_free,
 };
 
@@ -849,13 +851,11 @@ static const struct drm_sched_backend_ops v3d_csd_sched_ops = {
 
 static const struct drm_sched_backend_ops v3d_cache_clean_sched_ops = {
 	.run_job = v3d_cache_clean_job_run,
-	.timedout_job = v3d_generic_job_timedout,
 	.free_job = v3d_sched_job_free
 };
 
 static const struct drm_sched_backend_ops v3d_cpu_sched_ops = {
 	.run_job = v3d_cpu_job_run,
-	.timedout_job = v3d_generic_job_timedout,
 	.free_job = v3d_cpu_job_free
 };
 

-- 
2.51.0

