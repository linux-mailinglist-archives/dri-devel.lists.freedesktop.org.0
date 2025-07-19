Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A0EB0B040
	for <lists+dri-devel@lfdr.de>; Sat, 19 Jul 2025 15:25:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3D6B10E3E8;
	Sat, 19 Jul 2025 13:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="WgXUR6nq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB1110E3E6
 for <dri-devel@lists.freedesktop.org>; Sat, 19 Jul 2025 13:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SXVIXevoVyTOTUgh3BlDb0v8xov0kAS4Kd/3BTfOkAk=; b=WgXUR6nqxZ1RcbJwHYcvU8r3Hw
 iNTGzeCzdJD1j2h/jKwkHxZkTxka/1vzo8Kotoy3TSV5x7LR8oThSYbENBp4LZovhiDkWG3HAUSZc
 +iTdCrILDxEiQw2vFzgHu4pRYjOUfcVg77GIM0zxaXoqXQNybo0Hiew+16blH/raqVWl0KYhFGnHA
 mqGKUFXZMloOH0DqKaRlsGZOXM3gk65b6NdXxxOxk7/jOtHOQsroTk6+15Udop7RGn+5yO5SOt9K6
 d61MlVC//m2LBXcRINA4BZXbTDaRovYyNAYlP1/NZeSfMqdUYKTQXiOz696gddBKf3+zpgCjjxORj
 ++d99giw==;
Received: from [187.36.210.68] (helo=1.0.0.127.in-addr.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ud7Ys-000wkK-6D; Sat, 19 Jul 2025 15:25:10 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Sat, 19 Jul 2025 10:24:44 -0300
Subject: [PATCH 5/6] drm/v3d: Synchronous operations can't timeout
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250719-v3d-queue-lock-v1-5-bcc61210f1e5@igalia.com>
References: <20250719-v3d-queue-lock-v1-0-bcc61210f1e5@igalia.com>
In-Reply-To: <20250719-v3d-queue-lock-v1-0-bcc61210f1e5@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral Quiroga <itoral@igalia.com>, 
 Jose Maria Casanova Crespo <jmcasanova@igalia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2229; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=ECwCiNMEtlgwEyeSiiOp7AT4UPBi26+Bw2ujoNUKIiQ=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoe5yiXvCQPG7HyGUHdt6rsDvFIr+16c4uqTwwb
 lgc4riXmlqJATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaHucogAKCRA/8w6Kdoj6
 qlIIB/4obyqj1JPoep8n6mqhHKGR10oSBl9UQSXSd4+n9zoK/Lc1zxqp2CXcVNjNR/W2WRWOB0M
 22cYFFWTqvWCeZBE1jDlO4uHx6R4E0WLSCxPKvv7Jr6mmuR76peqRDxpmnEISFWJspqHoRXty7J
 3oAZfmUSC8tq3BXB8wKWcfSFWV1mFRWjZ0ShJCjpxOnzEmmytTJhfQpf7lE+PPYLDqyIZxyV9xE
 bOXptjkLb7nAqq1hsMDjdu78wbzLZexB3kNV6VepvUamvw8rvwZK7Qq0PTWsVQ9uCZec3h71yu+
 8TTUI1r5AzjF+Fns6crJ6pnQwsWClnOgDP49PqgCbfMJctcx
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
---
 drivers/gpu/drm/v3d/v3d_sched.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 4a226ea3bc96865894e360b4115eb836da12d550..715cdc3ada62a271e6dbd0584cdbac24e23c63d6 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -703,6 +703,7 @@ v3d_cpu_job_run(struct drm_sched_job *sched_job)
 	trace_v3d_cpu_job_end(&v3d->drm, job->job_type);
 	v3d_job_update_stats(&job->base, V3D_CPU);
 
+	/* Synchronous operation, so no fence to wait on. */
 	return NULL;
 }
 
@@ -718,6 +719,7 @@ v3d_cache_clean_job_run(struct drm_sched_job *sched_job)
 
 	v3d_job_update_stats(job, V3D_CACHE_CLEAN);
 
+	/* Synchronous operation, so no fence to wait on. */
 	return NULL;
 }
 
@@ -799,7 +801,7 @@ v3d_render_job_timedout(struct drm_sched_job *sched_job)
 }
 
 static enum drm_gpu_sched_stat
-v3d_generic_job_timedout(struct drm_sched_job *sched_job)
+v3d_tfu_job_timedout(struct drm_sched_job *sched_job)
 {
 	struct v3d_job *job = to_v3d_job(sched_job);
 
@@ -839,7 +841,7 @@ static const struct drm_sched_backend_ops v3d_render_sched_ops = {
 
 static const struct drm_sched_backend_ops v3d_tfu_sched_ops = {
 	.run_job = v3d_tfu_job_run,
-	.timedout_job = v3d_generic_job_timedout,
+	.timedout_job = v3d_tfu_job_timedout,
 	.free_job = v3d_sched_job_free,
 };
 
@@ -851,13 +853,11 @@ static const struct drm_sched_backend_ops v3d_csd_sched_ops = {
 
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
2.50.0

