Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E91C4C4000F
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 13:55:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE6E10EAB4;
	Fri,  7 Nov 2025 12:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="p5M99Rb3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB4F10EAB4
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 12:55:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8A8FF601BD;
 Fri,  7 Nov 2025 12:55:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97371C116B1;
 Fri,  7 Nov 2025 12:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762520119;
 bh=8exqftc6e8NNM5I43fsBG61/6stXhGyx+oICt/2kdtw=;
 h=From:To:Cc:Subject:Date:From;
 b=p5M99Rb3eMQ2A/JdOoZqvdpixzbKFHdpwerowTLytfv78JJn+/k8MTHw0XD5RS0lb
 i1fK7eUigw5Kd//N9z+T9vaBg/j4dVkyHPO0wS+nKssMkJgcuRwP6K6INz3EcXckOr
 nlPdIfItdkLxk+wImNWzyyIMCkXEo51PChQTPE9ufOQRKAR3j4jdNqwuB3rkdW9EMm
 +ApptYRZZEIhZDh+s8HV7mS4YzT/q6IJfyiteRQAyJJ3Fb3mSq5RTgDIJCvjq4tFaj
 F724dXsVN9TRCFZjS8XMLlUfc1Nt6l8wM7G09V13jG95v9wdR6bGZPg9oaFPZXS5s6
 KJCGCm2UrM9Kg==
From: Philipp Stanner <phasta@kernel.org>
To: Matthew Brost <matthew.brost@intel.com>,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/sched: Don't crash kernel on wrong params
Date: Fri,  7 Nov 2025 13:55:09 +0100
Message-ID: <20251107125508.235449-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
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

drm_sched_job_arm() just panics the kernel with BUG_ON() in case of an
entity being NULL. While drm_sched_job_arm() crashing or not effectively
arming jobs is certainly a huge issue that needs to be noticed,
completely shooting down the kernel reduces the probability of reaching
and debugging a system to 0.

Moreover, the checkpatch script by now strongly discourages all new uses
of BUG_ON() for this reason.

Replace the BUG_ON() in drm_sched_job_arm() with a WARN_ON().

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 1d4f1b822e7b..3bf4ae0ca4bc 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -857,7 +857,7 @@ void drm_sched_job_arm(struct drm_sched_job *job)
 	struct drm_gpu_scheduler *sched;
 	struct drm_sched_entity *entity = job->entity;
 
-	BUG_ON(!entity);
+	WARN_ON(!entity);
 	drm_sched_entity_select_rq(entity);
 	sched = entity->rq->sched;
 
-- 
2.49.0

