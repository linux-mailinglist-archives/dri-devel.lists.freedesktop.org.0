Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C2B3A20DF9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 17:06:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B8E810E6A9;
	Tue, 28 Jan 2025 16:06:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ir/nekxX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7CB110E6C3;
 Tue, 28 Jan 2025 16:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738080382; x=1769616382;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=xJ8fhrD/4C+7EwmZ4SJD8MepYaH+Fw/Qew0gZ/nTVS0=;
 b=Ir/nekxXP+ckEJeCznLJh+lvRyZy7gYCiTdA8+AR+YuonisxxFgOZopo
 KIMiQZkf6cUa5oq5PlzUFldmjy3xDigoDI4zhKk26YMZNqqzLyQgYP5yf
 ra7bRLXjVX6L9GzHkLIlfgGSH0aHkq34Ei1TJwe8VVUdB5m8xa92h10th
 m7fr7CLPZql4NatAH55n+5AV0MurFk745XbLvSFvsQncbexZHelBSM/yV
 Kt/ISgNyBsWUPa40+pwB3/Pq7cSil6v39koj7jYzQy9QF6/XxKIUb6eUl
 xOujwvQ6RIy6qOM6Jd4GyAoAMsM/4/zeDd4zQYElNwz6/yjoi6rx1ZNfK A==;
X-CSE-ConnectionGUID: AVf2R6wvRNGRns7rKoPHAA==
X-CSE-MsgGUID: UoiNMR/nSB+h5kYZfk9T6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38745055"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="38745055"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 08:06:22 -0800
X-CSE-ConnectionGUID: dWEl1nkyTh+ZXQbNsus5pA==
X-CSE-MsgGUID: rMNU/I3jRUSR07Yep0SEvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="145977009"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa001.jf.intel.com with ESMTP; 28 Jan 2025 08:06:19 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 28 Jan 2025 21:21:17 +0530
Subject: [PATCH v8 11/14] drm/i915/crtc: Hook i915 IET LUT with the drm IET
 properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250128-dpst-v8-11-871b94d777f8@intel.com>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
In-Reply-To: <20250128-dpst-v8-0-871b94d777f8@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, dmitry.baryshkov@linaro.org, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

Upon drm getting the IET LUT value from the user through the IET_LUT
property, i915 driver will write the LUT table to the hardware
registers.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_crtc.c    | 3 +++
 drivers/gpu/drm/i915/display/intel_display.c | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_crtc.c b/drivers/gpu/drm/i915/display/intel_crtc.c
index b90017409a23de2a214ca43d32ba537998ea0f78..4e6c790f53ffe375e1b496fe48e9dc10e05bf11b 100644
--- a/drivers/gpu/drm/i915/display/intel_crtc.c
+++ b/drivers/gpu/drm/i915/display/intel_crtc.c
@@ -387,6 +387,9 @@ int intel_crtc_init(struct drm_i915_private *dev_priv, enum pipe pipe)
 	if (drm_crtc_create_histogram_property(&crtc->base,
 					       crtc->histogram->caps))
 		drm_err(&dev_priv->drm, "Failed to initialize histogram properties\n");
+	if (drm_crtc_create_iet_lut_property(&crtc->base,
+					     crtc->histogram->iet_caps))
+		drm_err(&dev_priv->drm, "Failed to initialize histogram properties\n");
 
 	intel_color_crtc_init(crtc);
 	intel_drrs_crtc_init(crtc);
diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index c38a33ee90aef144931215254f178ba955f998b0..673012e716e448b4aef0db530f5eeb44edc14265 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -7945,6 +7945,8 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
 			intel_histogram_update(crtc,
 					       (struct drm_histogram_config *)
 					       new_crtc_state->uapi.histogram_enable->data);
+		if (new_crtc_state->uapi.iet_lut_updated)
+			intel_histogram_set_iet_lut(crtc, new_crtc_state->uapi.iet_lut);
 	}
 
 	/* Underruns don't always raise interrupts, so check manually */

-- 
2.25.1

