Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1E3C5B7E0E
	for <lists+dri-devel@lfdr.de>; Wed, 14 Sep 2022 02:58:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC5810E79D;
	Wed, 14 Sep 2022 00:58:06 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CFD10E79B;
 Wed, 14 Sep 2022 00:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663117071; x=1694653071;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=LLQxBEoakgKgCJqit2FMaUPgiezPhRWwDBmft0s2Q58=;
 b=A4kwevMMaBd6eMyL55VT3AVuq8Ey/OOrzqAdu3JL+OndR9eVJw4QlcY3
 eEyLjmxJxXSxN69osSuUWqVX9BK5Yg0wuzUFewUGgMt01yS5qklvvA8iA
 kJ0050KS0cOOnxxefKVvxCUGAnnFd28aKRdb6drfZ3vmArhAnfIjtODcx
 S6ucBTDF6DB+fkjB1a92iCiOEa7+ABdhp5GUI9Nvvnr8LscoaMuExkscg
 fHGmV3QhAtHlzrzQhd9dc319GbUCrAIgulw9AxgDm2oflwKCcpMbtkG/k
 F+58pkTWftyd4f10+w99mZUYVhm86oKxHmeBcdmk7t9oLuEGcZD9yWrtc g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10469"; a="384592448"
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="384592448"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2022 17:57:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,313,1654585200"; d="scan'208";a="792137901"
Received: from relo-linux-5.jf.intel.com ([10.165.21.154])
 by orsmga005.jf.intel.com with ESMTP; 13 Sep 2022 17:57:50 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 1/1] drm/i915/uc: Fix issues with overriding firmware files
Date: Tue, 13 Sep 2022 17:58:21 -0700
Message-Id: <20220914005821.3702446-2-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220914005821.3702446-1-John.C.Harrison@Intel.com>
References: <20220914005821.3702446-1-John.C.Harrison@Intel.com>
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

v2: Also remove ANSI colour codes that accidentally got left in an
error message in the original patch.

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
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index af425916cdf64..1169e2a09da24 100644
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
@@ -322,7 +330,7 @@ __uc_fw_auto_select(struct drm_i915_private *i915, struct intel_uc_fw *uc_fw)
 				continue;
 
 bad:
-			drm_err(&i915->drm, "\x1B[35;1mInvalid FW blob order: %s r%u %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
+			drm_err(&i915->drm, "Invalid FW blob order: %s r%u %s%d.%d.%d comes before %s r%u %s%d.%d.%d\n",
 				intel_platform_name(fw_blobs[i - 1].p), fw_blobs[i - 1].rev,
 				fw_blobs[i - 1].blob.legacy ? "L" : "v",
 				fw_blobs[i - 1].blob.major,
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

