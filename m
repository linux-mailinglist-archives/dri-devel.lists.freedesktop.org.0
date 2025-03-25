Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B97A6FA98
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 13:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F75E10E544;
	Tue, 25 Mar 2025 12:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LPY+6Bhu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC3210E206;
 Tue, 25 Mar 2025 12:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742904108; x=1774440108;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=urBxdLCO9dgOqWgWTaVsenH58Dakyaq8qm220jHHPeQ=;
 b=LPY+6BhuQL7O93ySfa1HmLCBdvzas7LqQLgizyCYQdXVUB3Hemuub8JA
 ON+UlWHzb0M445GGvjcrigO3rojQRiAhQ8iQWeGawRwLSn+Wg4nzn3Ait
 BCm4/BHhVXmFO1K0gqiD1S2UPYakbu5G3RuNcxWqloY4qpwaDWAzqX7Ll
 6DHjlM6gt+zxLnVKGXWX6bGHwE+SC/7gXRskoBBmUOLTnArbljRuYwzRk
 SDZIJw2xVnTgFMiqMbBCsFs7+FL4eCvTbCAIuRFIlLjls2FsCUkcCZKj9
 wehTyiYr8ens6Pdk6YEl3Goaxt+EXenGWDempdclR2Zul+OhX96jDkIAF g==;
X-CSE-ConnectionGUID: XtZyMjziQoeTWMvMKXUELg==
X-CSE-MsgGUID: ZBfYvswOTBW1b3Xkhl67gw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="61537566"
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="61537566"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 05:01:47 -0700
X-CSE-ConnectionGUID: 46zTmrDBRL+AQX9cTz53jQ==
X-CSE-MsgGUID: SeZUqG10RaqiqnmxCRv3yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,274,1736841600"; d="scan'208";a="129033562"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.149])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2025 05:01:45 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Arshad Mehmood <arshad.mehmood@intel.com>
Subject: [PATCH] drm/i915/gt: Avoid duplicating CCS mode workaround
Date: Tue, 25 Mar 2025 13:01:37 +0100
Message-ID: <20250325120137.1302748-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.47.2
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

When generating workarounds for the CCS engine, specifically for
setting the CCS mode related to compute load balancing, the
function 'ccs_engine_wa_mode()' is called twice: once for the
render engine and once for the compute engine.

Add a check to ensure the engine class is compute before applying
the workaround to avoid redundant programming.

Suggested-by: Arshad Mehmood <arshad.mehmood@intel.com>
Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index 116683ebe074..37251546b755 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -2897,7 +2897,9 @@ engine_init_workarounds(struct intel_engine_cs *engine, struct i915_wa_list *wal
 	 */
 	if (engine->flags & I915_ENGINE_FIRST_RENDER_COMPUTE) {
 		general_render_compute_wa_init(engine, wal);
-		ccs_engine_wa_mode(engine, wal);
+
+		if (engine->class == COMPUTE_CLASS)
+			ccs_engine_wa_mode(engine, wal);
 	}
 
 	if (engine->class == COMPUTE_CLASS)
-- 
2.47.2

