Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F75FAD8303
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 08:16:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAADD10E8C7;
	Fri, 13 Jun 2025 06:16:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CDqacUEN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B7510E8C5;
 Fri, 13 Jun 2025 06:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749795366; x=1781331366;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Qio9/NzexI3eyEbx+r/kfeJWAsqYS5EeySh5CO5LiuY=;
 b=CDqacUENwOCJ2JycjeZz3XhoABGZHLMUhlIH871XxEv3GpLyEfNfMR1C
 Jfy/jzGIYZccCA20ELQIVNpJn8JhaudEfWvhiGinS02jiQ8VQcNjrrhZS
 0RzpZQ4KgFwxzjt6yvZCaMD+NPssQIP2jgOn/0mQKt5XldMUUIPj+lgtS
 sqO+7FdTRkEoFRZxMMevstGm+FdYRw9e2fqwzJsgkCnSXSN1mfXLaKNc1
 TWHlZaY1PZwqnU0Wj38FcmTnZ5Yj9M7EL2W/Jn1tBB9E9qvlYwGqCTnx2
 G64lo+lkpeTbKT1i1udy5FF874OT03PuKpHa5Ykqqa038tOnMbksFIKlD g==;
X-CSE-ConnectionGUID: /FIOt8BwRRqgVuQvfQrKTg==
X-CSE-MsgGUID: 7Nc8YYL6RPaCKEeNreW66A==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="39608774"
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="39608774"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2025 23:16:06 -0700
X-CSE-ConnectionGUID: 1VPhn6CwTr6pysb6Tcq0/A==
X-CSE-MsgGUID: ZHQgio5CQ7mPpJ8O4r9gmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,232,1744095600"; d="scan'208";a="152717189"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa004.jf.intel.com with ESMTP; 12 Jun 2025 23:16:03 -0700
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: arun.r.murthy@intel.com,
	Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [RFC PATCH 0/4] New Helper to Initialise writeback connector 
Date: Fri, 13 Jun 2025 11:45:46 +0530
Message-Id: <20250613061550.2893526-1-suraj.kandpal@intel.com>
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

This series is for review comments only and is not tested.
This series added a helper to be able to initialise writeback connector
in a way where drivers can send their own connector and encoder.

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (4):
  drm/writeback: Add function that takes preallocated connector
  drm/i915/writeback: Add writeback registers
  drm/i915/writeback: Add some preliminary writeback definitions
  drm/i915/writeback: Init writeback connector

 drivers/gpu/drm/drm_writeback.c               |  83 +++++++++++
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_display.h  |   4 +
 .../drm/i915/display/intel_display_device.c   |  26 +++-
 .../drm/i915/display/intel_display_device.h   |   2 +-
 .../drm/i915/display/intel_display_limits.h   |   2 +
 .../drm/i915/display/intel_display_types.h    |   1 +
 .../gpu/drm/i915/display/intel_writeback.c    | 131 +++++++++++++++++
 .../gpu/drm/i915/display/intel_writeback.h    |  17 +++
 .../drm/i915/display/intel_writeback_reg.h    | 134 ++++++++++++++++++
 include/drm/drm_writeback.h                   |   7 +
 11 files changed, 405 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_writeback.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_writeback.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_writeback_reg.h

-- 
2.34.1

