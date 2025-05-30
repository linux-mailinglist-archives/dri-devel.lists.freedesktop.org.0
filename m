Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A12B6AC90E7
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 16:02:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E474F10E876;
	Fri, 30 May 2025 14:02:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="bmmShJGC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5E7210E869;
 Fri, 30 May 2025 14:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ENQUInjl+dwKI8wrpwB+gOTi/ZF/fsC/hMMSQ/wsAVM=; b=bmmShJGCk7A7+tjbR6hV9AHqMo
 CGzxXuq9b6WRp7Y/a9udZhwPs6f1JVR31bF166TH5DGVRp9rX1xkdqy72jY6bmz2h1NJHbQhGZ+Zm
 9SzIvRNkrFRWWI0xR+AoZzQXdzm7lutfywm+gCzZ4xmWnSgrzx2L/30jwgLRodha3fVu6vPNcfi3p
 l7whGva2KxbFAFXpL5iYobRpTCMyQsJ6dfAj6iEhhgxq4sdLYBDmIe1C9EFupVvgPhgVq8ruoH0D4
 RRRBlTsdET0o9B1fjy/B93qvb/28A7Q7gOHZHNFGr6LMsMXJScnmvJIuUL3ETeuNdOScyMBWp5UMb
 JQWS+trA==;
Received: from [189.7.87.163]
 (helo=1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uL0Jp-00FFzl-Ds; Fri, 30 May 2025 16:02:45 +0200
From: =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
Date: Fri, 30 May 2025 11:01:34 -0300
Subject: [PATCH v2 5/8] drm/v3d: Use DRM_GPU_SCHED_STAT_NO_HANG to skip the
 reset
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250530-sched-skip-reset-v2-5-c40a8d2d8daa@igalia.com>
References: <20250530-sched-skip-reset-v2-0-c40a8d2d8daa@igalia.com>
In-Reply-To: <20250530-sched-skip-reset-v2-0-c40a8d2d8daa@igalia.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1393; i=mcanal@igalia.com;
 h=from:subject:message-id; bh=5zO8BOmBfzFZHqPmbAKnstxn93iNt8sk4knVX8+wmiw=;
 b=owEBbQGS/pANAwAIAT/zDop2iPqqAcsmYgBoObpVBJwvWh+wMD2OJVE8WdXw8qkOnbVBJdiGQ
 y8AlrQAXN+JATMEAAEIAB0WIQT45F19ARZ3Bymmd9E/8w6Kdoj6qgUCaDm6VQAKCRA/8w6Kdoj6
 qlh5B/4ssYag2BNfQZXGUqqqzuWhJR30yieqyY+9cZ7KqiLekuaINi+qiWoNQMfKiPZssvEw3J7
 Kah/YL7ZusKXvci4KRfogc6njmXe1qsnHcsT1KmYkohi+mpjLnTlf1CdG05nefijaDKWwZzVb2d
 B5RAzd9bYtHKCXwgAnSC6RqGjzfD07BvTLsxEbjEFlWgtBWPmFDGlbx/ZdpJqliBXEnFK9wqedB
 RtIrD6AigtA6SuD7vNQlnN6HTLh9d6q+9tpJysewmO05MzKpgX03DllFgYkyFAqvhbUTG7kk/E1
 CT78u0S/Whh744OkwO3+Nv1jkepIT8am6iztXSC2Z5uBSfE/
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

Use the DRM_GPU_SCHED_STAT_NO_HANG status to skip the reset and re-arm
the timer.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_sched.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index e1997387831541fb053e472672004cf511c25558..fbb09a8aff3740b5cd59573b5f2e26b2ee352dfb 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -761,7 +761,7 @@ v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
 	if (*timedout_ctca != ctca || *timedout_ctra != ctra) {
 		*timedout_ctca = ctca;
 		*timedout_ctra = ctra;
-		return DRM_GPU_SCHED_STAT_RESET;
+		return DRM_GPU_SCHED_STAT_NO_HANG;
 	}
 
 	return v3d_gpu_reset_for_timeout(v3d, sched_job);
@@ -805,7 +805,7 @@ v3d_csd_job_timedout(struct drm_sched_job *sched_job)
 	 */
 	if (job->timedout_batches != batches) {
 		job->timedout_batches = batches;
-		return DRM_GPU_SCHED_STAT_RESET;
+		return DRM_GPU_SCHED_STAT_NO_HANG;
 	}
 
 	return v3d_gpu_reset_for_timeout(v3d, sched_job);

-- 
2.49.0

