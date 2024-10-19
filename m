Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A977A9A5074
	for <lists+dri-devel@lfdr.de>; Sat, 19 Oct 2024 21:20:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0400510E3B3;
	Sat, 19 Oct 2024 19:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AHL0VLK8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F14410E3AC;
 Sat, 19 Oct 2024 19:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729365605; x=1760901605;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LOHJOKRWPS3t1F9n+yHh2x06fh1KPzPpyWRlnRzLJMs=;
 b=AHL0VLK8DdbYLDgEQDI+D5AxWoz4eCr4Op58a1W0O68vgupHbl8xMrZo
 RoYSGWdvcVLOKweTDaQqwga4Hiso/6sdpAA2YmRIrfTAr6qcxKiqwf1K+
 ORZTaVEAY1G/9JJ32j2nfcMaRrASl7gK69spCd4Ezx/8xJkcJYfJk13sj
 ODJoxCajdnEWp1zu62RzyZOnAFvhoupBo9pa0BIdugZBHyNY4YSNlNQzX
 O1dhrUBDRYZPInqpzu/Po1qh6JgaGPRD6ZOUIVH8zsnHPBPkwdMr05B55
 ++LWNRjFtchkla1nr+hCEiyZS1R8IE84ASwz46vcZXl0dpfcKhNwAccwh w==;
X-CSE-ConnectionGUID: 1iP5GXkCQCaNKtn//ehm3w==
X-CSE-MsgGUID: r9v8EJ1hQNO+qgnKi6V+oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="28978583"
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; d="scan'208";a="28978583"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2024 12:20:05 -0700
X-CSE-ConnectionGUID: MDtGnLFXTj2iP9eOOCvQBA==
X-CSE-MsgGUID: qMIUd6iWS6WKq/4tZPSOAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,217,1725346800"; d="scan'208";a="84212393"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2024 12:20:05 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v3 0/6] Fix non-contiguous VRAM BO access in Xe 
Date: Sat, 19 Oct 2024 12:20:24 -0700
Message-Id: <20241019192030.1505020-1-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mapping a non-contiguous VRAM BO doesn't work, start to fix this.

v2:
 - Include missing local change
v3:
 - Use GPU for non-visible access
 - Take PM ref in xe_ttm_access_memory
 - Disable VMAP for non-contiguous BOs

Matthew Brost (6):
  drm/ttm: Add ttm_bo_access
  drm/xe: Add xe_ttm_access_memory
  drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access
  drm/xe: Use ttm_bo_access in xe_vm_snapshot_capture_delayed
  drm/xe: Set XE_BO_FLAG_PINNED in migrate selftest BOs
  drm/xe: Only allow contiguous BOs to use xe_bo_vmap

 drivers/gpu/drm/ttm/ttm_bo_util.c     |  86 +++++++++
 drivers/gpu/drm/ttm/ttm_bo_vm.c       |  65 +------
 drivers/gpu/drm/xe/tests/xe_migrate.c |  13 +-
 drivers/gpu/drm/xe/xe_bo.c            |  95 +++++++--
 drivers/gpu/drm/xe/xe_migrate.c       | 267 ++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_migrate.h       |   4 +
 drivers/gpu/drm/xe/xe_vm.c            |  17 +-
 include/drm/ttm/ttm_bo.h              |   2 +
 8 files changed, 458 insertions(+), 91 deletions(-)

-- 
2.34.1

