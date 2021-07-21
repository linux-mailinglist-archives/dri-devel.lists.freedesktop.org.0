Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9113D124A
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 17:25:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A966E9A4;
	Wed, 21 Jul 2021 15:25:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 263FC6E9A1
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 15:25:03 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 g4-20020a17090ace84b029017554809f35so4211231pju.5
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jul 2021 08:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gcrDl1ifXL7AdQuGEj7BhkWSyCWUi3i70UQr7yQo6u0=;
 b=fO+x1DlRxG+CTszsMDHaYNey+LByQjb2ZwyEInb1eC+21rU5LHMOfiXXHKjPG8cF2g
 HVhruFbLTKf8koyOu36JCqjxKTEOF8DVthXLaA4ZK2By2aSD35IBuoDFIpJAuFbc110R
 GxM9/olqK8AE2E5Y7IIYxg0vgVfcfYwbNyJQIMDFcM59X5apkwEoF2POgWSGSVZm11lB
 38w1VvTmpUprmMrY73sWZv5f4cmVBFO+fS6ACH/ra5VmvyfSNxLfEe7ppyCCIzGPB55i
 tNC7qdDHU8+fYQFN8xg5U3Ku1p95Emedr1yzI1Sa+U+idQ17tZC+y+kCI5FtMeuB1wqx
 dG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gcrDl1ifXL7AdQuGEj7BhkWSyCWUi3i70UQr7yQo6u0=;
 b=gfcRB3exj7udb5k53WJoik/Oex7oc6jpFXfDhfASBP9MIn0LBEZM34U0I3Is3me2AB
 B61rVyHwFTKfKD01UQ17D2aHVC1oKKCiJ5Jp8SXtoQPUoMvSzsCdExY13jeHZ1xASilT
 51wOsrArYg0Dw2qa9KfHprEamPENH4tTJiIEjRazrWIjeP+y1bWRk1fpA5gbKaJVNUWy
 n0+qRU+KcRgg8VsCxE2tJY39BVoAPEPSM29brFvVEwKDJCn/dT+IL1ygyaB3aYPu4pVb
 kz5bpVvi/FgPjO30Q9OtY+nJoAhhYEpLUchANOQMbVh9ohxzt1zk2lDeJCE61g30PSwl
 LbmQ==
X-Gm-Message-State: AOAM5332J5O31KNhrIR0ZKQwMzXNAVaC9mkxdzC9BIZgFgZtd7Sc1X8V
 tF6JOF2wl1qKs3mULdTdOv9lRQ==
X-Google-Smtp-Source: ABdhPJzth6v1+Wkd7FoAtepzuLrb4GYkvnsXH8qyZBoR4Ba8jt0dp5eFieKbjKzJ4izYbTYdx6BmSw==
X-Received: by 2002:a17:90a:a087:: with SMTP id
 r7mr4424171pjp.84.1626881102527; 
 Wed, 21 Jul 2021 08:25:02 -0700 (PDT)
Received: from omlet.com ([134.134.137.82])
 by smtp.gmail.com with ESMTPSA id e4sm32451034pgi.94.2021.07.21.08.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jul 2021 08:25:01 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/6] drm/i915: Use a table for i915_init/exit (v2)
Date: Wed, 21 Jul 2021 10:23:55 -0500
Message-Id: <20210721152358.2893314-4-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210721152358.2893314-1-jason@jlekstrand.net>
References: <20210721152358.2893314-1-jason@jlekstrand.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Jason Ekstrand <jason@jlekstrand.net>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the driver was not fully loaded, we may still have globals lying
around.  If we don't tear those down in i915_exit(), we'll leak a bunch
of memory slabs.  This can happen two ways: use_kms = false and if we've
run mock selftests.  In either case, we have an early exit from
i915_init which happens after i915_globals_init() and we need to clean
up those globals.

