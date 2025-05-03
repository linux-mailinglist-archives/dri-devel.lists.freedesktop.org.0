Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4548AA82DC
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 23:01:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB1510E3B1;
	Sat,  3 May 2025 21:01:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="iEXoP4eN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2380310E238;
 Sat,  3 May 2025 21:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zE9Zu7VcO61Gp2suK3c9NG21oAernLtVLzVK5umI+OA=; b=iEXoP4eNkRPETYNiFL5agvr3up
 297h0m3dedA/OQdzTg/oj7y1APk/k4N6ana8EMIu2YDQMNzdTAF2LPlbE3IYUtHNHIJ9Z4iSJ9RVg
 YZLKiqTkhGkoN/Ch5eXrarC91j6lXaBf+3yNInz/6HztuMeFWHcLdq+3yByrkRNwLlLeG3Dermrmp
 fGtF5m9AJ9/35tT6SerIRpMb40PDquHSzkMrUVZ0zOjGj+7A/g+JuxlT7CtgBO8rZ3CTugyzpjkrJ
 EOgjXUEw7wBh+0Q+bO0LVsoJEr9PEgr6ScJzw87/PQcpFLJdBCSu7MLZ+qPAdfEx5bFOCUPnMKwfP
 TisxCSvQ==;
Received: from [189.7.87.174] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uBJwO-002dbs-Kh; Sat, 03 May 2025 23:01:01 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Sat, 03 May 2025 17:59:56 -0300
Subject: [PATCH 5/8] drm/v3d: Use DRM_GPU_SCHED_STAT_RUNNING to skip the reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250503-sched-skip-reset-v1-5-ed0d6701a3fe@igalia.com>
References: <20250503-sched-skip-reset-v1-0-ed0d6701a3fe@igalia.com>
In-Reply-To: <20250503-sched-skip-reset-v1-0-ed0d6701a3fe@igalia.com>
To: Matthew Brost <matthew.brost@intel.com>, 
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <mwen@igalia.com>, Lucas Stach <l.stach@pengutronix.de>, 
 Russell King <linux+etnaviv@armlinux.org.uk>, 
 Christian Gmeiner <christian.gmeiner@gmail.com>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org, 
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1396; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=2ssem536I82ETJAt3RqaSeK/OrqircqY0YtCabDWq3k=;
 b=kA0DAAgBP/MOinaI+qoByyZiAGgWg+egxN1L7cSR2ytarwdSdwR/oDmuXBGdhcVc+jt6s4k5p
 4kBMwQAAQgAHRYhBPjkXX0BFncHKaZ30T/zDop2iPqqBQJoFoPnAAoJED/zDop2iPqqbBIIAM6V
 QEnMSrRo3ytNrb7hTNoA5RgQkmYyC7mp4mfMl4aTRrxO5I7D2OlaSntcaSLQ81kktZOe9gtLOPo
 3StLUmtQpLADU4HBhNGsDhHbFnG/bsuz6ae8jURmHqBRtLmzgAkzJtHajEBZFnGXuV9GYEcAE5d
 t7/USBUDalVFsLsTfTOHhdlrluSHUhed417l+gsTczJzZ+UnEcdQS9JS3YuSriQEE95NAwYW0Pb
 xke0+HK6IjDJ3QHxX45GWvZw2ra/YC/dO3ojZGKv2WhUBdzEixkJPfDi2tdE7O2ATJXurZq8YNk
 uw+uJOFYhQsR6Q2vXWXRcaSa5DywV6IAHqwygek=
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

Use the DRM_GPU_SCHED_STAT_RUNNING status to skip the reset and rearm
the timer.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_sched.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index b3be08b0ca9188564f9fb6aa32694940a5fadc9d..51770b6686d0befffa3e87c290bbdc1a12a19ad5 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -751,7 +751,7 @@ v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
 	if (*timedout_ctca != ctca || *timedout_ctra != ctra) {
 		*timedout_ctca = ctca;
 		*timedout_ctra = ctra;
-		return DRM_GPU_SCHED_STAT_NOMINAL;
+		return DRM_GPU_SCHED_STAT_RUNNING;
 	}
 
 	return v3d_gpu_reset_for_timeout(v3d, sched_job);
@@ -795,7 +795,7 @@ v3d_csd_job_timedout(struct drm_sched_job *sched_job)
 	 */
 	if (job->timedout_batches != batches) {
 		job->timedout_batches = batches;
-		return DRM_GPU_SCHED_STAT_NOMINAL;
+		return DRM_GPU_SCHED_STAT_RUNNING;
 	}
 
 	return v3d_gpu_reset_for_timeout(v3d, sched_job);

-- 
2.49.0

