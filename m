Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38D268C6DE3
	for <lists+dri-devel@lfdr.de>; Wed, 15 May 2024 23:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C47B10EC27;
	Wed, 15 May 2024 21:43:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G+yjjgXW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1243510E3CA;
 Wed, 15 May 2024 21:43:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715809380; x=1747345380;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q4BKRUonUrFhgjMaw6tHgpgzacmRW8CrOqMwqtPHYyY=;
 b=G+yjjgXWb/E/GsWod/UB0e61XWXTUwCDRiHvXDXkeW2/tdHptk/XyMIz
 rg3Aj9kAlbESKYdrcc6/evnxh1nt2OwyEjcv3v6fPSMO0ZsxZ+N/F4UTb
 f96YoT8tB/IA3itQRSLUzfoxqdR+HUkTCn3WW9OyBYE69yOEOVDaQu7vV
 tpybgii3gmfPDD3WD8WqFnQ4HAoztNFGm8Z1lY/5WmQAqtHiz+Q9JfUrD
 OgNkCOVCcaxyWKFWX+EHyv9F3LSPGcH2tWRidQayrS/s3wxaPRyprI6Rw
 /2Yy91NP161bRn5L2vgCsV1XHFwFEoLOQmRPp5lmgm8sM2dokZw8oOMXl g==;
X-CSE-ConnectionGUID: UCEEsVeuTaCOH7m6vJOPyg==
X-CSE-MsgGUID: NvK2ElagRDuUze/AbdvmDg==
X-IronPort-AV: E=McAfee;i="6600,9927,11074"; a="11739172"
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="11739172"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 14:43:00 -0700
X-CSE-ConnectionGUID: 5qAc8ja5QGK79U4dWZGqSA==
X-CSE-MsgGUID: JmEGZmPCS96gRCrnrwGDEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,162,1712646000"; d="scan'208";a="35651145"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2024 14:42:59 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: <intel-xe@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 dri-devel@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v4 7/8] drm/xe: Add helper to return any available hw engine
Date: Wed, 15 May 2024 14:42:57 -0700
Message-ID: <20240515214258.59209-8-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240515214258.59209-1-lucas.demarchi@intel.com>
References: <20240515214258.59209-1-lucas.demarchi@intel.com>
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

Get the first available engine from a gt, which helps in the case any
engine serves as a context, like when reading RING_TIMESTAMP.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/xe/xe_gt.c | 11 +++++++++++
 drivers/gpu/drm/xe/xe_gt.h |  7 +++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
index 5194a3d38e76..3432fef56486 100644
--- a/drivers/gpu/drm/xe/xe_gt.c
+++ b/drivers/gpu/drm/xe/xe_gt.c
@@ -833,3 +833,14 @@ struct xe_hw_engine *xe_gt_any_hw_engine_by_reset_domain(struct xe_gt *gt,
 
 	return NULL;
 }
+
+struct xe_hw_engine *xe_gt_any_hw_engine(struct xe_gt *gt)
+{
+	struct xe_hw_engine *hwe;
+	enum xe_hw_engine_id id;
+
+	for_each_hw_engine(hwe, gt, id)
+		return hwe;
+
+	return NULL;
+}
diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
index ad3fd31e0a41..a53f01362d94 100644
--- a/drivers/gpu/drm/xe/xe_gt.h
+++ b/drivers/gpu/drm/xe/xe_gt.h
@@ -67,6 +67,13 @@ void xe_gt_remove(struct xe_gt *gt);
 struct xe_hw_engine *
 xe_gt_any_hw_engine_by_reset_domain(struct xe_gt *gt, enum xe_engine_class class);
 
+/**
+ * xe_gt_any_hw_engine - scan the list of engines and return the
+ * first available
+ * @gt: GT structure
+ */
+struct xe_hw_engine *xe_gt_any_hw_engine(struct xe_gt *gt);
+
 struct xe_hw_engine *xe_gt_hw_engine(struct xe_gt *gt,
 				     enum xe_engine_class class,
 				     u16 instance,
-- 
2.43.0

