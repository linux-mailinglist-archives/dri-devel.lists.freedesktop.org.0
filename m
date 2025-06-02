Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6961ACAEE5
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 15:23:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FD5610E1FF;
	Mon,  2 Jun 2025 13:23:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="VVIpijuf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6747610E1D4;
 Mon,  2 Jun 2025 13:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AoWr/xzSg8anf+lp/dkeJOwZG3sIWYg6HK+zxoH1fXk=; b=VVIpijufwc2UX10zluF2nbknbU
 uBPoQWSwH/kCY3qaQEI0M/mfNy9hUP7Y0EpEO6fW6OfQA0Sg3ApK2aH0bXPOQXiyaMD4xPfDjKKek
 T2P2KPENQ+HJpXnLJFyxtAkgSdx40V9Yyhj/KtXtE2qhta/h4EWvpOlkDdbq9JItakQ2ZPBZqSVIO
 s0lG27583gmqmQuo4GwGZEwiYla2oS9KMXOjG7n9OlILCTVz9801mnQyz6NZI37NQs+MeIvc6+zaW
 EWOa8pCGV/Qca46BTfkHK/9fzYm4G3sgQ0MYyusC45PrzJXbPdFpUKw4z1MDS9BCrKG8H36Y/40gP
 074B6QYQ==;
Received: from [189.7.87.52] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__CHACHA20_POLY1305:256)
 (Exim) id 1uM58I-00GHvh-Du; Mon, 02 Jun 2025 15:23:18 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Lucas Stach <l.stach@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <cgmeiner@igalia.com>,
 Philipp Stanner <phasta@kernel.org>
Cc: dri-devel@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 kernel-dev@igalia.com, =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 stable@vger.kernel.org
Subject: [PATCH] drm/etnaviv: Protect the scheduler's pending list with its
 lock
Date: Mon,  2 Jun 2025 10:22:16 -0300
Message-ID: <20250602132240.93314-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.49.0
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

Commit 704d3d60fec4 ("drm/etnaviv: don't block scheduler when GPU is still
active") ensured that active jobs are returned to the pending list when
extending the timeout. However, it didn't use the pending list's lock to
manipulate the list, which causes a race condition as the scheduler's
workqueues are running.

Hold the lock while manipulating the scheduler's pending list to prevent
a race.

Cc: stable@vger.kernel.org
Fixes: 704d3d60fec4 ("drm/etnaviv: don't block scheduler when GPU is still active")
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
Hi,

I'm proposing this workaround patch to address the race-condition caused
by manipulating the pending list without using its lock. Although I
understand this isn't a complete solution (see [1]), it's not reasonable
to backport the new DRM stat series [2] to the stable branches.

Therefore, I believe the best solution is backporting this fix to the
stable branches, which will fix the race and will keep adding the job
back to the pending list (which will avoid most memory leaks).

[1] https://lore.kernel.org/dri-devel/bcc0ed477f8a6f3bb06665b1756bcb98fb7af871.camel@mailbox.org/
[2] https://lore.kernel.org/dri-devel/20250530-sched-skip-reset-v2-0-c40a8d2d8daa@igalia.com/

Best Regards,
- Maíra
---
 drivers/gpu/drm/etnaviv/etnaviv_sched.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
index 76a3a3e517d8..71e2e6b9d713 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
@@ -35,6 +35,7 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 							  *sched_job)
 {
 	struct etnaviv_gem_submit *submit = to_etnaviv_submit(sched_job);
+	struct drm_gpu_scheduler *sched = sched_job->sched;
 	struct etnaviv_gpu *gpu = submit->gpu;
 	u32 dma_addr, primid = 0;
 	int change;
@@ -89,7 +90,9 @@ static enum drm_gpu_sched_stat etnaviv_sched_timedout_job(struct drm_sched_job
 	return DRM_GPU_SCHED_STAT_NOMINAL;
 
 out_no_timeout:
-	list_add(&sched_job->list, &sched_job->sched->pending_list);
+	spin_lock(&sched->job_list_lock);
+	list_add(&sched_job->list, &sched->pending_list);
+	spin_unlock(&sched->job_list_lock);
 	return DRM_GPU_SCHED_STAT_NOMINAL;
 }
 
-- 
2.49.0

