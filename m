Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8466EA0E4
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 03:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1FFE10E308;
	Fri, 21 Apr 2023 01:15:33 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8F210E12F;
 Fri, 21 Apr 2023 01:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682039732; x=1713575732;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RHjjFOS8XLzo/PUCYz7+9LKMD75NgmKtYuy+pAI0Zjc=;
 b=G0XfGR1ixr+sCjeM/F13qxb4Lt2RJwxeppjWoXQ5a7EptT3zwi3B34Sw
 f8LHFUYs40k60SkPSXSp2GK+4hwZstxEXq+221YEVRgZe2UOzRXWlWdo4
 scKtmZpKYjtOUPxZ833idx9qkENTfDfnEbqHXtNQ8n6tLs6BzKSk56ErM
 WKdsE3Rmat+jNZcjjvNMDLd4lQT4hrV/hmZ36Ondz2RdqdbrRH9MOWycL
 3S+iXVQqgJkIOHCY/x4qmXHFK2Gw+8wWGYZhNgy7NpfBzFSUnD8HYiNFm
 hrrYPazHSBUJCKmoElhIxWewYX/8mVUtaDd5hw6AgH7erVIzB0LSD1IME A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="343380940"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="343380940"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 18:15:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="692114493"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="692114493"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga002.jf.intel.com with ESMTP; 20 Apr 2023 18:15:31 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 5/6] drm/i915/uc: Reject duplicate entries in firmware table
Date: Thu, 20 Apr 2023 18:15:24 -0700
Message-Id: <20230421011525.3282664-6-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230421011525.3282664-1-John.C.Harrison@Intel.com>
References: <20230421011525.3282664-1-John.C.Harrison@Intel.com>
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

It was noticed that duplicate entries in the firmware table could cause
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
index eb52e8db9ae0b..bc4011d55667c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -319,7 +319,7 @@ static bool validate_fw_table_type(struct drm_i915_private *i915, enum intel_uc_
 {
 	const struct uc_fw_platform_requirement *fw_blobs;
 	u32 fw_count;
-	int i;
+	int i, j;
 
 	if (type >= ARRAY_SIZE(blobs_all)) {
 		drm_err(&i915->drm, "No blob array for %s\n", intel_uc_fw_type_repr(type));
@@ -334,6 +334,27 @@ static bool validate_fw_table_type(struct drm_i915_private *i915, enum intel_uc_
 
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
@@ -377,8 +398,8 @@ static bool validate_fw_table_type(struct drm_i915_private *i915, enum intel_uc_
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

