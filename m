Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EF14BB64B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 11:05:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E462710F024;
	Fri, 18 Feb 2022 10:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F53110F024;
 Fri, 18 Feb 2022 10:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645178728; x=1676714728;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hcVzhZodcMoOb6EhljxJkIPxUEl9mgAJWAieBEsYSCc=;
 b=iwSh1YF8JOsGGBtWFRNY51W6LFU+ZQhELOpm3XtbfqPaH9kxoQPgfZim
 lCzP75BA8uwas58sOv5kmPvWP77hXRkviU4RZQ1qZYhYjTl23g54Q4dJB
 1fKY/bN5RdG2EGaZR1siHlJ/hv6mZBpH0rx43oaqembw+Frpd2XRuH8CY
 KhOhiF7sD3j2AMLKooEiws83q9UbJs3aifZcCSC/CvcpSWH9kDk+Y5Tjo
 xkpOkeIz7zxoWbrIrMLTE3BMbNfMx9E4zT4RybWXWJDxwEKyxsYOG/UEO
 VYRDWeAtoSlUOqt815FKCAOeJu9W1/8uxLLMpQYuZUBmlVAM1PVdbthzS g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="238502186"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="238502186"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 02:05:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="541855402"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by fmsmga007.fm.intel.com with SMTP; 18 Feb 2022 02:05:24 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Feb 2022 12:05:23 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 19/22] drm/i915: Use drm_mode_copy()
Date: Fri, 18 Feb 2022 12:04:00 +0200
Message-Id: <20220218100403.7028-20-ville.syrjala@linux.intel.com>
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
 drivers/gpu/drm/i915/display/intel_display.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 74c5a99ab276..661e36435793 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -5506,8 +5506,10 @@ intel_crtc_copy_uapi_to_hw_state_modeset(struct intel_atomic_state *state,
 
 	crtc_state->hw.enable = crtc_state->uapi.enable;
 	crtc_state->hw.active = crtc_state->uapi.active;
-	crtc_state->hw.mode = crtc_state->uapi.mode;
-	crtc_state->hw.adjusted_mode = crtc_state->uapi.adjusted_mode;
+	drm_mode_copy(&crtc_state->hw.mode,
+		      &crtc_state->uapi.mode);
+	drm_mode_copy(&crtc_state->hw.adjusted_mode,
+		      &crtc_state->uapi.adjusted_mode);
 	crtc_state->hw.scaling_filter = crtc_state->uapi.scaling_filter;
 
 	intel_crtc_copy_uapi_to_hw_state_nomodeset(state, crtc);
@@ -5584,9 +5586,12 @@ copy_bigjoiner_crtc_state_modeset(struct intel_atomic_state *state,
 	memset(&slave_crtc_state->hw, 0, sizeof(slave_crtc_state->hw));
 	slave_crtc_state->hw.enable = master_crtc_state->hw.enable;
 	slave_crtc_state->hw.active = master_crtc_state->hw.active;
-	slave_crtc_state->hw.mode = master_crtc_state->hw.mode;
-	slave_crtc_state->hw.pipe_mode = master_crtc_state->hw.pipe_mode;
-	slave_crtc_state->hw.adjusted_mode = master_crtc_state->hw.adjusted_mode;
+	drm_mode_copy(&slave_crtc_state->hw.mode,
+		      &master_crtc_state->hw.mode);
+	drm_mode_copy(&slave_crtc_state->hw.pipe_mode,
+		      &master_crtc_state->hw.pipe_mode);
+	drm_mode_copy(&slave_crtc_state->hw.adjusted_mode,
+		      &master_crtc_state->hw.adjusted_mode);
 	slave_crtc_state->hw.scaling_filter = master_crtc_state->hw.scaling_filter;
 
 	copy_bigjoiner_crtc_state_nomodeset(state, slave_crtc);
-- 
2.34.1

