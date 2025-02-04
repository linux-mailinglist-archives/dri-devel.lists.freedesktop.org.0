Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C192A27223
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 13:50:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFE0710E614;
	Tue,  4 Feb 2025 12:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jPjNthxb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4F710E614;
 Tue,  4 Feb 2025 12:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738673425; x=1770209425;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O70d/n8A7jSwkP9ydUPZ82gCpTvnBGZkV7gto2fDQAU=;
 b=jPjNthxbonxc3zSOP5i2KThMi5RhX851WTtc/iK4F3y/yssrhxHKcqK5
 9J6ohbqHwF55SlWo1a3p8KwLhvfDosUaKs0a6s9pY/b9vGpbeDAa9WrdN
 tFLWKc5nWblYP88l+k4xSBj/1OxTG89exp2+X7z/g8ySYMo0vZFPe7LdP
 OPFzQxNeai0rTTGFwDYTsmYYU+sEMCf5rEzXs9GZ72SPggWstuIh+GCWx
 g0biLU+yzT7MjyvKLr0ey0D5Et+5oHd1suS8NXy2mPUpBNPwk1LFIHrxo
 gotQdNCiRpzabyXiJdDf5gbZAFUTKXMQoy3lNfj5oA0T5R0lZI3Qow6p8 g==;
X-CSE-ConnectionGUID: oSsG/eNBSnOFEjQ9bCYtsg==
X-CSE-MsgGUID: jXunjUfrQ2OFc4N4fBQMEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="42853150"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208,223";a="42853150"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2025 04:50:25 -0800
X-CSE-ConnectionGUID: CK8l3EkSQDKYUsvgths7vQ==
X-CSE-MsgGUID: jrf1AG9ZQmKvyZBld6j4ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
 d="scan'208,223";a="111441935"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa008.jf.intel.com with ESMTP; 04 Feb 2025 04:50:21 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com, jani.nikula@intel.com, arun.r.murthy@intel.com,
 ben.kao@intel.com, Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 0/7] Enable Aux based Nits brightness control for eDP
Date: Tue,  4 Feb 2025 18:20:02 +0530
Message-Id: <20250204125009.2609726-1-suraj.kandpal@intel.com>
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
brightness. But still did not have the nits luminance control coded
in. This series enables nits based luminance control over Aux using
VESA pathways.

--v2
-Prefer using Luminance for function name over nits [Jani]

Closes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/3669
Signed-off-by: Suraj Kandpal <suraj.kandpal@intel.com>

Suraj Kandpal (7):
  drm/dp: Add eDP 1.5 bit definition
  drm/i915/backlight: Use proper interface based on eDP version
  drm/i915/backlight: Check Luminance based brightness control for VESA
  drm/i915/backlight: Modify function to get VESA brightness in Nits
  drm/i915/backlight: Add function to change brightness in nits for VESA
  drm/i915/backlight: Setup nits based luminance via VESA
  drm/i915/backlight: Enable nits based luminance

 .../drm/i915/display/intel_display_types.h    |   1 +
 .../drm/i915/display/intel_dp_aux_backlight.c | 181 ++++++++++++++----
 include/drm/display/drm_dp.h                  |   1 +
 3 files changed, 142 insertions(+), 41 deletions(-)

-- 
2.34.1

