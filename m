Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D33618014
	for <lists+dri-devel@lfdr.de>; Thu,  3 Nov 2022 15:52:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AC1210E616;
	Thu,  3 Nov 2022 14:51:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A8B10E2B1;
 Thu,  3 Nov 2022 14:51:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1846AB828B5;
 Thu,  3 Nov 2022 14:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37B47C43144;
 Thu,  3 Nov 2022 14:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667487103;
 bh=EgUfYi6omv+JphmdlMh1yMRQPC+NdgzKbGKf8IoKtB4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dPxuEoxlI5Qt+ee5xfr6mCmkZr3CA39FxBhKj0s86ZClDnS48ngdeW3WwzCaBJ/jt
 cDP4p9meb+b4Lo7nOaPtPYv05r8aIEi170TYkCKeu7ZLSFg7zcIFzJSOTKTNMiQEIa
 oO65nxc3qHmRXJHkoU8HpiO2w3vcOWG3RSnVelWtzAd5VZwdVTX4TMEt/w5ex2LmT7
 NLl9y49LnA1X0ZbWMHc3rPz5YiympCgVnPlMb1/G03M8gB/F9NhUgy/VQizmZ1xoRA
 BXhoyEEHnjNgRfvXeYHA6B/2PEUPKdn5Yu7HxfM7L7jJuQsugA2wCQDIFCzCPSKkNv
 vRPUGttR0RxeA==
Received: from mchehab by mail.kernel.org with local (Exim 4.96)
 (envelope-from <mchehab@kernel.org>) id 1oqbZE-0076b1-0G;
 Thu, 03 Nov 2022 14:51:40 +0000
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: 
Subject: [PATCH RFC v2 4/8] drm/i915: add support to run KUnit tests on bare
 metal
Date: Thu,  3 Nov 2022 14:51:34 +0000
Message-Id: <df4fd92968cb7442dd2778f1c6f3e69935c5796b.1667486144.git.mchehab@kernel.org>
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

Add a logic to seek for PCI devices and to run tests on
them, if the tests are willing to run on physical hardware,
instead of using Qemu.

Later patches will add the KUnit tests. So, for now, mark
such functions with __maybe_unused, to avoid build issues
with WERROR.

Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH RFC v2 0/8] at: https://lore.kernel.org/all/cover.1667486144.git.mchehab@kernel.org/

 drivers/gpu/drm/i915/selftests/i915_kunit.c | 100 ++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/drivers/gpu/drm/i915/selftests/i915_kunit.c b/drivers/gpu/drm/i915/selftests/i915_kunit.c
index 731b84a1fdc3..430610864f6e 100644
--- a/drivers/gpu/drm/i915/selftests/i915_kunit.c
+++ b/drivers/gpu/drm/i915/selftests/i915_kunit.c
@@ -8,9 +8,109 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/pci.h>
 #include <kunit/test.h>
+#include "i915_drv.h"
 #include "i915_selftest.h"
 
+#define MAX_PCI_BOARDS	8
+
+/*
+ * PCI selftest support
+ *
+ * It is possible to run tests that demands hardware in bare metal.
+ *
+ * Add a logic to detect and get PCI devices using i915 driver, up to
+ * MAX_PCI_BOARDS devices.
+ */
+
+static int n_boards;
+static struct pci_dev *dev_i915[MAX_PCI_BOARDS];
+static int __maybe_unused i915_pci_init_suite(struct kunit_suite *suite)
+{
+	struct pci_dev *pdev = NULL;
+	int i;
+
+	/* Check for PCI devices with i915 driver */
+	do {
+		/*
+		 * Let's search all devices at the PCI ID. We could, instead,
+		 * use include/drm/i915_pciids.h, but that would mean a much
+		 * more complex code, and won't still warrant that the device
+		 * was bound to i915 driver. So, let's check the driver's
+		 * name instead.
+		 */
+		pdev = pci_get_device(PCI_VENDOR_ID_INTEL, PCI_ANY_ID, pdev);
+		if (pdev) {
+			if (pdev->driver && !strcmp(pdev->driver->name, "i915")) {
+				pr_info("%s: it is a i915 device.\n",
+					pci_name(pdev));
+
+				for (i = 0; i < n_boards; i++) {
+					if (pdev == dev_i915[i]) {
+						pci_dev_put(pdev);
+						continue;
+					}
+				}
+				dev_i915[n_boards++] = pdev;
+				if (n_boards >= MAX_PCI_BOARDS)
+					break;
+			} else {
+				pci_dev_put(pdev);
+			}
+		}
+	} while (pdev);
+
+	return 0;
+}
+
+static void __maybe_unused i915_pci_exit_suite(struct kunit_suite *suite)
+{
+	int i;
+
+	for (i = 0; i < n_boards; i++)
+		pci_dev_put(dev_i915[i]);
+
+	n_boards = 0;
+}
+
+static void __maybe_unused run_pci_test(struct kunit *test,
+					int (*f)(struct drm_i915_private *i915))
+{
+	struct drm_i915_private *i915;
+	int i, ret, disable_display;
+
+	if (!n_boards)
+		kunit_skip(test, "runs only on i915 hardware\n");
+
+	for (i = 0; i < n_boards; i++) {
+		i915 = pdev_to_i915(dev_i915[i]);
+
+		cond_resched();
+		if (signal_pending(current))
+			return;
+
+		pr_info("Running %s on %s\n",
+			test->name, pci_name(dev_i915[i]));
+
+		/* FIXME: is it ok to disable_display here? */
+		disable_display = i915->params.disable_display;
+		i915->params.disable_display = 1;
+		ret = f(i915);
+		i915->params.disable_display = disable_display;
+
+		if (ret == -EINTR && !signal_pending(current))
+			ret = 0;
+
+		if (WARN(ret > 0 || ret == -ENOTTY,
+			"%s returned %d, conflicting with selftest's magic values!\n",
+			test->name, ret))
+			ret = -EINVAL;
+
+		KUNIT_EXPECT_EQ(test, ret, 0);
+	}
+}
+
 /*
  * Test run logic, similar to what i915 selftest does
  */
-- 
2.38.1

