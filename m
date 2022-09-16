Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD4F5BA41E
	for <lists+dri-devel@lfdr.de>; Fri, 16 Sep 2022 03:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3465510EC4E;
	Fri, 16 Sep 2022 01:47:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABAF610E36E;
 Fri, 16 Sep 2022 01:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663292838; x=1694828838;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=mBrBrNbyS9Ah/9rVXVmDV0py47/SsU6yd8AvUSy+RnY=;
 b=EGAsQ8m/R71dd31wDetdqGAY4RNEqP2Hwsvl5UAybpIf/fsZK241cJ9S
 EkBHdE4mWi0YTRtLS9gAGwocbBtm91sDTq9wbX7wchidOz4584fsUFSCL
 4E721iFs0FgSY+5voOg/Y0TD9+jj/7eoiQtcfN6lTppau5toV4lTK80YE
 W/HQmbOQIiil365fLSU04EiAp+06oVgFeBB+VkZ/bjvpzzWxDUVSg7bMC
 mxarIh7YmtvqLTcQg+1WQ5UlG5dzWOn8FsGa1a0a+NuVec67XSsJ5Eenf
 ivC8FZRwgkhwZWueQBMtykBfLoGxVNoc57/gHiDl3tPWdUQfj7Dlv0xrK g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="297609200"
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="297609200"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 18:47:18 -0700
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="613101378"
Received: from invictus.jf.intel.com ([10.165.21.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 18:47:17 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 0/3] Initial Meteorlake Support
Date: Thu, 15 Sep 2022 18:46:45 -0700
Message-Id: <20220916014648.1310346-1-radhakrishna.sripada@intel.com>
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
Handful of early enablement patches including support for
display power wells, VBT and AUX Channel mapping, PCH and
gmbus support, dbus, mbus, sagv and memory bandwidth support
got merged.

This series adds the support for a new way to read Graphics,
Media and Display versions, the way to read stepping info and
engine context layouts.

This is based out of the earlier series posted at [1]. Several
of the patches from the earlier series got merged. This version is
rebased on top of the earlier patches that got merged.

[1] https://patchwork.freedesktop.org/series/106786/



José Roberto de Souza (1):
  drm/i915: Parse and set stepping for platforms with GMD

Matt Roper (2):
  drm/i915: Read graphics/media/display arch version from hw
  drm/i915/mtl: Define engine context layouts

 drivers/gpu/drm/i915/gt/intel_gt_regs.h  |  2 +
 drivers/gpu/drm/i915/gt/intel_lrc.c      | 84 +++++++++++++++++++++++-
 drivers/gpu/drm/i915/i915_driver.c       |  3 +-
 drivers/gpu/drm/i915/i915_drv.h          |  2 +
 drivers/gpu/drm/i915/i915_pci.c          |  1 +
 drivers/gpu/drm/i915/i915_reg.h          |  7 ++
 drivers/gpu/drm/i915/intel_device_info.c | 67 ++++++++++++++++++-
 drivers/gpu/drm/i915/intel_device_info.h | 12 +++-
 drivers/gpu/drm/i915/intel_step.c        | 25 +++++++
 drivers/gpu/drm/i915/intel_step.h        | 24 ++++++-
 10 files changed, 221 insertions(+), 6 deletions(-)

-- 
2.34.1

