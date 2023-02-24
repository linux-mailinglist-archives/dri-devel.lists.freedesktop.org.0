Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 039D76A1917
	for <lists+dri-devel@lfdr.de>; Fri, 24 Feb 2023 10:52:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB1810E71E;
	Fri, 24 Feb 2023 09:52:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5917310E71E;
 Fri, 24 Feb 2023 09:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677232334; x=1708768334;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=bIauPA2cKg/fMw3M/B7+qACh9V8fm/vTQ+PmGA66mqE=;
 b=TKPqp3Pe1k1eU/AyUaZasXAcpO9Z5LX6fVR7IRWVdJlkAQcibfCdgzJJ
 y74mv9rzMEWfBqd6Hr0bewiGNndJwpCpPyCcLQcRzLSZzctIIcu8TIUkp
 Ze+tmmC7pOn7As0CuMm7G8RCW0nDyuNiQPDXwnd7fmh2LAjxMUtwfJ5zA
 18t2iAphDWnmLzhUuIlm/wcogkwa2RbR+dZ6lQvj1bPQmOzQDCfuhLWmZ
 Jm8+f5R7aHu3VDkIZKKMgHcjIlk3OYZrS44gM75uelAJZrBdXNZ6IkT6b
 In6WQhRPkq0vc93yMinYg3iBj9oFkVQi/oji4iLYgjUA+qZqdarSjDa9m g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="331174002"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; d="scan'208";a="331174002"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 01:52:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10630"; a="741612828"
X-IronPort-AV: E=Sophos;i="5.97,324,1669104000"; d="scan'208";a="741612828"
Received: from auliel-mobl1.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.64])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2023 01:52:11 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/3] drm/helpers: Make the suballocation manager drm generic
Date: Fri, 24 Feb 2023 10:51:49 +0100
Message-Id: <20230224095152.30134-1-thomas.hellstrom@linux.intel.com>
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

v4:
- Avoid 64-bit integer divisions (kernel test robot <lkp@intel.com>)
- Use size_t rather than u64 for the managed range. (Thomas)


Maarten Lankhorst (3):
  drm/suballoc: Extract amdgpu_sa.c as generic suballocation helper
  drm/amd: Convert amdgpu to use suballocation helper.
  drm/radeon: Use the drm suballocation manager implementation.

 drivers/gpu/drm/Kconfig                    |   4 +
 drivers/gpu/drm/Makefile                   |   3 +
 drivers/gpu/drm/amd/amdgpu/Kconfig         |   1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  26 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ib.c     |   5 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |  23 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.h   |   3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_sa.c     | 324 +--------------
 drivers/gpu/drm/drm_suballoc.c             | 457 +++++++++++++++++++++
 drivers/gpu/drm/radeon/Kconfig             |   1 +
 drivers/gpu/drm/radeon/radeon.h            |  55 +--
 drivers/gpu/drm/radeon/radeon_ib.c         |  12 +-
 drivers/gpu/drm/radeon/radeon_object.h     |  25 +-
 drivers/gpu/drm/radeon/radeon_sa.c         | 316 ++------------
 drivers/gpu/drm/radeon/radeon_semaphore.c  |   4 +-
 include/drm/drm_suballoc.h                 | 108 +++++
 16 files changed, 674 insertions(+), 693 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_suballoc.c
 create mode 100644 include/drm/drm_suballoc.h

-- 
2.34.1

