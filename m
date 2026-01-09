Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F1DD072EC
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 06:03:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C4AA10E127;
	Fri,  9 Jan 2026 05:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W58lGIPH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72B9110E0A6;
 Fri,  9 Jan 2026 05:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767934988; x=1799470988;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=UpgxHR8DS+rl+apLQ19610/71GXOK39/L4Fif367214=;
 b=W58lGIPHyug6lqtIN5ZNMG2JZ41tFp1sxGgUuo+tKfGp0rsS4nsoJQ9P
 aonTWi283quqYVPhLxlBsQTszBDfFPYMP+ZNCFmV0sbAgHB+rBOXtiN3b
 gYkcpv+XBxlK7FG/ZIuOkcp8lG+r/YUtSRsbhXR18/52aFlABmysevAcr
 QFrQ3uZcN+GF1J7B3MjH+WGwqflOS0Lk+IaP6KEvjF3SGRpiVAMwK+UTy
 z1ucOnh/xuMd5xdfJZGp8UPAC9ebd8BwU5YcwYTwVOPustM16hduDNQsn
 91HOnB62R44zYqUMjXqY3T/Or5TitOEJegoIeC5LYTyu6L9DUkfsCY4eH A==;
X-CSE-ConnectionGUID: STBGIrKpQa2PnZHdMPzWeA==
X-CSE-MsgGUID: /vg3OHupRrqbDPEtM9lxzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="68512003"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="68512003"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 21:03:08 -0800
X-CSE-ConnectionGUID: XiVoGhW6RPWDNBwp2RHpWQ==
X-CSE-MsgGUID: NKlyb59GTjWDnXN3EWhuSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="240881022"
Received: from baandr0id001.iind.intel.com ([10.66.253.151])
 by orviesa001.jf.intel.com with ESMTP; 08 Jan 2026 21:03:04 -0800
From: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Kaushlendra Kumar <kaushlendra.kumar@intel.com>
Subject: [PATCH] drm/i915/display: use port not transcoder for PORT_ALPM_CTL
Date: Fri,  9 Jan 2026 10:30:21 +0530
Message-Id: <20260109050021.2017982-1-kaushlendra.kumar@intel.com>
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

intel_alpm_disable() incorrectly passes cpu_transcoder as the
index to PORT_ALPM_CTL(), which expects an enum port. This
writes to the wrong register, potentially corrupting state on
unrelated ports.

Use dp_to_dig_port(intel_dp)->base.port to access the correct
port-indexed register.

Signed-off-by: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_alpm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_alpm.c b/drivers/gpu/drm/i915/display/intel_alpm.c
index 6372f533f65b..09ba1c2be16c 100644
--- a/drivers/gpu/drm/i915/display/intel_alpm.c
+++ b/drivers/gpu/drm/i915/display/intel_alpm.c
@@ -557,6 +557,7 @@ void intel_alpm_disable(struct intel_dp *intel_dp)
 {
 	struct intel_display *display = to_intel_display(intel_dp);
 	enum transcoder cpu_transcoder = intel_dp->alpm.transcoder;
+	enum port port = dp_to_dig_port(intel_dp)->base.port;
 
 	if (DISPLAY_VER(display) < 20 || !intel_dp->alpm_dpcd)
 		return;
@@ -568,7 +569,7 @@ void intel_alpm_disable(struct intel_dp *intel_dp)
 		     ALPM_CTL_ALPM_AUX_LESS_ENABLE, 0);
 
 	intel_de_rmw(display,
-		     PORT_ALPM_CTL(cpu_transcoder),
+		     PORT_ALPM_CTL(port),
 		     PORT_ALPM_CTL_ALPM_AUX_LESS_ENABLE, 0);
 
 	drm_dbg_kms(display->drm, "Disabling ALPM\n");
-- 
2.34.1

