Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2C95B1033
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 01:09:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5432610E8F1;
	Wed,  7 Sep 2022 23:09:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1AF10E8EC;
 Wed,  7 Sep 2022 23:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662592142; x=1694128142;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Qpigr+NeYqOPkhLNlgiQYdM457o8+qzR/DGtRvrrtzQ=;
 b=lrhJU7Mbj2AVBM5Et2BjyAgSpSrgS+nCQBeCshJxCpLQva0M5mQWE42e
 v0fizOnSpr+gFlAsN8YNqpZOHwZuMbLuEEPbQmSI1G3ll1R+T8dZfW64U
 ICzkEDOD9dYl07mVDa3vkifO97skPkVV3uVEX/HpSJeimKQBYsR1isK/2
 Ts/H+mYUQeqIJ2SE/ItFOXwr/+vwDXnsZRScXPU0DWPlRQUhpfL33yU7I
 GvGmrTiYCjm4tTcLdZ4W0FS1S9IhHPPBj8gHzHyjFwiv3jVIBWMqG4TeD
 YgOXcPU8tUbL4x1oAQNw8GcNVaNawy5iODcABqstc5oevN0XlS6RZzTKu Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10463"; a="323206875"
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; d="scan'208";a="323206875"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 16:08:58 -0700
X-IronPort-AV: E=Sophos;i="5.93,298,1654585200"; d="scan'208";a="859815915"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2022 16:08:58 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: Noop lrc_init_wa_ctx() on recent/future platforms
Date: Wed,  7 Sep 2022 16:08:41 -0700
Message-Id: <20220907230841.1703574-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Except for graphics version 8 and 9, nothing is done in
lrc_init_wa_ctx(). Assume this won't be needed on future platforms as
well and remove the warning.

Note that this function is not called for anything below version 8 since
those don't use either guc or execlist, i.e. HAS_EXECLISTS() is false.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_lrc.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 070cec4ff8a4..43fa7b3422c4 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -1695,24 +1695,16 @@ void lrc_init_wa_ctx(struct intel_engine_cs *engine)
 	unsigned int i;
 	int err;
 
-	if (!(engine->flags & I915_ENGINE_HAS_RCS_REG_STATE))
+	if (GRAPHICS_VER(engine->i915) >= 11 ||
+	    !(engine->flags & I915_ENGINE_HAS_RCS_REG_STATE))
 		return;
 
-	switch (GRAPHICS_VER(engine->i915)) {
-	case 12:
-	case 11:
-		return;
-	case 9:
+	if (GRAPHICS_VER(engine->i915) == 9) {
 		wa_bb_fn[0] = gen9_init_indirectctx_bb;
 		wa_bb_fn[1] = NULL;
-		break;
-	case 8:
+	} else if (GRAPHICS_VER(engine->i915) == 8) {
 		wa_bb_fn[0] = gen8_init_indirectctx_bb;
 		wa_bb_fn[1] = NULL;
-		break;
-	default:
-		MISSING_CASE(GRAPHICS_VER(engine->i915));
-		return;
 	}
 
 	err = lrc_create_wa_ctx(engine);
-- 
2.37.2

