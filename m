Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCED3AE9F7
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 15:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4369B6E0CF;
	Mon, 21 Jun 2021 13:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 52D4B897E8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 13:25:47 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 7A78C1F42713;
 Mon, 21 Jun 2021 14:25:44 +0100 (BST)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Steven Price <steven.price@arm.com>, Robin Murphy <robin.murphy@arm.com>
Subject: [PATCH 00/10] drm/panfrost: Misc fixes/improvements
Date: Mon, 21 Jun 2021 15:25:29 +0200
Message-Id: <20210621132539.1683000-1-boris.brezillon@collabora.com>
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
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

Here's is collection of patches addressing some stability issues.

The first patch has been submitted a while ago but was lacking a way
to kill in-flight jobs when a context is closed; which is now addressed
in patch 10.

The rest of those patches are improving fault handling (with some code
refactoring in the middle).

"drm/panfrost: Do the exception -> string translation using a table"
still has a TODO. I basically mapped all exception types to
EINVAL since most faults are triggered by invalid job/shaders, but
there might be some exceptions that should be translated to something
else. Any feedback on that aspect is welcome.

Regards,

Boris

Boris Brezillon (10):
  drm/panfrost: Make sure MMU context lifetime is not bound to
    panfrost_priv
  drm/panfrost: Get rid of the unused JS_STATUS_EVENT_ACTIVE definition
  drm/panfrost: Drop the pfdev argument passed to
    panfrost_exception_name()
  drm/panfrost: Expose exception types to userspace
  drm/panfrost: Disable the AS on unhandled page faults
  drm/panfrost: Expose a helper to trigger a GPU reset
  drm/panfrost: Reset the GPU when the AS_ACTIVE bit is stuck
  drm/panfrost: Do the exception -> string translation using a table
  drm/panfrost: Don't reset the GPU on job faults unless we really have
    to
  drm/panfrost: Kill in-flight jobs on FD close

 drivers/gpu/drm/panfrost/panfrost_device.c | 143 +++++++++++------
 drivers/gpu/drm/panfrost/panfrost_device.h |  21 ++-
 drivers/gpu/drm/panfrost/panfrost_drv.c    |  50 ++----
 drivers/gpu/drm/panfrost/panfrost_gem.c    |  20 ++-
 drivers/gpu/drm/panfrost/panfrost_gpu.c    |   2 +-
 drivers/gpu/drm/panfrost/panfrost_job.c    |  74 ++++++---
 drivers/gpu/drm/panfrost/panfrost_mmu.c    | 173 ++++++++++++++-------
 drivers/gpu/drm/panfrost/panfrost_mmu.h    |   5 +-
 drivers/gpu/drm/panfrost/panfrost_regs.h   |   3 -
 include/uapi/drm/panfrost_drm.h            |  65 ++++++++
 10 files changed, 371 insertions(+), 185 deletions(-)

-- 
2.31.1

