Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E81F14A9D0C
	for <lists+dri-devel@lfdr.de>; Fri,  4 Feb 2022 17:37:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0886E10EDFD;
	Fri,  4 Feb 2022 16:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33BFA10E2DB;
 Fri,  4 Feb 2022 16:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643992641; x=1675528641;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fkpsUHodtIuBddCwUeraCqIaWiW/fdFjL2mps5Mw6oM=;
 b=VxGDvdjLQmqnBUGm4MGzCFRG8STf+j86MpX7wj908/R27kCrvytxUjH3
 N5VKNRd1tmrwSD9dF7BdhpUDnSbgmkGKgE/K5954cPlNHO5oND0HkGrJa
 SystRkE0Sex2k1ui0WwKD5LU8Xd0IER5cfYw6YqsOSeG4HaWSRl3TxYJQ
 rmcQQ5scBTHxlZznq7+OaRokG69kjdSMmwgR1ZGgKJ7MFUKxAhMcgkre6
 x4f8FBVGl8p2Wy09FaYVfOzuf4pgwiLe4giopODhdY/N2qVUWkwQDGaHd
 yvA+4ezbvhX6R9LJy+/6rTJm07UKzx02w22lm4S+yzFbCACX3S/gmb4dr w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10247"; a="272898336"
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="272898336"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 08:37:19 -0800
X-IronPort-AV: E=Sophos;i="5.88,343,1635231600"; d="scan'208";a="699724220"
Received: from pwaterl-mobl1.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.212.197.34])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2022 08:37:18 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 0/5] Use drm_clflush* instead of clflush
Date: Fri,  4 Feb 2022 08:37:06 -0800
Message-Id: <20220204163711.439403-1-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: tvrtko.ursulin@linux.intel.com, michael.cheng@intel.com,
 wayne.boyer@intel.com, casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series re-work a few i915 functions to use drm_clflush_virt_range
instead of calling clflush or clflushopt directly. This will prevent errors
when building for non-x86 architectures.

v2: s/PAGE_SIZE/sizeof(value) for Re-work intel_write_status_page and added
more patches to convert additional clflush/clflushopt to use drm_clflush*.
(Michael Cheng)

v3: Drop invalidate_csb_entries and directly invoke drm_clflush_virt_ran

v4: Remove extra memory barriers 

v5: s/cache_clflush_range/drm_clflush_virt_range

Michael Cheng (5):
  drm/i915/gt: Re-work intel_write_status_page
  drm/i915/gt: Drop invalidate_csb_entries
  drm/i915/gt: Re-work reset_csb
  drm/i915/: Re-work clflush_write32
  drm/i915/gt: replace cache_clflush_range

 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  8 +++-----
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 12 ++++++------
 drivers/gpu/drm/i915/gt/intel_engine.h        | 13 ++++---------
 .../drm/i915/gt/intel_execlists_submission.c  | 19 ++++++-------------
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  2 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  2 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  2 +-
 7 files changed, 22 insertions(+), 36 deletions(-)

-- 
2.25.1

