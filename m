Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0BCFA1B021
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 06:53:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0196510E8E9;
	Fri, 24 Jan 2025 05:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gjqwb9VO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96B8210E8D7;
 Fri, 24 Jan 2025 05:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737698003; x=1769234003;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1Z5TJwZS6JAy+qJUSNBrRRPyIC6HzfGCxyxDCS4AWLo=;
 b=Gjqwb9VO6mHHm4fSWOdCPnfZunqlo4YtNbd5aiSi4PZtghS4bjr9GZ9t
 mSvHmm8eWsHP+acTb4G4PDm/+N1P+i4s0FBXMfOxjsS7S2iyuACOo8zDC
 vdF1E9QtBvDWEv1XtnSfl0GnWCrlT//EOLGsHfuQh+7mmmd2S/fjXAhr/
 yX4u4/ZDdFhi67/kYmzQh3g+6aJC/evZXWyOIlxE6ev1jnvz8uMTc4Q71
 tkF47RvryuRdiK/PiMOj3/EUCaFLQPnD4NDvbdh8iIAhevGwDX2u2bPf2
 ZRt3SOX0NTMtFTc0fXKqQQWmWDZ1I1MvSjil0LyJoUW0qwhAePUkWUB4s Q==;
X-CSE-ConnectionGUID: INVIirblQqauqJdI9FUsBA==
X-CSE-MsgGUID: fDiHa+jUTPa9eGoJGu6Tjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="60689200"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="60689200"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 21:53:22 -0800
X-CSE-ConnectionGUID: 0o+3GuHST5akoUYeGd59Xw==
X-CSE-MsgGUID: OfjxnbF+RHOjPeMnQvtudw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="108218808"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa010.fm.intel.com with ESMTP; 23 Jan 2025 21:53:16 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, michal.wajdeczko@intel.com,
 christian.koenig@amd.com, xaver.hugl@kde.org
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 lina@asahilina.net, alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v11 4/5] drm/i915: Use device wedged event
Date: Fri, 24 Jan 2025 11:22:59 +0530
Message-Id: <20250124055300.1111274-5-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124055300.1111274-1-raag.jadav@intel.com>
References: <20250124055300.1111274-1-raag.jadav@intel.com>
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

Now that we have device wedged event provided by DRM core, make use
of it and support both driver rebind and bus-reset based recovery.
With this in place, userspace will be notified of wedged device on
gt reset failure.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_reset.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 5a625518d1a9..b33007cd1504 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -1422,6 +1422,9 @@ static void intel_gt_reset_global(struct intel_gt *gt,
 
 	if (!test_bit(I915_WEDGED, &gt->reset.flags))
 		kobject_uevent_env(kobj, KOBJ_CHANGE, reset_done_event);
+	else
+		drm_dev_wedged_event(&gt->i915->drm,
+				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
 }
 
 /**
-- 
2.34.1

