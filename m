Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FFFADF029
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 16:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C93610E887;
	Wed, 18 Jun 2025 14:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="U6/EfHoJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A2A310E87D;
 Wed, 18 Jun 2025 14:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=47Z/GaUC1ZQcoUqYdTpj22tNovtLydPLOanf/rTZqZE=; b=U6/EfHoJKv5Kwod41PX86Q+MNZ
 CSTVKSH6Z9sgaRQFZ2GRltriR5PhCob8zk69d/8Oe6ez1hPqu+MXQRl6QR9RdPEVgP8jUQjw6v5DE
 83fnSxCh91LwHZl6MXGaabBl5HgcRpDCv+VYk3cJeFpe4TcPlFChWFcHM2yYdO9nmcqV/+w3qgfqH
 7ZoW8nHqDbc3Lmzk8mdxwnFhcBRyS1KlAKn+OBIlJfsAG6HH+YNgPxfk3v/tDaaDDTkA4snm9IafZ
 aimQToMDprXrQnWOBU1IS3UqORmGDEPxkHEfC/RciBgeFb+dARULOIwklY6Ti7M+KnC/i/UdhUeyq
 s00oa2Iw==;
Received: from [189.7.87.79] (helo=janis.local)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uRu72-0056pP-6r; Wed, 18 Jun 2025 16:50:04 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Wed, 18 Jun 2025 11:47:47 -0300
Subject: [PATCH v3 6/8] drm/etnaviv: Use DRM_GPU_SCHED_STAT_NO_HANG to skip
 the reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250618-sched-skip-reset-v3-6-8be5cca2725d@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2131; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=7XQcPBtIn8Y5vHjkGvwgs9Yw7vE8STvxAqJtUyx+zSo=;
 b=owGbwMvMwMFo/5mvq6zj1yrG02pJDBlBF5+ym+qrvbL5zx57k/fKyeJQ/niOsroryy+7zj6uc
 oJtneu6TkZjFgZGDgZZMUWWH09iaxnFytk1l5VfhBnEygQyhYGLUwAmUrGWg6FZgDnrmvxRdd5T
 HcUdcTrzqsW8Db9xb2+5IMd1+LTW8gXHxHunztTeUxM/adruG+7bd9mbv+nqkflQ/vLz6YZDG29
 /O/7iouYGVXannTuu1xkZuKp/T0y5nx4rYP/LclOI/DkZ17/Blv7yX+tOtCQEdU9bb5mwKllqLd
 80T0MOS8+2vnecD/KDQw5Ge4hyOgqzSitcUt99pPxd8rfsqPT/1e9i3Zp26v9e3p38YVNaT0fga
 rPft7uua7zr4T9mtzR6Y6r0rA9hMzz2zbjLqzKpRE8j4+xrkyaBeF5vrvy8yBTOqHUHL3yus34p
 b7I5fztXVKCWeItqilZZP+9mhkTfJ01LjBtKTpzp/RADAA==
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

  1. TDR has fired before the free-job worker and the timeout is spurious.
  2. The GPU is still making progress on the front-end and we can give
     the job a chance to complete.

Instead of manipulating scheduler's internals, inform the scheduler that
the job did not actually timeout and no reset was performed through
the new status code DRM_GPU_SCHED_STAT_NO_HANG.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/etnaviv/etnaviv_sched.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 7146069a98492f5fab2a49d96e2054f649e1fe3d..46f5391e84a12232b247886cf1311f8e09f42f04 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -40,11 +40,11 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 	int change;
 
 	/*
-	 * If the GPU managed to complete this jobs fence, the timout is
-	 * spurious. Bail out.
+	 * If the GPU managed to complete this jobs fence, the timeout has
+	 * fired before free-job worker. The timeout is spurious, so bail out.
 	 */
 	if (dma_fence_is_signaled(submit->out_fence))
-		goto out_no_timeout;
+		return DRM_GPU_SCHED_STAT_NO_HANG;
 
 	/*
 	 * If the GPU is still making forward progress on the front-end (which
@@ -70,7 +70,7 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 		gpu->hangcheck_dma_addr = dma_addr;
 		gpu->hangcheck_primid = primid;
 		gpu->hangcheck_fence = gpu->completed_fence;
-		goto out_no_timeout;
+		return DRM_GPU_SCHED_STAT_NO_HANG;
 	}
 
 	/* block scheduler */
@@ -86,10 +86,7 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 	drm_sched_resubmit_jobs(&gpu->sched);
 
 	drm_sched_start(&gpu->sched, 0);
-	return DRM_GPU_SCHED_STAT_RESET;
 
-out_no_timeout:
-	list_add(&sched_job->list, &sched_job->sched->pending_list);
 	return DRM_GPU_SCHED_STAT_RESET;
 }
 

-- 
2.49.0

