Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA65B7D7D3
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 14:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46B5C10E185;
	Wed, 17 Sep 2025 08:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jFgzTQyS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD8E710E01F;
 Wed, 17 Sep 2025 08:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758099008; x=1789635008;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3eLHHGbA5sIRLYXgVB83DdiagFaJbLkZaJgAsc3v5+I=;
 b=jFgzTQySjXPFVL3BHggYfJhmeHX8/YvwHW1xWfGp4LUf8hijLwq+eLyD
 M3GOpXMsHCIGLLuj3MrvptZmA58AuB1nzIH5uSP3/rtzWkNi0/a2fv3Zm
 AzyW3A9JpJdlv8sRrmcrfoA9LfsbcsO4ZgIe/AWGG5hh2/UDTcZituOev
 3NZlmgUYzjMzBwb3Nz+SsfzTr17FIbdDMa3yt4JicQFKz5GckAZO8Axfg
 4uemT+X8Wora3OjQsITqeH4b29YR6Ajh9aEB+eWpgvSIt4x8VQKYw8t8/
 ttS3rtRcxN3jv+zenCuFqSEvu35/p8OGkS23X/gzHUbethaIQ7x8pNzB+ w==;
X-CSE-ConnectionGUID: 3Vpgd16vRV+oHv6/GHzZ6A==
X-CSE-MsgGUID: 2NPJvwcoTSepomjhieB/bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60316051"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="60316051"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 01:50:08 -0700
X-CSE-ConnectionGUID: EqYea4/wRJ+n5Ba7eg1sPw==
X-CSE-MsgGUID: L47Xnwa7Q3SZJPfqzKqatw==
X-ExtLoop1: 1
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa003.fm.intel.com with ESMTP; 17 Sep 2025 01:50:05 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com,
	S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH v4 0/2] drm: Add GPU frequency tracepoint
Date: Wed, 17 Sep 2025 14:11:33 +0530
Message-Id: <20250917084135.2049550-1-s.sebinraj@intel.com>
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

Add a GPU frequency tracepoint at the DRM subsystem level.
Integrates with the Xe PMU to provide frequency tracing.

The tracepoint is exposed at:
 /sys/kernel/debug/tracing/events/power/gpu_frequency

 Format: {unsigned int state, unsigned int gpu_id}
 - state: GPU frequency in KHz
 - gpu_id: GPU clock domain identifier

S Sebinraj (2):
  drm: Add GPU frequency tracepoint at DRM level
  drm/xe: Add DRM GPU frequency tracepoint to Xe

 drivers/gpu/drm/Kconfig                   | 11 ++++++
 drivers/gpu/drm/Makefile                  |  1 +
 drivers/gpu/drm/drm_gpu_frequency_trace.c | 16 ++++++++
 drivers/gpu/drm/xe/xe_gpu_freq_trace.h    | 14 +++++++
 drivers/gpu/drm/xe/xe_pmu.c               | 26 ++++++++++++-
 drivers/gpu/drm/xe/xe_pmu_types.h         |  4 ++
 include/drm/drm_gpu_frequency_trace.h     | 47 +++++++++++++++++++++++
 7 files changed, 117 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_gpu_frequency_trace.c
 create mode 100644 drivers/gpu/drm/xe/xe_gpu_freq_trace.h
 create mode 100644 include/drm/drm_gpu_frequency_trace.h

-- 
2.34.1

