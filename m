Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFA36E4DC4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Apr 2023 17:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A740B10E1B1;
	Mon, 17 Apr 2023 15:56:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C82910E1B1;
 Mon, 17 Apr 2023 15:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681746997; x=1713282997;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NkuxtsbO+mHTdhaOMm2pYNCWI+R28ZzS3Y10doUVbdw=;
 b=foeQtA+qBp/bs/9O5AJAA+isnSAIMGEBVee23Pt+/YcaKpXhIRad8gT/
 7KZxcAfZL68S+v8B/Plvk3yIF2uR8gtfhh0+EUyVR7TVWZuDrTh4LH+ft
 NfzjAWdgrnRhXL9M/mdbmzy095LiKJFqeD3M3QtD1q2tJzf7fCjkyeAzl
 26zVDut7XwVq4MnBKrnyFZiGKNRUQLU3jp49Z3ywuMpOYqWUNSzbg26t3
 6Y8QIPehAn+7dXpzOCOw2UV12GuTZmA/mN3/1+NIyNzH+W9dr8pQkfkU9
 WgaQpnWZT7VVCwNSdOzLFUwRf8msNkuSdU60/5xi8hoOahzGXjcm3z7dt w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="372804610"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="372804610"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 08:56:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="690718267"
X-IronPort-AV: E=Sophos;i="5.99,204,1677571200"; d="scan'208";a="690718267"
Received: from gtohallo-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.232.210])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2023 08:56:22 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 0/6] fdinfo alternative memory stats proposal
Date: Mon, 17 Apr 2023 16:56:07 +0100
Message-Id: <20230417155613.4143258-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Emil Velikov <emil.l.velikov@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

As discussed in the Rob's thread here is a slightly alternative idea on what to
expose and how.

DRM core is still defining a list of common memory categories but it is now up
to drivers to fill in the data and opt into the feature.

There is also no aggregated category and memory regions are always specified in
key names.

Two driver vfuncs are added where DRM core queries the number and names of
memory regions supported by the driver instance, and second where the driver
fills in the usage statistics for centrally defined memory categories.

I think this is a more future proof option since by moving the stat filling to
drivers they are able to show not only the GEM handles but all used memory. For
instance in case of i915 we have contexts, ring buffers, status pages and page
tables all backed by GEM objects too.

It also opens up a route for reporting sub-object size backing store granularity
and allows for not traversing under the file_table lock for drivers which are
able to do it in a more light-weight manner. For the former one example could be
simply adding TTM region helpers.

Not having aggregated counters means we do not need to add a second set of keys
as soon as the first driver wants to provide a more detailed view. And userspace
can trivially aggregate itself anyway.

At the same time two trivial helpers are provided who want to show just the
basic stats.

I have also tried to preserve the drm-memory-$region naming by reserving a
special character ('^') as a suffix ie. drm-memory-$region^$category. Unless I
am missing something this should be compatible with any existing parsers which
would just see more memory regions with more specific names. And they can be
updated to support the format extension.

Series is a bit rough so for discussion only.

Rob Clark (1):
  drm: Add common fdinfo helper

Tvrtko Ursulin (5):
  drm/i915: Use the fdinfo helper
  drm: Add fdinfo memory stats
  drm: Add simple fdinfo memory helpers
  drm/msm: Add basic memory stats
  drm/i915: Implement fdinfo memory stats printing

 Documentation/gpu/drm-usage-stats.rst  |  22 +++-
 drivers/gpu/drm/drm_file.c             | 132 +++++++++++++++++++
 drivers/gpu/drm/i915/i915_driver.c     |  11 +-
 drivers/gpu/drm/i915/i915_drm_client.c | 167 +++++++++++++++++--------
 drivers/gpu/drm/i915/i915_drm_client.h |  30 ++---
 drivers/gpu/drm/i915/i915_drv.h        |   4 +-
 drivers/gpu/drm/i915/i915_gem.c        |   6 +-
 drivers/gpu/drm/msm/msm_drv.c          |   4 +
 include/drm/drm_drv.h                  |  14 +++
 include/drm/drm_file.h                 |  18 +++
 10 files changed, 324 insertions(+), 84 deletions(-)

-- 
2.37.2

