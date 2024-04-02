Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F3C8950C9
	for <lists+dri-devel@lfdr.de>; Tue,  2 Apr 2024 12:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50F6210FC47;
	Tue,  2 Apr 2024 10:50:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="k2r7sFyg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E18710FC4D
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Apr 2024 10:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712055014; x=1743591014;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=mTW/M3FkAOS4u3W4Ome2eepB7zQVtmTu9VNk4Qzlog8=;
 b=k2r7sFyg2Nuii/OToJi90/3ZI8lGPso0/Z0hPJJ8qaku6QNiKVOd1ZZ+
 WFJjhgqoAYjadoMW5wzJaaP2IjX/QzHgSz+vnuwpti2nUoUB9DCrxaij5
 WvPeuGY8SbdgMqwu3GhX5i/xFD0eLxkNSXeiyw96GaPBY1IAodK4FGm6k
 G1yCe0l0QZI+W9cRr8Jx2v0F3daN34Pi7CeUimHV2HRUAsCwmJ7QrYxR/
 jYpzlLcJNJMpcPAwK038YXnVvR4QtsxBiKOZuTGaZeIDhZLYGlsiwTiXf
 ZDj1P7BWETozEt7VUoKtVLQGKtzd0ElA72wgLsZXLgi0ObxmD1uhSLgSE g==;
X-CSE-ConnectionGUID: RPQH3DOlSsOCfJcTceQVTQ==
X-CSE-MsgGUID: 0ttkaWfARw60Si2ijAyo9w==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="17944438"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="17944438"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 03:50:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; d="scan'208";a="18002518"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Apr 2024 03:50:13 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 "Wachowski, Karol" <karol.wachowski@intel.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Subject: [PATCH 5/8] accel/ivpu: Improve clarity of MMU error messages
Date: Tue,  2 Apr 2024 12:49:26 +0200
Message-ID: <20240402104929.941186-6-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240402104929.941186-1-jacek.lawrynowicz@linux.intel.com>
References: <20240402104929.941186-1-jacek.lawrynowicz@linux.intel.com>
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

From: "Wachowski, Karol" <karol.wachowski@intel.com>

This patch improves readability and clarity of MMU error messages.
Previously, the error strings were somewhat confusing and could lead to
ambiguous interpretations, making it difficult to diagnose issues.

Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_mmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_mmu.c b/drivers/accel/ivpu/ivpu_mmu.c
index 91bd640655ab..2e46b322c450 100644
--- a/drivers/accel/ivpu/ivpu_mmu.c
+++ b/drivers/accel/ivpu/ivpu_mmu.c
@@ -278,7 +278,7 @@ static const char *ivpu_mmu_event_to_str(u32 cmd)
 	case IVPU_MMU_EVT_F_VMS_FETCH:
 		return "Fetch of VMS caused external abort";
 	default:
-		return "Unknown CMDQ command";
+		return "Unknown event";
 	}
 }
 
@@ -286,15 +286,15 @@ static const char *ivpu_mmu_cmdq_err_to_str(u32 err)
 {
 	switch (err) {
 	case IVPU_MMU_CERROR_NONE:
-		return "No CMDQ Error";
+		return "No error";
 	case IVPU_MMU_CERROR_ILL:
 		return "Illegal command";
 	case IVPU_MMU_CERROR_ABT:
-		return "External abort on CMDQ read";
+		return "External abort on command queue read";
 	case IVPU_MMU_CERROR_ATC_INV_SYNC:
 		return "Sync failed to complete ATS invalidation";
 	default:
-		return "Unknown CMDQ Error";
+		return "Unknown error";
 	}
 }
 
-- 
2.43.2

