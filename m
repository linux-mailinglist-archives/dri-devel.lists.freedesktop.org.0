Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 227E2617FFD
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 15:51:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894C010E60A;
	Thu,  3 Nov 2022 14:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5528E10E2B1;
 Thu,  3 Nov 2022 14:51:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C29C261F0C;
 Thu,  3 Nov 2022 14:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EFF6C4347C;
 Thu,  3 Nov 2022 14:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667487103;
 bh=U21HowsYMW+tMOo5sJIGkQiIMjJyWPnB67qQL0JHuPc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WKBxf0BFTFEyae+QvYY5zlJAByXXlmYcFQACMxS53FF1ajk4//2cD5lPOE8jocRur
 d/eLwgryKzT0OQPNr6VovlctGClTmfXRA1NofuwqXCzEuqROy0luaECNaTAwz2uNwX
 1GUfvK+cOUVLnKdLhEh8x7O5ITqkiWHLhoezAlayhuCnk1k7sN8e9ACv0Sw7zA6BSr
 C8DXC2Ux6RRE8Q21szPE2MqcOSHLCWgzCBWTPXGiPOXvhttMQ/yYy7DNs5vx3oRuOW
 dlgRhiazFeoiug3BAHtZPUxYU9t8eIMSHilSvs20Dy37Dt6Gfc29DxLFhuq9lqEPsf
 klTlNuSD62H5A==
Received: from mchehab by mail.kernel.org with local (Exim 4.96)
 (envelope-from <mchehab@kernel.org>) id 1oqbZE-0076b4-0K;
 Thu, 03 Nov 2022 14:51:40 +0000
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH RFC v2 5/8] drm/i915: add live selftests to KUnit
Date: Thu,  3 Nov 2022 14:51:35 +0000
Message-Id: <7a0221045bcec317cf8353c72f0c26cc62935273.1667486144.git.mchehab@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <cover.1667486144.git.mchehab@kernel.org>
References: <cover.1667486144.git.mchehab@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, skhan@linuxfoundation.org,
 linux-kselftest@vger.kernel.org, Daniel Latypov <dlatypov@google.com>,
 linux-kernel@vger.kernel.org, igt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Isabella Basso <isabbasso@riseup.net>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Now that i915 KUnit has PCI support, add live tests as well.

NOTE: currently, some tests are failing when excecuting via
KUnit. I'll do a further investigation to check why, and if
this patch can be safely merged or not.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH RFC v2 0/8] at: https://lore.kernel.org/all/cover.1667486144.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/selftests/i915_kunit.c | 35 ++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_kunit.c b/drivers/gpu/drm/i915/selftests/i915_kunit.c
index 430610864f6e..f5281c866d75 100644
--- a/drivers/gpu/drm/i915/selftests/i915_kunit.c
+++ b/drivers/gpu/drm/i915/selftests/i915_kunit.c
@@ -177,6 +177,31 @@ static struct kunit_case i915_mock_tests[] = {
 };
 #undef selftest
 
+/*
+ * Suite 2: live selftests
+ */
+
+/* Declare selftest functions */
+#define selftest(x, __y) int __y(struct drm_i915_private *i915);
+#include "i915_live_selftests.h"
+#undef selftest
+
+/* Create selftest functions */
+#define selftest(__x, __y) 				\
+	static void live_##__x(struct kunit *test) {	\
+		run_pci_test(test, __y);		\
+	}
+#include "i915_live_selftests.h"
+#undef selftest
+
+/* Fill tests array */
+#define selftest(__x, __y) KUNIT_CASE(live_##__x),
+static struct kunit_case i915_live_tests[] = {
+#include "i915_live_selftests.h"
+	{}
+};
+#undef selftest
+
 /*
  * Declare test suites
  */
@@ -187,9 +212,17 @@ static struct kunit_suite i915_test_suites[] = {
 		.test_cases = i915_mock_tests,
 		.init = initialize_i915_selftests,
 	},
+	{
+		.name = "i915 live selftests",
+		.test_cases = i915_live_tests,
+		.init = initialize_i915_selftests,
+		.suite_init = i915_pci_init_suite,
+		.suite_exit = i915_pci_exit_suite,
+	},
 };
 
-kunit_test_suites(i915_test_suites);
+kunit_test_suites(&i915_test_suites[0],
+		  &i915_test_suites[1]);
 
 MODULE_LICENSE("GPL v2");
 MODULE_IMPORT_NS(I915_SELFTEST);
-- 
2.38.1

