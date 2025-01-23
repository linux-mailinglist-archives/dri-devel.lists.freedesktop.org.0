Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A13A1A6AA
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 16:09:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6224110E82B;
	Thu, 23 Jan 2025 15:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ab8OI7lC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05A5510E82B;
 Thu, 23 Jan 2025 15:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737644961; x=1769180961;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Nueboy7+JR2yY6NV0kNMAdAu1STkDV+A9odSEvpkmsA=;
 b=Ab8OI7lCRAj4Pqjf3QJniTAp1mhERbu1l4HAO9uFKskTekoBYoldO8W3
 xSs5YubOP3NWc4FmfuQQcRfiQbjH6ZBAOgU0jd22h5xS3fu0Vb/hJ/hkD
 sSdHqoq4Y/beWbj4A52iWBBzzST/O2VbU98NNgNybNVzrz8iY+d5WCS3k
 dK3b19hpUxyWNEYA3TBMQpU0ZcrJY0I1Xq0/XdWAEjz/ZNvE7FnwxKIjV
 UjzzMGP2IsDZNGWMZ7sBIUjbDrPwOTlPlO5mwTn5FwCiOGYhf5+TGaal5
 raebLuHaLOtmHXxYJKjnBTETnsInJZKOX0kF2/9+mEu6RrrgbBzwKfiNU A==;
X-CSE-ConnectionGUID: l3qvurZzSiSdDevynTON3Q==
X-CSE-MsgGUID: /fgw2NQEQhKsUcOjuFwlyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="49542362"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; d="scan'208";a="49542362"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 07:09:21 -0800
X-CSE-ConnectionGUID: Wnhew93WRIS8u/rgLScz1w==
X-CSE-MsgGUID: ilgtbt1JQHiGEIg+oOFqjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="108350306"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 07:09:19 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	jani.nikula@intel.com
Subject: [PATCH 0/5] drm: strict type checking for drm_device based logging
 helpers
Date: Thu, 23 Jan 2025 17:09:07 +0200
Message-Id: <cover.1737644530.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Fix all cases that pass something other than struct drm_device to the
drm_device based logging helpers, and add strict type checking.

Gustavo Sousa (1):
  drm/print: Include drm_device.h

Jani Nikula (4):
  drm/mipi-dsi: stop passing non struct drm_device to drm_err() and
    friends
  drm/rockchip: stop passing non struct drm_device to drm_err() and
    friends
  drm/sched: stop passing non struct drm_device to drm_err() and friends
  drm/print: require struct drm_device for drm_err() and friends

 drivers/gpu/drm/drm_mipi_dsi.c                | 12 +++---
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c   | 16 +++----
 .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    | 16 +++----
 drivers/gpu/drm/scheduler/sched_entity.c      |  2 +-
 drivers/gpu/drm/scheduler/sched_main.c        | 20 +++++----
 include/drm/drm_print.h                       | 42 +++++++++++--------
 6 files changed, 58 insertions(+), 50 deletions(-)

-- 
2.39.5

