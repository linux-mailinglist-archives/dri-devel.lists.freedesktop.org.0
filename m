Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBD994E974
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 11:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B34A10E073;
	Mon, 12 Aug 2024 09:12:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="UyF08sfW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D7010E071
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Aug 2024 09:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nzakQAeO2wVmbzs7cMJEkVxni0mJK8NaG4e9tA5Swdw=; b=UyF08sfWt6vvsk1wD92VMzHwza
 6dBKCZQjgnUbDZz84oKmAIGMiF4Fis27tM8cKnrpKpBCKBo5i5CQtENdNMBogzQjYxeOi0XUHDkBb
 qZj48Gv793KLcoMu6mHl5hGAeGgYTbBw+yuD3HK/Uj5z4qFahlKssGGUhLeVkXQkGQOioCeq0xEdJ
 hXq+ckjfuY7D3C50xnf61H/yOb27neKm7l4P0WPSEAilhn6xuEIisYVghCQ68uIJ4XbQuUa+cADjQ
 sS/L7Ng0HYCqww/V7FFHOvJ2zvUc4cVFbofSzb7tHU0NoPufhOSbz+Lmt+m9dYC9moKaDlWHHTUKg
 KukKhWNw==;
Received: from [84.69.19.168] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1sdR6T-00BSDl-05; Mon, 12 Aug 2024 11:12:37 +0200
From: Tvrtko Ursulin <tursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, stable@vger.kernel.org
Subject: [PATCH 1/2] drm/v3d: Disable preemption while updating GPU stats
Date: Mon, 12 Aug 2024 10:12:17 +0100
Message-ID: <20240812091218.70317-1-tursulin@igalia.com>
X-Mailer: git-send-email 2.44.0
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

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

We forgot to disable preemption around the write_seqcount_begin/end() pair
while updating GPU stats:

  [ ] WARNING: CPU: 2 PID: 12 at include/linux/seqlock.h:221 __seqprop_assert.isra.0+0x128/0x150 [v3d]
  [ ] Workqueue: v3d_bin drm_sched_run_job_work [gpu_sched]
 <...snip...>
  [ ] Call trace:
  [ ]  __seqprop_assert.isra.0+0x128/0x150 [v3d]
  [ ]  v3d_job_start_stats.isra.0+0x90/0x218 [v3d]
  [ ]  v3d_bin_job_run+0x23c/0x388 [v3d]
  [ ]  drm_sched_run_job_work+0x520/0x6d0 [gpu_sched]
  [ ]  process_one_work+0x62c/0xb48
  [ ]  worker_thread+0x468/0x5b0
  [ ]  kthread+0x1c4/0x1e0
  [ ]  ret_from_fork+0x10/0x20

Fix it.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Fixes: 6abe93b621ab ("drm/v3d: Fix race-condition between sysfs/fdinfo and interrupt handler")
Cc: Maíra Canal <mcanal@igalia.com>
Cc: <stable@vger.kernel.org> # v6.10+
---
 drivers/gpu/drm/v3d/v3d_sched.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index 42d4f4a2dba2..cc2e5a89467b 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -136,6 +136,8 @@ v3d_job_start_stats(struct v3d_job *job, enum v3d_queue queue)
 	struct v3d_stats *local_stats = &file->stats[queue];
 	u64 now = local_clock();
 
+	preempt_disable();
+
 	write_seqcount_begin(&local_stats->lock);
 	local_stats->start_ns = now;
 	write_seqcount_end(&local_stats->lock);
@@ -143,6 +145,8 @@ v3d_job_start_stats(struct v3d_job *job, enum v3d_queue queue)
 	write_seqcount_begin(&global_stats->lock);
 	global_stats->start_ns = now;
 	write_seqcount_end(&global_stats->lock);
+
+	preempt_enable();
 }
 
 static void
@@ -164,8 +168,10 @@ v3d_job_update_stats(struct v3d_job *job, enum v3d_queue queue)
 	struct v3d_stats *local_stats = &file->stats[queue];
 	u64 now = local_clock();
 
+	preempt_disable();
 	v3d_stats_update(local_stats, now);
 	v3d_stats_update(global_stats, now);
+	preempt_enable();
 }
 
 static struct dma_fence *v3d_bin_job_run(struct drm_sched_job *sched_job)
-- 
2.44.0

