Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C3F5470B6
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jun 2022 02:57:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A5610F240;
	Sat, 11 Jun 2022 00:57:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D81510E394;
 Sat, 11 Jun 2022 00:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654909037; x=1686445037;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=a+JEbE4CVtcmNK9rFCJqjviulkAo9lfSRJVek9XdZbI=;
 b=nGv2xiPBgvsGD/kxeRXNIcPq1vzPMRYVjEDRWlAuHqcCLBCP1g25flSf
 sqGjb9jmZIoi0xdZPzY2i+SftUaG1sl1aHespG85pcGoltym0br+UWjQ8
 CUCwN59hKmOiS0QNTLgwXaYaVz588pc3pve+JO3VIpY3gc8yMBs+4P2+W
 Jncc14MDzdqkZoylpfuMRKf6tuG+PW+T3lZC5pKc2FWq7sDj4/BE0IGYF
 qMUuNBF/Uzg1kmTU1gFa4u5YWuHq2n+ciiszV2OHKyV1w9wg4GizawGRj
 bcVl94Ji1ONxCwO8/hB496neOAvuNsurwQk+EjvzoSbQNKFx8lUAzL+iz w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10374"; a="257628002"
X-IronPort-AV: E=Sophos;i="5.91,292,1647327600"; d="scan'208";a="257628002"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 17:57:17 -0700
X-IronPort-AV: E=Sophos;i="5.91,292,1647327600"; d="scan'208";a="650121335"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2022 17:57:16 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/2] i915: Extract, polish, and document multicast handling
Date: Fri, 10 Jun 2022 17:57:09 -0700
Message-Id: <20220611005711.596098-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.3
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Multicast/replicated (MCR) registers on Intel hardware are a purely
GT-specific concept.  Rather than leaving MCR register handling spread
across several places throughout the driver (intel_uncore.c, intel_gt.c,
etc.) with confusing combinations of handler functions living in
different namespaces, let's consolidate it all into a single place
(intel_gt_mcr.c) and provide a more consistent and clearly-documented
interface for the rest of the driver to access such registers:

 * intel_gt_mcr_read -- unicast read from specific instance
 * intel_gt_mcr_read_any[_fw] -- unicast read from any non-terminated
   instance
 * intel_gt_mcr_unicast_write -- unicast write to specific instance
 * intel_gt_mcr_multicast_write[_fw] -- multicast write to all instances

Matt Roper (2):
  drm/i915/gt: Move multicast register handling to a dedicated file
  drm/i915/gt: Cleanup interface for MCR operations

 drivers/gpu/drm/i915/Makefile               |   1 +
 drivers/gpu/drm/i915/gem/i915_gem_stolen.c  |   3 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c   |  36 +-
 drivers/gpu/drm/i915/gt/intel_gt.c          | 297 +-----------
 drivers/gpu/drm/i915/gt/intel_gt.h          |  15 -
 drivers/gpu/drm/i915/gt/intel_gt_debugfs.c  |   3 +-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c      | 483 ++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_mcr.h      |  34 ++
 drivers/gpu/drm/i915/gt/intel_region_lmem.c |   5 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c |   9 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c  |   3 +-
 drivers/gpu/drm/i915/i915_drv.h             |   2 -
 drivers/gpu/drm/i915/intel_uncore.c         | 112 -----
 drivers/gpu/drm/i915/intel_uncore.h         |   8 -
 14 files changed, 551 insertions(+), 460 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_mcr.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_mcr.h

-- 
2.35.3

