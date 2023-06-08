Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A93772830B
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jun 2023 16:52:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89ECD10E241;
	Thu,  8 Jun 2023 14:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C4CD10E049;
 Thu,  8 Jun 2023 14:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686235906; x=1717771906;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UPdbaFZIy/Xa/3lqGqI7ii7CmXU60kWVSDkMDZcIp9w=;
 b=gpH9nbotRP0gDuQUHaQJ10P8AJy/jFf7y8AitQNcusFTI/2NSEn+k+By
 opmYoEuZCuae2V34ZKqPYWVm5gTXvXMOpEVeB26hKk7HAcv81sHDtafJx
 1lZFa98cyfEblQuyZfXfBNLF8xFxG0c/2sZ1DC2k/jzfUihYOcrhZzeIX
 cAyDfE4r1FeoC+j0EnRqhnm/0+JW1MYbDNbooZgQpzghcR0aYYP/CdxIO
 5sU/A65EMrPwkWNq10gX/rAFyhQzgpRFsAHrf5umohz1li9Ct9LHPwioC
 l4CO4/oF29E/d9/GIvo5DBPgQwblNDJ9JT7xD0B6k2kqhH7aaY2cN+C4C g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="336957589"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="336957589"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 07:51:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10735"; a="704134501"
X-IronPort-AV: E=Sophos;i="6.00,227,1681196400"; d="scan'208";a="704134501"
Received: from rirwin-mobl3.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.239.227])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2023 07:51:39 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/5] fdinfo memory stats
Date: Thu,  8 Jun 2023 15:51:28 +0100
Message-Id: <20230608145133.1059554-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Second try, this time actually per client! :)

I added tracking of most classes of objects which contribute to clients memory
footprint and accouting along the similar lines as in Rob's msm code. Then
printing it out to fdinfo using the drm helper Rob added.

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

Tvrtko Ursulin (5):
  drm/i915: Track buffer objects belonging to clients
  drm/i915: Record which clients own a VM
  drm/i915: Track page table backing store usage
  drm/i915: Account ring buffer and context state storage
  drm/i915: Implement fdinfo memory stats printing

 drivers/gpu/drm/i915/gem/i915_gem_context.c   |  17 ++-
 .../gpu/drm/i915/gem/i915_gem_context_types.h |   3 +
 drivers/gpu/drm/i915/gem/i915_gem_create.c    |  32 ++++-
 drivers/gpu/drm/i915/gem/i915_gem_object.c    |   6 +
 .../gpu/drm/i915/gem/i915_gem_object_types.h  |  12 ++
 drivers/gpu/drm/i915/gt/intel_gtt.c           |   6 +
 drivers/gpu/drm/i915/gt/intel_gtt.h           |   1 +
 drivers/gpu/drm/i915/i915_drm_client.c        | 110 +++++++++++++++++-
 drivers/gpu/drm/i915/i915_drm_client.h        |  46 +++++++-
 drivers/gpu/drm/i915/i915_gem.c               |   2 +-
 10 files changed, 226 insertions(+), 9 deletions(-)

-- 
2.39.2

