Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5DD9E21C6
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 16:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91F8810EA58;
	Tue,  3 Dec 2024 15:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HW5wdex3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9376A10E447;
 Tue,  3 Dec 2024 15:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733239038; x=1764775038;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1yM98AJk6xMVV5jRFvRbtqL71ywi6RezWpInklvwe50=;
 b=HW5wdex3B2A2BNsNI/Bl22gcLzb7zzeGx49CZs6PyHhuBu+5AZYajZ8N
 99ksrnaQP+/BVc72j7Phxd13jAdsoqY71YbfCM/1/uTueLSMBiUjxfFSf
 wWiom5xCYw1um35Okilffdy/s2+NQ8dYFF3LpqKZ1k05vxge4WMpAc67V
 hVLU+o78h+96w+DFfYPlAsBca7YjkdH52jI3r0O8D/Ou09XHQb8MaY729
 vg7EsYj4ixLeNkdr0GLi3CrWIq0so3j/uD+ArUNqj1wSOOjuOz5qG0ygX
 CQVh5XAsSjMiRgP22uw59oQNtaOw1+p6lEGzOel4YUCsWUh+whHByKgtC w==;
X-CSE-ConnectionGUID: YPR6l2I3Q1Ovlc12OTImrQ==
X-CSE-MsgGUID: wgCggKd0SN+UL1hoA29zhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33708744"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="33708744"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 07:17:17 -0800
X-CSE-ConnectionGUID: 2FhMevIHRsOU1iTZs5kDJw==
X-CSE-MsgGUID: /Kr5wR2MQlKbrrkvKsLO3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="97526154"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.135])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 07:17:15 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, imre.deak@intel.com, Lyude Paul <lyude@redhat.com>
Subject: [PATCH v2 0/3] drm/dp: extract payload helpers
Date: Tue,  3 Dec 2024 17:17:07 +0200
Message-Id: <cover.1733238940.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
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

Add some mst topology manager independent payload helpers.

v2 of [1] with some kernel-doc cleanups.

BR,
Jani.

[1] https://lore.kernel.org/r/cover.1731942780.git.jani.nikula@intel.com

Jani Nikula (3):
  drm/dp: extract drm_dp_dpcd_poll_act_handled()
  drm/dp: extract drm_dp_dpcd_write_payload()
  drm/dp: extract drm_dp_dpcd_clear_payload()

 drivers/gpu/drm/display/drm_dp_helper.c       | 125 +++++++++++++++++-
 drivers/gpu/drm/display/drm_dp_mst_topology.c |  88 +-----------
 include/drm/display/drm_dp_helper.h           |   5 +
 3 files changed, 134 insertions(+), 84 deletions(-)

-- 
2.39.5

