Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBFBAA82DE
	for <lists+dri-devel@lfdr.de>; Sat,  3 May 2025 23:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC25410E225;
	Sat,  3 May 2025 21:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Ygrps66t";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E969310E225;
 Sat,  3 May 2025 21:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2IRgHRpPBg55DhyqwO5HmIIzAbPWE2Wot40iFLFPxvY=; b=Ygrps66tvOtfQXYxErOS+f7R4A
 BXdlnGZe1dHsD5Vi4KK1LFuxxpQsVaRJWPLP66rq+fd69QCZXyT0XtFEWIA4dL10icineNv1V6eDR
 2rnK8PL/SPweKraWnNmzo2Qlegbfj4Huoul+G3YVTerrfhrYpZ5mArpK+KDmYDPT/zMc1TWk1eKBt
 UzvN/C+yyV3o2hZ28h1GzoBaJ9tK/bPCzUiwJuVtb0IArYoT20JBHrWlY2PWcyjnTyXSXFtF4z5kW
 zHzp810VPQy+Ds7QnaQ6pnxSg72A/CBRYxlehuh1yG+hWqkEqHdASDcMk9R2nKmIJ5tvT103tGFHi
 9jlIro3A==;
Received: from [189.7.87.174] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uBJwU-002dbs-Q7; Sat, 03 May 2025 23:01:07 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Sat, 03 May 2025 17:59:57 -0300
Subject: [PATCH 6/8] drm/etnaviv: Use DRM_GPU_SCHED_STAT_RUNNING to skip
 the reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250503-sched-skip-reset-v1-6-ed0d6701a3fe@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2071; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=Xd6jgn9omeOB5sVr4CIVVno9urb3ZtJGSU/re/qnoUQ=;
 b=kA0DAAgBP/MOinaI+qoByyZiAGgWg+ejYbeMplAqrxjqGXPs2LKXv1VDyF5QKU8W4B6PsEUqz
 YkBMwQAAQgAHRYhBPjkXX0BFncHKaZ30T/zDop2iPqqBQJoFoPnAAoJED/zDop2iPqqvtUH/0zV
 cnpv+kzpGgPOgkC3oD5skUgsLwW60ihenSKEvH4+IdA0f6jTa3c4Nrxzojv9jzmelRiBzKzjE3h
 mekfjEoXeB3+J5k8B+HJ22p/kLnT1YvKMleKJieEDvF3/Sl0cNpiRWCWDZbvQupej5i9mcwcgyC
 KsSaNdC+OAUUYwer9ceydl7fm0jnebt8H861cdMHO2V0Bg/bglN+DC9aq5t9frfsXrnSX7ZBHCy
 eNq4NR4KDTWqsiHf8l6yv8Q1ynLapoVuCSaTEz1jR0uOiB+PONDS5+/AZx1x7u18Tdw2/01O+4M
 IwVsk3s7zB4omH0z3JQERC6QGwT3t19jdq40svI=
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

Etnaviv can skip a hardware reset in two situations:

  1. TDR has fired before the IRQ and the timeout is spurious.
  2. The GPU is still making progress on the front-end and we can give
     the job a chance to complete.

Instead of relying on the scheduler internals, use the
DRM_GPU_SCHED_STAT_RUNNING status to skip the reset and rearm the timer.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_sched.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 76a3a3e517d8d9f654fb6b9e98e72910795cfc7a..b87ffdb4136aebade736d78b3677de2f21d52ebc 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -40,11 +40,11 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 	int change;
 
 	/*
-	 * If the GPU managed to complete this jobs fence, the timout is
-	 * spurious. Bail out.
+	 * If the GPU managed to complete this jobs fence, TDR has fired before
+	 * IRQ and the timeout is spurious. Bail out.
 	 */
 	if (dma_fence_is_signaled(submit->out_fence))
-		goto out_no_timeout;
+		return DRM_GPU_SCHED_STAT_RUNNING;
 
 	/*
 	 * If the GPU is still making forward progress on the front-end (which
@@ -70,7 +70,7 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 		gpu->hangcheck_dma_addr = dma_addr;
 		gpu->hangcheck_primid = primid;
 		gpu->hangcheck_fence = gpu->completed_fence;
-		goto out_no_timeout;
+		return DRM_GPU_SCHED_STAT_RUNNING;
 	}
 
 	/* block scheduler */
@@ -87,10 +87,6 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 
 	drm_sched_start(&gpu->sched, 0);
 	return DRM_GPU_SCHED_STAT_NOMINAL;
-
-out_no_timeout:
-	list_add(&sched_job->list, &sched_job->sched->pending_list);
-	return DRM_GPU_SCHED_STAT_NOMINAL;
 }
 
 static void etnaviv_sched_free_job(struct drm_sched_job *sched_job)

-- 
2.49.0

