Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECC05B646A
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 01:55:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5E010E4A7;
	Mon, 12 Sep 2022 23:54:53 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C45410E488;
 Mon, 12 Sep 2022 23:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663026886; x=1694562886;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W0EE0LlD3Jx1GksuZcoFGKc32g8gFV/OnRIDwR3vsTk=;
 b=bl3ziFvi9lmWoKkQfa1hiT5SQOptc7kZEYdRQ0PI0bqdROXLaOI22Wjs
 kYPU3NrAi+JYF1HlDpdEF8bcrqVfaDFBRn1nU05q1Bn0DA3JUJYH03DrR
 g3iffJJzUJFHO/YwTzRmTtQXLYYnRAo/9HbRFYRGwdfVD0y/tzwE+SlqO
 7w0FtVFVkStA0IYd3u/Lh6at5o0R0u0LB/PQIhsqkin+OzM/ipmpLDodV
 vJhL1asqMOy2QmgM+K0P08bbr+NVvfOPCdgzC+KLFgFof/qAWdNezTD3Z
 VI71LCiarLCz0gIV1mbhl1lkANPmutPh615joFJ3B8fOmIwYK1H4ZjnXW g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="384292950"
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; d="scan'208";a="384292950"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 16:54:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; d="scan'208";a="684629551"
Received: from relo-linux-5.jf.intel.com ([10.165.21.151])
 by fmsmga004.fm.intel.com with ESMTP; 12 Sep 2022 16:54:45 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 1/1] drm/i915/uc: Fix issues with overriding firmware files
Date: Mon, 12 Sep 2022 16:55:15 -0700
Message-Id: <20220912235515.2457180-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220912235515.2457180-1-John.C.Harrison@Intel.com>
References: <20220912235515.2457180-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 DRI-Devel@Lists.FreeDesktop.Org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

The earlier update to support reduced versioning of firmware files
introduced an issue with the firmware override module parameter. If an
invalid file was specified then an infinite loop could occur trying to
find a backup firmware.

The fix is that if an explicit override has been set, then don't scan
for backup options because there is no point anyway. The user wanted X
and if X is not available, that's their problem.

This patch also fixes up the scanning loop code so that if an invalid
file is passed in, it will exit rather than loop forever. So if the
impossible situation did somehow occur in the future, it wouldn't be
such a big problem.

Fixes: 665ae9c9ca79 ("drm/i915/uc: Support for version reduced and multiple
firmware files")
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Venkata Sandeep Dhanalakota <venkata.s.dhanalakota@intel.com>
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index af425916cdf64..5ff98239b6c9f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -232,6 +232,7 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
 	u32 fw_count;
 	u8 rev = INTEL_REVID(i915);
 	int i;
+	bool found;
 
 	/*
 	 * The only difference between the ADL GuC FWs is the HWConfig support.
@@ -246,6 +247,7 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
 	fw_blobs = blobs_all[uc_fw->type].blobs;
 	fw_count = blobs_all[uc_fw->type].count;
 
+	found = false;
 	for (i = 0; i < fw_count && p <= fw_blobs[i].p; i++) {
 		const struct uc_fw_blob *blob = &fw_blobs[i].blob;
 
@@ -266,9 +268,15 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
 		uc_fw->file_wanted.path = blob->path;
 		uc_fw->file_wanted.major_ver = blob->major;
 		uc_fw->file_wanted.minor_ver = blob->minor;
+		found = true;
 		break;
 	}
 
+	if (!found && uc_fw->file_selected.path) {
+		/* Failed to find a match for the last attempt?! */
+		uc_fw->file_selected.path = NULL;
+	}
+
 	/* make sure the list is ordered as expected */
 	if (IS_ENABLED(CONFIG_DRM_I915_SELFTEST) && !verified) {
 		verified = true;
@@ -553,10 +561,14 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 
 	err = firmware_request_nowarn(&fw, uc_fw->file_selected.path, dev);
 	memcpy(&file_ideal, &uc_fw->file_wanted, sizeof(file_ideal));
-	if (!err || intel_uc_fw_is_overridden(uc_fw))
-		goto done;
+
+	/* Any error is terminal if overriding. Don't bother searching for older versions */
+	if (err && intel_uc_fw_is_overridden(uc_fw))
+		goto fail;
 
 	while (err == -ENOENT) {
+		old_ver = true;
+
 		__uc_fw_auto_select(i915, uc_fw);
 		if (!uc_fw->file_selected.path) {
 			/*
@@ -576,8 +588,6 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 	if (err)
 		goto fail;
 
-	old_ver = true;
-done:
 	if (uc_fw->loaded_via_gsc)
 		err = check_gsc_manifest(fw, uc_fw);
 	else
-- 
2.37.3

