Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1010B2C8CA
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 17:53:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2AD089CFA;
	Tue, 19 Aug 2025 15:53:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AYOOfUUD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F6A8905A;
 Tue, 19 Aug 2025 15:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1755618823; x=1787154823;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dWgdYZm2maNhNMWZU6O5ftvpFysTJGfi04vsE2dgAcw=;
 b=AYOOfUUD7jbgB4YXJSIRo9/MD+u/WQfDdyu2RadhxpmqyHWN5iVc3Yth
 TJYg5UDX4fDfU5ZWhyZjqUoyCOVlfNLWwzC6lIhWVuvMJvyDDlOHP+dga
 NTipO0eIcflQ7QYhDlTDDBIYuMfeNbhMr4/7EQhiGaC/+mDeo7y9XqJce
 9MVGKfEXUeuiPFuy4+SsWk9nxCtrZbey84jzRH5P6zAtCvuDSfnOFoQkh
 U3giNwMzjUFIjD97UUOE3rhdT6nyeGjZ+wAXeyJol4wIqbK31Y2FO5C4x
 t/G2zQ2MHI3WHkw+OUuzEVI9OpgpLz+daV+e/5AdkMlQ4f13RPMN3KIfM Q==;
X-CSE-ConnectionGUID: 33yEoZOjRPGz7iYOClUNOw==
X-CSE-MsgGUID: qgKB8ypaQCyOrPdG4WF1/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="58015688"
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="58015688"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2025 08:53:42 -0700
X-CSE-ConnectionGUID: 4LKQuT8mTOKDY3CXbvl0hg==
X-CSE-MsgGUID: mR7qwtYvSqCG03C7BxJSSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,302,1747724400"; d="scan'208";a="167503896"
Received: from himal-super-server.iind.intel.com ([10.190.239.34])
 by orviesa009.jf.intel.com with ESMTP; 19 Aug 2025 08:53:41 -0700
From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
Subject: [PATCH 0/4] Xe-agnostic patches to support MADVISE
Date: Tue, 19 Aug 2025 21:50:54 +0530
Message-Id: <20250819162058.2777306-1-himal.prasad.ghimiray@intel.com>
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

This series contains a set of patches that modify files outside the Xe
driver to enable support for MADVISE [1] in the Xe subsystem. These
patches are being submitted for merging via drm-misc.

Once these patches are backmerged into drm-xe-next, the remaining
patches from the MADVISE [1] series will be submitted to drm-xe-next.

[1] https://patchwork.freedesktop.org/series/149550/ 

Boris Brezillon (2):
  drm/gpuvm: Pass map arguments through a struct
  drm/gpuvm: Kill drm_gpuva_init()

Himal Prasad Ghimiray (2):
  drm/gpuvm: Introduce drm_gpuvm_madvise_ops_create
  drm/gpusvm: Make drm_gpusvm_for_each_* macros public

 drivers/gpu/drm/drm_gpusvm.c           | 122 +++--------
 drivers/gpu/drm/drm_gpuvm.c            | 287 ++++++++++++++++++-------
 drivers/gpu/drm/imagination/pvr_vm.c   |  15 +-
 drivers/gpu/drm/msm/msm_gem_vma.c      |  35 ++-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  11 +-
 drivers/gpu/drm/panthor/panthor_mmu.c  |  13 +-
 drivers/gpu/drm/xe/xe_vm.c             |  13 +-
 include/drm/drm_gpusvm.h               |  70 ++++++
 include/drm/drm_gpuvm.h                |  38 ++--
 9 files changed, 393 insertions(+), 211 deletions(-)

-- 
2.34.1

