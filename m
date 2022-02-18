Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4306D4BB630
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 11:04:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68FD210EE77;
	Fri, 18 Feb 2022 10:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5D7810ED5F;
 Fri, 18 Feb 2022 10:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645178682; x=1676714682;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=egpcGDWyNA+kSMrTnKY0NnLDjm381z1cwgUobC378rU=;
 b=ShBuVxJGZro71XeWwDQi1mcwMGbhbQnYCiPOv91kDpixzFMaQpbgQtwo
 B3vya6LAkwNmSlPxZby8GWnZHCwgW4sPzP8Tv5hjqdb1jr7BmMBeLSKtJ
 F6RYcHTIL6G9eKo7YRLIPQmWP6trb7Jnw8VfyR5Y7fnetQuGch65f5Wlp
 P4liPah5duHFqjymwMZLHF3vI4LCWFXel6cxJ0y0snjdE3a64fjrA5bwl
 A3LR5QbGy6DG8ZUtBE+mYbddeyhGeqNaofXVyZwwllEYIfMaBj4REnTJQ
 7GMk6zApcqed4D7Jx0WYSoyjbfqKhBowpovwp4PI083GymXDra7rMe6J+ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="249931187"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="249931187"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 02:04:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="590153734"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by fmsmga008.fm.intel.com with SMTP; 18 Feb 2022 02:04:39 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Feb 2022 12:04:39 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/22] drm/gma500: Use drm_mode_copy()
Date: Fri, 18 Feb 2022 12:03:48 +0200
Message-Id: <20220218100403.7028-8-ville.syrjala@linux.intel.com>
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

Cc: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/gma500/oaktrail_crtc.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/gma500/oaktrail_crtc.c b/drivers/gpu/drm/gma500/oaktrail_crtc.c
index 36c7c2686c90..79fc602b35bc 100644
--- a/drivers/gpu/drm/gma500/oaktrail_crtc.c
+++ b/drivers/gpu/drm/gma500/oaktrail_crtc.c
@@ -385,12 +385,8 @@ static int oaktrail_crtc_mode_set(struct drm_crtc *crtc,
 	if (!gma_power_begin(dev, true))
 		return 0;
 
-	memcpy(&gma_crtc->saved_mode,
-		mode,
-		sizeof(struct drm_display_mode));
-	memcpy(&gma_crtc->saved_adjusted_mode,
-		adjusted_mode,
-		sizeof(struct drm_display_mode));
+	drm_mode_copy(&gma_crtc->saved_mode, mode);
+	drm_mode_copy(&gma_crtc->saved_adjusted_mode, adjusted_mode);
 
 	list_for_each_entry(connector, &mode_config->connector_list, head) {
 		if (!connector->encoder || connector->encoder->crtc != crtc)
-- 
2.34.1

