Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2A54BAAEB
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 21:27:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38B610E790;
	Thu, 17 Feb 2022 20:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 994E510E790;
 Thu, 17 Feb 2022 20:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645129615; x=1676665615;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cF0j/5lXhE9vXYAFhoP9dnmKk1A0LC4iuoAkt+5jVCg=;
 b=WEqivElAR0hZvT1Wf82/Yq/X8c081LI9wI8QZ1jAQFEQ8yxsCm2pScy0
 d5/AWmYt9RNWAQ3HkCjiUZwGAveqV0UbtTR5uV+x4zJ5sP7QaSwVbzO1W
 xLrlRde/U3R6HaxWqvMYl9OWZ46tdKsCaee6Zh5pdzsoyvaNRx9ocCchY
 2a3UgpOUd9ON8+9ZwZI67gyV9e2bqY5FL4viocXYNbSjxVqzV2KD1M37z
 k2zsQIy6xITKGWPo+wsC6PTeNwfNbsmZ+M4zo4cnLAqPdsylQUU4vQ566
 eQIhCP9Xu3BwOa/X+aYY1wH86rwOYHBtcBwbPLFkmiMyBZUev7rtJZhR0 g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="238370943"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="238370943"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 12:26:55 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="545842090"
Received: from zlwang-mobl2.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.212.198.213])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 12:26:54 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/3] Move #define wbvind_on_all_cpus
Date: Thu, 17 Feb 2022 12:26:41 -0800
Message-Id: <20220217202644.122937-1-michael.cheng@intel.com>
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
 balasubramani.vivekanandan@intel.com, wayne.boyer@intel.com,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org, siva.mullati@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series moves the logic for wbvind_on_all_cpus to drm_cache. The logic 
changes a little here, if platform is not x86 then we throw out a warning
for when wbvind_on_all_cpus is being called. 

v2(Michael Cheng): Move and redo logic for wbvind_on_all_cpus. Also
		   add drm_cache.h where the function is being called and 
		   remove uneeded header files.

Michael Cheng (3):
  drm_cache: Add logic for wbvind_on_all_cpus
  drm/i915/gem: Remove logic for wbinvd_on_all_cpus
  drm/i915/: Add drm_cache.h

 drivers/gpu/drm/drm_cache.c                | 2 --
 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 2 +-
 drivers/gpu/drm/i915/gem/i915_gem_pm.c     | 7 +------
 drivers/gpu/drm/i915/gt/intel_ggtt.c       | 2 +-
 include/drm/drm_cache.h                    | 6 ++++++
 5 files changed, 9 insertions(+), 10 deletions(-)

-- 
2.25.1

