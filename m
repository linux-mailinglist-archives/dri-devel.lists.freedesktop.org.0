Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C72A1B005
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 06:47:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73FDC10E8D5;
	Fri, 24 Jan 2025 05:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aEvdZbAt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06A710E8D2;
 Fri, 24 Jan 2025 05:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737697635; x=1769233635;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=VJ1uGlFjedj2/PdDc3pOkMujCDGK/UFY9DBwvUPLOxI=;
 b=aEvdZbAtCJiXIZ1R5f4VA9jnq6+jwGFgY+fSG/uUDAkP08SpjKr7ggfX
 eHS4VFJbWvP2MXlTu9cbqG8otsXCF6DtCsQCuRqdFRdXqgTzsnUcPx4fd
 vxJnBhU9+pq5Y30oV7QhkVAPc9mhMZMsOg7zX1Hl9KolqqST94QKBY9r2
 V47wAU6g8Cuo1OiD290gelkYLSysONNpVz/qhyFot6rCNl6uXxC3NSGC5
 ewyjeAN9RpxUWhrIvRs/8BwKg2Or6iiPBjWSvWC9K9/5M5H3fln6uxh/i
 di3MPRaR1kDmBTrhWwVZAew+iFgCyutD/aYBxxP0gMAEfPzJCTRbDw6ve A==;
X-CSE-ConnectionGUID: yoc4VAP1Sn20TRD6/D9L9Q==
X-CSE-MsgGUID: 1obRTxZsQWm0MaNjIqRx8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="37429294"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208,223";a="37429294"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 21:47:15 -0800
X-CSE-ConnectionGUID: PwJJpqEfSD2ARS9yhofXJQ==
X-CSE-MsgGUID: TapHUkNnQ1aCW7ZRnbHRsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
 d="scan'208,223";a="107525968"
Received: from kandpal-x299-ud4-pro.iind.intel.com ([10.190.239.10])
 by orviesa010.jf.intel.com with ESMTP; 23 Jan 2025 21:47:13 -0800
From: Suraj Kandpal <suraj.kandpal@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: uma.shankar@intel.com, arun.r.murthy@intel.com, ben.kao@intel.com,
 Suraj Kandpal <suraj.kandpal@intel.com>
Subject: [PATCH 0/7] Enable Aux based Nits brightness control for eDP
Date: Fri, 24 Jan 2025 11:16:24 +0530
Message-Id: <20250124054631.1796456-1-suraj.kandpal@intel.com>
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

Suraj Kandpal (7):
  drm/dp: Add eDP 1.5 bit definition
  drm/i915/backlight: Use proper interface based on eDP version
  drm/i915/backlight: Check Nits based brightness control for VESA
  drm/i915/backlight: Modify function to get VESA brightness in NITS
  drm/i915/backlight: Add function to change brightness in NITS for VESA
  drm/i915/backlight: Setup NITS based brightness via VESA
  drm/i915/backlight: Enable Nits based brightness

 .../drm/i915/display/intel_display_types.h    |   1 +
 .../drm/i915/display/intel_dp_aux_backlight.c | 178 ++++++++++++++----
 include/drm/display/drm_dp.h                  |   1 +
 3 files changed, 139 insertions(+), 41 deletions(-)

-- 
2.34.1

