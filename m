Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C61694BB659
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 11:05:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FD710F045;
	Fri, 18 Feb 2022 10:05:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43D910F036;
 Fri, 18 Feb 2022 10:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645178740; x=1676714740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PUqy1tbdJNwPaIOxliV4UfMNjPZ/izCMpv8A1Z1PLUQ=;
 b=c8hKm17DCb39Ai+UrJBwcOz2JsMXYf457SKR8XJo/fp0w7f4ZuQPip8n
 WAEzi2qrI3+/UfpuuyvVqj/j+cnPCutJkik8os3DpY9JA9QnHiI7bS18K
 xSmqsQzlny7G0FBc/jmnl/iwU7QqERvZjimbuSK591gXj6FjnSFkx9pGA
 QuJXtXlAWZ3tFxcb7II7Lcg0N5JJAZ9vFjYmS9Owb5jP44eEMqE2vH6HI
 4nmnFtKvwGSOUM8MTxVjGEd4XBORYlvdCOKu6T/lr6/0iRulqSlw+tHSi
 H63XbmX4NUWhJQF1dqIf+HSREDOqJ+ba0U5uy24Ee23mqzn/3rmXGbcrM g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="249931355"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="249931355"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 02:05:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="635674555"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by fmsmga002.fm.intel.com with SMTP; 18 Feb 2022 02:05:21 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Feb 2022 12:05:20 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 18/22] drm/i915: Use drm_mode_init() for on-stack modes
Date: Fri, 18 Feb 2022 12:03:59 +0200
Message-Id: <20220218100403.7028-19-ville.syrjala@linux.intel.com>
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

Initialize on-stack modes with drm_mode_init() to guarantee
no stack garbage in the list head, or that we aren't copying
over another mode's list head.

Based on the following cocci script, with manual fixups:
@decl@
identifier M;
expression E;
@@
- struct drm_display_mode M = E;
+ struct drm_display_mode M;

@@
identifier decl.M;
expression decl.E;
statement S, S1;
@@
struct drm_display_mode M;
... when != S
+ drm_mode_init(&M, &E);
+
S1

@@
expression decl.E;
@@
- &*E
+ E

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 740620ef07ad..74c5a99ab276 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -6898,8 +6898,9 @@ intel_crtc_update_active_timings(const struct intel_crtc_state *crtc_state)
 {
 	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
 	struct drm_i915_private *dev_priv = to_i915(crtc->base.dev);
-	struct drm_display_mode adjusted_mode =
-		crtc_state->hw.adjusted_mode;
+	struct drm_display_mode adjusted_mode;
+
+	drm_mode_init(&adjusted_mode, &crtc_state->hw.adjusted_mode);
 
 	if (crtc_state->vrr.enable) {
 		adjusted_mode.crtc_vtotal = crtc_state->vrr.vmax;
-- 
2.34.1

