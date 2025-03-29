Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0C0A75614
	for <lists+dri-devel@lfdr.de>; Sat, 29 Mar 2025 12:54:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0075210E23C;
	Sat, 29 Mar 2025 11:54:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="jqqhzicK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com
 [91.218.175.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91B2810E23C
 for <dri-devel@lists.freedesktop.org>; Sat, 29 Mar 2025 11:54:04 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1743249243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=THxuM/PMfTP0Y+Z6SEtj+1K+JpeW8z2FyoRNt+QLTYA=;
 b=jqqhzicKmbz5crbssFy0Qgrpg7BiBCXgHzDgzUlPX2T1ld9OhkfC5S7W4S3fpXMjPrmM44
 KW4Es0cXhpgw0n4IgLxi2OEDEaHiLwbuOnRxjUtOPkcZ7FARkAajQ6QVIfhbY+zq70oyW8
 yWa0suAwwx9LjVFyTGXw2XHFoUj8E+Q=
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Devarsh Thakkar <devarsht@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
 Udit Kumar <u-kumar1@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Dominik Haller <d.haller@phytec.de>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: [PATCH v11 13/14] drm/bridge: Update the bridge enable/disable doc
Date: Sat, 29 Mar 2025 17:23:32 +0530
Message-Id: <20250329115333.72614-3-aradhya.bhatia@linux.dev>
In-Reply-To: <20250329113925.68204-1-aradhya.bhatia@linux.dev>
References: <20250329113925.68204-1-aradhya.bhatia@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Now that the bridges get pre-enabled before the CRTC is enabled, and get
post-disabled after the CRTC is disabled, update the function
descriptions to accurately reflect the updated scenario.

The enable sequence for the display pipeline looks like:

	bridge[n]_pre_enable
	...
	bridge[1]_pre_enable

	crtc_enable
	encoder_enable

	bridge[1]_enable
	...
	bridge[n]_enable

And, the disable sequence for the display pipeline looks like:

	bridge[n]_disable
	...
	bridge[1]_disable

	encoder_disable
	crtc_disable

	bridge[1]_post_disable
	...
	bridge[n]_post_disable

Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
---
 include/drm/drm_bridge.h | 216 +++++++++++++++++++++++++++------------
 1 file changed, 150 insertions(+), 66 deletions(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index cdad3b78a195..fc126562733c 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -164,17 +164,28 @@ struct drm_bridge_funcs {
 	/**
 	 * @disable:
 	 *
-	 * This callback should disable the bridge. It is called right before
-	 * the preceding element in the display pipe is disabled. If the
-	 * preceding element is a bridge this means it's called before that
-	 * bridge's @disable vfunc. If the preceding element is a &drm_encoder
-	 * it's called right before the &drm_encoder_helper_funcs.disable,
-	 * &drm_encoder_helper_funcs.prepare or &drm_encoder_helper_funcs.dpms
-	 * hook.
+	 * The @disable callback should disable the bridge.
 	 *
 	 * The bridge can assume that the display pipe (i.e. clocks and timing
 	 * signals) feeding it is still running when this callback is called.
 	 *
+	 * It is called right before the preceding element in the display pipe
+	 * is disabled. If the preceding element is a &drm_bridge, then it's
+	 * called before that bridge is disabled.
+	 *
+	 * If the preceding element of the bridge is a display controller, which
+	 * has under it a &drm_crtc and a &drm_encoder, then this callback is
+	 * called right before the encoder and the CRTC are disabled via the
+	 * following hooks.
+	 * &drm_encoder_helper_funcs.atomic_disable, or
+	 * &drm_encoder_helper_funcs.prepare, or
+	 * &drm_encoder_helper_funcs.disable, or &drm_encoder_helper_funcs.dpms
+	 * hook for the encoder, and
+	 * &drm_crtc_helper_funcs.prepare, or
+	 * &drm_crtc_helper_funcs.atomic_disable, or
+	 * &drm_crtc_helper_funcs.disable, or &drm_crtc_helper_funcs.dpms hook
+	 * for the CRTC.
+	 *
 	 * The @disable callback is optional.
 	 *
 	 * NOTE:
@@ -187,17 +198,30 @@ struct drm_bridge_funcs {
 	/**
 	 * @post_disable:
 	 *
-	 * This callback should disable the bridge. It is called right after the
-	 * preceding element in the display pipe is disabled. If the preceding
-	 * element is a bridge this means it's called after that bridge's
-	 * @post_disable function. If the preceding element is a &drm_encoder
-	 * it's called right after the encoder's
-	 * &drm_encoder_helper_funcs.disable, &drm_encoder_helper_funcs.prepare
-	 * or &drm_encoder_helper_funcs.dpms hook.
-	 *
 	 * The bridge must assume that the display pipe (i.e. clocks and timing
-	 * signals) feeding it is no longer running when this callback is
-	 * called.
+	 * signals) feeding this bridge is no longer running when the
+	 * @post_disable is called.
+	 *
+	 * This callback should perform all the actions required by the hardware
+	 * after it has stopped receiving signals from the preceding element.
+	 *
+	 * It is called right after the preceding element is post-disabled, and
+	 * right before the following element gets post-disabled (given that the
+	 * preceding and following elements are &drm_bridges), unless marked
+	 * otherwise by the @pre_enable_prev_first flag.
+	 *
+	 * If the preceding element of the bridge is a display controller, which
+	 * has under it a &drm_crtc and a &drm_encoder, then this callback is
+	 * called right after the encoder and the CRTC are disabled via the
+	 * following hooks.
+	 * &drm_encoder_helper_funcs.atomic_disable, or
+	 * &drm_encoder_helper_funcs.prepare, or
+	 * &drm_encoder_helper_funcs.disable, or &drm_encoder_helper_funcs.dpms
+	 * hook for the encoder, and
+	 * &drm_crtc_helper_funcs.prepare, or
+	 * &drm_crtc_helper_funcs.atomic_disable, or
+	 * &drm_crtc_helper_funcs.disable, or &drm_crtc_helper_funcs.dpms hook
+	 * for the CRTC.
 	 *
 	 * The @post_disable callback is optional.
 	 *
@@ -240,18 +264,26 @@ struct drm_bridge_funcs {
 	/**
 	 * @pre_enable:
 	 *
-	 * This callback should enable the bridge. It is called right before
-	 * the preceding element in the display pipe is enabled. If the
-	 * preceding element is a bridge this means it's called before that
-	 * bridge's @pre_enable function. If the preceding element is a
-	 * &drm_encoder it's called right before the encoder's
-	 * &drm_encoder_helper_funcs.enable, &drm_encoder_helper_funcs.commit or
-	 * &drm_encoder_helper_funcs.dpms hook.
-	 *
 	 * The display pipe (i.e. clocks and timing signals) feeding this bridge
-	 * will not yet be running when this callback is called. The bridge must
-	 * not enable the display link feeding the next bridge in the chain (if
-	 * there is one) when this callback is called.
+	 * will not yet be running when the @pre_enable is called.
+	 *
+	 * This callback should perform all the necessary actions to prepare the
+	 * bridge to accept signals from the preceding element.
+	 *
+	 * It is called right after the following element is pre-enabled, and
+	 * right before the preceding element gets pre-enabled (given that the
+	 * following and preceding elements are &drm_bridges), unless marked
+	 * otherwise by @pre_enable_prev_first flag.
+	 *
+	 * If the preceding element of the bridge is a display controller, which
+	 * has under it a &drm_crtc and a &drm_encoder, then this callback is
+	 * called right before the CRTC and the encoder are enabled via these
+	 * hooks.
+	 * &drm_crtc_helper_funcs.atomic_enable, or
+	 * &drm_crtc_helper_funcs.commit hook for the CRTC, and
+	 * &drm_encoder_helper_funcs.atomic_enable, or
+	 * &drm_encoder_helper_funcs.enable, or &drm_encoder_helper_funcs.commit
+	 * hook for the encoder.
 	 *
 	 * The @pre_enable callback is optional.
 	 *
@@ -265,19 +297,27 @@ struct drm_bridge_funcs {
 	/**
 	 * @enable:
 	 *
-	 * This callback should enable the bridge. It is called right after
-	 * the preceding element in the display pipe is enabled. If the
-	 * preceding element is a bridge this means it's called after that
-	 * bridge's @enable function. If the preceding element is a
-	 * &drm_encoder it's called right after the encoder's
-	 * &drm_encoder_helper_funcs.enable, &drm_encoder_helper_funcs.commit or
-	 * &drm_encoder_helper_funcs.dpms hook.
+	 * The @enable callback should enable the bridge.
 	 *
 	 * The bridge can assume that the display pipe (i.e. clocks and timing
 	 * signals) feeding it is running when this callback is called. This
 	 * callback must enable the display link feeding the next bridge in the
 	 * chain if there is one.
 	 *
+	 * It is called right after the preceding element in the display pipe is
+	 * enabled. If the preceding element is a &drm_bridge, then it's called
+	 * after that bridge is enabled.
+	 *
+	 * If the preceding element of the bridge is a display controller, which
+	 * has under it a &drm_crtc and a &drm_encoder, then this callback is
+	 * called right after the CRTC and the encoder are enabled via these
+	 * hooks.
+	 * &drm_crtc_helper_funcs.atomic_enable, or
+	 * &drm_crtc_helper_funcs.commit hook for the CRTC, and
+	 * &drm_encoder_helper_funcs.atomic_enable, or
+	 * &drm_encoder_helper_funcs.enable, or &drm_encoder_helper_funcs.commit
+	 * hook for the encoder.
+	 *
 	 * The @enable callback is optional.
 	 *
 	 * NOTE:
@@ -290,17 +330,26 @@ struct drm_bridge_funcs {
 	/**
 	 * @atomic_pre_enable:
 	 *
-	 * This callback should enable the bridge. It is called right before
-	 * the preceding element in the display pipe is enabled. If the
-	 * preceding element is a bridge this means it's called before that
-	 * bridge's @atomic_pre_enable or @pre_enable function. If the preceding
-	 * element is a &drm_encoder it's called right before the encoder's
-	 * &drm_encoder_helper_funcs.atomic_enable hook.
-	 *
 	 * The display pipe (i.e. clocks and timing signals) feeding this bridge
-	 * will not yet be running when this callback is called. The bridge must
-	 * not enable the display link feeding the next bridge in the chain (if
-	 * there is one) when this callback is called.
+	 * will not yet be running when the @atomic_pre_enable is called.
+	 *
+	 * This callback should perform all the necessary actions to prepare the
+	 * bridge to accept signals from the preceding element.
+	 *
+	 * It is called right after the following element is pre-enabled, and
+	 * right before the preceding element gets pre-enabled (given that the
+	 * following and preceding elements are &drm_bridges), unless marked
+	 * otherwise by @pre_enable_prev_first flag.
+	 *
+	 * If the preceding element of the bridge is a display controller, which
+	 * has under it a &drm_crtc and a &drm_encoder, then this callback is
+	 * called right before the CRTC and the encoder are enabled via these
+	 * hooks.
+	 * &drm_crtc_helper_funcs.atomic_enable, or
+	 * &drm_crtc_helper_funcs.commit hook for the CRTC, and
+	 * &drm_encoder_helper_funcs.atomic_enable, or
+	 * &drm_encoder_helper_funcs.enable, or &drm_encoder_helper_funcs.commit
+	 * hook for the encoder.
 	 *
 	 * The @atomic_pre_enable callback is optional.
 	 */
@@ -310,18 +359,27 @@ struct drm_bridge_funcs {
 	/**
 	 * @atomic_enable:
 	 *
-	 * This callback should enable the bridge. It is called right after
-	 * the preceding element in the display pipe is enabled. If the
-	 * preceding element is a bridge this means it's called after that
-	 * bridge's @atomic_enable or @enable function. If the preceding element
-	 * is a &drm_encoder it's called right after the encoder's
-	 * &drm_encoder_helper_funcs.atomic_enable hook.
+	 * The @atomic_enable callback should enable the bridge.
 	 *
 	 * The bridge can assume that the display pipe (i.e. clocks and timing
 	 * signals) feeding it is running when this callback is called. This
 	 * callback must enable the display link feeding the next bridge in the
 	 * chain if there is one.
 	 *
+	 * It is called right after the preceding element in the display pipe is
+	 * enabled. If the preceding element is a &drm_bridge, then it's called
+	 * after that bridge is enabled.
+	 *
+	 * If the preceding element of the bridge is a display controller, which
+	 * has under it a &drm_crtc and a &drm_encoder, then this callback is
+	 * called right after the CRTC and the encoder are enabled via these
+	 * hooks.
+	 * &drm_crtc_helper_funcs.atomic_enable, or
+	 * &drm_crtc_helper_funcs.commit hook for the CRTC, and
+	 * &drm_encoder_helper_funcs.atomic_enable, or
+	 * &drm_encoder_helper_funcs.enable, or &drm_encoder_helper_funcs.commit
+	 * hook for the encoder.
+	 *
 	 * The @atomic_enable callback is optional.
 	 */
 	void (*atomic_enable)(struct drm_bridge *bridge,
@@ -329,16 +387,28 @@ struct drm_bridge_funcs {
 	/**
 	 * @atomic_disable:
 	 *
-	 * This callback should disable the bridge. It is called right before
-	 * the preceding element in the display pipe is disabled. If the
-	 * preceding element is a bridge this means it's called before that
-	 * bridge's @atomic_disable or @disable vfunc. If the preceding element
-	 * is a &drm_encoder it's called right before the
-	 * &drm_encoder_helper_funcs.atomic_disable hook.
+	 * The @atomic_disable callback should disable the bridge.
 	 *
 	 * The bridge can assume that the display pipe (i.e. clocks and timing
 	 * signals) feeding it is still running when this callback is called.
 	 *
+	 * It is called right before the preceding element in the display pipe
+	 * is disabled. If the preceding element is a &drm_bridge, then it's
+	 * called before that bridge is disabled.
+	 *
+	 * If the preceding element of the bridge is a display controller, which
+	 * has under it a &drm_crtc and a &drm_encoder, then this callback is
+	 * called right before the encoder and the CRTC are disabled via the
+	 * following hooks.
+	 * &drm_encoder_helper_funcs.atomic_disable, or
+	 * &drm_encoder_helper_funcs.prepare, or
+	 * &drm_encoder_helper_funcs.disable, or &drm_encoder_helper_funcs.dpms
+	 * hook for the encoder, and
+	 * &drm_crtc_helper_funcs.prepare, or
+	 * &drm_crtc_helper_funcs.atomic_disable, or
+	 * &drm_crtc_helper_funcs.disable, or &drm_crtc_helper_funcs.dpms hook
+	 * for the CRTC.
+	 *
 	 * The @atomic_disable callback is optional.
 	 */
 	void (*atomic_disable)(struct drm_bridge *bridge,
@@ -347,16 +417,30 @@ struct drm_bridge_funcs {
 	/**
 	 * @atomic_post_disable:
 	 *
-	 * This callback should disable the bridge. It is called right after the
-	 * preceding element in the display pipe is disabled. If the preceding
-	 * element is a bridge this means it's called after that bridge's
-	 * @atomic_post_disable or @post_disable function. If the preceding
-	 * element is a &drm_encoder it's called right after the encoder's
-	 * &drm_encoder_helper_funcs.atomic_disable hook.
-	 *
 	 * The bridge must assume that the display pipe (i.e. clocks and timing
-	 * signals) feeding it is no longer running when this callback is
-	 * called.
+	 * signals) feeding this bridge is no longer running when the
+	 * @atomic_post_disable is called.
+	 *
+	 * This callback should perform all the actions required by the hardware
+	 * after it has stopped receiving signals from the preceding element.
+	 *
+	 * It is called right after the preceding element is post-disabled, and
+	 * right before the following element gets post-disabled (given that the
+	 * preceding and following elements are &drm_bridges), unless marked
+	 * otherwise by the @pre_enable_prev_first flag.
+	 *
+	 * If the preceding element of the bridge is a display controller, which
+	 * has under it a &drm_crtc and a &drm_encoder, then this callback is
+	 * called right after the encoder and the CRTC are disabled via the
+	 * following hooks.
+	 * &drm_encoder_helper_funcs.atomic_disable, or
+	 * &drm_encoder_helper_funcs.prepare, or
+	 * &drm_encoder_helper_funcs.disable, or &drm_encoder_helper_funcs.dpms
+	 * hook for the encoder, and
+	 * &drm_crtc_helper_funcs.prepare, or
+	 * &drm_crtc_helper_funcs.atomic_disable, or
+	 * &drm_crtc_helper_funcs.disable, or &drm_crtc_helper_funcs.dpms hook
+	 * for the CRTC.
 	 *
 	 * The @atomic_post_disable callback is optional.
 	 */
-- 
2.34.1

