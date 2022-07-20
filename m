Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8000257B634
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 14:16:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7935612A5F9;
	Wed, 20 Jul 2022 12:16:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CD6512A2C4;
 Wed, 20 Jul 2022 12:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658319345; x=1689855345;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cnGW971gTKAjs5K8BebO0eDFgVCDB9gEsxUcT1skyLQ=;
 b=Mf+XIzEAPElRrM+q0NMFQMUViZz3MQHZ16dneyNjnBEIxqbI+ecJQHqm
 seczSx4ybvsNwt27BU3Frs0kwlhhiV7SXUNtjprOA/2FuSxjbs3xqWvyI
 Vq1RpPm+7iDwuQZWAUP6Yb8kVC3HV0cg54XiBx/vFYkkqEGhnEaDxVdv0
 5Ls71Bi7E91RyExIPsW7u4Ku8nxECzmfrcxYHnqgLHSVt+kiDLaIcGokj
 5YQ9iHw4kp9/cfT8DdCngbGv5S71Qc/qIDeqQ+uXRqNq1D/U58d+9MFCf
 NVXUnXrlYOZ4XYfaXjUsiZQZ7aJHr9LNPPRC8WGjtXjUr3EHnkjfjC8gq A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10413"; a="273598879"
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="273598879"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 05:15:44 -0700
X-IronPort-AV: E=Sophos;i="5.92,286,1650956400"; d="scan'208";a="573280118"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2022 05:15:42 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v4 2/3] drm/i915/fbdev: suspend HPD before fbdev unregistration
Date: Wed, 20 Jul 2022 14:15:07 +0200
Message-Id: <20220720121508.1202750-3-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720121508.1202750-1-andrzej.hajda@intel.com>
References: <20220720121508.1202750-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HPD event after fbdev unregistration can cause registration of deferred
fbdev which will not be unregistered later, causing use-after-free.
To avoid it HPD handling should be suspended before fbdev unregistration.

It should fix following GPF:
[272.634530] general protection fault, probably for non-canonical address 0x6b6b6b6b6b6b6b6b: 0000 [#1] PREEMPT SMP NOPTI
[272.634536] CPU: 0 PID: 6030 Comm: i915_selftest Tainted: G     U            5.18.0-rc5-CI_DRM_11603-g12dccf4f5eef+ #1
[272.634541] Hardware name: Intel Corporation Raptor Lake Client Platform/RPL-S ADP-S DDR5 UDIMM CRB, BIOS RPLSFWI1.R00.2397.A01.2109300731 09/30/2021
[272.634545] RIP: 0010:fb_do_apertures_overlap.part.14+0x26/0x60
...
[272.634582] Call Trace:
[272.634583]  <TASK>
[272.634585]  do_remove_conflicting_framebuffers+0x59/0xa0
[272.634589]  remove_conflicting_framebuffers+0x2d/0xc0
[272.634592]  remove_conflicting_pci_framebuffers+0xc8/0x110
[272.634595]  drm_aperture_remove_conflicting_pci_framebuffers+0x52/0x70
[272.634604]  i915_driver_probe+0x63a/0xdd0 [i915]

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5329
Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5510
Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_fbdev.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 221336178991f0..b682fd72d4bf25 100644
--- a/drivers/gpu/drm/i915/display/intel_fbdev.c
+++ b/drivers/gpu/drm/i915/display/intel_fbdev.c
@@ -573,7 +573,8 @@ void intel_fbdev_unregister(struct drm_i915_private *dev_priv)
 	if (!ifbdev)
 		return;
 
-	cancel_work_sync(&dev_priv->fbdev_suspend_work);
+	intel_fbdev_set_suspend(&dev_priv->drm, FBINFO_STATE_SUSPENDED, true);
+
 	if (!current_is_async())
 		intel_fbdev_sync(ifbdev);
 
-- 
2.25.1

