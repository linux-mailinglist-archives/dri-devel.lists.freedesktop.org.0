Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDDB6A0C48
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 15:54:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21FA810EBB9;
	Thu, 23 Feb 2023 14:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C7610EBB9;
 Thu, 23 Feb 2023 14:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677164091; x=1708700091;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hZfSJbmm5jOlfcIG6VH262Ny/4i0KgdnezwXIcAC41c=;
 b=NiygQPog775nsDDnN7/xcgUGGhtm/EjYlnFF8aywPZ4Nxzjri88ZHBmz
 5kvmFMDdzDw7ztdmqa0KKiRuUUvNjYTZ/eN0+4ZaFSsnQBaDYsLd/ATth
 ZyGDl6w+ujiVonaDTrECuUvQN/3W2lXbgDNfqmy2BfpAuSGqbbpWv+ZCn
 OH48rG7lDbdsR4iQ9EGWfWgO/pWkUJKMuMOf5BDwsXhzq8ALyMx8dv1W3
 KJ7JN0BwiLGDI036YIkYkKJH46PjkewAZDOjo4wLhFed70LA+0CEP82uX
 RIcft5/I12j1ryq8Fgi50PpuF4qJ/x4n9KtiY4E3JbfX+zmL9p4rALDMS A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="321392681"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; d="scan'208";a="321392681"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 06:25:57 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="622349629"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; d="scan'208";a="622349629"
Received: from skallurr-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.84])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 06:25:54 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/3] drm/helpers: Make the suballocation manager drm generic
Date: Thu, 23 Feb 2023 15:25:28 +0100
Message-Id: <20230223142531.8446-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.38.1
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>, Dave Airlie <airlied@redhat.com>,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series (or at least the suballocator helper) is a prerequisite
for the new Xe driver.

There was an unresolved issue when the series was last up for review,
and that was the per allocation aligment. Last message was from
Maarten Lankhorst arguing that the larger per-driver alignment used
would only incur a small memory cost. This new variant resolves that.

The generic suballocator has been tested with the Xe driver, and a
kunit test is under development.
The amd- and radeon adaptations are only compile-tested.

v3:
- Remove stale author information (Christian König)
- Update Radeon Kconfig (Thomas Hellström)


Maarten Lankhorst (3):
  drm/suballoc: Extract amdgpu_sa.c as generic suballocation helper
  drm/amd: Convert amdgpu to use suballocation helper.
  drm/radeon: Use the drm suballocation manager implementation.

 drivers/gpu/drm/Kconfig                    |   5 +
 drivers/gpu/drm/Makefile                   |   3 +
 drivers/gpu/drm/amd/amdgpu/Kconfig         |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c     |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c     | 324 +--------------
 drivers/gpu/drm/drm_suballoc.c             | 453 +++++++++++++++++++++
 drivers/gpu/drm/radeon/Kconfig             |   1 +
 drivers/gpu/drm/radeon/radeon.h            |  55 +--
 drivers/gpu/drm/radeon/radeon_ib.c         |  12 +-
 drivers/gpu/drm/radeon/radeon_object.h     |  25 +-
 drivers/gpu/drm/radeon/radeon_sa.c         | 316 ++------------
 drivers/gpu/drm/radeon/radeon_semaphore.c  |   4 +-
 include/drm/drm_suballoc.h                 | 106 +++++
 16 files changed, 669 insertions(+), 693 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_suballoc.c
 create mode 100644 include/drm/drm_suballoc.h

-- 
2.34.1

