Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F5B5A8868
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 23:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18F4A10E4F1;
	Wed, 31 Aug 2022 21:50:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D6A10E4F0;
 Wed, 31 Aug 2022 21:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661982631; x=1693518631;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Rfo6FsBGDqpvqum3ipZvCyq8cJc17Yf2BGwPugsHB8w=;
 b=RBmDo0qrYlqxh418dywmhqO1lWwefQ4IGrFY7N/+uiIlOGTsXMpn/gEX
 m2FrOLsUOh0td5RTiudX1NGXyxQXSiiZG5Lny25ZyptxG5d9W7QF0/3he
 hsl7h7MHzdDGrTDTscsSAWnbtkFJAnKRmYA18EEcKy6Uk4fmLmkeD1Z2A
 B7n0bpK3mBF1Lrol17mtv4zEujJqIupgXkJ+7A/oitKAglg3FdExKNS92
 GucUQloMKT0+rh3nxJArdxkMJsz7fukzfqdiwUgLoHti450erjPBGVs+z
 6X7cjtb8mp6xKUYVA/QvhXdUaQsPKrC6FNSZKKtf4tRMzLVJ0x310Vsbo g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="296833057"
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; d="scan'208";a="296833057"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 14:50:30 -0700
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; d="scan'208";a="940586203"
Received: from invictus.jf.intel.com ([10.165.21.206])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 14:50:30 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 00/11] Initial Meteorlake Support
Date: Wed, 31 Aug 2022 14:49:47 -0700
Message-Id: <20220831214958.109753-1-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The PCI Id's and platform definition are posted earlier.
This series adds handful of early enablement patches including
support for display power wells, VBT and AUX Channel mapping,
PCH and gmbus support, dbus, mbus, sagv and memory bandwidth support.

This series also add the support for a new way to read Graphics,
Media and Display versions

This is based out of the earlier series posted at [1]. Several
of the patches from the earlier series got merged. This version is
rebased on top of the earlier patches that got merged.

[1] https://patchwork.freedesktop.org/series/106786/

Imre Deak (2):
  drm/i915/mtl: Add display power wells
  drm/i915/mtl: Add DP AUX support on TypeC ports

José Roberto de Souza (1):
  drm/i915: Parse and set stepping for platforms with GMD

Madhumitha Tolakanahalli Pradeep (1):
  drm/i915/mtl: Update CHICKEN_TRANS* register addresses

Matt Roper (2):
  drm/i915: Read graphics/media/display arch version from hw
  drm/i915/mtl: Define engine context layouts

Radhakrishna Sripada (5):
  drm/i915: Move display and media IP version to runtime info
  drm/i915/mtl: Add gmbus and gpio support
  drm/i915/mtl: Obtain SAGV values from MMIO instead of GT pcode mailbox
  drm/i915/mtl: Update MBUS_DBOX credits
  drm/i915/mtl: Do not update GV point, mask value

 drivers/gpu/drm/i915/display/intel_bw.c       |  42 ++++++-
 drivers/gpu/drm/i915/display/intel_display.c  |  14 ++-
 .../i915/display/intel_display_power_map.c    | 115 +++++++++++++++++-
 .../i915/display/intel_display_power_well.c   |  44 +++++++
 .../i915/display/intel_display_power_well.h   |   4 +
 drivers/gpu/drm/i915/display/intel_dp_aux.c   |  53 +++++++-
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   5 +-
 drivers/gpu/drm/i915/display/intel_gmbus.c    |  15 +++
 drivers/gpu/drm/i915/display/intel_gmbus.h    |   1 +
 drivers/gpu/drm/i915/display/intel_psr.c      |   6 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   2 +
 drivers/gpu/drm/i915/gt/intel_lrc.c           |  81 +++++++++++-
 drivers/gpu/drm/i915/i915_driver.c            |   2 +
 drivers/gpu/drm/i915/i915_drv.h               |  10 +-
 drivers/gpu/drm/i915/i915_pci.c               |  21 ++--
 drivers/gpu/drm/i915/i915_reg.h               |  83 ++++++++++++-
 drivers/gpu/drm/i915/intel_device_info.c      |  85 ++++++++++++-
 drivers/gpu/drm/i915/intel_device_info.h      |  18 ++-
 drivers/gpu/drm/i915/intel_dram.c             |  41 ++++++-
 drivers/gpu/drm/i915/intel_pm.c               |  73 ++++++++++-
 drivers/gpu/drm/i915/intel_step.c             |  60 +++++++++
 21 files changed, 723 insertions(+), 52 deletions(-)

-- 
2.25.1

