Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C95A81BC9B
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 18:08:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5132A10E35F;
	Thu, 21 Dec 2023 17:08:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2617C10E11E;
 Thu, 21 Dec 2023 17:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703178527; x=1734714527;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W5+VNjZilFIVYfLWf8euKtzEVTTezNWE3hOizOpeuEg=;
 b=Q+AtO0yvM1dLiKpo5IDKgweO8HQIN72Zw3sSRqXdpXyWi7vUj3Gw2J/l
 VA+0a7bb/dMPViKiWhip/Z1drVx6FvWdcwtpgSjj9qJU+IItGBUMK4sB9
 5GF7Mg56ByWqbKeA1U0Q58IYKlK3Ym3vcW2Mdp5VSxMr7OQCNhNanJ8+2
 gO00/QrYZCsrHPgSg0HgQlCQ138VAEUFsGb79J5bAmrNEgpxG5m2yMqvq
 M8j167jDH+S8VBUN7ZBF3vGOJajQzxebvGBH4JOcEukUfH0y+dXKuOl2D
 i8lykV5NesMZPSCaOWkrbT7Bu2RsthwSppXaZZSMu5nEVr8lbAdUcLho9 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="14692301"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="14692301"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 09:08:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10931"; a="780255761"
X-IronPort-AV: E=Sophos;i="6.04,293,1695711600"; d="scan'208";a="780255761"
Received: from dgiardin-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.35.73])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Dec 2023 09:08:42 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/3] Disable dynamic load balancing and support fixed balancing
Date: Thu, 21 Dec 2023 18:08:21 +0100
Message-ID: <20231221170825.356970-1-andi.shyti@linux.intel.com>
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
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series aims to disable the CCS hardware load balancing, as recommended by
hardware directives in Wa_16016805146.

In the meantime, we need to define and support a fixed CCS mode of balancing
that can be configured by the user.

Thanks,
Andi

Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>

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
 drivers/gpu/drm/i915/gt/intel_gt_types.h    |  20 +++
 drivers/gpu/drm/i915/gt/intel_workarounds.c |   6 +
 drivers/gpu/drm/i915/i915_drv.h             |   2 +
 9 files changed, 217 insertions(+)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h

-- 
2.43.0

