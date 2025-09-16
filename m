Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D98DB58F43
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 09:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5210F10E08A;
	Tue, 16 Sep 2025 07:35:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="m3HHWS0L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7775C10E08A;
 Tue, 16 Sep 2025 07:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758008132; x=1789544132;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OPue7su3CypKqBwdePJhsUWz6agcLyDP9IpGUay8+AM=;
 b=m3HHWS0LoD1USyVzyZlBm/JBsH9+ZlnIjBrQkQIwfCK7wHXVeCu/jB/w
 fZ852IB6FFCp7I91PsuUPvdkV8d3vIQbNur6afvE5qh7u71gABLCL6fw4
 PElGJPxpM3/FrBvbbCCTIhFYwEyGh8MKN2ca55SNUCmHEwFXhEL/eKx7v
 AgfteLsxq8PZzINjcb1Q/07QFM4xbZ0U1WC+ru9dmOopVkjy342NqF6c2
 ABxh160uHidGQKYgNI3KamWtWUWLdSnIhh9ZOD1WJMOgEi4ebbpjuaERI
 XxUIEExmKrdDuE6ZkCw6KLmdVvdgcUykKUO2vSLclBu3rNU4yMGkjDZir g==;
X-CSE-ConnectionGUID: hZIPpfvCQomSm6C45vG44g==
X-CSE-MsgGUID: HbVlO6onRQOmXfXcqJqt2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11554"; a="70960405"
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="70960405"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2025 00:35:30 -0700
X-CSE-ConnectionGUID: kjCspqE9TZaahAHDmP4BPA==
X-CSE-MsgGUID: hB5mv/8ITai69Xi8NKZ8lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,268,1751266800"; d="scan'208";a="179250715"
Received: from intel-s2600wft.iind.intel.com ([10.223.26.143])
 by fmviesa005.fm.intel.com with ESMTP; 16 Sep 2025 00:35:27 -0700
From: S Sebinraj <s.sebinraj@intel.com>
To: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jeevaka.badrappan@intel.com,
	S Sebinraj <s.sebinraj@intel.com>
Subject: [PATCH v3 0/3] drm: Add GPU frequency tracepoint
Date: Tue, 16 Sep 2025 12:57:01 +0530
Message-Id: <20250916072704.2351591-1-s.sebinraj@intel.com>
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

S Sebinraj (3):
  drm: Add GPU frequency tracepoint at DRM level
  drm/xe: Add DRM GPU frequency tracepoint to Xe
  drm/xe: Refactoring the code as per review comment

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

