Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A774ACA2D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 21:11:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 118DE10F9D4;
	Mon,  7 Feb 2022 20:11:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C675F10F8B8;
 Mon,  7 Feb 2022 20:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644264692; x=1675800692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n5RKJcp81B88J6tTgVRUp4ooYKldFrNbNiKg6W8kZms=;
 b=g2x1+8IfH9hMUDV2C4vWmNLpz2TGN1N8LX7trr9+zyOafzxq0u+nPe1O
 eqP2PuiFLtyhoxJ3rM45qXLkuq/vKo04qunlFXV4wsNAP2Dx9/0DtF+Ur
 lcU/pHyXA0ls1Iv/UXN1oFYE69a2XPIYBXjCUiloaAh9IWCVGVgiEHPHJ
 EglMVPWMx+O6RL9KDMmcbuZn2Z/JYu+DxLZuTB88s7bXJZ4hhpXKiS4YB
 9w568mjbSmZriFuEdCBrVz0Zh5I4ixZrfdLXQTIJyZ0VBm4Dk6oNb+sP2
 7IKLVxPOhsbhLz5utjs5+7V4O0wwtP1apQAAEb718mY2o+U++s+4BU1DO w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="229448816"
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="229448816"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 12:11:32 -0800
X-IronPort-AV: E=Sophos;i="5.88,350,1635231600"; d="scan'208";a="770754206"
Received: from vdixit-mobl.amr.corp.intel.com (HELO mvcheng-desk2.intel.com)
 ([10.209.60.7])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 12:11:32 -0800
From: Michael Cheng <michael.cheng@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 3/6] drm/i915/gt: Re-work reset_csb
Date: Mon,  7 Feb 2022 12:11:24 -0800
Message-Id: <20220207201127.648624-4-michael.cheng@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220207201127.648624-1-michael.cheng@intel.com>
References: <20220207201127.648624-1-michael.cheng@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, michael.cheng@intel.com,
 balasubramani.vivekanandan@intel.com, wayne.boyer@intel.com,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use drm_clflush_virt_range instead of directly invoking clflush. This
will prevent compiler errors when building for non-x86 architectures.

v2(Michael Cheng): Remove extra clflush

v3(Michael Cheng): Remove memory barrier since drm_clflush_virt_range
		   takes care of it.

Signed-off-by: Michael Cheng <michael.cheng@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
index 28f2581d3046..cc561cfae808 100644
--- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
+++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
@@ -2944,9 +2944,8 @@ reset_csb(struct intel_engine_cs *engine, struct i915_request **inactive)
 {
 	struct intel_engine_execlists * const execlists = &engine->execlists;
 
-	mb(); /* paranoia: read the CSB pointers from after the reset */
-	clflush(execlists->csb_write);
-	mb();
+	drm_clflush_virt_range(execlists->csb_write,
+			sizeof(execlists->csb_write));
 
 	inactive = process_csb(engine, inactive); /* drain preemption events */
 
-- 
2.25.1

