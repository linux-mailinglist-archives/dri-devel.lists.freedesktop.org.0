Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D4D89D5D6
	for <lists+dri-devel@lfdr.de>; Tue,  9 Apr 2024 11:46:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5A93112C25;
	Tue,  9 Apr 2024 09:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ktfNN5Dy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75002112C24;
 Tue,  9 Apr 2024 09:46:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712655979; x=1744191979;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kX0r+b5WQrDlKBKmpzVT5ZWM2qKN9m2+SDKGvEwEKgI=;
 b=ktfNN5DyqosuEJbWG4in0+xSeZhgHIKDsH9ffiuiKWy3cQJ2F7l2zlFj
 Qaoc1rYBmA/JgjpPkPn8K80rVW/wLzaC4/Fzt97Op929yZRvd77gfaIc4
 cHwNYbG6J16fnogaKRJsk+BNSCER2COsGJYMVY3NaMUJ3oGj8+sC7w95e
 Pz9+uLexE3w8dmcuVkoWqg0EvSryvHZqtZ12eZ7gnhnDJCwyhy3O8kF5R
 tTiKDj4EW6R7U4CTiaenZ1RoRX0LEdNmEC8OcpPEox23pYUCtauxPBBCM
 6YOIJLeJnbFp3RAgfWs3znO7pmoDxm8XUokADYkqMBKWqstWyCjnbgatF Q==;
X-CSE-ConnectionGUID: fTCc6fYgT6K8XnyTrPj3jw==
X-CSE-MsgGUID: NxYFnBwESdq9LzABS+SdbA==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="11758310"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="11758310"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 02:46:18 -0700
X-CSE-ConnectionGUID: lIc9HulvQVWsoHlElLwjDA==
X-CSE-MsgGUID: mYpA+X//R46anWDJdQ2Twg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; d="scan'208";a="24658195"
Received: from mserban-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.59.228])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Apr 2024 02:46:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 Melissa Wen <mwen@igalia.com>, ville.syrjala@linux.intel.com
Subject: [PATCH v2 0/4] drm/edid & drm/i915: vendor and product id logging
 improvements
Date: Tue,  9 Apr 2024 12:46:08 +0300
Message-Id: <cover.1712655867.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
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

v2 with __be16 manufacturer_name in patch 1 and revamped date printing
in patch 2.

Jani Nikula (4):
  drm/edid: add drm_edid_get_product_id()
  drm/edid: add drm_edid_print_product_id()
  drm/i915/bios: switch to struct drm_edid and struct
    drm_edid_product_id
  drm/i915/bios: return drm_edid_product_id from get_lvds_pnp_id()

 drivers/gpu/drm/drm_edid.c                | 59 +++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_bios.c | 49 ++++++++-----------
 include/drm/drm_edid.h                    | 28 +++++++++--
 3 files changed, 103 insertions(+), 33 deletions(-)

-- 
2.39.2

