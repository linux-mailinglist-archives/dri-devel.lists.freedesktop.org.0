Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E60103B8F8B
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 11:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35276EAAD;
	Thu,  1 Jul 2021 09:12:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013496EAAD
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Jul 2021 09:12:29 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 5BB8C1F40485;
 Thu,  1 Jul 2021 10:12:28 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH v2 0/7] drm/panfrost: drm/panfrost: Add a new submit ioctl
Date: Thu,  1 Jul 2021 11:12:17 +0200
Message-Id: <20210701091224.3209803-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.31.1
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
Cc: Jason Ekstrand <jason@jlekstrand.net>, dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This is an attempt at providing a new submit ioctl that's more
Vulkan-friendly than the existing one. This ioctl

1/ allows passing several out syncobjs so we can easily update
   several fence/semaphore in a single ioctl() call
2/ allows passing several jobs so we don't have to have one ioctl
   per job-chain recorded in the command buffer
3/ supports disabling implicit dependencies as well as 
   non-exclusive access to BOs, thus removing unnecessary
   synchronization

I've also been looking at adding {IN,OUT}_FENCE_FD support (allowing
one to pass at most one sync_file object in input and/or creating a
sync_file FD embedding the render out fence), but it's not entirely
clear to me when that's useful. Indeed, we can already do the
sync_file <-> syncobj conversion using the
SYNCOBJ_{FD_TO_HANDLE,HANDLE_TO_FD} ioctls if we have to.
Note that, unlike Turnip, PanVk is using syncobjs to implement
vkQueueWaitIdle(), so the syncobj -> sync_file conversion doesn't
have to happen for each submission, but maybe there's a good reason
to use sync_files for that too. Any feedback on that aspect would
be useful I guess.

Any feedback on this new ioctl is welcome, in particular, do you
think other things are missing/would be nice to have for Vulkan?

Regards,

Boris

P.S.: basic igt tests for these new ioctls re available there [1]

[1]https://gitlab.freedesktop.org/bbrezillon/igt-gpu-tools/-/tree/panfrost-batch-submit

Boris Brezillon (7):
  drm/panfrost: Pass a job to panfrost_{acquire,attach_object_fences}()
  drm/panfrost: Move the mappings collection out of
    panfrost_lookup_bos()
  drm/panfrost: Add BO access flags to relax dependencies between jobs
  drm/panfrost: Add the ability to create submit queues
  drm/panfrost: Add a new ioctl to submit batches
  drm/panfrost: Advertise the SYNCOBJ_TIMELINE feature
  drm/panfrost: Bump minor version to reflect the feature additions

 drivers/gpu/drm/panfrost/Makefile             |   3 +-
 drivers/gpu/drm/panfrost/panfrost_device.h    |   2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       | 442 ++++++++++++++++--
 drivers/gpu/drm/panfrost/panfrost_job.c       |  89 ++--
 drivers/gpu/drm/panfrost/panfrost_job.h       |  10 +-
 .../gpu/drm/panfrost/panfrost_submitqueue.c   | 130 ++++++
 .../gpu/drm/panfrost/panfrost_submitqueue.h   |  27 ++
 include/uapi/drm/panfrost_drm.h               | 103 ++++
 8 files changed, 720 insertions(+), 86 deletions(-)
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_submitqueue.c
 create mode 100644 drivers/gpu/drm/panfrost/panfrost_submitqueue.h

-- 
2.31.1

