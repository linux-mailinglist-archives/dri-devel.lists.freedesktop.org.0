Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52269B4A6A3
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 11:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8166310E23A;
	Tue,  9 Sep 2025 09:07:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="B8oCIwTM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF0ED10E23A;
 Tue,  9 Sep 2025 09:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757408829; x=1788944829;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rdNdT4h2Oc0EFRwt8g29KfZMzwaT30SW5hT7WinTgZc=;
 b=B8oCIwTMzRUf0FPyUP4hSjRMErb0kE10mrJPqFDVImKEsqIydotVbTMW
 ZfB1gdneiQUWw3S7a7D7XmEk9w/8ynTC6CWACWgMyzdevm9WOoAA/F0mM
 ApPfAU9eOXGhhqwNUhAibK+R7Z2+MM+FceiUPXO5e6iKML3qF8v1k0sdS
 ylVPU5yH5UWlJBUeXbXZEyT3uCkUB9j8Al662/oi8z/EN0kNoKFhTmY0Q
 S8lPxzriATBA1DQlzr8jvNY3ufnLWGbvAXAVHrSq+8sIlEnbtrYLv8P3a
 6J77qPEZbWRhbZwvZjObIY0Ypla5w9O35U4wBcVXkEG5EWGk8iFe/368T w==;
X-CSE-ConnectionGUID: 6R6aeuQ/TLmUSIojtiKQhQ==
X-CSE-MsgGUID: bgSlu5r9QCqsPxLUAhqrZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11547"; a="85132626"
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="85132626"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2025 02:06:54 -0700
X-CSE-ConnectionGUID: MXhyCgWXSiW/Ha1acc3yeQ==
X-CSE-MsgGUID: HPemkfdXQ6S/I13Cl3D7cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,251,1751266800"; d="scan'208";a="172628932"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa007.fm.intel.com with ESMTP; 09 Sep 2025 02:06:53 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com,
	S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH v2 0/2] drm: Add GPU frequency tracepoint
Date: Tue,  9 Sep 2025 14:29:17 +0530
Message-Id: <20250909085919.168658-1-s.sebinraj@intel.com>
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
 drivers/gpu/drm/drm_gpu_frequency_trace.h | 47 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_gpu_freq_trace.h    | 14 +++++++
 drivers/gpu/drm/xe/xe_pmu.c               | 26 ++++++++++++-
 drivers/gpu/drm/xe/xe_pmu_types.h         |  4 ++
 7 files changed, 117 insertions(+), 2 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_gpu_frequency_trace.c
 create mode 100644 drivers/gpu/drm/drm_gpu_frequency_trace.h
 create mode 100644 drivers/gpu/drm/xe/xe_gpu_freq_trace.h

-- 
2.34.1

