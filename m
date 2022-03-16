Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CB34DBB1A
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 00:32:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42DB710EA12;
	Wed, 16 Mar 2022 23:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CEE010E66F;
 Wed, 16 Mar 2022 23:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647473523; x=1679009523;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vh55hOHr99q70pKfX8/sP2kXZBpsbzxmbHdTWgpeypw=;
 b=OrBzKV+15bALlnkbEoxt5xEZKYdSPQReqjVAm9wC6vtZc0UjuDrb/c3z
 356PqkFFky59d7MCBKb8hnxkyVnRR57iWDHZDoVy2PhlzHHPRv6/07u/C
 GlTJyaeTyBubMtqxqHa6rN3xAmjSrvPdzbI29izNPfDpGaOj10xFeHnIN
 8JWjagk9zkUzOOvcPU5gb+zA5tlZCrkzb+KYfpxHfwUT1O1u2vrpW0vXG
 o+rTcMihrrJqZ+6eegiYE5JEtMEfMC4Am1f/C/5cEvLtKupKFKJYMCFFJ
 57wRwCXgp0ADdGtROGa3r7JPTJT4GRm+BrnSFU9O9aC1o0KH/WyH59maQ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10288"; a="237343408"
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; d="scan'208";a="237343408"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 16:32:01 -0700
X-IronPort-AV: E=Sophos;i="5.90,187,1643702400"; d="scan'208";a="613816764"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 16:32:01 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/3] INTEL_DII: drm/i915/pvc: Add PVC logical mapping for
 VDBOXs
Date: Wed, 16 Mar 2022 16:31:47 -0700
Message-Id: <20220316233148.434177-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316233148.434177-1-lucas.demarchi@intel.com>
References: <20220316233148.434177-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
X-Git-Pile: INTEL_DII
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
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matthew Brost <matthew.brost@intel.com>

PVC has non-standard logical mapping for the VDBOXs, add support for the
correct mapping.

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 7a12192ff1d51..7f9cff011561c 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -925,7 +925,13 @@ static void setup_logical_ids(struct intel_gt *gt, u8 *logical_ids, u8 class)
 	 * Logical to physical mapping is needed for proper support
 	 * to split-frame feature.
 	 */
-	if (MEDIA_VER_FULL(gt->i915) >= IP_VER(12, 50) &&
+	if (IS_PONTEVECCHIO(gt->i915) && class == VIDEO_DECODE_CLASS) {
+		static const u8 map[] = { 0, 2, 1 };
+
+		populate_logical_ids(gt, logical_ids, class,
+				     map, ARRAY_SIZE(map));
+
+	} else if (MEDIA_VER_FULL(gt->i915) >= IP_VER(12, 50) &&
 	    class == VIDEO_DECODE_CLASS) {
 		static const u8 map[] = { 0, 2, 4, 6, 1, 3, 5, 7 };
 
