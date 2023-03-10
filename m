Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B6686B3366
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 01:59:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED6D110E90F;
	Fri, 10 Mar 2023 00:59:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E980510E909;
 Fri, 10 Mar 2023 00:59:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678409988; x=1709945988;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4i+CbRf17pj+9JbPiILrT7Y7i+TV1Tz1B85E68hysjk=;
 b=MV8NNxkipUFbc4pgcaQx92BBtfbf8XU0g66exglxLn47pa+MJ+Jem3mE
 DIhxkk9cDBBP7RVqVMUcH45lDjg7SMrc3CynDV4Dsvp9LryMCo6Ej8jM5
 X6EGnOy8iU+Wxo9eW8M4RNe4G2fEPxEfbMZcFBIzBaHDUHrRynSNnVCJ4
 zqUYPTCQk/auq9gAO8PV2VOdE948rcZV7WwtDstl7HMgJD5fruUpbauZb
 jnMD93/uQUUGIEgL2VO413+p4A+i1TjBWDwFNAfuv5G8FzgPLQOHIfrje
 u3vIe4VqbPVIU5+ctcrDTfIgQDjlT4XHRH6xq6mVmlnkcRiQq5T8bGBE6 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="324964506"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; d="scan'208";a="324964506"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 16:59:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="677616397"
X-IronPort-AV: E=Sophos;i="5.98,248,1673942400"; d="scan'208";a="677616397"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 16:59:47 -0800
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/2] drm/i915/pmu: Use common freq functions with sysfs
Date: Thu,  9 Mar 2023 16:59:41 -0800
Message-Id: <20230310005943.1029333-1-ashutosh.dixit@intel.com>
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

 drivers/gpu/drm/i915/gt/intel_rps.c | 34 ++++++++++++++++-------------
 drivers/gpu/drm/i915/gt/intel_rps.h |  2 +-
 drivers/gpu/drm/i915/i915_pmu.c     | 17 ++++++++++-----
 3 files changed, 31 insertions(+), 22 deletions(-)

-- 
2.38.0

