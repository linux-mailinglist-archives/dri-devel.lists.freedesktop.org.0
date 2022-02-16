Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A112C4B8FF8
	for <lists+dri-devel@lfdr.de>; Wed, 16 Feb 2022 19:15:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 826D910E65A;
	Wed, 16 Feb 2022 18:15:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE6410E651;
 Wed, 16 Feb 2022 18:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645035351; x=1676571351;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XSaHcrYQhg2MfkEYhGe6x+1xWaV4z82MOiGzD4XpFQI=;
 b=hoSnZ+ieKZCoba/0HovIUF3raxu3vcrn72cQRvNVYHaTOnHJueySXjq5
 EEtZIIfNv9dRqi0tBnjLrTC47dsVHjOsWCVv1yFkQHyYdBd8Bawm0+dKm
 xP4FPgw5vpDys6od4wdKLdFdHUMRQ/EPDhHYM7V5NPCAXqVM69b0L4Lam
 TGL/AtwpMPqgf+xKc8K8hiGGJOHEdQ89x5JyPUOlrp4Lc3EV3Zq2DDh5Q
 YC8KZY+hMipcSv6jpYNHCf4yChgWe1xYYTEnu4n4PezFUtcH66zHaYaI7
 KK9J53VbKln4ukPkho2/A5lfjqcXR1XtJb25wXNycK0ZfDWS12xjht4mO w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="249523667"
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="249523667"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2022 10:15:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; d="scan'208";a="487271250"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga003.jf.intel.com with ESMTP; 16 Feb 2022 10:15:28 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc/slpc: Correct the param count for unset param
Date: Wed, 16 Feb 2022 10:15:04 -0800
Message-Id: <20220216181504.7155-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.34.0
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SLPC unset param H2G only needs one parameter - the id of the
param.

Fixes: 025cb07bebfa ("drm/i915/guc/slpc: Cache platform frequency limits")

Suggested-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index 13b27b8ff74e..ba21ace973da 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -110,7 +110,7 @@ static int guc_action_slpc_unset_param(struct intel_guc *guc, u8 id)
 {
 	u32 request[] = {
 		GUC_ACTION_HOST2GUC_PC_SLPC_REQUEST,
-		SLPC_EVENT(SLPC_EVENT_PARAMETER_UNSET, 2),
+		SLPC_EVENT(SLPC_EVENT_PARAMETER_UNSET, 1),
 		id,
 	};
 
-- 
2.34.0

