Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB136B1A17
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 04:46:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D98910E784;
	Thu,  9 Mar 2023 03:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74E010E138;
 Thu,  9 Mar 2023 03:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678333585; x=1709869585;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+Ld0ypTFpiWU31BLU4ZnwPNaCuLiZBdh/oRuI9ppKX4=;
 b=V3uktxbqn6fSLuVQcbZmFL1I8VFJLXdXBkMaYU/wDixwZb1jVsFdEduU
 xV5p8m7MgITnhrWG6r9rsDT24LLtG5MbCLgwZvXyqmuM2ItGFqP47Fo8H
 n0lkWsS9SH2hMu1YkjwCWF6Rsa4jptavVOqKgHcRIs5fNlKuxM/+ZljEn
 bwfeCWAo7NgfMhqYNiD2gE/7trlmvZ6SD0c7my51p4WKbSmFTICpHIxkt
 7QT1RSk6wCSrdKGWouR2Ea0kcrQRtiGb1NZS2i5GrG5BvnVztF6cbe7e6
 XoMDWw1WDTmXtb0JuxNt2D993qIRjiWZrr6AkV9VhENRTKe+VnruPBRFP w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="320173788"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; d="scan'208";a="320173788"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 19:46:25 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="820462272"
X-IronPort-AV: E=Sophos;i="5.98,245,1673942400"; d="scan'208";a="820462272"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 19:46:24 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/2] drm/i915/pmu: Use common freq functions with sysfs
Date: Wed,  8 Mar 2023 19:46:19 -0800
Message-Id: <20230309034621.1008458-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Badal Nilawar <badal.nilawar@intel.com>,
 dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Expose intel_rps_read_actual_frequency_fw to read the actual freq without
taking forcewake for use by PMU. The code is refactored to use a common set
of functions across sysfs and PMU. Using common functions with sysfs in PMU
solves the issues of missing support for MTL and missing support for older
generations (prior to Gen6). It also future proofs the PMU where sometimes
code has been updated for sysfs and PMU has been missed.

Ashutosh Dixit (2):
  drm/i915/pmu: Use functions common with sysfs to read actual freq
  drm/i915/pmu: Remove fallback to requested freq for SLPC

 drivers/gpu/drm/i915/gt/intel_rps.c | 46 +++++++++++++++++++----------
 drivers/gpu/drm/i915/gt/intel_rps.h |  2 +-
 drivers/gpu/drm/i915/i915_pmu.c     | 17 +++++++----
 3 files changed, 43 insertions(+), 22 deletions(-)

-- 
2.38.0

