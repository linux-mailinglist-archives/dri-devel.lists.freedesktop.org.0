Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0B88C8A24
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 18:34:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFD6710E313;
	Fri, 17 May 2024 16:34:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XRMmgi3F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366A510E313;
 Fri, 17 May 2024 16:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715963675; x=1747499675;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wMPpnvAgQgbIIEJ7G9U9h+zMQJEGD49kCdXtmeGeICA=;
 b=XRMmgi3FzAvGI5aLiiNzubU8DWSKbbVphPDHPm5GZqWmfqXyN1MZFZqQ
 cDIHbVTVKJeB/37V8uMhaOFuKJ1wC6L+LKv8boTyOflb6n53h5lUsWGv7
 nPeREs6w/AEcnrMMaO5eDCPfQrOgbD1cV2ienQq1+8B7RSp4PHbZHQUfu
 2X82DOg0V9Nt4o1B3qQgafjGwjdbhz+/VE+IJLlONQEb09kjuLrAHWdUY
 DO3qGs6g7/EcDNoB4FCdGcA81LX0Tv3Ft0B5FBu6WGYPMyZMpD9s1lY5r
 zDXI0aqCfJDqfYHHDNCL4Pw9GTGWYKDzJGeFnTLpijZUSC69Ido4DQsOD g==;
X-CSE-ConnectionGUID: ZfVrnuGSSBuOpb74zp5+tw==
X-CSE-MsgGUID: ajdFKS/LTVC8SJlVuzQ0Kw==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="12022132"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="12022132"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 09:34:26 -0700
X-CSE-ConnectionGUID: vVzsqReMSmueLz3R3Y7FtQ==
X-CSE-MsgGUID: r7uDcgVXR5yeGzhXw1CkBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; d="scan'208";a="31986785"
Received: from mwajdecz-mobl.ger.corp.intel.com ([10.94.252.59])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 09:34:24 -0700
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 3/3] drm/i915: Don't use __func__ as prefix for
 drm_dbg_printer
Date: Fri, 17 May 2024 18:34:06 +0200
Message-Id: <20240517163406.2348-4-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20240517163406.2348-1-michal.wajdeczko@intel.com>
References: <20240517163406.2348-1-michal.wajdeczko@intel.com>
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

Updated code of drm_dbg_printer() is already printing symbolic
name of the caller like drm_dbg() does.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_reset.c      | 2 +-
 drivers/gpu/drm/i915/gt/selftest_context.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 6161f7a3ff70..735cd23a43c6 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -1025,7 +1025,7 @@ void intel_gt_set_wedged(struct intel_gt *gt)
 
 	if (GEM_SHOW_DEBUG()) {
 		struct drm_printer p = drm_dbg_printer(&gt->i915->drm,
-						       DRM_UT_DRIVER, __func__);
+						       DRM_UT_DRIVER, NULL);
 		struct intel_engine_cs *engine;
 		enum intel_engine_id id;
 
diff --git a/drivers/gpu/drm/i915/gt/selftest_context.c b/drivers/gpu/drm/i915/gt/selftest_context.c
index 12eca750f7d0..5eb46700dc4e 100644
--- a/drivers/gpu/drm/i915/gt/selftest_context.c
+++ b/drivers/gpu/drm/i915/gt/selftest_context.c
@@ -286,7 +286,7 @@ static int __live_active_context(struct intel_engine_cs *engine)
 
 	if (intel_engine_pm_is_awake(engine)) {
 		struct drm_printer p = drm_dbg_printer(&engine->i915->drm,
-						       DRM_UT_DRIVER, __func__);
+						       DRM_UT_DRIVER, NULL);
 
 		intel_engine_dump(engine, &p,
 				  "%s is still awake:%d after idle-barriers\n",
-- 
2.43.0