The mock selftests case is especially sticky.  The load isn't entirely
a no-op.  We actually do quite a bit inside those selftests including
allocating a bunch of mock objects and running tests on them.  Once all
those tests are complete, we exit early from i915_init().  Perviously,
i915_init() would return a non-zero error code on failure and a zero
error code on success.  In the success case, we would get to i915_exit()
and check i915_pci_driver.driver.owner to detect if i915_init exited early
and do nothing.  In the failure case, we would fail i915_init() but
there would be no opportunity to clean up globals.

The most annoying part is that you don't actually notice the failure as
part of the self-tests since leaking a bit of memory, while bad, doesn't
result in anything observable from userspace.  Instead, the next time we
load the driver (usually for next IGT test), i915_globals_init() gets
invoked again, we go to allocate a bunch of new memory slabs, those
implicitly create debugfs entries, and debugfs warns that we're trying
to create directories and files that already exist.  Since this all
happens as part of the next driver load, it shows up in the dmesg-warn
of whatever IGT test ran after the mock selftests.

While the obvious thing to do here might be to call i915_globals_exit()
after selftests, that's not actually safe.  The dma-buf selftests call
i915_gem_prime_export which creates a file.  We call dma_buf_put() on
the resulting dmabuf which calls fput() on the file.  However, fput()
isn't immediate and gets flushed right before syscall returns.  This
means that all the fput()s from the selftests don't happen until right
before the module load syscall used to fire off the selftests returns
which is after i915_init().  If we call i915_globals_exit() in
i915_init() after selftests, we end up freeing slabs out from under
objects which won't get released until fput() is flushed at the end of
the module load syscall.

The solution here is to let i915_init() return success early and detect
the early success in i915_exit() and only tear down globals and nothing
else.  This way the module loads successfully, regardless of the success
or failure of the tests.  Because we've not enumerated any PCI devices,
no device nodes are created and it's entirely useless from userspace.
The only thing the module does at that point is hold on to a bit of
memory until we unload it and i915_exit() is called.  Importantly, this
means that everything from our selftests has the ability to properly
flush out between i915_init() and i915_exit() because there is at least
one syscall boundary in between.

In order to handle all the delicate init/exit cases, we convert the
whole thing to a table of init/exit pairs and track the init status in
the new init_progress global.  This allows us to ensure that i915_exit()
always tears down exactly the things that i915_init() successfully
initialized.  We also allow early-exit of i915_init() without failure by
an init function returning > 0.  This is useful for nomodeset, and
selftests.  For the mock selftests, we convert them to always return 1
so we get the desired behavior of the driver always succeeding to load
the driver and then properly tearing down the partially loaded driver.

v2 (Tvrtko Ursulin):
 - Guard init_funcs[i].exit with GEM_BUG_ON(i >= ARRAY_SIZE(init_funcs))
v2 (Daniel Vetter):
 - Update the docstring for i915.mock_selftests

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c               | 105 ++++++++++++------
 drivers/gpu/drm/i915/i915_perf.c              |   3 +-
 drivers/gpu/drm/i915/i915_perf.h              |   2 +-
 drivers/gpu/drm/i915/i915_pmu.c               |   4 +-
 drivers/gpu/drm/i915/i915_pmu.h               |   4 +-
 .../gpu/drm/i915/selftests/i915_selftest.c    |   4 +-
 6 files changed, 82 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 4e627b57d31a2..5f05cb1b5ac6b 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1185,27 +1185,9 @@ static void i915_pci_shutdown(struct pci_dev *pdev)
 	i915_driver_shutdown(i915);
 }
 
-static struct pci_driver i915_pci_driver = {
-	.name = DRIVER_NAME,
-	.id_table = pciidlist,
-	.probe = i915_pci_probe,
-	.remove = i915_pci_remove,
-	.shutdown = i915_pci_shutdown,
-	.driver.pm = &i915_pm_ops,
-};
-
-static int __init i915_init(void)
+static int i915_check_nomodeset(void)
 {
 	bool use_kms = true;
-	int err;
-
-	err = i915_globals_init();
-	if (err)
-		return err;
-
-	err = i915_mock_selftests();
-	if (err)
-		return err > 0 ? 0 : err;
 
 	/*
 	 * Enable KMS by default, unless explicitly overriden by
@@ -1222,31 +1204,88 @@ static int __init i915_init(void)
 	if (!use_kms) {
 		/* Silently fail loading to not upset userspace. */
 		DRM_DEBUG_DRIVER("KMS disabled.\n");
-		return 0;
+		return 1;
 	}
 
