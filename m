Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9AF561CB1
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 16:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54AF11B1EE;
	Thu, 30 Jun 2022 14:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD71C11B1CD;
 Thu, 30 Jun 2022 14:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656597826; x=1688133826;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TD4vUpyaKldefz9Z4eNZL8pceZrDVpmvWLWLlfrAxSE=;
 b=RKxSSz2nhnXLX+A6XhkNN1whULjUPFUG673tcNObI98PR1+7Aq5tJTEK
 xy9jyKK5BQCBJl/XO8OV9tvVymGhmJ5WtGB2g0/f7eJEcsHMfi/zmEYT6
 wc1Q5SDmkcAx3mSTQrqvmrB7m/WCp3USte6EBxItd9l7s8dzioIENiUzL
 fXJ4s285PcuCoKTIGfB4XWd2lupN1ruIzsHAlZ+5qCyKA8flldaUS2H7O
 c/omvLmirbTEALmtQYvJUxa5F7HPtPfNBVSwNB5kB2AtVQK/fsI+xcMZx
 NtwBY0wkiVhvpiWU9SDb5DZ0RjCAo1CT3/Wa8qBCY7jgXnogm8PhKS9+e g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="262153434"
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; d="scan'208";a="262153434"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 07:03:30 -0700
X-IronPort-AV: E=Sophos;i="5.92,234,1650956400"; d="scan'208";a="647903049"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2022 07:03:28 -0700
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v2 2/2] drm/i915/fbdev: suspend HPD before fbdev unregistration
Date: Thu, 30 Jun 2022 16:03:08 +0200
Message-Id: <20220630140308.3485100-3-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630140308.3485100-1-andrzej.hajda@intel.com>
References: <20220630140308.3485100-1-andrzej.hajda@intel.com>
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

