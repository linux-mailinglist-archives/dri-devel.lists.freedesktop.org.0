Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8FA7FAB14
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 21:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 016A610E0CB;
	Mon, 27 Nov 2023 20:11:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3491210E0BD;
 Mon, 27 Nov 2023 20:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701115911; x=1732651911;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CfHdewdopfjic1WVuJmqile6NiLz/R2JMX1wAXlMdVY=;
 b=H7mJKmd311wAJUQ0tLJ71pBabYYQLO5DLvdBofpHRatzyeilPZbnYvun
 Imlgyc4lcxKXkTvklp3gtrLISfjaTfPOcmMJXjrIh8Eje0bNe0w14cd5V
 31nh4PmccGJHSMfthNen0x8WHhPHVWpuoF9RcX9OhuhdYKW3ukR2sfEAH
 R2gxbQ1iiFK17twf/OJMQgCEwdx0IngsZZJZDd4mgoJpM7tbqtobzJz4I
 hPW1TeR8PRbevN1/JNRoGwojG6wOu5rbLHyuzH0T6ptd66WE/3+MwcA+F
 j6CILPGRJfGKAhl+ghhktKNPF4DY7vfweFM6C4ASzHxM11eabxFK28psr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="14337944"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="14337944"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2023 12:11:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="772035986"
X-IronPort-AV: E=Sophos;i="6.04,231,1695711600"; d="scan'208";a="772035986"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga007.fm.intel.com with ESMTP; 27 Nov 2023 12:11:50 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 1/1] drm/i915/pxp: Add missing tag for Wa_14019159160
Date: Mon, 27 Nov 2023 12:11:50 -0800
Message-Id: <20231127201150.8407-1-alan.previn.teres.alexis@intel.com>
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

 v3: - Check targeted platforms using IP_VAL. (John Harrison)
 v2: - Fix WA id number (John Harrison).
     - Improve comments and code to be specific
       for the targeted platforms (John Harrison)

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_lrc.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 7c367ba8d9dc..1152cf25d578 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -863,10 +863,12 @@ static bool ctx_needs_runalone(const struct intel_context *ce)
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
+	if (GRAPHICS_VER_FULL(ce->engine->i915) == IP_VER(12, 70) &&
 	    (ce->engine->class == COMPUTE_CLASS || ce->engine->class == RENDER_CLASS)) {
 		rcu_read_lock();
 		gem_ctx = rcu_dereference(ce->gem_context);

base-commit: 5429d55de723544dfc0630cf39d96392052b27a1
-- 
2.39.0

