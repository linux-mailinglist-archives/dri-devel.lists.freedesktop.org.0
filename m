Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E4FA2AFE4
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 19:10:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B65F10E8F7;
	Thu,  6 Feb 2025 18:10:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hQjw32Tx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E964110E8F6;
 Thu,  6 Feb 2025 18:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738865412; x=1770401412;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7PMBIvNWvtgiLxcwJPkuicu6E83kkxxMIdHz14vqq9M=;
 b=hQjw32TxWqm1rGJgcvZbMjdRVlRzhtUyw3w2c34VoSWcchmONFo9lZoG
 VMRgHRQTB6EUYWfaP1X6Y8192dK7WJaHfAS4CJVFa8BFuq9WefSBKbeyx
 05Cxox1vq0abvL/G0xCGoh7QOWadAkymIDqe8ECSyxFd0Y7osj+P8jENd
 cf8nI3HQ/sAtXnO7tj3rbUm+AUgdp4FZZSre9H0RbVBFg30lyvQH4C6+h
 O/G4LBiqLUpAdcwrsf7At0/BNYrpBvqqvFF16xL/jE0bJiY3LYKXL3FvE
 R9MtbkW/uOZM4dGRRXBPjfSgaeJzQou/bTZVqGmq9n3taN+SrkGqXUsBm g==;
X-CSE-ConnectionGUID: CoLHZoaoTqaopQiuzX6V0w==
X-CSE-MsgGUID: b1QHIkj2Qwmfv2zlnJV0RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="61965301"
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="61965301"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 10:10:12 -0800
X-CSE-ConnectionGUID: NuRdCKfpR5+ak10Vei6Q+A==
X-CSE-MsgGUID: ytkFN/KYQZ6SBN+XV98gmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,264,1732608000"; d="scan'208";a="111889323"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.246.55])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Feb 2025 10:10:09 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH 3/3] drm/i915: Fix device sysfs teardown tried even if not set
 up
Date: Thu,  6 Feb 2025 19:07:41 +0100
Message-ID: <20250206180927.2237256-8-janusz.krzysztofik@linux.intel.com>
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

If device sysfs setup is skipped then its teardown counterpart,
unconditionally called when unregistering the driver, fails and emits
a warning that taints the kernel:

<3> [525.823143] i915 0000:00:02.0: [drm] *ERROR* Failed to register driver for userspace access!
...
<4> [526.441186] ------------[ cut here ]------------
<4> [526.441191] kernfs: can not remove 'error', no directory
<4> [526.441211] WARNING: CPU: 1 PID: 3440 at fs/kernfs/dir.c:1684 kernfs_remove_by_name_ns+0xbc/0xc0
...
<4> [526.441536] RIP: 0010:kernfs_remove_by_name_ns+0xbc/0xc0
...
<4> [526.441578] Call Trace:
<4> [526.441581]  <TASK>
...
<4> [526.441686]  sysfs_remove_bin_file+0x17/0x30
<4> [526.441691]  i915_gpu_error_sysfs_teardown+0x1d/0x30 [i915]
<4> [526.442226]  i915_teardown_sysfs+0x1c/0x60 [i915]
<4> [526.442369]  i915_driver_remove+0x9d/0x140 [i915]
<4> [526.442473]  i915_pci_remove+0x1e/0x40 [i915]
...

Since restoring symmetry by setting up the device sysfs even after a
failure is not possible due to missing dependencies, teach the teardown
counterpart to handle all components of the never set up device sysfs
gently.

Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/9820
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10131
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10887
Link: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12817
Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/gpu/drm/i915/i915_sysfs.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_sysfs.c b/drivers/gpu/drm/i915/i915_sysfs.c
index 8775beab9cb84..9758a7ca27fd2 100644
--- a/drivers/gpu/drm/i915/i915_sysfs.c
+++ b/drivers/gpu/drm/i915/i915_sysfs.c
@@ -189,6 +189,9 @@ void i915_teardown_sysfs(struct drm_i915_private *dev_priv)
 {
 	struct device *kdev = dev_priv->drm.primary->kdev;
 
+	if (!dev_priv->sysfs_gt)
+		return;
+
 	i915_gpu_error_sysfs_teardown(dev_priv);
 
 	device_remove_bin_file(kdev, &dpf_attrs_1);
-- 
2.47.1

