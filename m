Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBCF4DEA73
	for <lists+dri-devel@lfdr.de>; Sat, 19 Mar 2022 20:42:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE3AA10E2E8;
	Sat, 19 Mar 2022 19:42:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DD7910E2E8;
 Sat, 19 Mar 2022 19:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647718952; x=1679254952;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=R1QXbdRGuzhVOgqDzwsQWxTWBpTUv9KJtZ48CgUTZk4=;
 b=KE/SzViGHgLsi8/hK9XdyHpS0f7IxF+Mw5PChCM8P+dwZeyx8cVM74G7
 b4EivPfjctQbqdlT7blxxsetPGmFOuYtYkVkgj4hmQ28XNiWLfBNbkr35
 Wd8BRgCwafqFvbS9dgjgCjpUve/XEamJbQ6N9QyYlQOoqfK5Uv58pcIdV
 doAYPAmXZkCz+PCvMTYAxQBdZ625mdO8IJ8FtQ3FNIbbRbinEGb+m1XgZ
 1CIQlQ8EavxYLkF6Jgj780I80dAlz818Yz0GcRJb5neR7QOiOAFADEvC7
 Psu8wteM+FVbaKjEiXxM1+NCfd34ICKw5+ebIak9266vRa/WBITsMUfXf Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10291"; a="282145180"
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; d="scan'208";a="282145180"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2022 12:42:31 -0700
X-IronPort-AV: E=Sophos;i="5.90,195,1643702400"; d="scan'208";a="600019671"
Received: from jpulito-mobl2.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.255.231.61])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2022 12:42:31 -0700
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/4] Drop wbinvd_on_all_cpus usage 
Date: Sat, 19 Mar 2022 12:42:23 -0700
Message-Id: <20220319194227.297639-1-michael.cheng@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, thomas.hellstrom@linux.intel.com,
 michael.cheng@intel.com, wayne.boyer@intel.com, daniel.vetter@ffwll.ch,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

To align with the discussion in [1][2], this patch series drops all usage of
wbvind_on_all_cpus within i915 by either replacing the call with certain
drm clflush helpers, or reverting to a previous logic.

[1]. https://lists.freedesktop.org/archives/dri-devel/2021-November/330928.html
[2]. https://patchwork.freedesktop.org/patch/475752/?series=99991&rev=5

Michael Cheng (4):
  i915/gem: drop wbinvd_on_all_cpus usage
  Revert "drm/i915/gem: Almagamate clflushes on suspend"
  i915/gem: Revert i915_gem_freeze to previous logic
  drm/i915/gt: Revert ggtt_resume to previous logic

 drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c |  9 +---
 drivers/gpu/drm/i915/gem/i915_gem_pm.c     | 56 ++++++++++++++--------
 drivers/gpu/drm/i915/gt/intel_ggtt.c       | 17 +++----
 drivers/gpu/drm/i915/gt/intel_gtt.h        |  2 +-
 4 files changed, 46 insertions(+), 38 deletions(-)

-- 
2.25.1

