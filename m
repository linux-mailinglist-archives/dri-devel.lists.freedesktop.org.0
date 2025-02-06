Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE590A2A0FE
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 07:34:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1C2910E43C;
	Thu,  6 Feb 2025 06:34:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JUG1jEKw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D2BB10E136;
 Thu,  6 Feb 2025 06:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738823587; x=1770359587;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=z/tcEItx/8U2jLnMZW8qmtfuipLNS08+6BEcmukOSQQ=;
 b=JUG1jEKw5F7893avLIbzKyx24We81S8oLWlZkZlHPnGVolRLdack154J
 euKFwUk2UjGHvGLVjIRenXJ9FHyOoQCBVqbHXRr/q4Cijn/3y8fJGpsb+
 7+uWDE4u3zpSO6+HSeuuHk8WbFMUGl+NsSMrm/Zu7dweSA0qVW8UjoL+U
 ja+zEojHyzv+8TBM+mNZKCfSuwYD8xSekBnTvuhSA+Ay55cDUTffwvwJ4
 GkELtY5P3I8agmcN90cinVB4NBK57AX0aDeVW1HZO7VXSWHEsqvG/g2rJ
 ZMu3Ta3X8pKYs8GhOLFnXEHBU7ulcHmxG4VvEFLXPLPF1PHoh1uawYv04 w==;
X-CSE-ConnectionGUID: LqBtl+hOTYGwLyL0ygsN4Q==
X-CSE-MsgGUID: hBBQ0jJUSdqnGedbFJlWMA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="27014210"
X-IronPort-AV: E=Sophos;i="6.13,263,1732608000"; d="scan'208,223";a="27014210"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Feb 2025 22:33:06 -0800
X-CSE-ConnectionGUID: TA4VGN7ORHaWbKUkoypzlw==
X-CSE-MsgGUID: uEdrty4jSDeuFkfOzJPEUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
 d="scan'208,223";a="112013657"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 05 Feb 2025 22:33:05 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com, arun.r.murthy@intel.com, ben.kao@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 0/8] Enable Aux based Nits brightness control for eDP
Date: Thu,  6 Feb 2025 12:02:45 +0530
Message-Id: <20250206063253.2827017-1-suraj.kandpal@intel.com>
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

From eDP 1.5 we are supposed to use the VESA pathways to control
brightness. But still did not have the Nits brightness control coded
in. This series enables NITS based backlight control over AUX using
VESA pathways.

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3669
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (8):
  drm/dp: Add eDP 1.5 bit definition
  drm/dp: Increase eDP display control capability size
  drm/i915/backlight: Use proper interface based on eDP version
  drm/i915/backlight: Check Luminance based brightness control for VESA
  drm/i915/backlight: Modify function to get VESA brightness in Nits
  drm/i915/backlight: Add function to change brightness in nits for VESA
  drm/i915/backlight: Setup nits based luminance via VESA
  drm/i915/backlight: Enable nits based luminance

 .../drm/i915/display/intel_display_types.h    |   1 +
 .../drm/i915/display/intel_dp_aux_backlight.c | 181 ++++++++++++++----
 include/drm/display/drm_dp.h                  |   3 +-
 3 files changed, 143 insertions(+), 42 deletions(-)

-- 
2.34.1

