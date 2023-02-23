Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 102E66A06D1
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 11:58:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1302010E050;
	Thu, 23 Feb 2023 10:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1727610E050;
 Thu, 23 Feb 2023 10:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677149907; x=1708685907;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kr4Gibachqc50LHT0/5OHvALc9AoVbDI9Bb5Gx47wNE=;
 b=ZOiXpXm8Zzoah23xY54odcC3WUOPWludeslAPqA/JbkGtoPsv7VjiHJQ
 PUdAvybyB8mjtl1woRyjL5/i4bIVQuNmSZrRkouZ5vk+hfLyDu02FNfeg
 DqPf+5DQLRLFGsHYVGb3X6ce7wKaGSJvD3+dS/xNwLFymZoEzOcLvkJy8
 L9b89MKgVa4055DDaSUMQ2X1GqitvFgoSJK+jHVOdifLCwoAUlj7qNImx
 3Pd5C+IzIiPcIuvkuz/4v88gJkQR7/j/OXG4DKodE+OBjzcUuT3631QWR
 h8G9W7wbWd8gyA0991ZuuLuCr5w6M9KcfloNMvlqZOTvNtmO8WxxOaGj7 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="395665800"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; d="scan'208";a="395665800"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 02:58:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10629"; a="741225466"
X-IronPort-AV: E=Sophos;i="5.97,320,1669104000"; d="scan'208";a="741225466"
Received: from skallurr-mobl1.ger.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.84])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2023 02:58:24 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/helpers: Make the suballocation manager drm generic
Date: Thu, 23 Feb 2023 11:57:42 +0100
Message-Id: <20230223105747.4719-1-thomas.hellstrom@linux.intel.com>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>,
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
 drivers/gpu/drm/drm_suballoc.c             | 457 +++++++++++++++++++++
 drivers/gpu/drm/radeon/radeon.h            |  55 +--
 drivers/gpu/drm/radeon/radeon_ib.c         |  12 +-
 drivers/gpu/drm/radeon/radeon_object.h     |  25 +-
 drivers/gpu/drm/radeon/radeon_sa.c         | 316 ++------------
 drivers/gpu/drm/radeon/radeon_semaphore.c  |   4 +-
 include/drm/drm_suballoc.h                 | 106 +++++
 15 files changed, 672 insertions(+), 693 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_suballoc.c
 create mode 100644 include/drm/drm_suballoc.h

-- 
2.34.1

