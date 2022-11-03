Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0296618010
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 15:52:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFE5710E615;
	Thu,  3 Nov 2022 14:51:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55ADA10E606;
 Thu,  3 Nov 2022 14:51:44 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BAA1961F08;
 Thu,  3 Nov 2022 14:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B011C433D6;
 Thu,  3 Nov 2022 14:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667487103;
 bh=aBiqaKM+JH7n4Gr1RSbFfPLj/Tspjy42oxH/2AtYZuI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PP8D6vwogDrReAZBrJYHfHbN3jPMgkwi0GC7tzE4b9IRuXDaDUuqHYaeCcN530tOe
 PyvNLDEV0NFmWvGqPxyGAMECDo5Lt7AvoSA3W+c6+XTl1n7H4+OhnbbJvthYt/4PFy
 6pnuhVSRNApVh7R/N1J7FvSd4loBmbFkXDMSsaSvuYoBMg877oxTWEHsvW2I2qQDtX
 4OD8Ii7cKGxmJuuZFi1OjZXSl3Qvx9/Rn3aYjn3s3jvpHQpmqCI9KyWn9qdQaQ0duO
 m+OhBzFHhUpZGsyLN80DWjoS5V1yP3QBNGuwhwcIaCsQcVyoELKsCRB4uFUJ4XCHdO
 wvw6tu6AwLDSQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.96)
 (envelope-from <mchehab@kernel.org>) id 1oqbZE-0076b7-0O;
 Thu, 03 Nov 2022 14:51:40 +0000
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH RFC v2 6/8] drm/i915: add perf selftests to KUnit
Date: Thu,  3 Nov 2022 14:51:36 +0000
Message-Id: <048d54e7e5718ba6c7606be61482cedd7cb92dfd.1667486144.git.mchehab@kernel.org>
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

Now that i915 KUnit has PCI support, add perf tests as well.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH RFC v2 0/8] at: https://lore.kernel.org/all/cover.1667486144.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/selftests/i915_kunit.c | 34 ++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_kunit.c b/drivers/gpu/drm/i915/selftests/i915_kunit.c
index f5281c866d75..6de5d3fa8920 100644
--- a/drivers/gpu/drm/i915/selftests/i915_kunit.c
+++ b/drivers/gpu/drm/i915/selftests/i915_kunit.c
@@ -202,6 +202,30 @@ static struct kunit_case i915_live_tests[] = {
 };
 #undef selftest
 
+/*
+ * Suite 3: live selftests
+ */
+
+#define selftest(x, __y) int __y(struct drm_i915_private *i915);
+#include "i915_perf_selftests.h"
+#undef selftest
+
+/* Create selftest functions */
+#define selftest(__x, __y)				\
+	static void perf_##__x(struct kunit *test) {	\
+		run_pci_test(test, __y);		\
+	}
+#include "i915_perf_selftests.h"
+#undef selftest
+
+/* Fill tests array */
+#define selftest(__x, __y) KUNIT_CASE(perf_##__x),
+static struct kunit_case i915_perf_tests[] = {
+#include "i915_perf_selftests.h"
+	{}
+};
+#undef selftest
+
 /*
  * Declare test suites
  */
@@ -219,10 +243,18 @@ static struct kunit_suite i915_test_suites[] = {
 		.suite_init = i915_pci_init_suite,
 		.suite_exit = i915_pci_exit_suite,
 	},
+	{
+		.name = "i915 perf selftests",
+		.test_cases = i915_perf_tests,
+		.init = initialize_i915_selftests,
+		.suite_init = i915_pci_init_suite,
+		.suite_exit = i915_pci_exit_suite,
+	},
 };
 
 kunit_test_suites(&i915_test_suites[0],
-		  &i915_test_suites[1]);
+		  &i915_test_suites[1],
+		  &i915_test_suites[2]);
 
 MODULE_LICENSE("GPL v2");
 MODULE_IMPORT_NS(I915_SELFTEST);
-- 
2.38.1

