Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E097EBD978D
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 14:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C87A510E602;
	Tue, 14 Oct 2025 12:55:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RDV10rVt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B5B610E605;
 Tue, 14 Oct 2025 12:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760446533; x=1791982533;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yG27QDaqU+po4sJ5BacEmjTWmqbhwhvqTsiuhsZt7mg=;
 b=RDV10rVtlR+qMsvc0+CAUQTgLoKNUGoCbbr3TOpO3W/HbUdSZDHwAR/+
 aYOipBsQkjPz3atrzHFL1wT7zaq8dHvZWcBJ2rv/m//b5jtiqXKuvWzmW
 P1LEi8Iom54AexJSbjrHe54W5drX99aTu5u00i2Xgqzp4x/026FIoQSXQ
 vH1gNlF/agYEzfm1Xqz+7YSmm8vi6MFlauRZHWXliX0X3odvYz2qkSnOV
 ojpDlpL7Izjavrpj+m5Xu6MLCcBtB9/qOvpIR0RzNpCgR95/EvoI91CDO
 eGVLu5NFw08cncUoUlTgd9uMSxA6v2Aeh8EgFwRraxs08hOKha204XgTq Q==;
X-CSE-ConnectionGUID: OZEPv8nIS8ePINBMOMnyQA==
X-CSE-MsgGUID: UNx8q+BmT5+flUjKbBsqkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="61813314"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="61813314"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 05:55:33 -0700
X-CSE-ConnectionGUID: 4b0fUPY2TxSV1nDBDZYWuw==
X-CSE-MsgGUID: mnBKYF1ASZayFKVKTU3y4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="181096682"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.230])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 05:55:30 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH v2 2/3] drm/i915: Wait longer for threads in migrate selftest
 on CHV/BXT+VTD
Date: Tue, 14 Oct 2025 14:47:37 +0200
Message-ID: <20251014125504.14804-7-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014125504.14804-5-janusz.krzysztofik@linux.intel.com>
References: <20251014125504.14804-5-janusz.krzysztofik@linux.intel.com>
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

When running on a Cherryview, or on a Broxton with VTD enabled, pinning of
a VMA to GGTT is now committed asynchronously to avoid lock inversion
among reservation_ww and cpu_hotplug locks, the latter acquired from
stop_machine().  That may defer further processing of resources that
depend on that VMA.  As a consequence, a 10ms delay in a multithreaded
migrate test case may occur too short and still incomplete threads may be
interrupted, and the test case may fail with -ERESTARTSYS or -EINTR error
code returned by any of those threads.

Extend the delay to empirically determined 100ms on affected platforms.

v2: Fix spelling (Sebastian, Krzysztof),
  - explain why VMA pinning is commited asynchronously on CHV/BXT+VTD
    (Krzysztof),
  - use more precise wording in commit description.

Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/selftest_migrate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_migrate.c b/drivers/gpu/drm/i915/gt/selftest_migrate.c
index 54bc447efce0b..cde755751a0ba 100644
--- a/drivers/gpu/drm/i915/gt/selftest_migrate.c
+++ b/drivers/gpu/drm/i915/gt/selftest_migrate.c
@@ -710,7 +710,8 @@ static int threaded_migrate(struct intel_migrate *migrate,
 		thread[i].tsk = tsk;
 	}
 
-	msleep(10 * n_cpus); /* start all threads before we kthread_stop() */
+	/* start all threads before we kthread_stop() */
+	msleep((intel_vm_no_concurrent_access_wa(migrate->context->vm->i915) ? 100 : 10) * n_cpus);
 
 	for (i = 0; i < n_cpus; ++i) {
 		struct task_struct *tsk = thread[i].tsk;
-- 
2.51.0

