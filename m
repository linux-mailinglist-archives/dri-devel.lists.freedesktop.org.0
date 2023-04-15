Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E5916E2E11
	for <lists+dri-devel@lfdr.de>; Sat, 15 Apr 2023 02:57:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8984510EEF4;
	Sat, 15 Apr 2023 00:57:26 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3F4E10EEE8;
 Sat, 15 Apr 2023 00:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681520241; x=1713056241;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Pe11YMconuswnEFoezXOEcJgX8y24yJ369pX1TBrQQk=;
 b=HQnfYzK92EUUH5ruC0kUWrNoF1WlJDftYakOF3XFrNb8/E8w3VPCB3gS
 gyeNvdnaUKcad/jabrRYbyag6VXFExAlFMnSGYLYKw9iSOMyaObsuvJ3v
 rAql1QPfGhYF9BP0BEeWl/qXFi1i+jZB6eIDKf4fRorQCi7Z1pzcgBMIx
 QygrhZycEzje1HRKzxVjegUpI1ncBRhgZ68NYB0pUQib3bB7cFxBOY2J5
 nU54sKz8/ghzMq2JM3XKumk+yEu3BrRn4drks9qJS7pewomI5iNzKXSAv
 +Zzbger+80HtIAFDbLxK01ovlPAgdLhyIqmwMiZCiEtlyLF5wzNyqhx/u g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="372471784"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="372471784"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2023 17:57:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10680"; a="722643213"
X-IronPort-AV: E=Sophos;i="5.99,198,1677571200"; d="scan'208";a="722643213"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga001.jf.intel.com with ESMTP; 14 Apr 2023 17:57:19 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 5/5] drm/i915/uc: Reject doplicate entries in firmware table
Date: Fri, 14 Apr 2023 17:57:06 -0700
Message-Id: <20230415005706.4135485-6-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230415005706.4135485-1-John.C.Harrison@Intel.com>
References: <20230415005706.4135485-1-John.C.Harrison@Intel.com>
MIME-Version: 1.0
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

It was noticed that duplicte entries in the firmware table could cause
an infinite loop in the firmware loading code if that entry failed to
load. Duplicate entries are a bug anyway and so should never happen.
Ensure they don't by tweaking the table validation code to reject
duplicates.

For full m/m/p files, that can be done by simply tweaking the patch
level check to reject matching values. For reduced version entries,
the filename itself must be compared.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c | 27 +++++++++++++++++++++---
 1 file changed, 24 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index c589782467265..44829247ef6bc 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -319,7 +319,7 @@ static void validate_fw_table_type(struct drm_i915_private *i915, enum intel_uc_
 {
 	const struct uc_fw_platform_requirement *fw_blobs;
 	u32 fw_count;
-	int i;
+	int i, j;
 
 	if (type >= ARRAY_SIZE(blobs_all)) {
 		drm_err(&i915->drm, "No blob array for %s\n", intel_uc_fw_type_repr(type));
@@ -334,6 +334,27 @@ static void validate_fw_table_type(struct drm_i915_private *i915, enum intel_uc_
 
 	/* make sure the list is ordered as expected */
 	for (i = 1; i < fw_count; i++) {
+		/* Versionless file names must be unique per platform: */
+		for (j = i + 1; j < fw_count; j++) {
+			/* Same platform? */
+			if (fw_blobs[i].p != fw_blobs[j].p)
+				continue;
+
+			if (fw_blobs[i].blob.path != fw_blobs[j].blob.path)
+				continue;
+
+			drm_err(&i915->drm, "Diplicaate %s blobs: %s r%u %s%d.%d.%d [%s] matches %s r%u %s%d.%d.%d [%s]\n",
+				intel_uc_fw_type_repr(type),
+				intel_platform_name(fw_blobs[j].p), fw_blobs[j].rev,
+				fw_blobs[j].blob.legacy ? "L" : "v",
+				fw_blobs[j].blob.major, fw_blobs[j].blob.minor,
+				fw_blobs[j].blob.patch, fw_blobs[j].blob.path,
+				intel_platform_name(fw_blobs[i].p), fw_blobs[i].rev,
+				fw_blobs[i].blob.legacy ? "L" : "v",
+				fw_blobs[i].blob.major, fw_blobs[i].blob.minor,
+				fw_blobs[i].blob.patch, fw_blobs[i].blob.path);
+		}
+
 		/* Next platform is good: */
 		if (fw_blobs[i].p < fw_blobs[i - 1].p)
 			continue;
@@ -377,8 +398,8 @@ static void validate_fw_table_type(struct drm_i915_private *i915, enum intel_uc_
 		if (fw_blobs[i].blob.minor != fw_blobs[i - 1].blob.minor)
 			goto bad;
 
-		/* Patch versions must be in order: */
-		if (fw_blobs[i].blob.patch <= fw_blobs[i - 1].blob.patch)
+		/* Patch versions must be in order and unique: */
+		if (fw_blobs[i].blob.patch < fw_blobs[i - 1].blob.patch)
 			continue;
 
 bad:
-- 
2.39.1