-	i915_pmu_init();
+	return 0;
+}
 
-	err = pci_register_driver(&i915_pci_driver);
-	if (err) {
-		i915_pmu_exit();
-		i915_globals_exit();
-		return err;
+static struct pci_driver i915_pci_driver = {
+	.name = DRIVER_NAME,
+	.id_table = pciidlist,
+	.probe = i915_pci_probe,
+	.remove = i915_pci_remove,
+	.shutdown = i915_pci_shutdown,
+	.driver.pm = &i915_pm_ops,
+};
+
+static int i915_register_pci_driver(void)
+{
+	return pci_register_driver(&i915_pci_driver);
+}
+
+static void i915_unregister_pci_driver(void)
+{
+	pci_unregister_driver(&i915_pci_driver);
+}
+
+static const struct {
+   int (*init)(void);
+   void (*exit)(void);
+} init_funcs[] = {
+	{ i915_globals_init, i915_globals_exit },
+	{ i915_mock_selftests, NULL },
+	{ i915_check_nomodeset, NULL },
+	{ i915_pmu_init, i915_pmu_exit },
+	{ i915_register_pci_driver, i915_unregister_pci_driver },
+	{ i915_perf_sysctl_register, i915_perf_sysctl_unregister },
+};
+static int init_progress;
+
+static int __init i915_init(void)
+{
+	int err, i;
+
+	for (i = 0; i < ARRAY_SIZE(init_funcs); i++) {
+		err = init_funcs[i].init();
+		if (err < 0) {
+			while (i--) {
+				if (init_funcs[i].exit)
+					init_funcs[i].exit();
+			}
+			return err;
+		} else if (err > 0) {
+			/*
+			 * Early-exit success is reserved for things which
+			 * don't have an exit() function because we have no
+			 * idea how far they got or how to partially tear
+			 * them down.
+			 */
+			WARN_ON(init_funcs[i].exit);
+
+			/*
+			 * We don't want to advertise devices with an only
+			 * partially initialized driver.
+			 */
+			WARN_ON(i915_pci_driver.driver.owner);
+			break;
+		}
 	}
 
-	i915_perf_sysctl_register();
+	init_progress = i;
+
 	return 0;
 }
 
 static void __exit i915_exit(void)
 {
-	if (!i915_pci_driver.driver.owner)
-		return;
+	int i;
 
-	i915_perf_sysctl_unregister();
-	pci_unregister_driver(&i915_pci_driver);
-	i915_pmu_exit();
-	i915_globals_exit();
+	for (i = init_progress - 1; i >= 0; i--) {
+		GEM_BUG_ON(i >= ARRAY_SIZE(init_funcs));
+		if (init_funcs[i].exit)
+			init_funcs[i].exit();
+	}
 }
 
 module_init(i915_init);
diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
index b4ec114a4698b..48ddb363b3bda 100644
--- a/drivers/gpu/drm/i915/i915_perf.c
+++ b/drivers/gpu/drm/i915/i915_perf.c
@@ -4483,9 +4483,10 @@ static int destroy_config(int id, void *p, void *data)
 	return 0;
 }
 
-void i915_perf_sysctl_register(void)
+int i915_perf_sysctl_register(void)
 {
 	sysctl_header = register_sysctl_table(dev_root);
+	return 0;
 }
 
 void i915_perf_sysctl_unregister(void)
diff --git a/drivers/gpu/drm/i915/i915_perf.h b/drivers/gpu/drm/i915/i915_perf.h
index 882fdd0a76800..1d1329e5af3ae 100644
--- a/drivers/gpu/drm/i915/i915_perf.h
+++ b/drivers/gpu/drm/i915/i915_perf.h
@@ -23,7 +23,7 @@ void i915_perf_fini(struct drm_i915_private *i915);
 void i915_perf_register(struct drm_i915_private *i915);
 void i915_perf_unregister(struct drm_i915_private *i915);
 int i915_perf_ioctl_version(void);
