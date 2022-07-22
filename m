Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D4B57E1A7
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jul 2022 14:52:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC5A2BFF8;
	Fri, 22 Jul 2022 12:52:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE148112F21;
 Fri, 22 Jul 2022 12:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658494326; x=1690030326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=gV1f3pXRyRxJeSX8JRlGkq8JDzLneM6hAGT21tMbo3E=;
 b=micDE4SzcYQ+dorfwKgdUExn/nVC+rCX9fp7mqNY7oBH7r6DHLa3jBhW
 ItOGNRwlv3rIbx3adRgQhE+ZASDm7LYLF0SW+YI/IssaA9kf5fwGXf0ZP
 Es1snVmH85TLuRymWHUz3fghWJxML5dE1d2lQgmsAiaSAWqnWLaVdle9e
 qvEIEwxygMtBBTp1OMkBVFivHTCr+T2hep5sCb9noHxJM0Wbxr/opwa/a
 kf41GA//OmSQPeg0fMjTFfOkpaBwXtVxFEr1YHlwl/5Ja02x/Hw87OXm8
 ZPEg5c1YeXpZv1xj5cqRrclLVs/ITM34yiVIvriyzNTOYDi1aKyjucIe3 w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10415"; a="288061173"
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; d="scan'208";a="288061173"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2022 05:52:06 -0700
X-IronPort-AV: E=Sophos;i="5.93,185,1654585200"; d="scan'208";a="626550944"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jul 2022 05:52:04 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v6 2/4] drm/i915/fbdev: suspend HPD before fbdev unregistration
Date: Fri, 22 Jul 2022 14:51:41 +0200
Message-Id: <20220722125143.1604709-3-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220722125143.1604709-1-andrzej.hajda@intel.com>
References: <20220722125143.1604709-1-andrzej.hajda@intel.com>
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
 drivers/gpu/drm/i915/display/intel_fbdev.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_fbdev.c b/drivers/gpu/drm/i915/display/intel_fbdev.c
index 221336178991f0..94ddc0f34fde64 100644
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
 
@@ -618,7 +619,7 @@ void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous
 	struct fb_info *info;
 
 	if (!ifbdev || !ifbdev->vma)
-		return;
+		goto unlock;
 
 	info = ifbdev->helper.fbdev;
 
@@ -661,6 +662,7 @@ void intel_fbdev_set_suspend(struct drm_device *dev, int state, bool synchronous
 	drm_fb_helper_set_suspend(&ifbdev->helper, state);
 	console_unlock();
 
+unlock:
 	intel_fbdev_hpd_set_suspend(dev_priv, state);
 }
 
-- 
2.25.1

