Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E96944C001C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 18:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F2E810EB7A;
	Tue, 22 Feb 2022 17:26:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D03E10EB7A;
 Tue, 22 Feb 2022 17:26:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645550814; x=1677086814;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EJ5+nS7EI7LPUzEtZGqTKGsQwtmxQSSrvzbu8G+yjZM=;
 b=Pkn32c8Iy9a5QGGJAlzN8qOMRzs478j/HfF+AH+Ncs10GtesKVQieA05
 Qpfd5HNApJqEtKVkd322H9KlNpFVALzSwWtUKcNnZTB9/bZT2B0Xg49+c
 zUh090AUH1qQRYBxBSGN5npZVosBcKSdt8+AfeNZMZgZBNBBLuRc9xGo9
 R1qOVwWKFI/G1k8CPhFto1MDwro+Hu1DW8My7RtcH/fyLZhnpa72BzKzx
 YqBCo2GeN0MtlJFsy2xFlAMygnzYNLqZA2qTwQR1nLPe+VZSjaI6lmzEC
 n0SnknvlmamlvJ6CkyyStWp3+NmDJVn+qQxUM1Va/whUd6DkUmazIF7YT A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="231736910"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="231736910"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 09:26:53 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="683594302"
Received: from shreyasj-mobl1.amr.corp.intel.com (HELO
 mvcheng-desk2.intel.com) ([10.209.93.217])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 09:26:53 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 0/3] Move #define wbvind_on_all_cpus
Date: Tue, 22 Feb 2022 09:26:46 -0800
Message-Id: <20220222172649.331661-1-michael.cheng@intel.com>
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series moves the logic for wbvind_on_all_cpus to drm_cache. The logic
changes a little here, if platform is not x86 then we throw out a warning
for when wbvind_on_all_cpus is being called.

v2(Michael Cheng): Move and redo logic for wbvind_on_all_cpus. Also
		   add drm_cache.h where the function is being called and
		   remove uneeded header files.

v3(Michael Cheng): Updated commit messages.

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

