Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CC1602479
	for <lists+dri-devel@lfdr.de>; Tue, 18 Oct 2022 08:36:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CB9A10EE87;
	Tue, 18 Oct 2022 06:35:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC8A10ED0E;
 Mon, 17 Oct 2022 09:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665999144; x=1697535144;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6ZU9PDhvVYa7AEOd0lamaGEe6sVuaqOTNJI83nJvfl8=;
 b=mnzk/B0X65EPuTA7735U+Ph3/odnje5sF8SrM/9lu5EZ1B5cIZw8r0n2
 cp2G17v591DcDK8H9zZb/4zymaNtIDsgzUMXJ3h1VOKK8L60t2MhGzsNH
 iqnTpUuZ8YYad/cn7BjxCRjLxDFNLlnK9vLOuTWmiZ7eOAOlfLvOombPP
 0tWmAzfVLN4H5Uhss4nQ74RyxUB/PiDJHeq5LuyyqzH60CFhdWmAo7czN
 BdoVs8PFpOkdQNoCxzhgkKPiPIWkst3eDwDVDLkIJV9D24ajzsbAuR8XB
 WShLagGUGuTIIJV9djFzCHAQHSXexlm55WLUVuZQHeelBLsI4qrryxyV5 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="286142588"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; d="scan'208";a="286142588"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 02:32:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="717431199"
X-IronPort-AV: E=Sophos;i="5.95,191,1661842800"; d="scan'208";a="717431199"
Received: from liuzhao-optiplex-7080.sh.intel.com ([10.239.160.132])
 by FMSMGA003.fm.intel.com with ESMTP; 17 Oct 2022 02:32:19 -0700
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
Subject: [PATCH 0/9] drm/i915: Replace kmap_atomic() with kmap_local_page()
Date: Mon, 17 Oct 2022 17:37:16 +0800
Message-Id: <20221017093726.2070674-1-zhao1.liu@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 18 Oct 2022 06:35:11 +0000
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

The use of kmap_atomic() is being deprecated in favor of
kmap_local_page()[1].

In the following patches, we can convert the calls of kmap_atomic() /
kunmap_atomic() to kmap_local_page() / kunmap_local(), which can
instead do the mapping / unmapping regardless of the context.

With kmap_local_page(), the mapping is per thread, CPU local and not
globally visible.

[1]: https://lore.kernel.org/all/20220813220034.806698-1-ira.weiny@intel.com
---
Zhao Liu (9):
  drm/i915: Use kmap_local_page() in gem/i915_gem_object.c
  drm/i915: Use kmap_local_page() in gem/i915_gem_pyhs.c
  drm/i915: Use kmap_local_page() in gem/i915_gem_shmem.c
  drm/i915: Use kmap_local_page() in gem/selftests/huge_pages.c
  drm/i915: Use kmap_local_page() in gem/selftests/i915_gem_coherency.c
  drm/i915: Use kmap_local_page() in gem/selftests/i915_gem_context.c
  drm/i915: Use memcpy_from_page() in gt/uc/intel_uc_fw.c
  drm/i915: Use kmap_local_page() in i915_cmd_parser.c
  drm/i915: Use kmap_local_page() in gem/i915_gem_execbuffer.c

 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c       | 10 +++++-----
 drivers/gpu/drm/i915/gem/i915_gem_object.c           |  8 +++-----
 drivers/gpu/drm/i915/gem/i915_gem_phys.c             |  8 ++++----
 drivers/gpu/drm/i915/gem/i915_gem_shmem.c            |  6 ++++--
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c      |  6 +++---
 .../gpu/drm/i915/gem/selftests/i915_gem_coherency.c  | 12 ++++--------
 .../gpu/drm/i915/gem/selftests/i915_gem_context.c    |  8 ++++----
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c             |  5 +----
 drivers/gpu/drm/i915/i915_cmd_parser.c               |  4 ++--
 9 files changed, 30 insertions(+), 37 deletions(-)

-- 
2.34.1

