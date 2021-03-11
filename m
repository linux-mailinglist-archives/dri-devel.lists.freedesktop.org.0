Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFFD6336EC4
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 10:25:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB2556EB51;
	Thu, 11 Mar 2021 09:25:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D956A6EB51
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Mar 2021 09:25:45 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:b93f:9fae:b276:a89a])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 82F711F46002;
 Thu, 11 Mar 2021 09:25:44 +0000 (GMT)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>, Tomeu Vizoso <tomeu@tomeuvizoso.net>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [RFC PATCH 0/7] drm/panfrost: Add a new submit ioctl
Date: Thu, 11 Mar 2021 10:25:32 +0100
Message-Id: <20210311092539.2405596-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

I've been playing with Vulkan lately and struggled quite a bit to
implement VkQueueSubmit with the submit ioctl we have. There are
several limiting factors that can be worked around if we really have to,
but I think it'd be much easier and future-proof if we introduce a new
ioctl that addresses the current limitations:

1/ There can only be one out_sync, but Vulkan might ask us to signal
   several VkSemaphores and possibly one VkFence too, both of those
   being based on sync objects in my PoC. Making out_sync an array of
   syncobjs to attach the render_done fence to would make that possible.
   The other option would be to collect syncobj updates in userspace
   in a separate thread and propagate those updates to all
   semaphores+fences waiting on those events (I think the v3dv driver
   does something like that, but I didn't spend enough time studying
   the code to be sure, so I might be wrong).

2/ Queued jobs might be executed out-of-order (unless they have
   explicit/implicit deps between them), and Vulkan asks that the out
   fence be signaled when all jobs are done. Timeline syncobjs are a
   good match for that use case. All we need to do is pass the same
   fence syncobj to all jobs being attached to a single QueueSubmit
   request, but a different point on the timeline. The syncobj
   timeline wait does the rest and guarantees that we've reached a
   given timeline point (IOW, all jobs before that point are done)
   before declaring the fence as signaled.
   One alternative would be to have dummy 'synchronization' jobs that
   don't actually execute anything on the GPU but declare a dependency
   on all other jobs that are part of the QueueSubmit request, and
   signal the out fence (the scheduler would do most of the work for
   us, all we have to do is support NULL job heads and signal the
   fence directly when that happens instead of queueing the job).

3/ The current implementation lacks information about BO access,
   so we serialize all jobs accessing the same set of BOs, even
   if those jobs might just be reading from them (which can
   happen concurrently). Other drivers pass an access type to the
   list of referenced BOs to address that. Another option would be
   to disable implicit deps (deps based on BOs) and force the driver
   to pass all deps explicitly (interestingly, some drivers have
   both the no-implicit-dep and r/w flags, probably to support
   sub-resource access, so we might want to add that one too).
   I don't see any userspace workaround to that problem, so that one
   alone would justify extending the existing ioctl or adding a new
   one.

4/ There's also the fact that submitting one job at a time adds an
   overhead when QueueSubmit is being passed more than one
   CommandBuffer. That one is less problematic, but if we're adding
   a new ioctl we'd better design it to limit the userspace -> kernel
   transition overhead.

Right now I'm just trying to collect feedback. I don't intend to get
those patches merged until we have a userspace user, but I thought
starting the discussion early would be a good thing.

Feel free to suggest other approaches.

Regards,

Boris

Boris Brezillon (7):
  drm/panfrost: Pass a job to panfrost_{acquire,attach_object_fences}()
  drm/panfrost: Collect implicit and explicit deps in an XArray
  drm/panfrost: Move the mappings collection out of
    panfrost_lookup_bos()
  drm/panfrost: Add BO access flags to relax dependencies between jobs
  drm/panfrost: Add a new ioctl to submit batches
  drm/panfrost: Advertise the SYNCOBJ_TIMELINE feature
  drm/panfrost: Bump minor version to reflect the feature additions

 drivers/gpu/drm/panfrost/panfrost_drv.c | 408 +++++++++++++++++++++---
 drivers/gpu/drm/panfrost/panfrost_job.c |  80 +++--
 drivers/gpu/drm/panfrost/panfrost_job.h |   8 +-
 include/uapi/drm/panfrost_drm.h         |  83 +++++
 4 files changed, 483 insertions(+), 96 deletions(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
