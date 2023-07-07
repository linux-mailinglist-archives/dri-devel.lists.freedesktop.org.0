Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F0B974B16D
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 15:03:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E4AD10E598;
	Fri,  7 Jul 2023 13:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EF6010E587;
 Fri,  7 Jul 2023 13:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688734960; x=1720270960;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OhaOmWZL7rjVV4K21qgO9Ik+dnoRcFXvWA39+S++cYc=;
 b=WFzIzAsFp7AeErjKbefvG27Pa9F3Vpmk0gjwGbp9tT5xXPJLAi2NOO5k
 GJE150tBecbmvKi6FCgBnU8jrlwcPbMwOxn4VobKqzK6f5vRxGMWqd5bd
 561kVV98u47Acuq609WoLIlYHsErVKjxciKS1nxxxrcCDcKCOP3RzxVV3
 E9kT9LTse8VpCqexFsYmPje8QmSQgSiAnzDJ4u+rnbL4pxlz5hOKdCWQ/
 l0rwVg+5bsbCtOvh302OyhKUOygKu39slVekDwXHjWdX3jpWn4p9E02UN
 SUjti2eCp5n9Q9fAdaY7+bOyJUyOvLyDtCyYVDucPbekj4OdzmFfwnsjS Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="427570718"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="427570718"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 06:02:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="1050535636"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="1050535636"
Received: from gjmurphy-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.202.50])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 06:02:24 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/5] fdinfo memory stats
Date: Fri,  7 Jul 2023 14:02:15 +0100
Message-Id: <20230707130220.3966836-1-tvrtko.ursulin@linux.intel.com>
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

v4:
 * Rely on DRM GEM handles for tracking user objects.
 * Fix internal object accounting (no placements).

v5:
 * Fixed brain fart of overwriting the loop cursor.
 * Fixed object destruction racing with fdinfo reads.
 * Take reference to GEM context while using it.

Tvrtko Ursulin (5):
  drm/i915: Add ability for tracking buffer objects per client
  drm/i915: Record which client owns a VM
  drm/i915: Track page table backing store usage
  drm/i915: Account ring buffer and context state storage
  drm/i915: Implement fdinfo memory stats printing

 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  11 +-
 .../gpu/drm/i915/gem/i915_gem_context_types.h |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |  13 +-
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  12 ++
 .../gpu/drm/i915/gem/selftests/mock_context.c |   4 +-
 drivers/gpu/drm/i915/gt/intel_context.c       |  13 ++
 drivers/gpu/drm/i915/gt/intel_gtt.c           |   6 +
 drivers/gpu/drm/i915/gt/intel_gtt.h           |   1 +
 drivers/gpu/drm/i915/i915_drm_client.c        | 131 ++++++++++++++++++
 drivers/gpu/drm/i915/i915_drm_client.h        |  40 ++++++
 10 files changed, 226 insertions(+), 8 deletions(-)

-- 
2.39.2

