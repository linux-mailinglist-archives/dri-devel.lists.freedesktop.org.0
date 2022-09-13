Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 884595B79A6
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 20:35:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD37B10E1C0;
	Tue, 13 Sep 2022 18:34:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B86810E0C3;
 Tue, 13 Sep 2022 18:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663094058; x=1694630058;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IvVap7bBDzaqZ+poA3+C+1MyCLbNWwwODXTVsPb8WDM=;
 b=BjAHj5pH9qu6H6Nzm/8jc31AwkxUcok9qJcviuCVnnn0Au1EDV/b56QR
 QbIJrILr9KI+tXG8l0uC/mPfT7FMyHYFQ//zslZ0f1ID3mu7GRV8WOXSz
 922LTvj62TeSB/JLhBmF6+bl8/zwPtikDInz1iR928wJcR5qEAqSELmsh
 MudNNS1Ct6V4TJLbkVpvykOfkuCfVO+LxMJO0mFa2V5cJw935Bh5M+gQs
 dipQbKL6b3NJZtOVRfnQL6+f60Zj+dnBXpZk3snqp2rhH5lBQzc+5C8xx
 SKK5YzeqM4IzLQxjmF8gFg/1HDHvBBTBOYN7ImCDG8HMH3aNDICg1T/OR w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="281235520"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="281235520"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 11:34:17 -0700
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="647045100"
Received: from invictus.jf.intel.com ([10.165.21.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 11:34:17 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 0/5] Initial Meteorlake Support
Date: Tue, 13 Sep 2022 11:33:36 -0700
Message-Id: <20220913183341.908028-1-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
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


José Roberto de Souza (1):
  drm/i915: Parse and set stepping for platforms with GMD

Madhumitha Tolakanahalli Pradeep (1):
  drm/i915/mtl: Update CHICKEN_TRANS* register addresses

Matt Roper (2):
  drm/i915: Read graphics/media/display arch version from hw
  drm/i915/mtl: Define engine context layouts

Radhakrishna Sripada (1):
  drm/i915/mtl: Update MBUS_DBOX credits

 drivers/gpu/drm/i915/display/intel_display.c | 14 +++-
 drivers/gpu/drm/i915/display/intel_dp_mst.c  |  5 +-
 drivers/gpu/drm/i915/display/skl_watermark.c | 48 ++++++++++--
 drivers/gpu/drm/i915/gt/intel_gt_regs.h      |  2 +
 drivers/gpu/drm/i915/gt/intel_lrc.c          | 82 +++++++++++++++++++-
 drivers/gpu/drm/i915/i915_driver.c           |  3 +-
 drivers/gpu/drm/i915/i915_drv.h              |  2 +
 drivers/gpu/drm/i915/i915_pci.c              |  1 +
 drivers/gpu/drm/i915/i915_reg.h              | 18 +++++
 drivers/gpu/drm/i915/intel_device_info.c     | 74 +++++++++++++++++-
 drivers/gpu/drm/i915/intel_device_info.h     | 12 ++-
 drivers/gpu/drm/i915/intel_step.c            | 60 ++++++++++++++
 12 files changed, 306 insertions(+), 15 deletions(-)

-- 
2.34.1

