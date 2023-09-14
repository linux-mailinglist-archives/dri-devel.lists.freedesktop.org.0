Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E26E7A1104
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 00:32:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E01CF10E59F;
	Thu, 14 Sep 2023 22:31:55 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80F2710E59B;
 Thu, 14 Sep 2023 22:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694730713; x=1726266713;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jYTppX34GjYQhFtzr5caeabEuQJVfGDdAzV7lGZ26/4=;
 b=JSkwdPaMsv5LSI8ew5PVohX0HK0ed0dmTk88tG7jl/kOFCdNqOFN28s8
 zB7bLX7Z4GL3KK6rGT4zDwAfx+Qi3+MZHjPJ3An/wjapqBLqdUt6taeY4
 5LysAYebbgQobbbLEDIq6OlRTytolz293E1ljosgM3OnEJDHfIkMq7fh1
 VNZyiv3j0phdsmz6aaDKltA3zkg2SkjXUS1QUcUj7Otmw+KCtnbPAjxmS
 9rfrUtHt3jJXiSkBepwsbH/ynTXOZ/zKzKWaKid549IbaHm4OFfgRIlIK
 WuWQdOo9QBLQdF54XwZbX0LgG0wDSnMEm2OFLGdA1UafODrlMMJj98ZqC w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="382913335"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; d="scan'208";a="382913335"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Sep 2023 15:29:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10833"; a="744717709"
X-IronPort-AV: E=Sophos;i="6.02,147,1688454000"; d="scan'208";a="744717709"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga002.jf.intel.com with ESMTP; 14 Sep 2023 15:29:11 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 2/2] drm/i915/guc: Enable WA 14018913170
Date: Thu, 14 Sep 2023 15:28:13 -0700
Message-ID: <20230914222813.278774-3-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914222813.278774-1-John.C.Harrison@Intel.com>
References: <20230914222813.278774-1-John.C.Harrison@Intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

The GuC handles the WA, the KMD just needs to set the flag to enable
it on the appropriate platforms.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c      | 6 ++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc.h      | 1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h | 1 +
 3 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 27df41c53b890..3f3df1166b860 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -319,6 +319,12 @@ static u32 guc_ctl_wa_flags(struct intel_guc *guc)
 	if (!RCS_MASK(gt))
 		flags |= GUC_WA_RCS_REGS_IN_CCS_REGS_LIST;
 
+	/* Wa_14018913170 */
+	if (GUC_FIRMWARE_VER(guc) >= MAKE_GUC_VER(70, 7, 0)) {
+		if (IS_DG2(gt->i915) || IS_METEORLAKE(gt->i915) || IS_PONTEVECCHIO(gt->i915))
+			flags |= GUC_WA_ENABLE_TSC_CHECK_ON_RC6;
+	}
+
 	return flags;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
index 6c392bad29c19..818c8c146fd47 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
@@ -295,6 +295,7 @@ struct intel_guc {
 #define MAKE_GUC_VER(maj, min, pat)	(((maj) << 16) | ((min) << 8) | (pat))
 #define MAKE_GUC_VER_STRUCT(ver)	MAKE_GUC_VER((ver).major, (ver).minor, (ver).patch)
 #define GUC_SUBMIT_VER(guc)		MAKE_GUC_VER_STRUCT((guc)->submission_version)
+#define GUC_FIRMWARE_VER(guc)		MAKE_GUC_VER_STRUCT((guc)->fw.file_selected.ver)
 
 static inline struct intel_guc *log_to_guc(struct intel_guc_log *log)
 {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
index b4d56eccfb1f0..123ad75d2eb28 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h
@@ -100,6 +100,7 @@
 #define   GUC_WA_HOLD_CCS_SWITCHOUT	BIT(17)
 #define   GUC_WA_POLLCS			BIT(18)
 #define   GUC_WA_RCS_REGS_IN_CCS_REGS_LIST	BIT(21)
+#define   GUC_WA_ENABLE_TSC_CHECK_ON_RC6	BIT(22)
 
 #define GUC_CTL_FEATURE			2
 #define   GUC_CTL_ENABLE_SLPC		BIT(2)
-- 
2.41.0

