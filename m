Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7762BC5F9E
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 18:13:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030F210E85B;
	Wed,  8 Oct 2025 16:13:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UNB1nFpD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115B710E85A;
 Wed,  8 Oct 2025 16:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759940008; x=1791476008;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=In3vRqx6jHa+4sJzd3AqpJSNo2kPbDHCXsYJZyt63ss=;
 b=UNB1nFpDJgSZnrWU0J0gU1otC/oViVEotvwBN3b0nfYLjJBCD2KN15xK
 kp6Kd7hjzT61yOsvZiK61E4+niFvSMePWcuQXKzEgtQog5aUmEQ/rzuP+
 XbvTJuoEdnTFC3KiK6r/H8gytDlt8bm1efmhZsb642cpzAv1dYoNYA7WY
 C+EARJo7ObGHVnDn99QmjKjxI6vb0I1ofAflhDm8t+A4UOuD2t5gHiGkk
 vGneOWU5Ce+qtsoQeolaM6IVcctJasEOjqEhlCmKBNlz0Xzi8DtL0wrI9
 LhdreFEaWeDbkxaXRQiboLeF92UbQoSul2X26tq0iTduVMtdCoyV6cPXR A==;
X-CSE-ConnectionGUID: UzVeyL2tTUmQZIDTvN7Lsg==
X-CSE-MsgGUID: Q2vUwtUGTiCDokrjh3h+JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="79784447"
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="79784447"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 09:13:28 -0700
X-CSE-ConnectionGUID: QvEKLJvsRIGdfdgtHMj2Cg==
X-CSE-MsgGUID: 28ljtD8UQ+GPYz/Y3v4Czw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="180294894"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.245.244.124])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 09:13:24 -0700
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
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH 2/3] drm/i915: Wait longer for threads in migrate selftest on
 CHV/BXT+VTD
Date: Wed,  8 Oct 2025 18:12:27 +0200
Message-ID: <20251008161258.3568573-7-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008161258.3568573-5-janusz.krzysztofik@linux.intel.com>
References: <20251008161258.3568573-5-janusz.krzysztofik@linux.intel.com>
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
a VMA to GGTT is now committed asynchronously.  That may defer further
processing of resources that depend on that VMA.  As a consequence, a 10ms
delay in a multithreaded migrate test case may occur too short and still
incomplete threads may be interrupted, and the test case may fail with
-ERESTARTSYS or -EINTR error code returned by any of those threads.

Extend the delay to empiricaly determined 100ms on affected platforms.

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

