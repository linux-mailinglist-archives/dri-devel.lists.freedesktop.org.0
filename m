Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DCB8979D6
	for <lists+dri-devel@lfdr.de>; Wed,  3 Apr 2024 22:36:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C755112ED7;
	Wed,  3 Apr 2024 20:36:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="GgSwC1OO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425C6112ED1
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Apr 2024 20:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/f/s6nl8p2AU0OWOur9Yb0cNXPGeVoqcDmuLuJ1+7fw=; b=GgSwC1OO8XOsf4ujENeF9L1f5n
 39c0wyP7DQQ1jJlOqy5pVAWfhtPAzwYFfYSkyHr3zb2Ax4OrMfIJgjI5wT1qHTNsLRPF697r24j74
 P9xesGL4XkPO8Uc19mIt85DIcz1N0TSMxQTlG8fDMPcISUkecImAHXCXic6CAShWtu0SFAQxkNJJV
 gJy0mqS9WmG+IDGmSUbkwHgImK4CF3GrvkqHddNm6Voa55fpglq+HovUAb023Wv9inbhplRxt5ucr
 vQKU8/15tNCqiQZlm2uMV2CgeXc3XZT1j2DETEzPB7yO4Va+XijolAlnHwuHF8kwPCpwHRPtEzYPj
 SITreu0Q==;
Received: from [177.34.169.255] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rs7L7-00124v-1T; Wed, 03 Apr 2024 22:36:09 +0200
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Chema Casanova <jmcasanova@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH 4/5] drm/v3d: Create function to update a set of GPU stats
Date: Wed,  3 Apr 2024 17:24:53 -0300
Message-ID: <20240403203517.731876-5-mcanal@igalia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240403203517.731876-1-mcanal@igalia.com>
References: <20240403203517.731876-1-mcanal@igalia.com>
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
queue in a given context, create a function that can update all this set of
GPU stats.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_sched.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index ea5f5a84b55b..754107b80f67 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -118,6 +118,16 @@ v3d_job_start_stats(struct v3d_job *job, enum v3d_queue queue)
 	global_stats->start_ns = now;
 }
 
+static void
+v3d_stats_update(struct v3d_stats *stats)
+{
+	u64 now = local_clock();
+
+	stats->enabled_ns += now - stats->start_ns;
+	stats->jobs_sent++;
+	stats->start_ns = 0;
+}
+
 void
 v3d_job_update_stats(struct v3d_job *job, enum v3d_queue queue)
 {
@@ -125,15 +135,9 @@ v3d_job_update_stats(struct v3d_job *job, enum v3d_queue queue)
 	struct v3d_file_priv *file = job->file->driver_priv;
 	struct v3d_stats *global_stats = &v3d->queue[queue].stats;
 	struct v3d_stats *local_stats = &file->stats[queue];
-	u64 now = local_clock();
-
-	local_stats->enabled_ns += now - local_stats->start_ns;
-	local_stats->jobs_sent++;
-	local_stats->start_ns = 0;
 
-	global_stats->enabled_ns += now - global_stats->start_ns;
-	global_stats->jobs_sent++;
-	global_stats->start_ns = 0;
+	v3d_stats_update(local_stats);
+	v3d_stats_update(global_stats);
 }
 
 static struct dma_fence *v3d_bin_job_run(struct drm_sched_job *sched_job)
-- 
2.44.0

