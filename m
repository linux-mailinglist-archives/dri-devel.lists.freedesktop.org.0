Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6919D9CD678
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 06:09:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D565D10E390;
	Fri, 15 Nov 2024 05:09:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LKp0Q89b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC63510E397;
 Fri, 15 Nov 2024 05:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731647379; x=1763183379;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qYukzmCPsvOARxioxlXwjkqT2dRol8jy1Mh65asZ6/U=;
 b=LKp0Q89bvKAiE2AE8g2QogoyPVFkpnVevaBVhJmoCYf559CsY0kHFNP/
 KCsIsa3BdydoJPUcNrLDMjc5tyXHMYN+PKNfXBnnMIUmi/A2ZTtz3jrIF
 lHxizougM4DHygWXMowhtFimBfD6PKEoihThj4PEHBZH7EEr0+meW/7fT
 Wzo2ThU+nj6HlEjAjqJQMiV7Lcgo+4ZJVlhC/ffA85QgISMtWCSzPTrf4
 E8XFz45l1hEqJ0iw69m79q5SNyieN+dgdLNllhWm7IU02LhXcpgJyJ1I7
 5LcEaFkTfslDUbTL6ujWC9EGx4LAGjQXBex6var/q5JIG4x/mhymbtd1X Q==;
X-CSE-ConnectionGUID: 9r89uIEGSIyLVf2XHSlYbQ==
X-CSE-MsgGUID: 0js5EaFxTqK8th6XsS1c5g==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31023956"
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; d="scan'208";a="31023956"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 21:09:38 -0800
X-CSE-ConnectionGUID: t6ViUxllTHqBbcmkyGuDDg==
X-CSE-MsgGUID: wtRXWbhZRQ66HlMZ5AAIxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; d="scan'208";a="92493571"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by fmviesa003.fm.intel.com with ESMTP; 14 Nov 2024 21:09:33 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, christian.koenig@amd.com
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v9 4/4] drm/i915: Use device wedged event
Date: Fri, 15 Nov 2024 10:37:33 +0530
Message-Id: <20241115050733.806934-5-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241115050733.806934-1-raag.jadav@intel.com>
References: <20241115050733.806934-1-raag.jadav@intel.com>
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
---
 drivers/gpu/drm/i915/gt/intel_reset.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index f42f21632306..18cf50a1e84d 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -1418,6 +1418,9 @@ static void intel_gt_reset_global(struct intel_gt *gt,
 
 	if (!test_bit(I915_WEDGED, &gt->reset.flags))
 		kobject_uevent_env(kobj, KOBJ_CHANGE, reset_done_event);
+	else
+		drm_dev_wedged_event(&gt->i915->drm,
+				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
 }
 
 /**
-- 
2.34.1

