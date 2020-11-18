Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 891D02B8207
	for <lists+dri-devel@lfdr.de>; Wed, 18 Nov 2020 17:38:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C68F6E459;
	Wed, 18 Nov 2020 16:38:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E5986E459
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Nov 2020 16:38:25 +0000 (UTC)
IronPort-SDR: LE8RSBhHb1sg+/MFv4aj9mVc8NNQVemxQFSy2krCkCxE78bCI2MhgP038YTbd6QM//Cf4kYbUU
 3WWvLRKbU1mQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9809"; a="170362375"
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; d="scan'208";a="170362375"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 08:38:24 -0800
IronPort-SDR: JohC16KpMQEgDR/yusQtlblf7WQ4VfYv72z74/DKC3pA+kNJ5acfnT9nDUZ5jiTT8ARNF9cNap
 yqSzRZpeMiIQ==
X-IronPort-AV: E=Sophos;i="5.77,488,1596524400"; d="scan'208";a="544604149"
Received: from shaid-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.255.202.56])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2020 08:38:22 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] intel: Do not assert on unknown chips in
 drm_intel_decode_context_alloc
Date: Wed, 18 Nov 2020 16:36:01 +0000
Message-Id: <20201118163601.958254-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

There is this long standing nit of igt/tools/intel_error_decode asserting
when you feed it an error state from a GPU the local libdrm does not know
of.

To fix this I need a tweak in drm_intel_decode_context_alloc to make it
not assert but just return NULL (which seems an already possible return
value).

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 intel/intel_decode.c | 39 +++++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 18 deletions(-)

diff --git a/intel/intel_decode.c b/intel/intel_decode.c
index e0a516644314..be6f77984d65 100644
--- a/intel/intel_decode.c
+++ b/intel/intel_decode.c
@@ -3815,32 +3815,35 @@ drm_public struct drm_intel_decode *
 drm_intel_decode_context_alloc(uint32_t devid)
 {
 	struct drm_intel_decode *ctx;
+	int gen = 0;
 
-	ctx = calloc(1, sizeof(struct drm_intel_decode));
-	if (!ctx)
-		return NULL;
-
-	ctx->devid = devid;
-	ctx->out = stdout;
-
-	if (intel_get_genx(devid, &ctx->gen))
+	if (intel_get_genx(devid, &gen))
 		;
 	else if (IS_GEN8(devid))
-		ctx->gen = 8;
+		gen = 8;
 	else if (IS_GEN7(devid))
-		ctx->gen = 7;
+		gen = 7;
 	else if (IS_GEN6(devid))
-		ctx->gen = 6;
+		gen = 6;
 	else if (IS_GEN5(devid))
-		ctx->gen = 5;
+		gen = 5;
 	else if (IS_GEN4(devid))
-		ctx->gen = 4;
+		gen = 4;
 	else if (IS_9XX(devid))
-		ctx->gen = 3;
-	else {
-		assert(IS_GEN2(devid));
-		ctx->gen = 2;
-	}
+		gen = 3;
+	else if (IS_GEN2(devid))
+		gen = 2;
+
+	if (!gen)
+		return NULL;
+
+	ctx = calloc(1, sizeof(struct drm_intel_decode));
+	if (!ctx)
+		return NULL;
+
+	ctx->devid = devid;
+	ctx->gen = gen;
+	ctx->out = stdout;
 
 	return ctx;
 }
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
