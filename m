Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9C3F52241E
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 20:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD8910E206;
	Tue, 10 May 2022 18:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87FDE10E206;
 Tue, 10 May 2022 18:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652207616; x=1683743616;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AaHo4EhGB7NnUHsYKKbQNBVdt2CLsogT4iu2l1iyg44=;
 b=JB3bAeIce6C98T287YDYBtN/JhDvbQlyVqtiWijepKO2y23WBTCg7MkQ
 ZFKFaNylXFk9nZpjFmUi7YywyqD+P/1hkZeSaVGqmnkGD76fHwB/+K65k
 l0oGqBvvbS60cykRd/nKfq6nK9jw3PycLCX3yIb59uTanEfRBj0UD7Web
 rIcqDJDzUmoP17gviGQOVxF7RuPwGJM5ACd++eoIzjmjBcpk8F81wqg8N
 YKN2eqKDjKEymc/ZJwuqn6Sy/v+M9/2qaPZMfIipyQQgyIC74g3nbiIXn
 13PiLv09f/mBT1ptFdMsaTxV5kIsx+Qw/qbupeTxbEaWi9MKrm0lvOsBv A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10343"; a="267058483"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="267058483"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 11:33:36 -0700
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="593673582"
Received: from lengdahl-mobl.ger.corp.intel.com (HELO
 jhogande-mobl1.ger.corp.intel.com) ([10.251.220.119])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 11:33:34 -0700
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 2/3] drm/i915/psr: Use full update In case of area
 calculation fails
Date: Tue, 10 May 2022 21:33:12 +0300
Message-Id: <20220510183313.1046628-3-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220510183313.1046628-1-jouni.hogander@intel.com>
References: <20220510183313.1046628-1-jouni.hogander@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>,
 Mark Pearson <markpearson@lenovo.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 dri-devel@lists.freedesktop.org, Mika Kahola <mika.kahola@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Currently we have some corner cases where area calculation fails.  For
these sel fetch area calculation ends up having update area as y1 = 0,
y2 = 4. Instead of these values safer option is full update.

One of such for example is big fb with offset. We don't have usable
offset in psr2_sel_fetch_update. Currently it's open what is the
proper way to fix this corner case. Use full update for now.

v2: Commit message modified
v3: Print out debug info once when area calculation fails

Cc: José Roberto de Souza <jose.souza@intel.com>
Cc: Mika Kahola <mika.kahola@intel.com>
Cc: Mark Pearson <markpearson@lenovo.com>
Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 drivers/gpu/drm/i915/display/intel_psr.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_psr.c b/drivers/gpu/drm/i915/display/intel_psr.c
index 06db407e2749..3561c218cfb1 100644
--- a/drivers/gpu/drm/i915/display/intel_psr.c
+++ b/drivers/gpu/drm/i915/display/intel_psr.c
@@ -1685,6 +1685,7 @@ static bool psr2_sel_fetch_pipe_state_supported(const struct intel_crtc_state *c
 int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 				struct intel_crtc *crtc)
 {
+	struct drm_i915_private *dev_priv = to_i915(state->base.dev);
 	struct intel_crtc_state *crtc_state = intel_atomic_get_new_crtc_state(state, crtc);
 	struct drm_rect pipe_clip = { .x1 = 0, .y1 = -1, .x2 = INT_MAX, .y2 = -1 };
 	struct intel_plane_state *new_plane_state, *old_plane_state;
@@ -1770,6 +1771,17 @@ int intel_psr2_sel_fetch_update(struct intel_atomic_state *state,
 		clip_area_update(&pipe_clip, &damaged_area);
 	}
 
+	/*
+	 * TODO: For now we are just using full update in case
+	 * selective fetch area calculation fails. To optimize this we
+	 * should identify cases where this happens and fix the area
+	 * calculation for those.
+	 */
+	if (pipe_clip.y1 == -1) {
+		drm_dbg_once_kms(&dev_priv->drm, "No selective fetch area, using full update");
+		full_update = true;
+	}
+
 	if (full_update)
 		goto skip_sel_fetch_set_loop;
 
-- 
2.25.1

