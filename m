Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C5754E068
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 14:01:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285DE11A49D;
	Thu, 16 Jun 2022 12:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990F611A49D;
 Thu, 16 Jun 2022 12:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655380883; x=1686916883;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=N+yKnw2EyMNCzTaUtKSIBTQTMoGLEj64MbrkdJBDv8Q=;
 b=i5xEAlHDNjbj5/s3GnAL1ijkUcqK1t4V+Kg8md/1WI/AkEy6bUWCf0Ag
 UIPM0GJmXSdSeeUITtW3uvxDiDI57VP5jFtHNJ0r68mdcy9fjnp5PmCeh
 vpuDZoM21m+VGYIuJqUEIQwWQczpD+oRcw9vFtvaMtlj+bPPbHFhDrn4j
 S0NOpDjyLuZhUFIQdwLNiU5eVK30ElHRyckejYKEtXd0o8QLXMJNIPm15
 QyZsV7a8M5Rh097+ED4KkDD3u+Tm7tlkKJwudbNG6S6u280PPcvIRFKrg
 Wk1mLvdMfVprjzHdJVujUhuASmhF15eYwEMRdE+DYlvl6CYiTeoX3MPUE Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10379"; a="343189531"
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; d="scan'208";a="343189531"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 05:01:23 -0700
X-IronPort-AV: E=Sophos;i="5.91,305,1647327600"; d="scan'208";a="713330853"
Received: from srr4-3-linux-105-anshuma1.iind.intel.com ([10.223.74.179])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2022 05:01:20 -0700
From: Anshuman Gupta <anshuman.gupta@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/9] DG2 VRAM_SR Support
Date: Thu, 16 Jun 2022 17:30:57 +0530
Message-Id: <20220616120106.24353-1-anshuman.gupta@intel.com>
X-Mailer: git-send-email 2.26.2
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
Cc: tilak.tangudu@intel.com, tvrtko.ursulin@intel.com,
 Anshuman Gupta <anshuman.gupta@intel.com>, jon.ewins@intel.com,
 badal.nilawar@intel.com, rodrigo.vivi@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series add DG2 D3Cold VRAM_SR support.

TODO: GuC Interface state save/restore on VRAM_SR entry/exit.

Anshuman Gupta (8):
  drm/i915/dgfx: OpRegion VRAM Self Refresh Support
  drm/i915/dg1: OpRegion PCON DG1 MBD config support
  drm/i915/dg2: Add DG2_NB_MBD subplatform
  drm/i915/dg2: DG2 MBD config
  drm/i915/dgfx: Add has_lmem_sr
  drm/i915/dgfx: Setup VRAM SR with D3COLD
  drm/i915/rpm: Enable D3Cold VRAM SR Support
  drm/i915/rpm: d3cold Policy

Tvrtko Ursulin (1):
  drm/i915/xehpsdv: Store lmem region in gt

 drivers/gpu/drm/i915/display/intel_opregion.c | 107 +++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_opregion.h |  17 +++
 drivers/gpu/drm/i915/gt/intel_gt.c            |   1 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |   3 +
 drivers/gpu/drm/i915/i915_driver.c            |  49 ++++++++
 drivers/gpu/drm/i915/i915_drv.h               |  20 ++++
 drivers/gpu/drm/i915/i915_params.c            |   4 +
 drivers/gpu/drm/i915/i915_params.h            |   3 +-
 drivers/gpu/drm/i915/i915_pci.c               |   2 +
 drivers/gpu/drm/i915/i915_reg.h               |   4 +
 drivers/gpu/drm/i915/intel_device_info.c      |  21 ++++
 drivers/gpu/drm/i915/intel_device_info.h      |  12 +-
 drivers/gpu/drm/i915/intel_pcode.c            |  28 +++++
 drivers/gpu/drm/i915/intel_pcode.h            |   2 +
 drivers/gpu/drm/i915/intel_pm.c               |  43 +++++++
 drivers/gpu/drm/i915/intel_pm.h               |   2 +
 drivers/gpu/drm/i915/intel_runtime_pm.c       |   3 +-
 include/drm/i915_pciids.h                     |  23 ++--
 18 files changed, 329 insertions(+), 15 deletions(-)

-- 
2.26.2

