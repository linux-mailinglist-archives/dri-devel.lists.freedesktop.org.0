Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EB057B16D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 09:11:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0DBA112245;
	Wed, 20 Jul 2022 07:11:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 487 seconds by postgrey-1.36 at gabe;
 Tue, 19 Jul 2022 10:48:39 UTC
Received: from mail.ispras.ru (mail.ispras.ru [83.149.199.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7A0E12B854;
 Tue, 19 Jul 2022 10:48:39 +0000 (UTC)
Received: from localhost.localdomain (unknown [83.149.199.65])
 by mail.ispras.ru (Postfix) with ESMTPS id 4FA0340D403D;
 Tue, 19 Jul 2022 10:40:24 +0000 (UTC)
From: Andrey Strachuk <strochuk@ispras.ru>
To: Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH] drm/amdgpu: remove useless condition in
 amdgpu_job_stop_all_jobs_on_sched()
Date: Tue, 19 Jul 2022 13:39:54 +0300
Message-Id: <20220719103954.6737-1-strochuk@ispras.ru>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 20 Jul 2022 07:11:29 +0000
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
Cc: dri-devel@lists.freedesktop.org, Jack Zhang <Jack.Zhang1@amd.com>,
 Andrey Strachuk <strochuk@ispras.ru>, Guchun Chen <guchun.chen@amd.com>,
 Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Surbhi Kakarya <surbhi.kakarya@amd.com>,
 Melissa Wen <mwen@igalia.com>, ldv-project@linuxtesting.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Local variable 'rq' is initialized by an address
of field of drm_sched_job, so it does not make
sense to compare 'rq' with NULL.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Andrey Strachuk <strochuk@ispras.ru>
Fixes: 7c6e68c777f1 ("drm/amdgpu: Avoid HW GPU reset for RAS.")
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_job.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
index 67f66f2f1809..600401f2a98f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
@@ -285,10 +285,6 @@ void amdgpu_job_stop_all_jobs_on_sched(struct drm_gpu_scheduler *sched)
 	/* Signal all jobs not yet scheduled */
 	for (i = DRM_SCHED_PRIORITY_COUNT - 1; i >= DRM_SCHED_PRIORITY_MIN; i--) {
 		struct drm_sched_rq *rq = &sched->sched_rq[i];
-
-		if (!rq)
-			continue;
-
 		spin_lock(&rq->lock);
 		list_for_each_entry(s_entity, &rq->entities, list) {
 			while ((s_job = to_drm_sched_job(spsc_queue_pop(&s_entity->job_queue)))) {
-- 
2.25.1

