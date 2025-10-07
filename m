Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A049DBC1D63
	for <lists+dri-devel@lfdr.de>; Tue, 07 Oct 2025 17:02:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FCCF10E69F;
	Tue,  7 Oct 2025 15:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Ro9yLJ/2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A81210E69F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Oct 2025 15:02:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1759849360; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=M50HM7e4rrY4ttTqgW4yR3p1dKwc4ucsxPdWmEZQc23nLhIYdCayBcEuL8Km097DqTD0ysrRORoTdxYHlNvdw6UYddM66xN8DZPu6q70Yhqr8KohXzg3fPNf63ZNpdFgKHnXR9gOf/f644Kcxv7siLC9yN7iRpADHX+EKoOWWwQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1759849360;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=g+HW6MfkUt7E20j/Xt2mgSDYhDTXOKhdIRu4lYcnmRo=; 
 b=f2mhktMbRD5kq/IbjjcKz5aHDdD7pojtxWEjeQoR6opmeHjpK8HIwhkGTlrqbxlT/70i7PDi482OkVLcDvX8XP3Tcc2oaMFhN4oPrHXJ0QF3SBgqRW41cV61sNsrWzPOZebFTrLUkNV/Z+5TuJFN6+VC2Zj+Bc4KS0ysQb7Vk8E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759849360; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=g+HW6MfkUt7E20j/Xt2mgSDYhDTXOKhdIRu4lYcnmRo=;
 b=Ro9yLJ/2gdTFF3KDEriH4YCzhVMIMQ9wkHjmqnzVQATVQScB1aZqTNcfhznj1vng
 niRBUQ70q0zZnvBphWuF52qJ33HtH5jvSQ3zQN54Hb82VddBvjD36en8fEcquilI1fT
 UKNXJvH4ONp29rueqM/PJTPEdsCpVI63P1XyAgTA=
Received: by mx.zohomail.com with SMTPS id 1759849357913151.85939094255968;
 Tue, 7 Oct 2025 08:02:37 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
Subject: [PATCH v5 00/12] Some Panfrost fixes and improvements
Date: Tue,  7 Oct 2025 16:01:42 +0100
Message-ID: <20251007150216.254250-1-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.51.0
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

This is v5 of https://lore.kernel.org/dri-devel/20251001022039.1215976-1-adrian.larumbe@collabora.com/

This patch series is a collection of minor fixes and improvements I came up
with while working on driver related stuff.

Changelog:
 v5:
 - Move devfreq record keeping further down job submission function to
 keep busy count balanced in case of an early bail-out.
 - In MMU page fault ISR, bail out when sgt for 2MiB page is not assigned,
 rather than when the page array is populated. Add new commit for this.
 - Add commit with myself as a new Panfrost maintainer

 v4:
  - Rebased older patch series onto latest drm-misc-next
  - Added patch for renaming JM functions to reflect their actual role
  - Fixed treatment of error code in perfcnt when enabling sample buffer AS

 v3:
  - Minor convenience fixes to patches 3 and 4 in the series
  - Move unmapping of maped range of BO to the function's error path
  in case of BO mapping failure, also for putting BO's pages
  - Split patch 6/8 into two: one makes sure the Job IRQ enablement mask
  isn't recalculated at every device reset and uses the same expression
  everywhere in the driver, and another one that breaks the enablement
  function into two stages.

 v2:
  - Removed commit that provided an explicit fence cleanup function
  - Added commit for removing unused Panfrost device structure member
  - Refactored how optional job interrupt reenabling during reset is handled
  - Make the way errors and successful return values are delivered from inside
   panfrost_mmu_as_get more according to standard.
  - Simplify unmapping of already mapped area when mapping the pages of a BO
  - Fixing management of runtime-PM reference counts when failing HW job submission.

Adrián Larumbe (12):
  drm/panfrost: Replace DRM driver allocation method with newer one
  drm/panfrost: Handle inexistent GPU during probe
  drm/panfrost: Handle job HW submit errors
  drm/panfrost: Handle error when allocating AS number
  drm/panfrost: Check sgt to know whether pages are already mapped
  drm/panfrost: Handle page mapping failure
  drm/panfrost: Don't rework job IRQ enable mask in the enable path
  drm/panfrost: Make re-enabling job interrupts at device reset optional
  drm/panfrost: Add forward declaration and types header
  drm/panfrost: Remove unused device property
  drm/panfrost: Rename panfrost_job functions to reflect real role
  MAINTAINERS: Add Adrian Larumbe as Panfrost driver maintainer

 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/panfrost/panfrost_devfreq.c   |   4 +-
 drivers/gpu/drm/panfrost/panfrost_device.c    |  68 +++++----
 drivers/gpu/drm/panfrost/panfrost_device.h    |  13 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  78 ++++------
 drivers/gpu/drm/panfrost/panfrost_dump.c      |   8 +-
 drivers/gpu/drm/panfrost/panfrost_gem.c       |   8 +-
 .../gpu/drm/panfrost/panfrost_gem_shrinker.c  |   4 +-
 drivers/gpu/drm/panfrost/panfrost_gpu.c       |  64 ++++----
 drivers/gpu/drm/panfrost/panfrost_job.c       | 139 ++++++++---------
 drivers/gpu/drm/panfrost/panfrost_job.h       |  15 +-
 drivers/gpu/drm/panfrost/panfrost_mmu.c       | 142 ++++++++++++------
 drivers/gpu/drm/panfrost/panfrost_mmu.h       |   3 +-
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c   |  27 ++--
 14 files changed, 320 insertions(+), 254 deletions(-)

--
2.51.0
