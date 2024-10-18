Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF7C9A48CF
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 23:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7435A10E9B6;
	Fri, 18 Oct 2024 21:16:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WnugjDr6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A628910E240;
 Fri, 18 Oct 2024 21:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729286159; x=1760822159;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=K3OcbgxR5RHVBbG4Zgwy/ZdV+lnNHeh6sB+G/KWMYQ0=;
 b=WnugjDr6YffgC/G0snEh7fyRK6l84eTCnt49/YlhqSBiMQMFGPDDvrCZ
 kPGmzI4vd2siS6uq0uk3FYzA32G+uNeq3yxixbWPOuchvTTeyQ64gPjjr
 wRgXiR6+uNEgcGCmjv0nL43mWrgFLOFEjpnEiFHWgg/y/7/w16XgDxS6X
 LwbnMvSn9oQizmGqCUZTmk/PH5gvJUKKhaf1KyZQah8d6z3gRIvwKF86g
 YuCGlOvOwCEmABhAEAzvE5j91aFHSsn2V763yftI5dYyPzXCx6GHje0N1
 6p8h+HQa0qlK5Mz5U+TJdC8wtYc2VRxhmeccCOA+F2nlUhVXO0TLK+0yM w==;
X-CSE-ConnectionGUID: oO8hIJgNT46Gt/7YaXzdSw==
X-CSE-MsgGUID: f4tkI7wMQJ2HDFLskgPbqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="46329575"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="46329575"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 14:15:58 -0700
X-CSE-ConnectionGUID: AmtwRJaKS02cxBX7Kn6ODQ==
X-CSE-MsgGUID: WNm9osK1QP6UfuAW8jgRpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; d="scan'208";a="84040226"
Received: from lstrano-desk.jf.intel.com ([10.54.39.91])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Oct 2024 14:15:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: matthew.auld@intel.com,
	thomas.hellstrom@linux.intel.com
Subject: [PATCH v2 0/3] Fix non-contiguous VRAM BO access in Xe 
Date: Fri, 18 Oct 2024 14:16:20 -0700
Message-Id: <20241018211623.1367891-1-matthew.brost@intel.com>
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

A follow up series should cleanup any remaining mapping of
non-contiguous VRAM BOs, add non-visible access support to
xe_ttm_access_memory, and warn / error on mapping a BO which cannot be
mapped.

v2:
 - Include missing local change

Matthew Brost (3):
  drm/ttm: Add ttm_bo_access
  drm/xe: Add xe_ttm_access_memory
  drm/xe: Use ttm_bo_access in xe_vm_snapshot_capture_delayed

 drivers/gpu/drm/ttm/ttm_bo_util.c | 85 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/ttm/ttm_bo_vm.c   | 65 +----------------------
 drivers/gpu/drm/xe/xe_bo.c        | 57 +++++++++++++++++++--
 drivers/gpu/drm/xe/xe_vm.c        | 18 +++----
 include/drm/ttm/ttm_bo.h          |  2 +
 5 files changed, 149 insertions(+), 78 deletions(-)

-- 
2.34.1

