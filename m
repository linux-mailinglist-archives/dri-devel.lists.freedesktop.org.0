Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QM34Oml4g2nwngMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 17:48:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F12EA834
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 17:48:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A63210E6D1;
	Wed,  4 Feb 2026 16:48:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="elWXs1VI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 324B610E6D1;
 Wed,  4 Feb 2026 16:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1770223719; x=1801759719;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hqaixW3GZxkQ3u0RRS+ZcVJuGFrnEeCqG5FxLxxelZA=;
 b=elWXs1VIQbKy+hbV7a09TRecDMeVpTwJ7NXiAaY3JerM66Wl+iR6fnvJ
 yGTdNb+8ZqxPNOflzLyHKzwp0w/1DfOUlmyIbXwO06Jb2oTBnwq1tz1p4
 r9fGaERyY0Lq+lC9sXbu13eQKhmXY+NKf/Vs4ZvYqGSN8os2iOXelp9uM
 qXisAGYbjWsULF6bxUaE8OXi+nZX0qPD/QJvCiRb8PJQYfGOMScqeKA4o
 VccpDmH8WUMn21AB+qDn1xbUhesxdJoIA93txiQaZXkD8KLCjklA4vyai
 46BP/FZhHSFmXJDR41CxMMz4gB7raiZhnX/1oZhl42+xuqC4Q0bf+k/Dg Q==;
