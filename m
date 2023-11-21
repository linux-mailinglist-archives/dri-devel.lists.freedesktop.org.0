Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB3F7F3690
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 19:56:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B55E10E56D;
	Tue, 21 Nov 2023 18:56:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F7310E56D;
 Tue, 21 Nov 2023 18:55:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700592958; x=1732128958;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Tj3vwYuDpFx4lFlKoBdx5Xerip99JWiKOJkbLomiMOA=;
 b=FoexZ34vk6rhnxfLntQiEvcFMQ1oOvRUM3Z9WhwuAOLj4x1u5l/Pseau
 OLDk86jvsPtoKAB2iP4tUJ0sikf/996jgYmrjvl1wBFOP5VdlniZk6oig
 0oiy3XQ3KXQCaDKEH2YahJFEdZmLRDwbfG1JyY6TJMQx2fnmoWyA/8Uo2
 I+EPxLYwlCzr37mwgN82AI3uFRv2+l03sku77oFwgdU2rxf0V0KU0lVQV
 i1P9e7YyXnvtQRhpl596fA5ZBFM/utpa8LD5/4dt9PBPGsiiK+cYGWCug
 6ojpQR8GCqUIT7EwnQPkr66yvy5/frBZhOsTwse50WZ1P67iDx48uVjwG A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="5033876"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; 
   d="scan'208";a="5033876"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2023 10:55:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="857407287"
X-IronPort-AV: E=Sophos;i="6.04,216,1695711600"; d="scan'208";a="857407287"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by FMSMGA003.fm.intel.com with ESMTP; 21 Nov 2023 10:55:57 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/1] drm/i915/pxp: Add missing tag for Wa_14019159160
Date: Tue, 21 Nov 2023 10:55:56 -0800
Message-Id: <20231121185556.45770-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
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
Cc: John Harrison <john.c.harrison@Intel.com>, dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add missing tag for "Wa_14019159160 - Case 2" (for existing
PXP code that ensures run alone mode bit is set to allow
PxP-decryption.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_lrc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 7c367ba8d9dc..c758fe4906a5 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -863,8 +863,10 @@ static bool ctx_needs_runalone(const struct intel_context *ce)
 	bool ctx_is_protected = false;
 
 	/*
+	 * Wa_140191591606 - Case 2: mtl
 	 * On MTL and newer platforms, protected contexts require setting
-	 * the LRC run-alone bit or else the encryption will not happen.
+	 * the LRC run-alone bit or else the encryption/decryption will not happen.
+	 * NOTE: Case 2 only applies to PXP use-case of said workaround.
 	 */
 	if (GRAPHICS_VER_FULL(ce->engine->i915) >= IP_VER(12, 70) &&
 	    (ce->engine->class == COMPUTE_CLASS || ce->engine->class == RENDER_CLASS)) {

base-commit: dbdb47c227dc21b7bf98ada039bf42aac4b58b8b
-- 
2.39.0

