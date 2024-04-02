Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E79808950C1
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 12:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D0610FC48;
	Tue,  2 Apr 2024 10:50:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bEot5O2l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5319410FC48
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 10:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712055006; x=1743591006;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=41xlLdsYKFqlT/9lvwmmgXlP1pAAZ603JW5lmUCcUTs=;
 b=bEot5O2lrX8r53yMR8vBWdw7AgDBZ/ZT2EGuCjW85aQbNr+fMmEmH+ga
 RO4cQVEmn1eolnHWkTcsS1NQBbT5/BSOOFh5q6Veb7ZGdUy+CDgvDcMYe
 dmj4DcHlJU72thRPSqa82ATjyF0JaWLhX8IY468C5jZbrTlzso4K9TjYW
 VQ8hTS8Ru+vRJETp0s/xHZfj73l8112cZoQf8NQ0USf4UbDODsln5jrs4
 d1q+mhpBOQyTUsmDMYBI0h4GmBTWIb68SmHrOSsgiw4OX+3Mg0F2QrQFR
 e5VJ9/Z27M8OLOf5Vpe/UME22UzhjbPxdcsXlP6cZBQ1VH4wpIZpjMvC7 Q==;
X-CSE-ConnectionGUID: yv/slODKTBW5egiApC7ecA==
X-CSE-MsgGUID: p3bqkC19RMaqdaxBOtdoHg==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="17944401"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="17944401"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 03:50:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="18002478"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 03:50:04 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 0/8] accel/ivpu: Fixes for 6.9-rc3
Date: Tue,  2 Apr 2024 12:49:21 +0200
Message-ID: <20240402104929.941186-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A couple of small stability fixes, one UAPI fix and some error message fixes.

Jacek Lawrynowicz (5):
  accel/ivpu: Remove d3hot_after_power_off WA
  accel/ivpu: Put NPU back to D3hot after failed resume
  accel/ivpu: Return max freq for DRM_IVPU_PARAM_CORE_CLOCK_RATE
  accel/ivpu: Fix missed error message after VPU rename
  accel/ivpu: Fix deadlock in context_xa

Wachowski, Karol (3):
  accel/ivpu: Check return code of ipc->lock init
  accel/ivpu: Fix PCI D0 state entry in resume
  accel/ivpu: Improve clarity of MMU error messages

 drivers/accel/ivpu/ivpu_drv.c     | 40 ++++++++++---------------------
 drivers/accel/ivpu/ivpu_drv.h     |  3 +--
 drivers/accel/ivpu/ivpu_hw.h      |  6 +++++
 drivers/accel/ivpu/ivpu_hw_37xx.c | 11 ++++-----
 drivers/accel/ivpu/ivpu_hw_40xx.c |  6 +++++
 drivers/accel/ivpu/ivpu_ipc.c     |  8 +++++--
 drivers/accel/ivpu/ivpu_mmu.c     |  8 +++----
 drivers/accel/ivpu/ivpu_pm.c      | 14 +++++------
 8 files changed, 46 insertions(+), 50 deletions(-)

--
2.43.2
