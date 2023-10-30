Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6697DC344
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 00:46:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9865610E3C2;
	Mon, 30 Oct 2023 23:46:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01B6E10E109;
 Mon, 30 Oct 2023 23:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698709583; x=1730245583;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Zr1IejYKSMjknqhlaLzzyOk+L0t68BZJf/xvVL8fZgc=;
 b=YzKZ1nCv+eebO2aQ9/bBwk4MvPfPXyJdP37hYBbcjkeLEPbyOFRvwKRv
 RS8cg2Pfs0utEkIzvz+0R186vN+nJSEiVA3TXGV/3aENKgwzoFk2jH5yq
 wDtTdRvKd/YGmrRDZpDCpjUZvNO7wFL5ZEqGxh9ImW5OYLC4AGVYW04cm
 ru0ACAT1ig2khzX6NhJnpGvJqjBWI8x3vxCJTkBWKoj/5rQzZbltLAMmy
 jGsmXT2FqKToR8aQ949Zw4rBihcObB+TEy5Ue8Jd6/qqeIPJMOoMFkKje
 SMol6vD7rejT1BoUWMxWKdAdsmh2uDB1fDYzB6+midBR7X8XWst1lyH11 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="391058847"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; d="scan'208";a="391058847"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2023 16:46:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10879"; a="710256920"
X-IronPort-AV: E=Sophos;i="6.03,264,1694761200"; d="scan'208";a="710256920"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga003.jf.intel.com with ESMTP; 30 Oct 2023 16:46:22 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Initialize residency registers earlier
Date: Mon, 30 Oct 2023 16:45:27 -0700
Message-Id: <20231030234527.2285179-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If we skip RC6 init, residency registers do not get initialized,
leading to incorrect drpc debug output. Also release the wakeref
since we skip intel_rc6_enable() entirely when rc6_supported is false.

Fixes: 78d0b4552c37 ("drm/i915/gt: Use RC6 residency types as arguments to residency functions")
Suggested-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_rc6.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
index 7090e4be29cb..58dc0dab9b64 100644
--- a/drivers/gpu/drm/i915/gt/intel_rc6.c
+++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
@@ -608,11 +608,13 @@ void intel_rc6_init(struct intel_rc6 *rc6)
 	/* Disable runtime-pm until we can save the GPU state with rc6 pctx */
 	rpm_get(rc6);
 
-	if (!rc6_supported(rc6))
-		return;
-
 	rc6_res_reg_init(rc6);
 
+	if (!rc6_supported(rc6)) {
+		rpm_put(rc6);
+		return;
+	}
+
 	if (IS_CHERRYVIEW(i915))
 		err = chv_rc6_init(rc6);
 	else if (IS_VALLEYVIEW(i915))
-- 
2.38.1

