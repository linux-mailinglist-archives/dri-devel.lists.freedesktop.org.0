Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 860EC8252A8
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 12:22:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10BB110E5BA;
	Fri,  5 Jan 2024 11:22:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1747010E5BA
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 11:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704453743; x=1735989743;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fl2bJumrumpQVA5e6SrN8Uor3IDh4LptfaN7yMgu8Ds=;
 b=aeMEKUoVaju9qSW8vvgIl4F10/X1zJbGGOeuWy6C7d9zd0WUmA785X7I
 /Ng/vu5rQ4IoTiHFgtcJp8/pBIrCPoO/aY9mPR2kAQ0GI8lKI5QdX+5Cp
 FBdw5Z87VidpiNyz/tk4e7nUoS+TJiOHina7IHhZ+ZIGll1nN10BSW+WD
 +izjmnJpZRE5ffu3i/mDcLmyPUSDaH5iTKKfHEv54yncBU/FAxaC2YSMW
 Bsw34sVMGXkD0XRJTeToqVd8JS7lletrAvHL/6aHe1I/foeWrBHTtUXtm
 MXxyVcl+57sppXt3wraM6JtcYv6XFhFiLwBMyPT6DndAFAR52WUlbHWgM Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4255385"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="4255385"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 03:22:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="756918688"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="756918688"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 03:22:20 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/10] accel/ivpu fixes for 6.8
Date: Fri,  5 Jan 2024 12:22:08 +0100
Message-ID: <20240105112218.351265-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Various driver fixes:
 - Fixes for infinite loops, missing locks and DMA-API debug warnings
 - Deprecate DRM_IVPU_PARAM_CONTEXT_PRIORITY
 - Improve diagnostic messages

Jacek Lawrynowicz (5):
  accel/ivpu: Fix potential infinite loops in IRQ handlers
  accel/ivpu: Fix for missing lock around drm_gem_shmem_vmap()
  accel/ivpu: Free buffer sgt on unbind
  accel/ivpu: Disable buffer sharing among VPU contexts
  accel/ivpu: Improve buffer object debug logs

Wachowski, Karol (5):
  accel/ivpu: Dump MMU events in case of VPU boot timeout
  accel/ivpu: Call diagnose failure in ivpu_mmu_cmdq_sync()
  accel/ivpu: Add debug prints for MMU map/unmap operations
  accel/ivpu: Add diagnostic messages when VPU fails to boot or suspend
  accel/ivpu: Remove deprecated DRM_IVPU_PARAM_CONTEXT_PRIORITY

 drivers/accel/ivpu/ivpu_drv.c         |  17 +---
 drivers/accel/ivpu/ivpu_drv.h         |   2 +-
 drivers/accel/ivpu/ivpu_gem.c         | 133 +++++++++-----------------
 drivers/accel/ivpu/ivpu_gem.h         |   1 -
 drivers/accel/ivpu/ivpu_ipc.c         |   6 ++
 drivers/accel/ivpu/ivpu_job.c         |   3 +
 drivers/accel/ivpu/ivpu_mmu.c         |  29 ++++--
 drivers/accel/ivpu/ivpu_mmu.h         |   1 +
 drivers/accel/ivpu/ivpu_mmu_context.c |   9 ++
 drivers/accel/ivpu/ivpu_pm.c          |   4 +-
 include/uapi/drm/ivpu_accel.h         |  21 +++-
 11 files changed, 114 insertions(+), 112 deletions(-)

--
2.43.0
