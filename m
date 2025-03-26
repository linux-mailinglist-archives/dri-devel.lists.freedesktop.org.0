Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBDCA7271E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 00:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B479010E79A;
	Wed, 26 Mar 2025 23:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UCbu/MyY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 636D410E14A;
 Wed, 26 Mar 2025 23:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743032419; x=1774568419;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+THRrlas5m618UQU9IJYMT2ciS/zYYQYxCk+YkySHnk=;
 b=UCbu/MyYr38uq2okf0fUW3WB834l3yn1iN3N5U/dLAoNJPWhRW7bdBr/
 whLsZC3NVRxAJ8DkEB/TYxVBP1x5Hi+1VYkmkANYLd+2Ye0imOBlOyOJp
 EYyYBxar22ouDLaY3zWpY9IM6spCJspDsOsOE2eiFDP1Dsk+ZhBEm2K65
 IUE5GXcFyak2q73mZOjav+5fZaCWomfTFvFxKT8du1zAl6JGWZ0y1lsnU
 QsxfaTtznhi9wSCpVLmV2Gr0Vm5cry6pZzjYavg1clYuLpqcB1demPc2x
 zld05nscwO1b4NeQzW+aEOa7V1F+YtSJhF/wrCmtO4B0vzCJyDA9XTPzA g==;
X-CSE-ConnectionGUID: hxzUOfV5QA68se3DR1H7Ow==
X-CSE-MsgGUID: Su0HVEuLTzKf7MYTw+Y+/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="61741374"
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="61741374"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 16:40:18 -0700
X-CSE-ConnectionGUID: lgSZHd3/R1CwALKBdgf/jA==
X-CSE-MsgGUID: MxfJOMKjTSm/w0jYnzns1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,279,1736841600"; d="scan'208";a="148143219"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.3])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2025 16:40:15 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Arshad Mehmood <arshad.mehmood@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v2 0/6] Remove I915_ENGINE_FIRST_RENDER_COMPUTE
Date: Thu, 27 Mar 2025 00:39:59 +0100
Message-ID: <20250326234005.1574688-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.47.2
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

Hi,

While testing the multi-CCS static load balancing, Arshad  
discovered that the CCS workaround was being applied twice, due  
to commit [*].

Further discussions with Lucas led to rethinking the purpose of  
I915_ENGINE_FIRST_RENDER_COMPUTE. This flag was originally  
introduced to handle platforms with different CCS/RCS setups.  
However, for all GPUs currently supported by i915, we can assume  
the presence of at least one RCS engine, so the logic can shift  
to focus on the first CCS engine.

Based on this, the six patches in this series are mostly  
cleanup, with two main goals:

 1. Ensure the CCS engine workaround is applied only once  
 2. Remove the I915_ENGINE_FIRST_RENDER_COMPUTE flag

Thanks,  
Andi

[*] 1bfc03b13752 ("drm/i915: Remove special handling for !RCS_MASK()")

Changelog:
==========
v1 -> v2
 - During workaround set-up, avoid checking for
   FIRST_RENDER_COMPUTE, but move the logic to the CCS engine
   section.
 - Define the FIRST_CCS flag which checks for the CCS engine
   with the lowest istance number.
 - Remove the I915_ENGINE_FIRST_RENDER_COMPUTE flag and use
   FIRST_CCS() instead for everyone using it.

Andi Shyti (6):
  drm/i915: Add the FIRST_CCS() helper
  drm/i915/gt: Move CCS workaround to the correct section
  drm/i915/gt: Remove FIRST_RENDER_COMPUTE in workaround
  drm/i915/gt: Check for the first CCS instead of FIRST_RENDER_COMPUTE
  drm/i915/gt/uc: Use FIRST_CCS() helper for one-time CCS operations
  drm/i915/gt: Remove unused I915_ENGINE_FIRST_RENDER_COMPUTE flag

 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  4 --
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |  3 +-
 .../drm/i915/gt/intel_execlists_submission.c  |  2 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   | 72 +++++++++----------
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  3 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  2 +-
 drivers/gpu/drm/i915/i915_drv.h               |  3 +
 7 files changed, 41 insertions(+), 48 deletions(-)

-- 
2.47.2

