Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F42974818B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 11:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A55F10E083;
	Wed,  5 Jul 2023 09:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D52710E083;
 Wed,  5 Jul 2023 09:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688550953; x=1720086953;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+dw0mv5rBotXmuEqqpnGsPOpJLtjaLL72VWsfkFGC6Q=;
 b=D2x8yAfoVKAOxfs2GJi79MV2VhQeamOJJB7UigQmrymDfPb2zab2jsRv
 E3NVN2G0NNkc+4xlFsCDFzV7vR7WqM1DauTN/njtZ/Ue8lLkB3XXwC+vz
 2XJkGPyj1p/9KQKs+G3taxSdFhce0Fu9k5g/fzjlQISt4S0XlNhnIHlyT
 Rlt5wWdmh45JWsA7sG5OPA5aH3dkhdA4BirCtAkbyPkXZvpLsAYzMApJg
 DM40h46R1HmTFkdkJKNQuxBf8QjsHBJcP2lOWlJrpefFLYvdJQzzeOi7l
 BmN46z1Uv/0VFosDs46Kdh9s4wth3fQU4FgUVGKV1t9olcQ05lgWbJV3q w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="362167330"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="362167330"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 02:55:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="696399058"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; d="scan'208";a="696399058"
Received: from jputsman-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.200.219])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2023 02:55:30 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Remove some dead "code"
Date: Wed,  5 Jul 2023 10:55:18 +0100
Message-Id: <20230705095518.3690951-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Commit 2caffbf11762 ("drm/i915: Revoke mmaps and prevent access to fence
registers across reset") removed the temporary implementation of a reset
under stop machine but forgot to remove this one commented out define.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_reset.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
index 6916eba3bd33..cdbc08dad7ae 100644
--- a/drivers/gpu/drm/i915/gt/intel_reset.c
+++ b/drivers/gpu/drm/i915/gt/intel_reset.c
@@ -35,9 +35,6 @@
 
 #define RESET_MAX_RETRIES 3
 
-/* XXX How to handle concurrent GGTT updates using tiling registers? */
-#define RESET_UNDER_STOP_MACHINE 0
-
 static void client_mark_guilty(struct i915_gem_context *ctx, bool banned)
 {
 	struct drm_i915_file_private *file_priv = ctx->file_priv;
-- 
2.39.2

