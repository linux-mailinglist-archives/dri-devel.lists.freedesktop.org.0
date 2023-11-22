Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAB97F51AA
	for <lists+dri-devel@lfdr.de>; Wed, 22 Nov 2023 21:30:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C80F810E310;
	Wed, 22 Nov 2023 20:30:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B7E410E6AA;
 Wed, 22 Nov 2023 20:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700685052; x=1732221052;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=e0ueLoP4cffx5fWCjbtNI8NKINJOVbFRHzhyME095p8=;
 b=D/pTFJ+WYnhoAbKi/a4MlXj4cqcm5iqo5wl5XFn0D1zyo5gczX0idPZ5
 wTwHrOCiAnq+O/qq5q8P+qC+RNwDgsmordsmwsgSZNk1tBGyvTjNK2qkP
 1XwGw5vfSkuO27UaGdqGHg9iGvHai13CB+ic+hJZo0nvsT/w2tt6VF3I9
 GzI5xl4amxplQqUuPVEFCv8SNvyf4ACsH6kYBoAuEVSKeTxCK8eezapr+
 rg4ShKi3J19U4Hp2HxUGqUxHwE2u+uKSydKDnAbZ7blti0VGAcgVgjmsb
 g17YRK0e8QvgGVDqc2Hf0j1cYeCGwcHLdmWeOhKTxybrT70BHPCNP8xCE A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="10820517"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="10820517"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2023 12:30:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="884766573"
X-IronPort-AV: E=Sophos;i="6.04,219,1695711600"; d="scan'208";a="884766573"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2023 12:30:05 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 1/1] drm/i915/pxp: Add missing tag for Wa_14019159160
Date: Wed, 22 Nov 2023 12:30:03 -0800
Message-Id: <20231122203003.65735-1-alan.previn.teres.alexis@intel.com>
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

 v2: - Fix WA id number (John Harrison).
     - Improve comments and code to be specific
       for the targetted platforms (John Harrison)

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_lrc.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 7c367ba8d9dc..2959dfed2aa0 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -863,11 +863,13 @@ static bool ctx_needs_runalone(const struct intel_context *ce)
 	bool ctx_is_protected = false;
 
 	/*
-	 * On MTL and newer platforms, protected contexts require setting
-	 * the LRC run-alone bit or else the encryption will not happen.
+	 * Wa_14019159160 - Case 2: mtl
+	 * On some platforms, protected contexts require setting
+	 * the LRC run-alone bit or else the encryption/decryption will not happen.
+	 * NOTE: Case 2 only applies to PXP use-case of said workaround.
 	 */
-	if (GRAPHICS_VER_FULL(ce->engine->i915) >= IP_VER(12, 70) &&
-	    (ce->engine->class == COMPUTE_CLASS || ce->engine->class == RENDER_CLASS)) {
+	if (IS_METEORLAKE(ce->engine->i915) && (ce->engine->class == COMPUTE_CLASS ||
+						ce->engine->class == RENDER_CLASS)) {
 		rcu_read_lock();
 		gem_ctx = rcu_dereference(ce->gem_context);
 		if (gem_ctx)

base-commit: 5429d55de723544dfc0630cf39d96392052b27a1
-- 
2.39.0

