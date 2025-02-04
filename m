Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2855A26C76
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 08:06:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 754E510E5A0;
	Tue,  4 Feb 2025 07:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rcn2cgI3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F88E10E26C;
 Tue,  4 Feb 2025 07:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738652791; x=1770188791;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xX3fHNOOOIIebwiwV8PZRTxN6IVPVrlpQvKLYDho6hs=;
 b=Rcn2cgI3DbdsqxsFj30pitL7eROL4GDv2HTLSPLoRHhRrDZjJWWCTIbe
 c6BNbMuwsNqXVX9/VrrUAAfq0X7eJ1V9zxGKywNoYxIwVzkfZkA0P9fS3
 JSwfv6EQHpwFz9Rb3VhNMfOYA/Y1SyQZi0Gj/XfMlD5XshMv86TbM/f/F
 9k8ygE+XTw1Gs+h72Dw7vahEAhsjc9B2RP0QNPZL+ocnqIln5pIne0MCn
 T3+D6sG+Ui2pcu78LO3jJfkvG39Nj7n8qfsJ2nbNLxViPMWv3jRy4cKM2
 EOws6x3MM8DDCM8W1oTaRh9scz8+cliGIiuyoaqhUnzNuDtn8GbcibFGY w==;
X-CSE-ConnectionGUID: vRWts+gdTe2ynLD+2IQOkA==
X-CSE-MsgGUID: 3qNfpnznQemd+cT9YMwfbQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39196915"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="39196915"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 23:06:31 -0800
X-CSE-ConnectionGUID: R2o7QC2IQY2x1SqUeRJfzg==
X-CSE-MsgGUID: 68FAmoQvR+634vHlcc3bYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110974865"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa007.jf.intel.com with ESMTP; 03 Feb 2025 23:06:24 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 christian.koenig@amd.com, alexander.deucher@amd.com
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com, xaver.hugl@kde.org,
 pekka.paalanen@haloniitty.fi, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v12 4/5] drm/i915: Use device wedged event
Date: Tue,  4 Feb 2025 12:35:27 +0530
Message-Id: <20250204070528.1919158-5-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250204070528.1919158-1-raag.jadav@intel.com>
References: <20250204070528.1919158-1-raag.jadav@intel.com>
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
index aae5a081cb53..d6dc12fd87c1 100644
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

