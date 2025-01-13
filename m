Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C66BA0BC7C
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 16:47:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD6B10E6FE;
	Mon, 13 Jan 2025 15:47:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="W9fOb2em";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B1E10E6F1
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 15:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rJtSw2R7ZeCGOJ9x2K4OgmxWcYNIzrVqrcwiNH1lA2A=; b=W9fOb2embH03bo7srvg8/W30nD
 SatjkY+jBmmOHgYrA9ZX8WUY6fqw9IZhyQ+6G19v8fA1qlhcf7fMXNJ1Pwxfm+YZbgDH2tppQ7F9g
 c3jw4nJXnfO+WbgQ/9MKEvXobQhLjkPrAxYCl1DwPe+f6jBFJtNUQIqlgnudt6G0iGPiu2UqMz/Fs
 WCclQ13lXGPRUvlyfcUrE4CYQBhsy93AXAD27mmEWG4jOj6roAbIxZXn9rF/WKThHga4WQiA7kvJu
 z2wEF/ukU5ZuILtk7EEK4E7THScuaWKVGpaUX6x+ZDa9kt8pr+4nd2Qh4MNANwvb2CNGKoFOESMpx
 XmyavvOA==;
Received: from [187.36.213.55] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__CHACHA20_POLY1305:256)
 (Exim) id 1tXMfP-00FEpb-QL; Mon, 13 Jan 2025 16:47:52 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 Chema Casanova <jmcasanova@igalia.com>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH 2/2] drm/v3d: Remove `v3d->cpu_job`
Date: Mon, 13 Jan 2025 12:47:41 -0300
Message-Id: <20250113154741.67520-2-mcanal@igalia.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250113154741.67520-1-mcanal@igalia.com>
References: <20250113154741.67520-1-mcanal@igalia.com>
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

CPU jobs, like Clean Cache jobs, execute synchronously once the DRM
scheduler starts running them. Consequently, a global `v3d->cpu_job`
variable is unnecessary, as everything is managed within the
`v3d_cpu_job_run()` function.

This commit removes the `v3d->cpu_job` pointer, as it is not needed.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_drv.h   | 1 -
 drivers/gpu/drm/v3d/v3d_sched.c | 2 --
 2 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_drv.h b/drivers/gpu/drm/v3d/v3d_drv.h
index dc1cfe2e14be..9deaefa0f95b 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.h
+++ b/drivers/gpu/drm/v3d/v3d_drv.h
@@ -147,7 +147,6 @@ struct v3d_dev {
 	struct v3d_render_job *render_job;
 	struct v3d_tfu_job *tfu_job;
 	struct v3d_csd_job *csd_job;
-	struct v3d_cpu_job *cpu_job;
 
 	struct v3d_queue_state queue[V3D_MAX_QUEUES];
 
diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index da08ddb01d21..961465128d80 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -656,8 +656,6 @@ v3d_cpu_job_run(struct drm_sched_job *sched_job)
 	struct v3d_cpu_job *job = to_cpu_job(sched_job);
 	struct v3d_dev *v3d = job->base.v3d;
 
-	v3d->cpu_job = job;
-
 	if (job->job_type >= ARRAY_SIZE(cpu_job_function)) {
 		DRM_DEBUG_DRIVER("Unknown CPU job: %d\n", job->job_type);
 		return NULL;
-- 
2.39.5 (Apple Git-154)

