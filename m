Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE9BA9A2AF
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 08:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAD4A10E443;
	Thu, 24 Apr 2025 06:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fSd/EgbH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E03FE10E126;
 Thu, 24 Apr 2025 06:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745477767; x=1777013767;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ir3SSYARcOB2QW3Bh2EUraLS/CBw+CKFmNvfHpUxzVg=;
 b=fSd/EgbHZXLRgUcyWNsXiB89VP2DTcpgOMc2LnpOwGwJrV49i8ku3TAX
 1hzu/dds7kNXSrcNh/+82Cgf9lN+xnArx+GYqyXWCTlWQFn6xckuuYK2X
 WvsObi7Gad+bEX55iZwQc10mitSaP4rbdCu/o1fTmt+LhE46kNXBmToSQ
 BeOQhkXKqb5C6i1DyUZAJauEXPD0+HUepBGMbKh9OU2R7e3E0xGu9J88r
 Tjp+tq4vgVxrCo+tFqdocF1DCvFJQE/3t9nJUhzP6fU0HHdPyOeXIWLZd
 JR2FRO76bRzR4xZY0jh4eAPzo/Eh26E3BRJoCKYV0Tyg1PskwUkJmOdUh A==;
X-CSE-ConnectionGUID: 89MbiJfdSmqG9QBX6L9t0w==
X-CSE-MsgGUID: 3JeVZHpCSsOU6EW5gQlS1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="57292849"
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="57292849"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 23:56:06 -0700
X-CSE-ConnectionGUID: Hv9IHME7RL60tTAWX4oaPA==
X-CSE-MsgGUID: cgZo7lo+ReG/4taaxT42OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,235,1739865600"; d="scan'208";a="163505032"
Received: from junxiaochang.bj.intel.com ([10.238.157.86])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Apr 2025 23:56:03 -0700
From: Junxiao Chang <junxiao.chang@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
Cc: junxiao.chang@intel.com
Subject: [PATCH] drm/i915/gsc: mei interrupt top half should be in irq
 disabled context
Date: Thu, 24 Apr 2025 14:56:08 +0800
Message-Id: <20250424065609.624457-1-junxiao.chang@intel.com>
X-Mailer: git-send-email 2.34.1
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

MEI GSC interrupt comes from i915. It has top half and bottom half.
Top half is called from i915 interrupt handler. It should be in
irq disabled context.

With RT kernel, by default i915 IRQ handler is in threaded IRQ. MEI GSC
top half might be in threaded IRQ context. In this case, local IRQ
should be disabled for MEI GSC interrupt top half.

This change fixes A380/A770 GPU boot hang issue with RT kernel.

Signed-off-by: Junxiao Chang <junxiao.chang@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gsc.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gsc.c b/drivers/gpu/drm/i915/gt/intel_gsc.c
index 1e925c75fb080..9c72117263f78 100644
--- a/drivers/gpu/drm/i915/gt/intel_gsc.c
+++ b/drivers/gpu/drm/i915/gt/intel_gsc.c
@@ -270,6 +270,9 @@ static void gsc_init_one(struct drm_i915_private *i915, struct intel_gsc *gsc,
 static void gsc_irq_handler(struct intel_gt *gt, unsigned int intf_id)
 {
 	int ret;
+#ifdef CONFIG_PREEMPT_RT
+	int irq_disabled_flag;
+#endif
 
 	if (intf_id >= INTEL_GSC_NUM_INTERFACES) {
 		gt_warn_once(gt, "GSC irq: intf_id %d is out of range", intf_id);
@@ -284,7 +287,18 @@ static void gsc_irq_handler(struct intel_gt *gt, unsigned int intf_id)
 	if (gt->gsc.intf[intf_id].irq < 0)
 		return;
 
+#ifdef CONFIG_PREEMPT_RT
+	/* mei interrupt top half should run in irq disabled context */
+	irq_disabled_flag = irqs_disabled();
+	if (!irq_disabled_flag)
+		local_irq_disable();
+#endif
 	ret = generic_handle_irq(gt->gsc.intf[intf_id].irq);
+#ifdef CONFIG_PREEMPT_RT
+	if (!irq_disabled_flag)
+		local_irq_enable();
+#endif
+
 	if (ret)
 		gt_err_ratelimited(gt, "error handling GSC irq: %d\n", ret);
 }
-- 
2.34.1