-void i915_perf_sysctl_register(void);
+int i915_perf_sysctl_register(void);
 void i915_perf_sysctl_unregister(void);
 
 int i915_perf_open_ioctl(struct drm_device *dev, void *data,
diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
index 34d37d46a1262..eca92076f31d2 100644
--- a/drivers/gpu/drm/i915/i915_pmu.c
+++ b/drivers/gpu/drm/i915/i915_pmu.c
@@ -1088,7 +1088,7 @@ static int i915_pmu_cpu_offline(unsigned int cpu, struct hlist_node *node)
 
 static enum cpuhp_state cpuhp_slot = CPUHP_INVALID;
 
-void i915_pmu_init(void)
+int i915_pmu_init(void)
 {
 	int ret;
 
@@ -1101,6 +1101,8 @@ void i915_pmu_init(void)
 			  ret);
 	else
 		cpuhp_slot = ret;
+
+	return 0;
 }
 
 void i915_pmu_exit(void)
diff --git a/drivers/gpu/drm/i915/i915_pmu.h b/drivers/gpu/drm/i915/i915_pmu.h
index 60f9595f902cd..449057648f39b 100644
--- a/drivers/gpu/drm/i915/i915_pmu.h
+++ b/drivers/gpu/drm/i915/i915_pmu.h
@@ -147,14 +147,14 @@ struct i915_pmu {
 };
 
 #ifdef CONFIG_PERF_EVENTS
-void i915_pmu_init(void);
+int i915_pmu_init(void);
 void i915_pmu_exit(void);
 void i915_pmu_register(struct drm_i915_private *i915);
 void i915_pmu_unregister(struct drm_i915_private *i915);
 void i915_pmu_gt_parked(struct drm_i915_private *i915);
 void i915_pmu_gt_unparked(struct drm_i915_private *i915);
 #else
-static inline void i915_pmu_init(void) {}
+static inline int i915_pmu_init(void) { return 0; }
 static inline void i915_pmu_exit(void) {}
 static inline void i915_pmu_register(struct drm_i915_private *i915) {}
 static inline void i915_pmu_unregister(struct drm_i915_private *i915) {}
diff --git a/drivers/gpu/drm/i915/selftests/i915_selftest.c b/drivers/gpu/drm/i915/selftests/i915_selftest.c
index 1bc11c09faef5..484759c9409c0 100644
--- a/drivers/gpu/drm/i915/selftests/i915_selftest.c
+++ b/drivers/gpu/drm/i915/selftests/i915_selftest.c
@@ -187,7 +187,7 @@ int i915_mock_selftests(void)
 	err = run_selftests(mock, NULL);
 	if (err) {
 		i915_selftest.mock = err;
-		return err;
+		return 1;
 	}
 
 	if (i915_selftest.mock < 0) {
@@ -430,7 +430,7 @@ module_param_named(st_timeout, i915_selftest.timeout_ms, uint, 0400);
 module_param_named(st_filter, i915_selftest.filter, charp, 0400);
 
 module_param_named_unsafe(mock_selftests, i915_selftest.mock, int, 0400);
-MODULE_PARM_DESC(mock_selftests, "Run selftests before loading, using mock hardware (0:disabled [default], 1:run tests then load driver, -1:run tests then exit module)");
+MODULE_PARM_DESC(mock_selftests, "Run selftests before loading, using mock hardware (0:disabled [default], 1:run tests then load driver, -1:run tests then leave dummy module)");
 
 module_param_named_unsafe(live_selftests, i915_selftest.live, int, 0400);
 MODULE_PARM_DESC(live_selftests, "Run selftests after driver initialisation on the live system (0:disabled [default], 1:run tests then continue, -1:run tests then exit module)");
-- 
2.31.1

