Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8054DBB4A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 00:46:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7629B10EAAC;
	Wed, 16 Mar 2022 23:46:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57C8410EAAE;
 Wed, 16 Mar 2022 23:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647474371; x=1679010371;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dDHNidMA0Vac0wlN4mnDQJ8h975e9wTOouqaESuKBqs=;
 b=E52nwFHUuwOxlrTBjLQSTNW3IluK08YZsKiE9Lho+2my1KfHJsQ2lS2Q
 coisxZ5aEAkechTqL5Zomi8dSv3AEQGlV9FgqKfhN1EbBCLUxv6KnVnde
 MBtOpJHcuHeOgVZi5Hpfp+MW3ZnQ3CF9Qovk6CILC27n6r59OD2m9Kbeh
 5C4WJ64QHvTkA/lcDQzw17rk5sylk+JyoHowzIhJxoUFlegm0f580W//H
 f7OaL4rMQUXRAEXvmWLDO+kdzjA2G1VfHROc1dffeKsh2biPLR9ke+NFY
 PR9V9PRu3dxr0FweVCchM7Q5sarC0JtqKN8dRh32GfE69ES4FFSCBslsv g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="256468488"
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; d="scan'208";a="256468488"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 16:46:10 -0700
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; d="scan'208";a="821038539"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 16:46:09 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915: Add logical mapping for video decode engines
Date: Wed, 16 Mar 2022 16:45:38 -0700
Message-Id: <20220316234538.434357-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316234538.434357-1-lucas.demarchi@intel.com>
References: <20220316234538.434357-1-lucas.demarchi@intel.com>
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

Add logical mapping for VDBOXs. This mapping is required for
split-frame workloads, which otherwise fail with

	00000000-F8C53528: [GUC] 0441-INVALID_ENGINE_SUBMIT_MASK

... if the application is using the logical id to reorder the engines and
then using it for the batch buffer submission. It's not a big problem on
media version 11 and 12 as they have only 2 instances of VCS and the
logical to physical mapping is monotonically increasing - if the
application is not using the logical id.

Changing it for the previous platforms allows the media driver
implementation for the next ones (12.50 and above) to be the same,
checking the logical id. It should also not introduce any bug for the
old versions of userspace not checking the id.

The mapping added here is the complete map needed by XEHPSDV. Previous
platforms with only 2 instances will just use a partial map and should
still work.

Cc: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
[ Extend the mapping to media versions 11 and 12 and give proper
  justification in the commit message why ]
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 8080479f27aa..afa2e61cf729 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -731,12 +731,24 @@ static void populate_logical_ids(struct intel_gt *gt, u8 *logical_ids,
 
 static void setup_logical_ids(struct intel_gt *gt, u8 *logical_ids, u8 class)
 {
-	int i;
-	u8 map[MAX_ENGINE_INSTANCE + 1];
+	/*
+	 * Logical to physical mapping is needed for proper support
+	 * to split-frame feature.
+	 */
+	if (MEDIA_VER(gt->i915) >= 11 && class == VIDEO_DECODE_CLASS) {
+		static const u8 map[] = { 0, 2, 4, 6, 1, 3, 5, 7 };
 
-	for (i = 0; i < MAX_ENGINE_INSTANCE + 1; ++i)
-		map[i] = i;
-	populate_logical_ids(gt, logical_ids, class, map, ARRAY_SIZE(map));
+		populate_logical_ids(gt, logical_ids, class,
+				     map, ARRAY_SIZE(map));
+	} else {
+		int i;
+		u8 map[MAX_ENGINE_INSTANCE + 1];
+
+		for (i = 0; i < MAX_ENGINE_INSTANCE + 1; ++i)
+			map[i] = i;
+		populate_logical_ids(gt, logical_ids, class,
+				     map, ARRAY_SIZE(map));
+	}
 }
 
 /**
-- 
2.35.1

