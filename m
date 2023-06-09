Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C31729934
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jun 2023 14:11:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7596610E6A4;
	Fri,  9 Jun 2023 12:11:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECCBA10E6A1;
 Fri,  9 Jun 2023 12:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686312711; x=1717848711;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7nx0YyXted1LRrLD4YVfVdsRF1zysLfKI0bnhsC4Frs=;
 b=Us2aggpdPuhxfNoXqI0vkMSu04wdlPRJNAMezjTUKp6EXguSCnPrEt/y
 cmcrKbXgDyZhfbgivod2Bk8P58pqyhVCq+sodHaUt0SeBQaGlR32L+pX6
 hrpWxW42GPIPe0xL11/HsBYJ2VUN183N54eiS7k1miYJO/C+nTZpiMUuI
 5p7LvCRKrv0btax7SlJtkW+PGspV1Am5GZ+CPmdICnkVRcKgBH5af8qkN
 5Xcxm2SKT07PJT1PWdZOBhuIvzq/joY78BfFW0TUI824Ff/bcTdtj1ycD
 I37kqjBz/eGnKD7pFL/rqRgy3WpRUXp02T5BMlc+jTF3rMqiTeGuHtAQx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="356474734"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="356474734"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 05:11:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="740150817"
X-IronPort-AV: E=Sophos;i="6.00,229,1681196400"; d="scan'208";a="740150817"
Received: from pjdillon-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.210.241])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2023 05:11:49 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/8] fdinfo memory stats
Date: Fri,  9 Jun 2023 13:11:35 +0100
Message-Id: <20230609121143.1232420-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

I added tracking of most classes of objects which contribute to client's memory
footprint and accouting along the similar lines as in Rob's msm code. Then
printing it out to fdinfo using the drm helper Rob added.

Accounting by keeping per client lists may not be the most effient method,
perhaps we should simply add and subtract stats directly at convenient sites,
but that too is not straightforward due no existing connection between buffer
objects and clients. Possibly some other tricky bits in the buffer sharing
deparment. So lets see if this works for now. Infrequent reader penalty should
not be too bad (may be even useful to dump the lists in debugfs?) and additional
list_head per object pretty much drowns in the noise.

Example fdinfo with the series applied:

# cat /proc/1383/fdinfo/8
pos:    0
flags:  02100002
mnt_id: 21
ino:    397
drm-driver:     i915
drm-client-id:  18
drm-pdev:       0000:00:02.0
drm-total-system:       125 MiB
drm-shared-system:      16 MiB
drm-active-system:      110 MiB
drm-resident-system:    125 MiB
drm-purgeable-system:   2 MiB
drm-total-stolen-system:        0
drm-shared-stolen-system:       0
drm-active-stolen-system:       0
drm-resident-stolen-system:     0
drm-purgeable-stolen-system:    0
drm-engine-render:      25662044495 ns
drm-engine-copy:        0 ns
drm-engine-video:       0 ns
drm-engine-video-enhance:       0 ns

Example gputop output (local patches currently):

DRM minor 0
 PID     SMEM  SMEMRSS   render     copy     video    NAME
1233     124M     124M |████████||        ||        ||        | neverball
1130      59M      59M |█▌      ||        ||        ||        | Xorg
1207      12M      12M |        ||        ||        ||        | xfwm4

v2:
 * Now actually per client.

v3:
 * Track imported dma-buf objects.

P.S. Patch 1 in the series is to silence a false positive lockdep splat due
fence signaling annotations.

Tvrtko Ursulin (8):
  dma-fence: Bypass signaling annotation from dma_fence_is_signaled
  drm/i915: Track buffer objects belonging to clients
  drm/i915: Record which clients own a VM
  drm/i915: Track page table backing store usage
  drm/i915: Account ring buffer and context state storage
  drm: Add drm_gem_prime_fd_to_handle_obj
  drm/i915: Track imported dma-buf objects in memory stats
  drm/i915: Implement fdinfo memory stats printing

 drivers/dma-buf/dma-fence.c                   |  26 +++-
 drivers/gpu/drm/drm_prime.c                   |  41 ++++++-
 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  17 ++-
 .../gpu/drm/i915/gem/i915_gem_context_types.h |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_create.c    |  32 ++++-
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  32 +++++
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.h    |   7 ++
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |   6 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  12 ++
 .../gpu/drm/i915/gem/selftests/mock_context.c |   4 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c           |   6 +
 drivers/gpu/drm/i915/gt/intel_gtt.h           |   1 +
 drivers/gpu/drm/i915/i915_driver.c            |   2 +-
 drivers/gpu/drm/i915/i915_drm_client.c        | 113 +++++++++++++++++-
 drivers/gpu/drm/i915/i915_drm_client.h        |  45 ++++++-
 drivers/gpu/drm/i915/i915_gem.c               |   2 +-
 include/drm/drm_prime.h                       |   4 +
 include/linux/dma-fence.h                     |   3 +-
 18 files changed, 332 insertions(+), 24 deletions(-)

-- 
2.39.2

