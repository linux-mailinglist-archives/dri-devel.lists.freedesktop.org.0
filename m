Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C9DA429A1
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 18:27:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 363F610E4C1;
	Mon, 24 Feb 2025 17:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="j//30GVA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD11010E495;
 Mon, 24 Feb 2025 17:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740418034; x=1771954034;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1S+gbQI4tRMHfpY74D40BT/HxUgN89obzD0BxMRZEqg=;
 b=j//30GVA09mlkjc9cuqDH7Rqtxw0ChCc+88mu9eGeKBq8CqQYcZxFSDB
 UHkaGUjfrQ0R7uXPAmGjLuIN/9SV3ruv72O/csnrt13sXGORM75Hboqsb
 q0r/vgDl4lXk/YckWzdea6JXfZdQxSF+frZn89sDxbQL5q3eRhiF+fAMu
 iyUnmP5BrKpfbOUx3JsKyS/Aot13B5SzeCJ5ZxVoWjFjBYfnYR0MX7MyD
 XwkGslv/LzFKcAcd1xiOLxXW5hh7Nvet8+lqX1G9y8iT/rPfl2a8kMlmx
 kFNPLwI61IeMwhSRAlSTYDWyEw8ciwDu7HzBmyXnzUeFkwXN6Ok972MWV w==;
X-CSE-ConnectionGUID: zFLho8JLRCmZJCeCRL6RGg==
X-CSE-MsgGUID: il+wWR+RShe3CKdcO3yndw==
X-IronPort-AV: E=McAfee;i="6700,10204,11355"; a="58601773"
X-IronPort-AV: E=Sophos;i="6.13,312,1732608000"; d="scan'208";a="58601773"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2025 09:27:14 -0800
X-CSE-ConnectionGUID: RY/js/YhRkydFRrUKGIbVg==
X-CSE-MsgGUID: hG10up7JSXGViD4VgV2K0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="121374190"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 24 Feb 2025 09:27:12 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 24 Feb 2025 19:27:10 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 7/9] drm/i915/dp: Implement .set_idle_link_train() for everyone
Date: Mon, 24 Feb 2025 19:26:43 +0200
Message-ID: <20250224172645.15763-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.45.3
In-Reply-To: <20250224172645.15763-1-ville.syrjala@linux.intel.com>
References: <20250224172645.15763-1-ville.syrjala@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

All platforms are capable of explicitly transmitting the idle
pattern. Implement it for everyone (so far it as implemented
only for HSW+).

The immediate benefit is that we gain support for the
POST_LT_ADJ_REQ sequence for all platforms.

Another potential future use would be a pseudo port sync mode on
pre-BDW where we attempt to sync up multiple ports/pipes by trying
to turn on the transcoders at the same time, and switching the
links to normal pixel transmission at the same time.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/g4x_dp.c | 33 +++++++++++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/g4x_dp.c b/drivers/gpu/drm/i915/display/g4x_dp.c
index 372c3683c193..390f9b476a11 100644
--- a/drivers/gpu/drm/i915/display/g4x_dp.c
+++ b/drivers/gpu/drm/i915/display/g4x_dp.c
@@ -621,6 +621,19 @@ cpt_set_link_train(struct intel_dp *intel_dp,
 	intel_de_posting_read(display, intel_dp->output_reg);
 }
 
+static void
+cpt_set_idle_link_train(struct intel_dp *intel_dp,
+			const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+
+	intel_dp->DP &= ~DP_LINK_TRAIN_MASK_CPT;
+	intel_dp->DP |= DP_LINK_TRAIN_PAT_IDLE_CPT;
+
+	intel_de_write(display, intel_dp->output_reg, intel_dp->DP);
+	intel_de_posting_read(display, intel_dp->output_reg);
+}
+
 static void
 g4x_set_link_train(struct intel_dp *intel_dp,
 		   const struct intel_crtc_state *crtc_state,
@@ -649,6 +662,19 @@ g4x_set_link_train(struct intel_dp *intel_dp,
 	intel_de_posting_read(display, intel_dp->output_reg);
 }
 
+static void
+g4x_set_idle_link_train(struct intel_dp *intel_dp,
+			const struct intel_crtc_state *crtc_state)
+{
+	struct intel_display *display = to_intel_display(intel_dp);
+
+	intel_dp->DP &= ~DP_LINK_TRAIN_MASK;
+	intel_dp->DP |= DP_LINK_TRAIN_PAT_IDLE;
+
+	intel_de_write(display, intel_dp->output_reg, intel_dp->DP);
+	intel_de_posting_read(display, intel_dp->output_reg);
+}
+
 static void intel_dp_enable_port(struct intel_dp *intel_dp,
 				 const struct intel_crtc_state *crtc_state)
 {
@@ -1353,10 +1379,13 @@ bool g4x_dp_init(struct intel_display *display,
 	intel_encoder->audio_disable = g4x_dp_audio_disable;
 
 	if ((display->platform.ivybridge && port == PORT_A) ||
-	    (HAS_PCH_CPT(dev_priv) && port != PORT_A))
+	    (HAS_PCH_CPT(dev_priv) && port != PORT_A)) {
 		dig_port->dp.set_link_train = cpt_set_link_train;
-	else
+		dig_port->dp.set_idle_link_train = cpt_set_idle_link_train;
+	} else {
 		dig_port->dp.set_link_train = g4x_set_link_train;
+		dig_port->dp.set_idle_link_train = g4x_set_idle_link_train;
+	}
 
 	if (display->platform.cherryview)
 		intel_encoder->set_signal_levels = chv_set_signal_levels;
-- 
2.45.3

