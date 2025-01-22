Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6C9A18B53
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 06:34:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43E3810E662;
	Wed, 22 Jan 2025 05:34:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gin+rJCG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B137010E1D8;
 Wed, 22 Jan 2025 05:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737524060; x=1769060060;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tAEF0QdeVYwqsFkHenn7Uj72RzK2P4ihXws4kiMUvsQ=;
 b=Gin+rJCGZnGUg5gal8alwLrFQJJlOvjrZxkD/GDy7jrxXjEngXtzuky5
 RUepUbFevfDO5CADNtpqPxpMeBBuO9X9Wd4TgOWT3KhLZBcPpgPjy7Vve
 v5sWK6+z3X63X75dgr1ZEw380Rj+wm9fRG//hztmEDn/y47Vls+gey1XI
 qVRK1E4MGaqTInIDvt956qbjB1RGqapc1BFtD9MCp2qP7QfD1tRnVrXz7
 Hi7B9BrRQTjDbb/7JVGEgemvHmme2DCkrAEiWOn3nqLspgUv/kNcUGURV
 DgQkbhaQcblrpug345ImtXCi3lxwf1wZVk16vw+7RT5JyOJh7jGz72Jku A==;
X-CSE-ConnectionGUID: YGOJS1knSAutOUAiFHEByA==
X-CSE-MsgGUID: Pf6At6Z5Sn+G5O77eWETVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37662420"
X-IronPort-AV: E=Sophos;i="6.13,224,1732608000"; d="scan'208";a="37662420"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 21:34:20 -0800
X-CSE-ConnectionGUID: gnZ3H6gfS8SrxJDqJ3xxlA==
X-CSE-MsgGUID: jk1IedA9QpOWTJdyNwY3ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107920439"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 21 Jan 2025 21:34:19 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, dmitry.baryshkov@linaro.org,
 arun.r.murthy@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 0/3] Extended Wake Timeout 
Date: Wed, 22 Jan 2025 11:03:55 +0530
Message-Id: <20250122053358.1545039-1-suraj.kandpal@intel.com>
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

Retimers in H/w usually takes 30 to 40ms to wake up all the devices. To
get this we use the Extended Wake Time feature in which the sink device
tells us the minimum amount of time it requires to wake up and we need
to do a write to grant this request else we need to wake up within 1ms
of low power state exit.
DP source  device shall keep retying  the AUX tansaction up to the
extended timeout  that is being granted for LTTPRs from the sink device

Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (3):
  drm/dp: Add the DPCD register required for Extended wake timeout
  drm/display/dp: Define function to setup Extended wake time
  drm/i915/lttpr: Enable Extended Wake Timeout

 drivers/gpu/drm/display/drm_dp_helper.c       | 58 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_ddi.c      |  4 ++
 .../drm/i915/display/intel_dp_link_training.c |  2 +-
 .../drm/i915/display/intel_dp_link_training.h |  1 +
 include/drm/display/drm_dp.h                  | 14 +++++
 include/drm/display/drm_dp_helper.h           |  1 +
 6 files changed, 79 insertions(+), 1 deletion(-)

-- 
2.34.1

