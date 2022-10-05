Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E44D85F4D08
	for <lists+dri-devel@lfdr.de>; Wed,  5 Oct 2022 02:26:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A92EF10E40D;
	Wed,  5 Oct 2022 00:26:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D17510E40D;
 Wed,  5 Oct 2022 00:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664929586; x=1696465586;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FqLtMk27FHWf8jxUtfH3dcOGSxJpeBEAqaxV+Jvsvrs=;
 b=fNj3uAtAgdFMNUcYxU3RL3kHTxuTw2nd2v9AMP7VMtynd9zig450BosI
 l850dged5ck2ZGpym2O2ZlgDRV6RAo/Rvj2iYUs9gUyuQRlYcM4x6JGyl
 xDAdJyEyIjH6dlAAhT0FAdRh73RjF27lPoruvavwOCNPbHupecYQsn+7J
 nfU1wSLke8um/S7Rzy1FJt33BSTHgP50rDTWx9iNj3izjoEgsSreb31HS
 CvCjJohCLdxEulyF8/TVItJo5oVMCkxoTh6tqv7vU2mmlFXezWYEnL0Tf
 BoQeUjhmkMeiDb/46TuxtGdFkcX1fkTcHR943IGBP1RHaWh2FhumqmN7a g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="301779902"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; d="scan'208";a="301779902"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2022 17:26:17 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10490"; a="619317043"
X-IronPort-AV: E=Sophos;i="5.95,159,1661842800"; d="scan'208";a="619317043"
Received: from invictus.jf.intel.com ([10.165.21.201])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Oct 2022 17:26:16 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/mtl: Add MTP ddc pin configuration
Date: Tue,  4 Oct 2022 17:25:34 -0700
Message-Id: <20221005002534.2966978-1-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Meteorlake PCH reuses Alderlake ddc pin mapping. Extend
ADL-P pin mapping for Meteorlake.

Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/display/intel_bios.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_bios.c b/drivers/gpu/drm/i915/display/intel_bios.c
index 4c543e8205ca..c2987f2c2b2e 100644
--- a/drivers/gpu/drm/i915/display/intel_bios.c
+++ b/drivers/gpu/drm/i915/display/intel_bios.c
@@ -2188,7 +2188,7 @@ static u8 map_ddc_pin(struct drm_i915_private *i915, u8 vbt_pin)
 	const u8 *ddc_pin_map;
 	int n_entries;
 
-	if (IS_ALDERLAKE_P(i915)) {
+	if (HAS_PCH_MTP(i915) || IS_ALDERLAKE_P(i915)) {
 		ddc_pin_map = adlp_ddc_pin_map;
 		n_entries = ARRAY_SIZE(adlp_ddc_pin_map);
 	} else if (IS_ALDERLAKE_S(i915)) {
-- 
2.34.1

