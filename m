Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E407F3F1373
	for <lists+dri-devel@lfdr.de>; Thu, 19 Aug 2021 08:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5126E972;
	Thu, 19 Aug 2021 06:22:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD57B6E4B5;
 Thu, 19 Aug 2021 06:21:56 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10080"; a="216220756"
X-IronPort-AV: E=Sophos;i="5.84,334,1620716400"; d="scan'208";a="216220756"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 23:21:55 -0700
X-IronPort-AV: E=Sophos;i="5.84,334,1620716400"; d="scan'208";a="511675174"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2021 23:21:54 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Cc: <daniel.vetter@ffwll.ch>
Subject: [PATCH 11/27] drm/i915/selftests: Fix memory corruption in
 live_lrc_isolation
Date: Wed, 18 Aug 2021 23:16:23 -0700
Message-Id: <20210819061639.21051-12-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210819061639.21051-1-matthew.brost@intel.com>
References: <20210819061639.21051-1-matthew.brost@intel.com>
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

GuC submission has exposed an existing memory corruption in
live_lrc_isolation. We believe that some writes to the watchdog offsets
in the LRC (0x178 & 0x17c) can result in trashing of portions of the
address space. With GuC submission there are additional objects which
can move the context redzone into the space that is trashed. To
workaround this avoid poisoning the watchdog.

v2:
 (Daniel Vetter)
  - Add VLK ref in code to workaround

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_lrc.c | 29 +++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
index b0977a3b699b..cdc6ae48a1e1 100644
--- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
+++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
@@ -1074,6 +1074,32 @@ record_registers(struct intel_context *ce,
 	goto err_after;
 }
 
+static u32 safe_offset(u32 offset, u32 reg)
+{
+	/* XXX skip testing of watchdog - VLK-22772 */
+	if (offset == 0x178 || offset == 0x17c)
+		reg = 0;
+
+	return reg;
+}
+
+static int get_offset_mask(struct intel_engine_cs *engine)
+{
+	if (GRAPHICS_VER(engine->i915) < 12)
+		return 0xfff;
+
+	switch (engine->class) {
+	default:
+	case RENDER_CLASS:
+		return 0x07ff;
+	case COPY_ENGINE_CLASS:
+		return 0x0fff;
+	case VIDEO_DECODE_CLASS:
+	case VIDEO_ENHANCEMENT_CLASS:
+		return 0x3fff;
+	}
+}
+
 static struct i915_vma *load_context(struct intel_context *ce, u32 poison)
 {
 	struct i915_vma *batch;
@@ -1117,7 +1143,8 @@ static struct i915_vma *load_context(struct intel_context *ce, u32 poison)
 		len = (len + 1) / 2;
 		*cs++ = MI_LOAD_REGISTER_IMM(len);
 		while (len--) {
-			*cs++ = hw[dw];
+			*cs++ = safe_offset(hw[dw] & get_offset_mask(ce->engine),
+					    hw[dw]);
 			*cs++ = poison;
 			dw += 2;
 		}
-- 
2.32.0

