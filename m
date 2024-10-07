Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 561F4993566
	for <lists+dri-devel@lfdr.de>; Mon,  7 Oct 2024 19:51:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C775310E3EE;
	Mon,  7 Oct 2024 17:51:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ejAF1gUn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7B5E10E3EE
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Oct 2024 17:51:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AAB3B5C5C50;
 Mon,  7 Oct 2024 17:51:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12ED1C4CEC6;
 Mon,  7 Oct 2024 17:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1728323493;
 bh=WiRU2/l5hvl/vfYct6V/jUygCU+4xs7dk2Yp2YJ0gLI=;
 h=Subject:To:Cc:From:Date:From;
 b=ejAF1gUn+YheqUPotFzvhpqN8W2EXAUTE703t2kjTrWdIMN1mIiT/N490fQOF0pd4
 FAIqzPPWxjtinxekSQPDZUNOUGuxPBu427y/EIPxnatfmLxUCpuW09WNacMPQ0ys97
 KI9kOCER1fgWWYA52jvOxUz1uhbGjy71NM/gRt5s=
Subject: Patch "drm/sched: Add locking to drm_sched_entity_modify_sched" has
 been added to the 6.10-stable tree
To: airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 ltuikov89@gmail.com, matthew.brost@intel.com, pstanner@redhat.com,
 tvrtko.ursulin@igalia.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 07 Oct 2024 19:50:52 +0200
Message-ID: <2024100752-trapped-unfrozen-0204@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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


This is a note to let you know that I've just added the patch titled

    drm/sched: Add locking to drm_sched_entity_modify_sched

to the 6.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-sched-add-locking-to-drm_sched_entity_modify_sched.patch
and it can be found in the queue-6.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 4286cc2c953983d44d248c9de1c81d3a9643345c Mon Sep 17 00:00:00 2001
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date: Fri, 13 Sep 2024 17:05:52 +0100
Subject: drm/sched: Add locking to drm_sched_entity_modify_sched
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

commit 4286cc2c953983d44d248c9de1c81d3a9643345c upstream.

Without the locking amdgpu currently can race between
amdgpu_ctx_set_entity_priority() (via drm_sched_entity_modify_sched()) and
drm_sched_job_arm(), leading to the latter accesing potentially
inconsitent entity->sched_list and entity->num_sched_list pair.

v2:
 * Improve commit message. (Philipp)

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Fixes: b37aced31eb0 ("drm/scheduler: implement a function to modify sched list")
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Luben Tuikov <ltuikov89@gmail.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: Philipp Stanner <pstanner@redhat.com>
Cc: <stable@vger.kernel.org> # v5.7+
Reviewed-by: Christian König <christian.koenig@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240913160559.49054-2-tursulin@igalia.com
Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c |    2 ++
 1 file changed, 2 insertions(+)

--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -133,8 +133,10 @@ void drm_sched_entity_modify_sched(struc
 {
 	WARN_ON(!num_sched_list || !sched_list);
 
+	spin_lock(&entity->rq_lock);
 	entity->sched_list = sched_list;
 	entity->num_sched_list = num_sched_list;
+	spin_unlock(&entity->rq_lock);
 }
 EXPORT_SYMBOL(drm_sched_entity_modify_sched);
 


Patches currently in stable-queue which might be from tvrtko.ursulin@igalia.com are

queue-6.10/drm-sched-always-increment-correct-scheduler-score.patch
queue-6.10/drm-v3d-prevent-out-of-bounds-access-in-performance-query-extensions.patch
queue-6.10/drm-sched-always-wake-up-correct-scheduler-in-drm_sched_entity_push_job.patch
queue-6.10/drm-sched-add-locking-to-drm_sched_entity_modify_sched.patch
