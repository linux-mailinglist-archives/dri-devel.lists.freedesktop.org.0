Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1A2A104D6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2025 11:59:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C673D10E117;
	Tue, 14 Jan 2025 10:59:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Yi0ZaSAO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAFE210E117
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jan 2025 10:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=omPa8g+fZYwHE5HXyS5uDcI3s5p5McP/bYb1wKOt3J0=; b=Yi0ZaSAOhnk3GzHwOVQ0yEmA6o
 N94LDNR00HS61Qlj9HTQJbf8x/bEfv4c4M1Sy8xk5TU8kW9z7W2HEH/Ps3ik0sux2Fy7velwPNM4e
 UhjBJlAmbbJ0Wa6/W1060vLqT6tSHbppzaHYNgOiFAsxyHuBCKFnKkGRwTHdq+eRmUpU2DSW5dHhk
 tI2mUspWAjufW5lLJmSR6t4K+Frhec+u6ramo9THgA0ZkWeROlw0QlwygGG61nNMP960bA+Ol3wJ/
 6LTpWnymCqudgmATfMusL4msndGBjBXj+dk2/c11OFIVi6NuTdGYLq2z19bUXAxNiuA8XyWzbEpqh
 EAhK4wnw==;
Received: from [90.241.98.187] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tXee8-00FbsD-NA; Tue, 14 Jan 2025 11:59:44 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
Subject: [PATCH] drm/sched: Remove weak paused submission checks
Date: Tue, 14 Jan 2025 10:59:42 +0000
Message-ID: <20250114105942.64832-1-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.47.1
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

There is no need to check the boolean in the work item's prologues since
the boolean can be set at any later time anyway.

The helper which pauses submission sets it and synchronously cancels the
work and helpers which queue the work check for the flag so all should be
good.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/scheduler/sched_main.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 57da84908752..2d3d71e053a6 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -1166,9 +1166,6 @@ static void drm_sched_free_job_work(struct work_struct *w)
 		container_of(w, struct drm_gpu_scheduler, work_free_job);
 	struct drm_sched_job *job;
 
-	if (READ_ONCE(sched->pause_submit))
-		return;
-
 	job = drm_sched_get_finished_job(sched);
 	if (job)
 		sched->ops->free_job(job);
@@ -1192,9 +1189,6 @@ static void drm_sched_run_job_work(struct work_struct *w)
 	struct drm_sched_job *sched_job;
 	int r;
 
-	if (READ_ONCE(sched->pause_submit))
-		return;
-
 	/* Find entity with a ready job */
 	entity = drm_sched_select_entity(sched);
 	if (!entity)
-- 
2.47.1

