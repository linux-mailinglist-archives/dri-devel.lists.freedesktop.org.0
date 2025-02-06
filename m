Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0162BA2AFE3
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 19:10:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576C310E8F5;
	Thu,  6 Feb 2025 18:10:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="elmcILfm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3233D10E8F5;
 Thu,  6 Feb 2025 18:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738865410; x=1770401410;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=938+DV0T+4G520M30kBtArirNw3aiGYcVzHJpj5TwFM=;
 b=elmcILfmhLFn/XxV3FSqbLzSfd3kYgG4pqZ1BqMxQV2q4fH5ew3QCme9
 2Esb6Pwnjx1aTaUUYuXlF1H7WHgR8cz8+q2SdkhPrPUHDVWirMj9URYmw
 Ri7Mllw0p1OeNJFtGV4cacrI3fJXU0EDtmQC6Vt8KEhqY1YpcwOeKnrY8
 sy4zK7uROPNW/dTG8LpuMYaWmufqr5isz9oRLsyJZjTlHYGmbdRpF1BA4
 8MvjRQPRVlxYrnnnYtwig8HgriAk7k/Pbz3q6TNVSgwL4UMA16jaMCf88
 lUwXsCFlA+8zD3Qwy3swZia0j0kAeaFz5ZJcm8zaRpJQhEdQNjsBGw8C/ w==;
X-CSE-ConnectionGUID: JFuL8PqdRzO1mPCqwWkMNw==
X-CSE-MsgGUID: EASjsm7HTsioJSo5Ns+y6Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="61965293"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="61965293"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 10:10:09 -0800
X-CSE-ConnectionGUID: Wj1wBFY/TMuEO/NlVxcX+A==
X-CSE-MsgGUID: iNNQzeODTYudT+I/g0A+TA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="111889316"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.55])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 10:10:06 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH 2/3] drm/i915: Fix GT sysfs unregister tried even if not
 registered
Date: Thu,  6 Feb 2025 19:07:40 +0100
Message-ID: <20250206180927.2237256-7-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250206180927.2237256-5-janusz.krzysztofik@linux.intel.com>
References: <20250206180927.2237256-5-janusz.krzysztofik@linux.intel.com>
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

We return immediately from i915_driver_register() if drm_dev_register()
fails, skipping remaining registration steps.  However, the _unregister()
counterpart called at device remove knows nothing about that skip and
executes reverts for all those steps.  For that to work correctly, those
revert functions must be resistant to being called even on uninitialized
objects, or we must not skip their initialization.

If registration of a GT sysfs, expected to be performed on each GT
register, is skipped then its unregister counterpart, unconditionally
called on each GT unregister when unregistering the driver, fails and
emits a warning that taints the kernel:

<3> [525.823143] i915 0000:00:02.0: [drm] *ERROR* Failed to register driver for userspace access!
...
<4> [525.947666] ------------[ cut here ]------------
<4> [525.947669] kobject: '(null)' (ffff88814f62a218): is not initialized, yet kobject_put() is being called.
<4> [525.947707] WARNING: CPU: 6 PID: 3440 at lib/kobject.c:734 kobject_put+0xe4/0x200
...
<4> [525.947875] RIP: 0010:kobject_put+0xe4/0x200
...
<4> [525.947909] Call Trace:
<4> [525.947911]  <TASK>
...
<4> [525.947963]  intel_gt_sysfs_unregister+0x25/0x40 [i915]
<4> [525.948133]  intel_gt_driver_unregister+0x14/0x80 [i915]
<4> [525.948291]  i915_driver_remove+0x6c/0x140 [i915]
<4> [525.948411]  i915_pci_remove+0x1e/0x40 [i915]

Since restoring symmetry by registering GTs even after a failure is not
possible due to missing dependencies, teach the unregister counterpart
to handle never registered GT sysfs cases gently.

Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12817
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c b/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
index 33cba406b5698..b3d1b1240939d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
+++ b/drivers/gpu/drm/i915/gt/intel_gt_sysfs.c
@@ -111,6 +111,9 @@ void intel_gt_sysfs_register(struct intel_gt *gt)
 
 void intel_gt_sysfs_unregister(struct intel_gt *gt)
 {
+	if (!gt->sysfs_defaults)
+		return;
+
 	kobject_put(gt->sysfs_defaults);
 	kobject_put(&gt->sysfs_gt);
 }
-- 
2.47.1

