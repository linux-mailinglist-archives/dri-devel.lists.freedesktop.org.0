Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AC36CD2E2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 09:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0204A10E4D3;
	Wed, 29 Mar 2023 07:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2215410E4D3;
 Wed, 29 Mar 2023 07:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680074654; x=1711610654;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ggmwxoc7/dils5MWJi70ypc6lFx8cadwyL7s3JUR9cA=;
 b=dPLqZ93q/44tUma7uapeVHve6LICMIcBKF5uBV9No+MIZaMY/7Kwguj0
 zxJdV1bm1dvtygN6+syq5BNVzJTnqqWoshA/d8lQHBCoxkrm0E+Vp2Al0
 l5G466JquhoFlhKyKlOJ2JIQc5rKWk//QvyAbcE58PCPhKPTAKnBkLsLM
 dmMgxx/3YMU5HPHqpTK1XKYuLK+JFOe7XB+rITuyUVLp9LdQS4QCLPyoR
 XkV+bseLAtTbWbfGetBsWs1SVG2RwVZ0FAlvsvavdel1IpeZk1tF3nKAT
 F2hPPjiYUyCd+VMCsZQ1+E7wIkMTlzi9o4dpIbxJYv4MAnDZTBcxOYpdK w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="405745835"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; d="scan'208";a="405745835"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2023 00:24:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="684160540"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; d="scan'208";a="684160540"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.112])
 by orsmga002.jf.intel.com with ESMTP; 29 Mar 2023 00:24:09 -0700
From: Zhao Liu <zhao1.liu@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/9] drm/i915: Replace kmap_atomic() with kmap_local_page()
Date: Wed, 29 Mar 2023 15:32:11 +0800
Message-Id: <20230329073220.3982460-1-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: "Fabio M . De Francesco" <fmdefrancesco@gmail.com>,
 Ira Weiny <ira.weiny@intel.com>, Zhao Liu <zhao1.liu@intel.com>,
 Zhenyu Wang <zhenyu.z.wang@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zhao Liu <zhao1.liu@intel.com>

Hi list,

Sorry for a long delay since v1 [1]. This patchset is based on 197b6b6
(Linux 6.3-rc4).

Welcome and thanks for your review and comments!


# Purpose of this patchset

The purpose of this pacthset is to replace all uses of kmap_atomic() in
i915 with kmap_local_page() because the use of kmap_atomic() is being
deprecated in favor of kmap_local_page()[1]. And 92b64bd (mm/highmem:
add notes about conversions from kmap{,_atomic}()) has declared the
deprecation of kmap_atomic().


# Motivation for deprecating kmap_atomic() and using kmap_local_page()

The main difference between atomic and local mappings is that local
mappings doesn't disable page faults or preemption (the preemption is
disabled for !PREEMPT_RT case, otherwise it only disables migration).

With kmap_local_page(), we can avoid the often unwanted side effect of
unnecessary page faults and preemption disables.


# Patch summary

Patch 1, 4-6 and 8-9 replace kamp_atomic()/kunmap_atomic() with
        kmap_local_page()/kunmap_local() directly. With thses local
        mappings, the page faults and preemption are allowed.

Patch 2 and 7 use memcpy_from_page() and memcpy_to_page() to replace
        kamp_atomic()/kunmap_atomic(). These two variants of memcpy()
        are based on the local mapping, so page faults and preemption
        are also allowed in these two interfaces.

Patch 3 replaces kamp_atomic()/kunmap_atomic() with kmap_local_page()/
        kunmap_local() and also diable page fault since the for special
        handling (pls see the commit message).


# Changes since v1

* Dropped hot plug related description in commit message since it has
  nothing to do with kmap_local_page().
* Emphasized the motivation for using kmap_local_page() in commit
  message.
* Rebased patch 1 on f47e630 (drm/i915/gem: Typecheck page lookups) to
  keep the "idx" variable of type pgoff_t here.
* Used memcpy_from_page() and memcpy_to_page() to replace
  kmap_local_page() + memcpy() in patch 2.


# Reference

[1]: https://lore.kernel.org/lkml/20221017093726.2070674-1-zhao1.liu@linux.intel.com/
[1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com
---
Zhao Liu (9):
  drm/i915: Use kmap_local_page() in gem/i915_gem_object.c
  drm/i915: Use memcpy_[from/to]_page() in gem/i915_gem_pyhs.c
  drm/i915: Use kmap_local_page() in gem/i915_gem_shmem.c
  drm/i915: Use kmap_local_page() in gem/selftests/huge_pages.c
  drm/i915: Use kmap_local_page() in gem/selftests/i915_gem_coherency.c
  drm/i915: Use kmap_local_page() in gem/selftests/i915_gem_context.c
  drm/i915: Use memcpy_from_page() in gt/uc/intel_uc_fw.c
  drm/i915: Use kmap_local_page() in i915_cmd_parser.c
  drm/i915: Use kmap_local_page() in gem/i915_gem_execbuffer.c

 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c       | 10 +++++-----
 drivers/gpu/drm/i915/gem/i915_gem_object.c           |  8 +++-----
 drivers/gpu/drm/i915/gem/i915_gem_phys.c             | 10 ++--------
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c            |  6 ++++--
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c      |  6 +++---
 .../gpu/drm/i915/gem/selftests/i915_gem_coherency.c  | 12 ++++--------
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c    |  8 ++++----
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c             |  5 +----
 drivers/gpu/drm/i915/i915_cmd_parser.c               |  4 ++--
 9 files changed, 28 insertions(+), 41 deletions(-)

-- 
2.34.1

