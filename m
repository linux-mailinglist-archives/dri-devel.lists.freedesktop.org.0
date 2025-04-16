Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 179F2A90AEC
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 20:09:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D2E410E994;
	Wed, 16 Apr 2025 18:09:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DnYf8H4f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4634A10E994;
 Wed, 16 Apr 2025 18:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744826991; x=1776362991;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SYVirKpDgNUQSxRNKsbIwTjCLx3OIVyHDuBL6EbJhAM=;
 b=DnYf8H4fN0wLbacwQhL0sZTJ03lhpLyTp3+6U5pMc3RT4EMG871Uzn9i
 blGepVoDdH8TK2Ue9weYQKTExruZqbxaE0tJ2Y8i9PYmpbxXBGZcoRVwg
 mVwdE7I05F4uP71rHPB+zVXB3DzXg1HkDD22GRXACFP87GP4wwk0Ka3CX
 G25Xtar2YqiyKZKAvEtXEny3IX9NIYyywAAkHtX6HeB94HFuAeBPaSXN+
 DOIfvvZlJpN4aDwIbWhLR8J7iGXocXvU2oZyB6dqHaBKssJ/1gI27xzgO
 u3Xm6pft1gdVbWPlu5TsPvMTdb+9PeliklrXq8GHZChWnNBOsKnaZ+0gl g==;
X-CSE-ConnectionGUID: cxZPZtK/S7GALDCCL1C/vA==
X-CSE-MsgGUID: 1Cuc5NwVRlWkXTvLTVZsPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="63799685"
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="63799685"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 11:09:51 -0700
X-CSE-ConnectionGUID: 0mk3yj0dQW+22xDQumllXw==
X-CSE-MsgGUID: 0n9nnRdATeS+YFkg/6w32Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,216,1739865600"; d="scan'208";a="131468154"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2025 11:09:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, thomas.hellstrom@linux.intel.com,
 himal.prasad.ghimiray@intel.com
Subject: [RFC PATCH 0/4] Enable SVM atomics in Xe / GPU SVM
Date: Wed, 16 Apr 2025 11:11:03 -0700
Message-Id: <20250416181107.409538-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
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

Minimal set of patches to enable compute UMD SVM atomics.

Collaboration with Himal.

Sending as RFC to see if we should pursue merging this series ASAP, the
solution of timeslicing may not be the final solution but it is quite
simple as a stopgate / software enabling.

Matt

Himal Prasad Ghimiray (1):
  drm/gpusvm: Introduce vram_only flag for VRAM allocation

Matthew Brost (3):
  drm/xe: Strict migration policy for atomic SVM faults
  drm/xe: Timeslice GPU on atomic SVM fault
  drm/xe: Add atomic_svm_timeslice_ms debugfs entry

 drivers/gpu/drm/drm_gpusvm.c         | 14 +++++++
 drivers/gpu/drm/xe/xe_debugfs.c      | 38 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_device.c       |  1 +
 drivers/gpu/drm/xe/xe_device_types.h |  3 ++
 drivers/gpu/drm/xe/xe_svm.c          | 58 +++++++++++++++++++++-------
 drivers/gpu/drm/xe/xe_svm.h          |  5 ---
 include/drm/drm_gpusvm.h             |  7 ++++
 7 files changed, 108 insertions(+), 18 deletions(-)

-- 
2.34.1

