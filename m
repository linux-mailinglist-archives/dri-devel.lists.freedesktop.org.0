Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D0F4BB650
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 11:05:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6C1210F035;
	Fri, 18 Feb 2022 10:05:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7075710F047;
 Fri, 18 Feb 2022 10:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645178737; x=1676714737;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qaTNC+xXZmSxaE21z5U0LL34TH0l+uk/IjYSVhvcYhs=;
 b=G4E6EmJA1xui9xLsIYcj3s5+yPvt27LJHUWZZEoIE1iki5K0IQV+lVpG
 9lSzYMRiWxVB/hsBR8zNsK4eXPwzbq3NUVf53Ez1r/3Uv7s5bFFRHiDSI
 dgh4QQ2FatAriqjiN+SFMvo7abPC2uB1kTNo9KN0JIzdJwaCcOiDwixLG
 sBeLhxgBW/hSBTVXatlaIVbwdysmE1VYQiKY79CvFGFXe0dg9btz4l0n3
 YI2wdd2scFQXGvlW5K32B75rK4teOdN2pPd9h/mo7UsWaztPoXqAL4Wt4
 O+J8KZXahpcyW/o/UWe9OLHwtI406uOjQyjgx0+6zOV4gm0jULF73rubk g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="337541527"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="337541527"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 02:05:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="530863934"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga007.jf.intel.com with SMTP; 18 Feb 2022 02:05:33 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Feb 2022 12:05:33 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 22/22] drm: Use drm_mode_copy()
Date: Fri, 18 Feb 2022 12:04:03 +0200
Message-Id: <20220218100403.7028-23-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

struct drm_display_mode embeds a list head, so overwriting
the full struct with another one will corrupt the list
(if the destination mode is on a list). Use drm_mode_copy()
instead which explicitly preserves the list head of
the destination mode.

Even if we know the destination mode is not on any list
using drm_mode_copy() seems decent as it sets a good
example. Bad examples of not using it might eventually
get copied into code where preserving the list head
actually matters.

Obviously one case not covered here is when the mode
itself is embedded in a larger structure and the whole
structure is copied. But if we are careful when copying
into modes embedded in structures I think we can be a
little more reassured that bogus list heads haven't been
propagated in.

@is_mode_copy@
@@
drm_mode_copy(...)
{
...
}

@depends on !is_mode_copy@
struct drm_display_mode *mode;
expression E, S;
@@
(
- *mode = E
+ drm_mode_copy(mode, &E)
|
- memcpy(mode, E, S)
+ drm_mode_copy(mode, E)
)

@depends on !is_mode_copy@
struct drm_display_mode mode;
expression E;
@@
(
- mode = E
+ drm_mode_copy(&mode, &E)
|
- memcpy(&mode, E, S)
+ drm_mode_copy(&mode, E)
)

@@
struct drm_display_mode *mode;
@@
- &*mode
+ mode

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_crtc_helper.c | 4 ++--
 drivers/gpu/drm/drm_vblank.c      | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index a34aa009725f..b632825654a9 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -305,7 +305,7 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc,
 	/* Update crtc values up front so the driver can rely on them for mode
 	 * setting.
 	 */
-	crtc->mode = *mode;
+	drm_mode_copy(&crtc->mode, mode);
 	crtc->x = x;
 	crtc->y = y;
 
@@ -341,7 +341,7 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc,
 	}
 	DRM_DEBUG_KMS("[CRTC:%d:%s]\n", crtc->base.id, crtc->name);
 
-	crtc->hwmode = *adjusted_mode;
+	drm_mode_copy(&crtc->hwmode, adjusted_mode);
 
 	/* Prepare the encoders and CRTCs before setting the mode. */
 	drm_for_each_encoder(encoder, dev) {
diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index b701cda86d0c..2ff31717a3de 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -644,7 +644,7 @@ void drm_calc_timestamping_constants(struct drm_crtc *crtc,
 
 	vblank->linedur_ns  = linedur_ns;
 	vblank->framedur_ns = framedur_ns;
-	vblank->hwmode = *mode;
+	drm_mode_copy(&vblank->hwmode, mode);
 
 	drm_dbg_core(dev,
 		     "crtc %u: hwmode: htotal %d, vtotal %d, vdisplay %d\n",
-- 
2.34.1

