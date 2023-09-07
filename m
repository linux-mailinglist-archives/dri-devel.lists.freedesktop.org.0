Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1C0B79713C
	for <lists+dri-devel@lfdr.de>; Thu,  7 Sep 2023 11:28:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA4210E79C;
	Thu,  7 Sep 2023 09:28:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF4910E7A3;
 Thu,  7 Sep 2023 09:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694078927; x=1725614927;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=IpuLih3l2hEEKORnoksawfWXf/6TMFt+obTxVyFVcIE=;
 b=L5N3AVt3QPaxWtiESrjtz663Yke1UcjahytqOtO2b+o0EYrq1foSzOLV
 ha+N5mwOkFqnsB2gWeDMTXSA4Qk8z72vqhVFjnek6RcvhR5LhDMlZwf1m
 NSJM8EAy7jb6GD/n94qA+qDkjo99RAfAkCfn3CH8/ED4E5aQADV2NAxXi
 /kOavZowDo0JOs4pVWnFcmTHHeszKBmDxAo6OpQoj3FnSuYh1w89jefh5
 T/qcPtBVvSWTfjX48UHELSuMBI1t+WeAlb2RWCftz9JXbWuvo9t5QkuJl
 Xp+AW+qH32ICsr/COMJfzbkBhNQG+e+6s8z5NgHfYao3Qm79HOcwTh9dA Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="443690266"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="443690266"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 02:28:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10825"; a="741958752"
X-IronPort-AV: E=Sophos;i="6.02,234,1688454000"; d="scan'208";a="741958752"
Received: from iraduica-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.61.21])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2023 02:28:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/6] drm/edid: use a temp variable for sads to drop one level
 of dereferences
Date: Thu,  7 Sep 2023 12:28:22 +0300
Message-Id: <6692fbce07fbc03ad8785e6e6fe81fad4354e657.1694078430.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1694078430.git.jani.nikula@intel.com>
References: <cover.1694078430.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's arguably easier on the eyes, and drops a set of parenthesis too.

Cc: Mitul Golani <mitulkumar.ajitkumar.golani@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 2025970816c9..fcdc2c314cde 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5583,7 +5583,7 @@ static void drm_edid_to_eld(struct drm_connector *connector,
 }
 
 static int _drm_edid_to_sad(const struct drm_edid *drm_edid,
-			    struct cea_sad **sads)
+			    struct cea_sad **psads)
 {
 	const struct cea_db *db;
 	struct cea_db_iter iter;
@@ -5592,19 +5592,21 @@ static int _drm_edid_to_sad(const struct drm_edid *drm_edid,
 	cea_db_iter_edid_begin(drm_edid, &iter);
 	cea_db_iter_for_each(db, &iter) {
 		if (cea_db_tag(db) == CTA_DB_AUDIO) {
+			struct cea_sad *sads;
 			int j;
 
 			count = cea_db_payload_len(db) / 3; /* SAD is 3B */
-			*sads = kcalloc(count, sizeof(**sads), GFP_KERNEL);
-			if (!*sads)
+			sads = kcalloc(count, sizeof(*sads), GFP_KERNEL);
+			*psads = sads;
+			if (!sads)
 				return -ENOMEM;
 			for (j = 0; j < count; j++) {
 				const u8 *sad = &db->data[j * 3];
 
-				(*sads)[j].format = (sad[0] & 0x78) >> 3;
-				(*sads)[j].channels = sad[0] & 0x7;
-				(*sads)[j].freq = sad[1] & 0x7F;
-				(*sads)[j].byte2 = sad[2];
+				sads[j].format = (sad[0] & 0x78) >> 3;
+				sads[j].channels = sad[0] & 0x7;
+				sads[j].freq = sad[1] & 0x7F;
+				sads[j].byte2 = sad[2];
 			}
 			break;
 		}
-- 
2.39.2

