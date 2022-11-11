Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77333624F23
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 01:53:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1937410E17D;
	Fri, 11 Nov 2022 00:53:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8520D10E17B;
 Fri, 11 Nov 2022 00:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668128020; x=1699664020;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FK7EFJS49KCFYBfMZd0XE7olGXQAy+5jjqzzOWqgDuE=;
 b=O1nEU6BHwIX4Z0b9azBXCk+O0so8XDiAwimfnmpkZ5DOGbFuaQkjUzaf
 aF5uz/GJsugj5+c4AaQVYpSwuWhiUel1i7En8qYWehIi2UqW6so7v+B/e
 o58hL2LtMvfF5lNz24ozqJ2QsBx2k0hEkEWmrKgNYchsVzA5P9jRao1wJ
 aYsii7c2LeNX5WPBXRgPyruQTp8rwnCr3V5X5KOqdClHRirVv2J5Of+Lm
 ZeJ9muK9M8+UJ4ftQItWNTh66UpiNni1ea0b6MQsLWmw+dhEzujU6Z+//
 d1FDmxylpk1EPKvZVhl0mZfWQOOyuk8z3Yg6S0mUirPMFV0ON7AcLDF65 A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="291890533"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="291890533"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 16:53:39 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10527"; a="670567120"
X-IronPort-AV: E=Sophos;i="5.96,155,1665471600"; d="scan'208";a="670567120"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2022 16:53:39 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/huc: fix leak of debug object in huc load fence on
 driver unload
Date: Thu, 10 Nov 2022 16:56:51 -0800
Message-Id: <20221111005651.4160369-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Brian Norris <briannorris@chromium.org>, dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The fence is always initialized in huc_init_early, but the cleanup in
huc_fini is only being run if HuC is enabled. This causes a leaking of
the debug object when HuC is disabled/not supported, which can in turn
trigger a warning if we try to register a new debug offset at the same
address on driver reload.

To fix the issue, make sure to always run the cleanup code.

Reported-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Reported-by: Brian Norris <briannorris@chromium.org>
Fixes: 27536e03271d ("drm/i915/huc: track delayed HuC load with a fence")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Brian Norris <briannorris@chromium.org>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
---

Note: I didn't manage to repro the reported warning, but I did confirm
that we weren't correctly calling i915_sw_fence_fini and that this patch
fixes that.

 drivers/gpu/drm/i915/gt/uc/intel_huc.c | 12 +++++++-----
 drivers/gpu/drm/i915/gt/uc/intel_uc.c  |  1 +
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_huc.c b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
index fbc8bae14f76..83735a1528fe 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_huc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_huc.c
@@ -300,13 +300,15 @@ int intel_huc_init(struct intel_huc *huc)
 
 void intel_huc_fini(struct intel_huc *huc)
 {
-	if (!intel_uc_fw_is_loadable(&huc->fw))
-		return;
-
+	/*
+	 * the fence is initialized in init_early, so we need to clean it up
+	 * even if HuC loading is off.
+	 */
 	delayed_huc_load_complete(huc);
-
 	i915_sw_fence_fini(&huc->delayed_load.fence);
-	intel_uc_fw_fini(&huc->fw);
+
+	if (intel_uc_fw_is_loadable(&huc->fw))
+		intel_uc_fw_fini(&huc->fw);
 }
 
 void intel_huc_suspend(struct intel_huc *huc)
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc.c b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
index dbd048b77e19..41f08b55790e 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc.c
@@ -718,6 +718,7 @@ int intel_uc_runtime_resume(struct intel_uc *uc)
 
 static const struct intel_uc_ops uc_ops_off = {
 	.init_hw = __uc_check_hw,
+	.fini = __uc_fini, /* to clean-up the init_early initialization */
 };
 
 static const struct intel_uc_ops uc_ops_on = {
-- 
2.37.3

