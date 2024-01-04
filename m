Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4DE58243E4
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 15:36:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6416510E47A;
	Thu,  4 Jan 2024 14:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A1E010E47A;
 Thu,  4 Jan 2024 14:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704378967; x=1735914967;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=5+UHPV7999STMPjRD2aRmtPgpDFxie2Y+EUIctfclmw=;
 b=KUrgDk8BrN93CLCB4cP9UuDQkhcNizzj8MUFSzBByLwUI915RR6oD716
 FNpvPOF8uujY5KlMgqEIRj2U1/ll59XBjMiZWYu12YkdC/cxZhv3uqPH1
 47z3nyoGv8CFlwULYMU0SSbTfgtugyhYC+7/fqTlvwGeu2MJZlBC9RAt4
 gQTp6YNleGOjcrRg0jScLK7Ehj6tDv190Wy0BEgP+HiM+oZHF10olQTZ+
 7HBdApMvMir79DrbW3nTvviVAH7666acTYe/4d13rOk5bQzbqv/FymtwM
 CPJw3AKI2/VqRfPr5xbzuLSorRBtnuK0vmaAySM71cO7lJXwmqkf1XLeh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4617869"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; 
   d="scan'208";a="4617869"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 06:36:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="899313520"
X-IronPort-AV: E=Sophos;i="6.04,330,1695711600"; d="scan'208";a="899313520"
Received: from unknown (HELO intel.com) ([10.252.52.99])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 06:36:04 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 0/3] Disable dynamic load balancing and support fixed
 balancing
Date: Thu,  4 Jan 2024 15:35:54 +0100
Message-ID: <20240104143558.193694-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series aims to disable the CCS hardware load balancing, as recommended by
hardware directives in Wa_16016805146.

In the meantime, we need to define and support a fixed CCS mode of balancing
that can be configured by the user.

Thanks,
Andi

Changelog:
==========
v1 -> v2:
 - update comment about how the user sets the ccs mode.

Andi Shyti (3):
  drm/i915/gt: Support fixed CCS mode
  drm/i915/gt: Allow user to set up the CSS mode
  drm/i915/gt: Disable HW load balancing for CCS

 drivers/gpu/drm/i915/Makefile               |   1 +
 drivers/gpu/drm/i915/gt/intel_gt.c          |   6 +
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c | 149 ++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h |  17 +++
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  14 ++
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c    |   2 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h    |  19 +++
 drivers/gpu/drm/i915/gt/intel_workarounds.c |   6 +
 drivers/gpu/drm/i915/i915_drv.h             |   2 +
 9 files changed, 216 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h

-- 
2.43.0

