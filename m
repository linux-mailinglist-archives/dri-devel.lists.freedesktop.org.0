Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A898A7A93EE
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 13:49:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA66610E5D1;
	Thu, 21 Sep 2023 11:48:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8340D10E5BF;
 Thu, 21 Sep 2023 11:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695296937; x=1726832937;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=x/C2uh5PWRZQln2whJfXJ75Bccnm4zS6ipMqA1RakVk=;
 b=EDYJjXpcLgAP5cwdQjPdF+x8rrdMRV9ypyHPBclEsZ5/leB1fpyMU6Zd
 rRBAp3Olv0Bbq80Aup8dUKzYV6ZkECbP9u8QZ4X3o3dvQ+6EaST+yGZt4
 6Yja9jHPWmMP1atrvyCJ//uxtbW1f4Xt2Ccv6Mmpv8RuwJFt+N6QTBrkL
 pYlfRI/fi9u+822gmX70nzF4PjJi/yO478nl21sBukVqrhCgEvEXtcnx6
 9Nc2Ok8GrFQbhfKc5W75E5V4v4SqRUPJdqiYPx2FKagC1zNhWnMkbkQNE
 l/4Cw4vxB0funfYqnMVWLfEVtd6YN6wDAJCpB29dP4H6HZyRXwWiJM3eP A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="384336784"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="384336784"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 04:48:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="920700877"
X-IronPort-AV: E=Sophos;i="6.03,165,1694761200"; d="scan'208";a="920700877"
Received: from asilke-mobl2.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.199.249])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2023 04:48:55 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v7 0/5] fdinfo memory stats
Date: Thu, 21 Sep 2023 12:48:47 +0100
Message-Id: <20230921114852.192862-1-tvrtko.ursulin@linux.intel.com>
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

A short series to enable fdinfo memory stats for i915.

I added tracking of most classes of objects (user objects, page tables, context
state, ring buffers) which contribute to client's memory footprint and am
accouting their memory use along the similar lines as in Rob's msm code, just
that with i915 specific code we can show a memory region breakdown and so
support discrete and multi-tile GPUs properly. And also reflect that our objects
can have multiple allowed backing stores.

The existing helper Rob added is then used to dump the per memory region stats
to fdinfo.

The basic objects-per-client infrastructure can later be extended to cover all
objects and so avoid needing to walk the IDR under the client's file table lock,
which would further avoid distburbing the running clients by parallel fdinfo
readers.

Example fdinfo format:

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

Example gputop output:

DRM minor 0
 PID     SMEM  SMEMRSS   render     copy     video    NAME
1233     124M     124M |████████||        ||        ||        | neverball
1130      59M      59M |█▌      ||        ||        ||        | Xorg
1207      12M      12M |        ||        ||        ||        | xfwm4

Or with Wayland:

DRM minor 0
 PID      MEM      RSS    render        copy         video    video-enhance NAME
2093     191M     191M |▊          ||           ||           ||           | gnome-shell
DRM minor 128
 PID      MEM      RSS    render        copy         video    video-enhance NAME
2551      71M      71M |██▉        ||           ||           ||           | neverball
2553      50M      50M |           ||           ||           ||           | Xwayland

v2:
 * Now actually per client.

v3:
 * Track imported dma-buf objects.

v4:
 * Rely on DRM GEM handles for tracking user objects.
 * Fix internal object accounting (no placements).

v5:
 * Fixed brain fart of overwriting the loop cursor.
 * Fixed object destruction racing with fdinfo reads.
 * Take reference to GEM context while using it.

v6:
 * Rebase, cover letter update.

v7:
 * Account against active region only.
 * Cover all dma_resv usage when testing for activity.

Test-with: 20230921114557.192629-1-tvrtko.ursulin@linux.intel.com

Tvrtko Ursulin (5):
  drm/i915: Add ability for tracking buffer objects per client
  drm/i915: Record which client owns a VM
  drm/i915: Track page table backing store usage
  drm/i915: Account ring buffer and context state storage
  drm/i915: Implement fdinfo memory stats printing

 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  11 +-
 .../gpu/drm/i915/gem/i915_gem_context_types.h |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  13 ++-
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  12 ++
 .../gpu/drm/i915/gem/selftests/mock_context.c |   4 +-
 drivers/gpu/drm/i915/gt/intel_context.c       |  14 +++
 drivers/gpu/drm/i915/gt/intel_gtt.c           |   6 +
 drivers/gpu/drm/i915/gt/intel_gtt.h           |   1 +
 drivers/gpu/drm/i915/i915_drm_client.c        | 110 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_drm_client.h        |  41 +++++++
 10 files changed, 207 insertions(+), 8 deletions(-)

-- 
2.39.2

