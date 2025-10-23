Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C64A1C001CE
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 11:09:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A5110E371;
	Thu, 23 Oct 2025 09:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AVzNUK+Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77FB610E36F;
 Thu, 23 Oct 2025 09:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761210537; x=1792746537;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HxBjJW2x2jF/WupytGRGcuSHbZYhPHD8UDdo9EEmVmc=;
 b=AVzNUK+QEPnfavWoZva4sukfzLJJpuTota+FSeO5ZFY7f5GqmyUCyQ+C
 lvz+U8rfGDhHgYMN2P9YAx4nr/yfzkz326ODXwF82/4Kx9OqkTCHiiJ35
 vr4cRrrWM7+PHJifJBM+RbGE/MxrMhabDmIsTrHRO20mYY317i3+R/lS9
 Xh6j1OiEIfkz/eLHzfNaZKMmi9tuRdW5dnBqYwbhWim8JMu6BFnKfFKYE
 rZccsldJ4YQsDZKuY1hwBjabwQkwqreqGflBp1Itg6eXjrB0hiNoxEt1F
 Rju59PUkdLYZJU3S/D5DGxfYC1TZQGsfnzbOoM7bwxPhyieYhlm0G5r3L w==;
X-CSE-ConnectionGUID: EmjIUq6ARfCUhhVdOgcUag==
X-CSE-MsgGUID: dOEplJy/Sh63ZALmbmRN2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="67020602"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="67020602"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 02:08:57 -0700
X-CSE-ConnectionGUID: zfZynM1fQUaQGJZQS05eUA==
X-CSE-MsgGUID: 0ZecdZVNQ7qImk51Ktk3Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="183329401"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by orviesa010.jf.intel.com with ESMTP; 23 Oct 2025 02:08:55 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Animesh Manna <animesh.manna@intel.com>,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 2/8] drm/i915/alpm: alpm_init() for DP2.1
Date: Thu, 23 Oct 2025 14:11:41 +0530
Message-Id: <20251023084147.572535-3-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20251023084147.572535-1-animesh.manna@intel.com>
References: <20251023084147.572535-1-animesh.manna@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Initialize mutex for DP2.1 alpm.

Cc: Jouni Högander <jouni.hogander@intel.com>
Signed-off-by: Animesh Manna <animesh.manna@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dp.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 475518b4048b..3f9cbeb215ed 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6073,8 +6073,12 @@ intel_dp_detect(struct drm_connector *_connector,
 	if (ret == 1)
 		connector->base.epoch_counter++;
 
-	if (!intel_dp_is_edp(intel_dp))
+	if (!intel_dp_is_edp(intel_dp)) {
+		if (DISPLAY_VER(display) >= 35)
+			intel_alpm_init(intel_dp);
+
 		intel_psr_init_dpcd(intel_dp);
+	}
 
 	intel_dp_detect_dsc_caps(intel_dp, connector);
 
-- 
2.29.0

