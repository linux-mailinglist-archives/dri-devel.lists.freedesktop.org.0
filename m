Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FB7691F87
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 14:07:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 747D410E1D1;
	Fri, 10 Feb 2023 13:07:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 380C010E135;
 Fri, 10 Feb 2023 13:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676034419; x=1707570419;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8r+mYZOAihbnuMBZ+j/sDZbLGv/pMCA/x+B9AvKU1YQ=;
 b=LECcmOzmWNyvPhN1shtaygt+CUPxFTWhq9p0SDDfjvcgUyWmc6l3SNtQ
 d4nSc0RbBUwph+5HFKiAyFgoobfZF3eGJpWA2ZfQk954w1ZiwF5G3LhzT
 x5xKH7+y9VJUcCt3n5l+ejSK74fIOHlp7S6TswFpor/GdAxI7urHQsuvZ
 d0qaqe4JEiUNmsQ0QPznpkjAIXo1e/wigx6hGV9XXFVrX726sXuoozsyZ
 gRpQhRnT206H/HXfPz9mcTtitUGrOfRn3EAx+1IGczfeSvJOObL527ln7
 x16ZehjLp+fq7xQpmzYMnqBv6wTWyfvmZBjJO+VXlE6KBdqvLXphRvowj w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="329045869"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; d="scan'208";a="329045869"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2023 05:06:58 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10616"; a="731711280"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; d="scan'208";a="731711280"
Received: from athornbe-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.209.249])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2023 05:06:56 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC v2 0/5] Waitboost drm syncobj waits
Date: Fri, 10 Feb 2023 13:06:42 +0000
Message-Id: <20230210130647.580135-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

In i915 we have this concept of "wait boosting" where we give a priority boost
for instance to fences which are actively waited upon from userspace. This has
it's pros and cons and can certainly be discussed at lenght. However fact is
some workloads really like it.

Problem is that with the arrival of drm syncobj and a new userspace waiting
entry point it added, the waitboost mechanism was bypassed. Hence I cooked up
this mini series really (really) quickly to see if some discussion can be had.

It adds a concept of "wait count" to dma fence, which is incremented for every
explicit dma_fence_enable_sw_signaling and dma_fence_add_wait_callback (like
dma_fence_add_callback but from explicit/userspace wait paths).

Individual drivers can then inspect this via dma_fence_wait_count() and decide
to wait boost the waits on such fences.

Again, quickly put together and smoke tested only - no guarantees whatsoever and
I will rely on interested parties to test and report if it even works or how
well.

v2:
 * Small fixups based on CI feedback:
    * Handle decrement correctly for already signalled case while adding callback.
    * Remove i915 assert which was making sure struct i915_request does not grow.
 * Split out the i915 patch into three separate functional changes.

Tvrtko Ursulin (5):
  dma-fence: Track explicit waiters
  drm/syncobj: Mark syncobj waits as external waiters
  drm/i915: Waitboost external waits
  drm/i915: Mark waits as explicit
  drm/i915: Wait boost requests waited upon by others

 drivers/dma-buf/dma-fence.c               | 102 ++++++++++++++++------
 drivers/gpu/drm/drm_syncobj.c             |   6 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c |   1 -
 drivers/gpu/drm/i915/i915_request.c       |  13 ++-
 include/linux/dma-fence.h                 |  14 +++
 5 files changed, 101 insertions(+), 35 deletions(-)

-- 
2.34.1

