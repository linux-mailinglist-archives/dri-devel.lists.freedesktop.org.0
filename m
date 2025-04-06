Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 474B1A7CE12
	for <lists+dri-devel@lfdr.de>; Sun,  6 Apr 2025 15:17:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1ED10E271;
	Sun,  6 Apr 2025 13:17:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="jdjuX762";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com
 [91.218.175.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8587610E271
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Apr 2025 13:17:13 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1743945432;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=peCriXMe6QOQ6ExBy6uS3SVRNKgKAlAuN1XeUC5Pl8M=;
 b=jdjuX7623k5SOYJ01nPFj3kbC2Qxg97tVBJUPpUajNz/7sEJ3kHjho6S/UeigNEA5WmXwA
 +PGgtX6lZx+A0+LchRpBOjfZwOjNX4UGdIYIjzCWeNmgqo0rbOV+fpJsEj/5hxdGiX0PnW
 EM6enaXFyHecJ9qh/FbzLJS7eSsyW6E=
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
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: [PATCH v12 4/5] drm/bridge: Update the bridge enable/disable doc
Date: Sun,  6 Apr 2025 18:46:41 +0530
Message-Id: <20250406131642.171240-5-aradhya.bhatia@linux.dev>
In-Reply-To: <20250406131642.171240-1-aradhya.bhatia@linux.dev>
References: <20250406131642.171240-1-aradhya.bhatia@linux.dev>
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
 include/drm/drm_bridge.h | 249 ++++++++++++++++++++++++++++-----------
 1 file changed, 183 insertions(+), 66 deletions(-)

diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index cdad3b78a195..e5ccbefa60a8 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -164,17 +164,33 @@ struct drm_bridge_funcs {
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
+	 *
+	 * If the preceding element is a &drm_bridge, then this is called before
+	 * that bridge is disabled via one of:
+	 *
+	 * - &drm_bridge_funcs.disable
+	 * - &drm_bridge_funcs.atomic_disable
+	 *
+	 * If the preceding element of the bridge is a display controller, then
+	 * this callback is called before the encoder is disabled via one of:
+	 *
+	 * - &drm_encoder_helper_funcs.atomic_disable
+	 * - &drm_encoder_helper_funcs.prepare
+	 * - &drm_encoder_helper_funcs.disable
+	 * - &drm_encoder_helper_funcs.dpms
+	 *
+	 * and the CRTC is disabled via one of:
+	 *
+	 * - &drm_crtc_helper_funcs.prepare
+	 * - &drm_crtc_helper_funcs.atomic_disable
+	 * - &drm_crtc_helper_funcs.disable
+	 * - &drm_crtc_helper_funcs.dpms.
+	 *
 	 * The @disable callback is optional.
 	 *
 	 * NOTE:
@@ -187,17 +203,34 @@ struct drm_bridge_funcs {
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
+	 * If the preceding element is a &drm_bridge, then this is called after
+	 * that bridge is post-disabled (unless marked otherwise by the
+	 * @pre_enable_prev_first flag) via one of:
+	 *
+	 * - &drm_bridge_funcs.post_disable
+	 * - &drm_bridge_funcs.atomic_post_disable
+	 *
+	 * If the preceding element of the bridge is a display controller, then
+	 * this callback is called after the encoder is disabled via one of:
+	 *
+	 * - &drm_encoder_helper_funcs.atomic_disable
+	 * - &drm_encoder_helper_funcs.prepare
+	 * - &drm_encoder_helper_funcs.disable
+	 * - &drm_encoder_helper_funcs.dpms
+	 *
+	 * and the CRTC is disabled via one of:
+	 *
+	 * - &drm_crtc_helper_funcs.prepare
+	 * - &drm_crtc_helper_funcs.atomic_disable
+	 * - &drm_crtc_helper_funcs.disable
+	 * - &drm_crtc_helper_funcs.dpms
 	 *
 	 * The @post_disable callback is optional.
 	 *
@@ -240,18 +273,30 @@ struct drm_bridge_funcs {
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
+	 * If the preceding element is a &drm_bridge, then this is called before
+	 * that bridge is pre-enabled (unless marked otherwise by
+	 * @pre_enable_prev_first flag) via one of:
+	 *
+	 * - &drm_bridge_funcs.pre_enable
+	 * - &drm_bridge_funcs.atomic_pre_enable
+	 *
+	 * If the preceding element of the bridge is a display controller, then
+	 * this callback is called before the CRTC is enabled via one of:
+	 *
+	 * - &drm_crtc_helper_funcs.atomic_enable
+	 * - &drm_crtc_helper_funcs.commit
+	 *
+	 * and the encoder is enabled via one of:
+	 *
+	 * - &drm_encoder_helper_funcs.atomic_enable
+	 * - &drm_encoder_helper_funcs.enable
+	 * - &drm_encoder_helper_funcs.commit
 	 *
 	 * The @pre_enable callback is optional.
 	 *
@@ -265,19 +310,31 @@ struct drm_bridge_funcs {
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
+	 * If the preceding element is a &drm_bridge, then this is called after
+	 * that bridge is enabled via one of:
+	 *
+	 * - &drm_bridge_funcs.enable
+	 * - &drm_bridge_funcs.atomic_enable
+	 *
+	 * If the preceding element of the bridge is a display controller, then
+	 * this callback is called after the CRTC is enabled via one of:
+	 *
+	 * - &drm_crtc_helper_funcs.atomic_enable
+	 * - &drm_crtc_helper_funcs.commit
+	 *
+	 * and the encoder is enabled via one of:
+	 *
+	 * - &drm_encoder_helper_funcs.atomic_enable
+	 * - &drm_encoder_helper_funcs.enable
+	 * - drm_encoder_helper_funcs.commit
+	 *
 	 * The @enable callback is optional.
 	 *
 	 * NOTE:
@@ -290,17 +347,30 @@ struct drm_bridge_funcs {
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
+	 * If the preceding element is a &drm_bridge, then this is called before
+	 * that bridge is pre-enabled (unless marked otherwise by
+	 * @pre_enable_prev_first flag) via one of:
+	 *
+	 * - &drm_bridge_funcs.pre_enable
+	 * - &drm_bridge_funcs.atomic_pre_enable
+	 *
+	 * If the preceding element of the bridge is a display controller, then
+	 * this callback is called before the CRTC is enabled via one of:
+	 *
+	 * - &drm_crtc_helper_funcs.atomic_enable
+	 * - &drm_crtc_helper_funcs.commit
+	 *
+	 * and the encoder is enabled via one of:
+	 *
+	 * - &drm_encoder_helper_funcs.atomic_enable
+	 * - &drm_encoder_helper_funcs.enable
+	 * - &drm_encoder_helper_funcs.commit
 	 *
 	 * The @atomic_pre_enable callback is optional.
 	 */
@@ -310,18 +380,31 @@ struct drm_bridge_funcs {
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
+	 * If the preceding element is a &drm_bridge, then this is called after
+	 * that bridge is enabled via one of:
+	 *
+	 * - &drm_bridge_funcs.enable
+	 * - &drm_bridge_funcs.atomic_enable
+	 *
+	 * If the preceding element of the bridge is a display controller, then
+	 * this callback is called after the CRTC is enabled via one of:
+	 *
+	 * - &drm_crtc_helper_funcs.atomic_enable
+	 * - &drm_crtc_helper_funcs.commit
+	 *
+	 * and the encoder is enabled via one of:
+	 *
+	 * - &drm_encoder_helper_funcs.atomic_enable
+	 * - &drm_encoder_helper_funcs.enable
+	 * - drm_encoder_helper_funcs.commit
+	 *
 	 * The @atomic_enable callback is optional.
 	 */
 	void (*atomic_enable)(struct drm_bridge *bridge,
@@ -329,16 +412,32 @@ struct drm_bridge_funcs {
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
+	 * If the preceding element is a &drm_bridge, then this is called before
+	 * that bridge is disabled via one of:
+	 *
+	 * - &drm_bridge_funcs.disable
+	 * - &drm_bridge_funcs.atomic_disable
+	 *
+	 * If the preceding element of the bridge is a display controller, then
+	 * this callback is called before the encoder is disabled via one of:
+	 *
+	 * - &drm_encoder_helper_funcs.atomic_disable
+	 * - &drm_encoder_helper_funcs.prepare
+	 * - &drm_encoder_helper_funcs.disable
+	 * - &drm_encoder_helper_funcs.dpms
+	 *
+	 * and the CRTC is disabled via one of:
+	 *
+	 * - &drm_crtc_helper_funcs.prepare
+	 * - &drm_crtc_helper_funcs.atomic_disable
+	 * - &drm_crtc_helper_funcs.disable
+	 * - &drm_crtc_helper_funcs.dpms.
+	 *
 	 * The @atomic_disable callback is optional.
 	 */
 	void (*atomic_disable)(struct drm_bridge *bridge,
@@ -347,16 +446,34 @@ struct drm_bridge_funcs {
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
+	 * If the preceding element is a &drm_bridge, then this is called after
+	 * that bridge is post-disabled (unless marked otherwise by the
+	 * @pre_enable_prev_first flag) via one of:
+	 *
+	 * - &drm_bridge_funcs.post_disable
+	 * - &drm_bridge_funcs.atomic_post_disable
+	 *
+	 * If the preceding element of the bridge is a display controller, then
+	 * this callback is called after the encoder is disabled via one of:
+	 *
+	 * - &drm_encoder_helper_funcs.atomic_disable
+	 * - &drm_encoder_helper_funcs.prepare
+	 * - &drm_encoder_helper_funcs.disable
+	 * - &drm_encoder_helper_funcs.dpms
+	 *
+	 * and the CRTC is disabled via one of:
+	 *
+	 * - &drm_crtc_helper_funcs.prepare
+	 * - &drm_crtc_helper_funcs.atomic_disable
+	 * - &drm_crtc_helper_funcs.disable
+	 * - &drm_crtc_helper_funcs.dpms
 	 *
 	 * The @atomic_post_disable callback is optional.
 	 */
-- 
2.34.1

