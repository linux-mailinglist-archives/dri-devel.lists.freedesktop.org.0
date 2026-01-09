Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8241FD06FD3
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 04:28:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 800BA10E7E6;
	Fri,  9 Jan 2026 03:28:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Jadrd1aw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E5110E7E3;
 Fri,  9 Jan 2026 03:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767929317; x=1799465317;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EjP75rMtYoxcuMKQSr6O53Qxk6em91HW4fufreZrCsM=;
 b=Jadrd1awZnZ/v5a2YYMVTN754zqY1Nan0u7ivQskKscRF52e82qwwhyC
 YoH8+NLdt4SW3Cly0gjoS28cxTvNDWoC6CgRu9DgqIoKvX5WvHkdG8XX1
 LCbLpr2BsgUjxi87iqGQ/UP7AjG9eB5JEZLqVvwIEy0+T+C6d21ThbJwJ
 1uIHqioRKo7J9Ak/jDp7v8t1tLu3hQHBirsISUgB58K+D+O/9GPbJ42p4
 ysqH2w2QTkCC4vIz3UO1pmfdJLdSxsvxC5PnUYSQXd1kRtfuEOq098/ok
 ewmtlCkyW6AWLcS4tPDWBmENHYo1Z0VPlmBGKfLhZkskBCxrE491cUFzi Q==;
X-CSE-ConnectionGUID: 0+RuB/4EQZCs/gNslP5b7Q==
X-CSE-MsgGUID: UvnVQBO3SFKSrPo8oF0+jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="86900933"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="86900933"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jan 2026 19:28:36 -0800
X-CSE-ConnectionGUID: R9n3EEWqTXyb+QmgEeIpAg==
X-CSE-MsgGUID: PiZRmvkSR3KiVcxBJnV4jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; d="scan'208";a="203396555"
Received: from baandr0id001.iind.intel.com ([10.66.253.151])
 by orviesa007.jf.intel.com with ESMTP; 08 Jan 2026 19:28:34 -0800
From: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
To: jani.nikula@linux.intel.com, rodrigo.vivi@intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org,
 Kaushlendra Kumar <kaushlendra.kumar@intel.com>
Subject: [PATCH] drm/i915: free _DSM package when no connectors
Date: Fri,  9 Jan 2026 08:55:49 +0530
Message-Id: <20260109032549.1826303-1-kaushlendra.kumar@intel.com>
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

acpi_evaluate_dsm_typed() returns an ACPI package in pkg.
When pkg->package.count == 0, we returned without freeing pkg,
leaking memory. Free pkg before returning on the empty case.

Signed-off-by: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/display/intel_acpi.c b/drivers/gpu/drm/i915/display/intel_acpi.c
index 68c01932f7b4..e06f324027be 100644
--- a/drivers/gpu/drm/i915/display/intel_acpi.c
+++ b/drivers/gpu/drm/i915/display/intel_acpi.c
@@ -96,6 +96,7 @@ static void intel_dsm_platform_mux_info(acpi_handle dhandle)
 
 	if (!pkg->package.count) {
 		DRM_DEBUG_DRIVER("no connection in _DSM\n");
+		ACPI_FREE(pkg);
 		return;
 	}
 
-- 
2.34.1

