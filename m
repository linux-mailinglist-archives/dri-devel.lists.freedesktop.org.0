Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA0E429301
	for <lists+dri-devel@lfdr.de>; Mon, 11 Oct 2021 17:19:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532216E51B;
	Mon, 11 Oct 2021 15:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8F056E51B;
 Mon, 11 Oct 2021 15:19:45 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10134"; a="214044428"
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="214044428"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2021 08:19:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,364,1624345200"; d="scan'208";a="716427179"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga005.fm.intel.com with ESMTP; 11 Oct 2021 08:19:43 -0700
Received: from intel.com (srinivasulu-X299-AORUS-Gaming-7.iind.intel.com
 [10.145.162.218])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 19BFJcaI019164; Mon, 11 Oct 2021 16:19:42 +0100
From: Thanneeru Srinivasulu <thanneeru.srinivasulu@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: michal.wajdeczko@intel.com, thanneeru.srinivasulu@intel.com
Subject: [PATCH 2/4] drm/i915/huc: Use i915_probe_error to report early HuC
 failures
Date: Mon, 11 Oct 2021 20:51:04 +0530
Message-Id: <20211011152106.3424810-3-thanneeru.srinivasulu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211011152106.3424810-1-thanneeru.srinivasulu@intel.com>
References: <20211011152106.3424810-1-thanneeru.srinivasulu@intel.com>
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

Replace DRM_ERROR with i915_probe_error to report early HuC failures.

Signed-off-by: Thanneeru Srinivasulu <thanneeru.srinivasulu@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_huc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index ff4b6869b80b..ff0f5b9130c9 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -179,7 +179,7 @@ int intel_huc_auth(struct intel_huc *huc)
 	ret = intel_guc_auth_huc(guc,
 				 intel_guc_ggtt_offset(guc, huc->rsa_data));
 	if (ret) {
-		DRM_ERROR("HuC: GuC did not ack Auth request %d\n", ret);
+		i915_probe_error(gt->i915, "HuC: GuC did not ack Auth request %d\n", ret);
 		goto fail;
 	}
 
@@ -190,7 +190,7 @@ int intel_huc_auth(struct intel_huc *huc)
 					huc->status.value,
 					2, 50, NULL);
 	if (ret) {
-		DRM_ERROR("HuC: Firmware not verified %d\n", ret);
+		i915_probe_error(gt->i915, "HuC: Firmware not verified %d\n", ret);
 		goto fail;
 	}
 
-- 
2.25.1

