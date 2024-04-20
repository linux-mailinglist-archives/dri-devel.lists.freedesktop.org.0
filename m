Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 410998ABD20
	for <lists+dri-devel@lfdr.de>; Sat, 20 Apr 2024 23:38:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFB0F10EAE3;
	Sat, 20 Apr 2024 21:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="pqbCCC8e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C24BD10EACE
 for <dri-devel@lists.freedesktop.org>; Sat, 20 Apr 2024 21:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tQOJOdR7R8fPlGzGpAxIDtGIt/YwPd67iplbtKJy1G0=; b=pqbCCC8eWv2SvqHdXKB3G0VNPi
 SZ63j/wTIuXNMf6jZzIhKuLXAHV93Mx7mxh1+ZXHfNGF670878NfSwrH0pZ03hUIsHADSGafOnF/V
 +MHFsPakiMkbFmb4/ssfUUQ8McNC0DzOasn2wfBLPIJWlAJTa6KyjcEs4OIndjttJcC8vsCMkFS+K
 JUjrzq83mfLP6/vEJl/8+c1pKYdVS/ksgx6H7RVBj+66u3TX9pM9jpcXHkKNIsxt7k29XNi/iYQQ8
 zsy0QSzHr1UOa309CZPyFuqb+qCmiSD4m10um1XsDAP95xF5xlo7nBSdQmzYFglIUKMJmLZyhDYJU
 aBVTZSXA==;
Received: from [179.234.232.152] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1ryIP2-006j7P-PS; Sat, 20 Apr 2024 23:37:45 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Chema Casanova <jmcasanova@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: [PATCH v3 3/5] drm/v3d: Create function to update a set of GPU stats
Date: Sat, 20 Apr 2024 18:32:11 -0300
Message-ID: <20240420213632.339941-5-mcanal@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240420213632.339941-2-mcanal@igalia.com>
References: <20240420213632.339941-2-mcanal@igalia.com>
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

Given a set of GPU stats, that is, a `struct v3d_stats` related to a
queue in a given context, create a function that can update this set
of GPU stats.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Reviewed-by: Jose Maria Casanova Crespo <jmcasanova@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_sched.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index b6b5542c3fcf..b9614944931c 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -118,6 +118,14 @@ v3d_job_start_stats(struct v3d_job *job, enum v3d_queue queue)
 	global_stats->start_ns = now;
 }
 
+static void
+v3d_stats_update(struct v3d_stats *stats, u64 now)
+{
+	stats->enabled_ns += now - stats->start_ns;
+	stats->jobs_completed++;
+	stats->start_ns = 0;
+}
+
 void
 v3d_job_update_stats(struct v3d_job *job, enum v3d_queue queue)
 {
@@ -127,13 +135,8 @@ v3d_job_update_stats(struct v3d_job *job, enum v3d_queue queue)
 	struct v3d_stats *local_stats = &file->stats[queue];
 	u64 now = local_clock();
 
-	local_stats->enabled_ns += now - local_stats->start_ns;
-	local_stats->jobs_completed++;
-	local_stats->start_ns = 0;
-
-	global_stats->enabled_ns += now - global_stats->start_ns;
-	global_stats->jobs_completed++;
-	global_stats->start_ns = 0;
+	v3d_stats_update(local_stats, now);
+	v3d_stats_update(global_stats, now);
 }
 
 static struct dma_fence *v3d_bin_job_run(struct drm_sched_job *sched_job)
-- 
2.44.0

