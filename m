Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5E39521B7
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 20:00:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E90B10E504;
	Wed, 14 Aug 2024 18:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NxvMf9VH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8C310E503;
 Wed, 14 Aug 2024 18:00:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723658432; x=1755194432;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wbgiF+3EY7Or2yxgEmf/RJf/4YeTUERZjZoktVcB+zk=;
 b=NxvMf9VH8ON0w/bYsUE1mdYHneguQwdxSm/aQj54HCuiZXNh7dKCxjF3
 0KXMJ3QA3tEQLL4JgMlsi0MBUaAIp6cPMjj0AJ/ycSXEgTnnbuDEW6Dyu
 NZuXIoB+BMguISoyEsrNWYs2BhaNj2TwXnQv1scnFN08Z3WofP0HRV7zP
 UW1x+yZTNq5iHwtgKGP0tXPbSStbJgWwjco17VdgSMkPjbZcbIJk/hYap
 cuIhBO6G2lH6ga1h5TuskOqU43xlchImQux11tpISwWCmDj7TKs3p3y6Y
 9gEsUKXb3niSD7x+/iV9+lYiD8sjS4O6lgr0sDTkC7U251sgPP/Or4mcw Q==;
X-CSE-ConnectionGUID: vIUJ4HzgTWy7CSbZJlZAkg==
X-CSE-MsgGUID: H7gS8Z4ZRpaFNNuJgpelrw==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="24798384"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="24798384"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 11:00:32 -0700
X-CSE-ConnectionGUID: HaupHYbHS6WqtRrBES/law==
X-CSE-MsgGUID: cIz2i2O9RPKJF5Y5724nFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; d="scan'208";a="82309652"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.112])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Aug 2024 11:00:30 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH] drm/i915/gem: Remove unnecessary cast
Date: Wed, 14 Aug 2024 19:59:47 +0200
Message-ID: <20240814175947.169590-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The cast from "long" to "unsigned long" is unnecessary. Remove
it.

In this case, the variables "start" and "end" are of type long
because they need to account for the possibility of negative
values. However, they are subsequently moved to "unsigned long"
since addresses are typically handled as unsigned values.

Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
index e9b2424156f0..80528ba90a56 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
@@ -323,8 +323,8 @@ static void set_address_limits(struct vm_area_struct *area,
 	end = min_t(long, end, vm_end);
 
 	/* Let's move back into the "<< PAGE_SHIFT" domain */
-	*start_vaddr = (unsigned long)start << PAGE_SHIFT;
-	*end_vaddr = (unsigned long)end << PAGE_SHIFT;
+	*start_vaddr = start << PAGE_SHIFT;
+	*end_vaddr = end << PAGE_SHIFT;
 
 	*pfn = (gmadr_start + i915_ggtt_offset(vma)) >> PAGE_SHIFT;
 	*pfn += (*start_vaddr - area->vm_start) >> PAGE_SHIFT;
-- 
2.45.2

