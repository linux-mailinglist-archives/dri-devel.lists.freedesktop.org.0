Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 793D982DA67
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 14:44:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B94C510E2D1;
	Mon, 15 Jan 2024 13:44:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C4F210E2D0
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 13:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705326278; x=1736862278;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XRhJ7Nyvd/HqBZaHUCuDCEiG1UnHszxQMMOZCvAECNU=;
 b=cNoGsVXUA4lq9TTy8CLgL3p62t3pII60mjlEXRPe/7no6QrsqLYWkc7B
 gziT5lfwovIcalUekydN5SWHOwgClAdiQSg8xUIUqjSAGfMmj1yxiK+Jw
 8orJ+SoR7dodH5DANeSy7Z41+qDVYfI3xSqxAMpU5Hz9w50I5GZyltkei
 9O31SMpuMh5z7bBHeP1AIEOcle3bLM5IQeiv4/RkixiAKCbmyEzCDgAj7
 h0irRxYvOKpGk/b8c4aa0UxDeKzYMZ4nworaUzfu63VAFDo6xLTdOlLV8
 Isoxm6pSMyFAuDeMZ/un5k2IpsqFBSbeBsZjr/nfqYUX8HzgdpN8fYvWj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="403378717"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; d="scan'208";a="403378717"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 05:44:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; d="scan'208";a="25472201"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 05:44:37 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/9] accel/ivpu fixes for 6.8
Date: Mon, 15 Jan 2024 14:44:25 +0100
Message-ID: <20240115134434.493839-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Various driver fixes:
 - Fixes for infinite loops, missing locks and DMA-API debug warnings
 - Deprecate DRM_IVPU_PARAM_CONTEXT_PRIORITY
 - Improve diagnostic messages

v2 includes changes from v1 review comments and drops IRQ infinite loop patch.

Jacek Lawrynowicz (4):
  accel/ivpu: Fix for missing lock around drm_gem_shmem_vmap()
  accel/ivpu: Free buffer sgt on unbind
  accel/ivpu: Disable buffer sharing among VPU contexts
  accel/ivpu: Improve buffer object debug logs

Wachowski, Karol (5):
  accel/ivpu: Dump MMU events in case of VPU boot timeout
  accel/ivpu: Call diagnose failure in ivpu_mmu_cmdq_sync()
  accel/ivpu: Add debug prints for MMU map/unmap operations
  accel/ivpu: Add diagnostic messages when VPU fails to boot or suspend
  accel/ivpu: Deprecate DRM_IVPU_PARAM_CONTEXT_PRIORITY param

 drivers/accel/ivpu/ivpu_drv.c         |  17 +---
 drivers/accel/ivpu/ivpu_drv.h         |   2 +-
 drivers/accel/ivpu/ivpu_gem.c         | 126 +++++++++-----------------
 drivers/accel/ivpu/ivpu_gem.h         |   1 -
 drivers/accel/ivpu/ivpu_job.c         |   3 +
 drivers/accel/ivpu/ivpu_mmu.c         |  10 ++
 drivers/accel/ivpu/ivpu_mmu.h         |   1 +
 drivers/accel/ivpu/ivpu_mmu_context.c |   9 ++
 drivers/accel/ivpu/ivpu_pm.c          |   4 +-
 include/uapi/drm/ivpu_accel.h         |  25 ++++-
 10 files changed, 96 insertions(+), 102 deletions(-)

--
2.43.0
