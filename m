Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E246224AFD8
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37EEC6E8F6;
	Thu, 20 Aug 2020 07:15:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 166E56E2F3;
 Wed, 19 Aug 2020 11:53:57 +0000 (UTC)
IronPort-SDR: EAfyb8Y1bg3dtpCnrIxlcmJA6+06z9Krw7NQI1t5QWwkMx3RLQiDFCZ0iBzyCIRP3/Og7sauhN
 0EyzMjDZ2Zow==
X-IronPort-AV: E=McAfee;i="6000,8403,9717"; a="239922207"
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; d="scan'208";a="239922207"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2020 04:53:56 -0700
IronPort-SDR: tH4X2Paq3XfvQA2RiM8Y1LC6aKCErJ17exgjAh7BFc8iQvzE35GvKOqV4ZBB1Rm+yTgBBsOIfY
 433WjNqDmt2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,331,1592895600"; d="scan'208";a="334658309"
Received: from black.fi.intel.com ([10.237.72.28])
 by FMSMGA003.fm.intel.com with ESMTP; 19 Aug 2020 04:53:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 9A95A1FD; Wed, 19 Aug 2020 14:53:53 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
Subject: [PATCH v1] drm/i915/gt: convert tasklets to use new tasklet_setup()
 API
Date: Wed, 19 Aug 2020 14:53:53 +0300
Message-Id: <20200819115353.59592-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In preparation for unconditionally passing the struct tasklet_struct
pointer to all tasklet callbacks, switch to using the new tasklet_setup()
and from_tasklet() to pass the tasklet pointer explicitly.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_lrc.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_lrc.c b/drivers/gpu/drm/i915/gt/intel_lrc.c
index 9eeaca957a7e..5854fd2f046c 100644
--- a/drivers/gpu/drm/i915/gt/intel_lrc.c
+++ b/drivers/gpu/drm/i915/gt/intel_lrc.c
@@ -3137,9 +3137,9 @@ static bool preempt_timeout(const struct intel_engine_cs *const engine)
  * Check the unread Context Status Buffers and manage the submission of new
  * contexts to the ELSP accordingly.
  */
-static void execlists_submission_tasklet(unsigned long data)
+static void execlists_submission_tasklet(struct tasklet_struct *t)
 {
-	struct intel_engine_cs * const engine = (struct intel_engine_cs *)data;
+	struct intel_engine_cs * const engine = from_tasklet(engine, t, execlists.tasklet);
 	bool timeout = preempt_timeout(engine);
 
 	process_csb(engine);
@@ -5120,8 +5120,7 @@ int intel_execlists_submission_setup(struct intel_engine_cs *engine)
 	struct intel_uncore *uncore = engine->uncore;
 	u32 base = engine->mmio_base;
 
-	tasklet_init(&engine->execlists.tasklet,
-		     execlists_submission_tasklet, (unsigned long)engine);
+	tasklet_setup(&engine->execlists.tasklet, execlists_submission_tasklet);
 	timer_setup(&engine->execlists.timer, execlists_timeslice, 0);
 	timer_setup(&engine->execlists.preempt, execlists_preempt, 0);
 
@@ -5516,9 +5515,9 @@ static intel_engine_mask_t virtual_submission_mask(struct virtual_engine *ve)
 	return mask;
 }
 
-static void virtual_submission_tasklet(unsigned long data)
+static void virtual_submission_tasklet(struct tasklet_struct *t)
 {
-	struct virtual_engine * const ve = (struct virtual_engine *)data;
+	struct virtual_engine * const ve = from_tasklet(ve, t, base.execlists.tasklet);
 	const int prio = READ_ONCE(ve->base.execlists.queue_priority_hint);
 	intel_engine_mask_t mask;
 	unsigned int n;
@@ -5731,9 +5730,7 @@ intel_execlists_create_virtual(struct intel_engine_cs **siblings,
 
 	INIT_LIST_HEAD(virtual_queue(ve));
 	ve->base.execlists.queue_priority_hint = INT_MIN;
-	tasklet_init(&ve->base.execlists.tasklet,
-		     virtual_submission_tasklet,
-		     (unsigned long)ve);
+	tasklet_setup(&ve->base.execlists.tasklet, virtual_submission_tasklet);
 
 	intel_context_init(&ve->context, &ve->base);
 
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