X-CSE-ConnectionGUID: gi1nazsLQtanEJOq/0Uw1A==
X-CSE-MsgGUID: dDJNEo/VQcaUJPEEmY8n0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71578997"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="71578997"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:48:38 -0800
X-CSE-ConnectionGUID: yBxwfeD5SpC0LKm20rrzGQ==
X-CSE-MsgGUID: Zk7VEgN8RrWQ1x844OYi3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; d="scan'208";a="210311606"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.7])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2026 08:48:34 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: jani.nikula@intel.com, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Subject: [PATCH 1/2] drm/i915: drop display version 2-4 overlay uAPI
Date: Wed,  4 Feb 2026 18:48:26 +0200
Message-ID: <20260204164827.807502-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[intel.com,gmail.com,ffwll.ch,linux.intel.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jani.nikula@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,intel.com:dkim,intel.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 49F12EA834
X-Rspamd-Action: no action

i915 has a custom overlay IOCTL uAPI for display version 2-4, give or
take a few platforms.

The implementation sits somewhere between i915 display and core
(although the files are located under display). In order to properly
separate display and core, a lot of refactoring would be required,
splitting the functionality, defining better interfaces between them,
and so on.

The problem is, there are no IGT tests for the overlay IOCTLs,
I915_OVERLAY_PUT_IMAGE and I915_OVERLAY_ATTRS, at all. And even if there
were IGT tests, there seems to be only one PNV machine with overlay
support left in CI, at this time. A significant refactoring without
testing or CI support is bound to break something.

In user space the functionality is, to the best of my knowledge, only
supported by xf86-video-intel. There have been no updates to it in the
past six years, and the last tag is from 10+ years ago. It's been at the
end of the line for quite some time now. It's not really something
people should be using. The question is, if we regressed the
functionality, who is even going to notice, and when?

Let's just drop the custom IOCTL support.

The functionality is behind an I915_GETPARAM feature check, and the
current IOCTLs expect the caller to respect that. Return 0 for the
feature check, and -ENODEV for the IOCTLs, reusing and refactoring
i915_gem_reject_pin_ioctl() as i915_enodev_ioctl() for the job.

Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/i915_driver.c   | 13 +++++--------
 drivers/gpu/drm/i915/i915_getparam.c |  4 +---
 2 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index c01a35ecfa2f..da8f0210cc46 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -65,7 +65,6 @@
 #include "display/intel_gmbus.h"
 #include "display/intel_hotplug.h"
 #include "display/intel_opregion.h"
-#include "display/intel_overlay.h"
 #include "display/intel_pch_refclk.h"
 #include "display/intel_pps.h"
 #include "display/intel_sbi.h"
@@ -1772,9 +1771,7 @@ static const struct file_operations i915_driver_fops = {
 	.fop_flags = FOP_UNSIGNED_OFFSET,
 };
 
-static int
-i915_gem_reject_pin_ioctl(struct drm_device *dev, void *data,
-			  struct drm_file *file)
+static int i915_enodev_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
 {
 	return -ENODEV;
 }
@@ -1800,8 +1797,8 @@ static const struct drm_ioctl_desc i915_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(I915_GEM_INIT, drm_noop, DRM_AUTH|DRM_MASTER|DRM_ROOT_ONLY),
 	DRM_IOCTL_DEF_DRV(I915_GEM_EXECBUFFER, drm_invalid_op, DRM_AUTH),
 	DRM_IOCTL_DEF_DRV(I915_GEM_EXECBUFFER2_WR, i915_gem_execbuffer2_ioctl, DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(I915_GEM_PIN, i915_gem_reject_pin_ioctl, DRM_AUTH|DRM_ROOT_ONLY),
-	DRM_IOCTL_DEF_DRV(I915_GEM_UNPIN, i915_gem_reject_pin_ioctl, DRM_AUTH|DRM_ROOT_ONLY),
+	DRM_IOCTL_DEF_DRV(I915_GEM_PIN, i915_enodev_ioctl, DRM_AUTH|DRM_ROOT_ONLY),
+	DRM_IOCTL_DEF_DRV(I915_GEM_UNPIN, i915_enodev_ioctl, DRM_AUTH|DRM_ROOT_ONLY),
 	DRM_IOCTL_DEF_DRV(I915_GEM_BUSY, i915_gem_busy_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(I915_GEM_SET_CACHING, i915_gem_set_caching_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(I915_GEM_GET_CACHING, i915_gem_get_caching_ioctl, DRM_RENDER_ALLOW),
@@ -1821,8 +1818,8 @@ static const struct drm_ioctl_desc i915_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(I915_GEM_GET_APERTURE, i915_gem_get_aperture_ioctl, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(I915_GET_PIPE_FROM_CRTC_ID, intel_crtc_get_pipe_from_crtc_id_ioctl, 0),
 	DRM_IOCTL_DEF_DRV(I915_GEM_MADVISE, i915_gem_madvise_ioctl, DRM_RENDER_ALLOW),
-	DRM_IOCTL_DEF_DRV(I915_OVERLAY_PUT_IMAGE, intel_overlay_put_image_ioctl, DRM_MASTER),
-	DRM_IOCTL_DEF_DRV(I915_OVERLAY_ATTRS, intel_overlay_attrs_ioctl, DRM_MASTER),
+	DRM_IOCTL_DEF_DRV(I915_OVERLAY_PUT_IMAGE, i915_enodev_ioctl, DRM_MASTER),
+	DRM_IOCTL_DEF_DRV(I915_OVERLAY_ATTRS, i915_enodev_ioctl, DRM_MASTER),
 	DRM_IOCTL_DEF_DRV(I915_SET_SPRITE_COLORKEY, intel_sprite_set_colorkey_ioctl, DRM_MASTER),
 	DRM_IOCTL_DEF_DRV(I915_GET_SPRITE_COLORKEY, drm_noop, DRM_MASTER),
 	DRM_IOCTL_DEF_DRV(I915_GEM_WAIT, i915_gem_wait_ioctl, DRM_RENDER_ALLOW),
diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
index cf47c2491a0a..cdf8ad4b6f3a 100644
--- a/drivers/gpu/drm/i915/i915_getparam.c
+++ b/drivers/gpu/drm/i915/i915_getparam.c
@@ -4,7 +4,6 @@
 
 #include <drm/drm_print.h>
 
-#include "display/intel_overlay.h"
 #include "gem/i915_gem_mman.h"
 #include "gt/intel_engine_user.h"
 #include "pxp/intel_pxp.h"
@@ -18,7 +17,6 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 			struct drm_file *file_priv)
 {
 	struct drm_i915_private *i915 = to_i915(dev);
-	struct intel_display *display = i915->display;
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	const struct sseu_dev_info *sseu = &to_gt(i915)->info.sseu;
 	drm_i915_getparam_t *param = data;
@@ -41,7 +39,7 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 		value = to_gt(i915)->ggtt->num_fences;
 		break;
 	case I915_PARAM_HAS_OVERLAY:
-		value = intel_overlay_available(display);
+		value = 0;
 		break;
 	case I915_PARAM_HAS_BSD:
 		value = !!intel_engine_lookup_user(i915,
-- 
2.47.3

