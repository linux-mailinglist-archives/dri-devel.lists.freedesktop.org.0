Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9F9CA7005
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 10:52:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BEA610EA97;
	Fri,  5 Dec 2025 09:52:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="HPCE1hrp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BD2410EA96
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 09:52:29 +0000 (UTC)
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi
 [91.158.153.178])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C10FC11EF;
 Fri,  5 Dec 2025 10:50:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1764928210;
 bh=+ymyio3eA+DYlmRJI9W1XgVmwy5/B3PG90stDf9BFHk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=HPCE1hrpDv12tDiTdPw6hNHZN7y2Bemr0Q/tT/rqbI8Nd6g5HeH9Nh8o/Aj1jtpN2
 NaWqECU+jF/emCI4tJh3ocUMmz7gT3Vcj5tK/1c6M4zVr1I3Q8Jo8rY7YNWmknWFc2
 zqqLZiCgSq868LtamJn66/aF9gwvANEAyS1JRfIk=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 05 Dec 2025 11:51:48 +0200
Subject: [PATCH 1/4] Revert "drm/atomic-helper: Re-order bridge chain
 pre-enable and post-disable"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-drm-seq-fix-v1-1-fda68fa1b3de@ideasonboard.com>
References: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
In-Reply-To: <20251205-drm-seq-fix-v1-0-fda68fa1b3de@ideasonboard.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>, 
 Linus Walleij <linusw@kernel.org>, Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Vicente Bergas <vicencb@gmail.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=15709;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=+ymyio3eA+DYlmRJI9W1XgVmwy5/B3PG90stDf9BFHk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpMqtVMxyofo+pk0fUCqHAhIUnHAjWKXUvxnj2p
 fn8zsG2WvGJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaTKrVQAKCRD6PaqMvJYe
 9eQ1D/955qRo5DUhVivaV9qn/ywyAe8jSOTEmcU7FW6Xvo2tKQtXMUW2O2jaGPWqulXroi/8Nui
 DhF++yKo405cyuKemE+VcxzKjsqrWLrK2kB30vyJp5aZHrK73BotHcu/QAV9sQXPqrEI1a9763b
 5h/16PAATPHoIe1dKZZCz4wHuIdtmOoFLgV4OJ6TjFqmlx4pqdJ/K5KhBHoRfvqbAdT5DSE08EQ
 554hSq2lpPXBbba1PFSjDdcr0Icuu02/0Adg4sDaQcpXSuMxYvSQC/JXd3f7+n+JOEF61sW+K0h
 3FhMnl+Ai3CHLn/DyadoF5O2aDZh1Qjq2iJGZO9dBYmDhvZ8HrJ2Mc+ugHViyC7rLg0Ug2sUQxu
 ordKS2CRW/enj0vwlr9Mq4Q6bdugfPPndWI5jMS6IzmQBp09H4JY/1kWKVl69B544ES+cGPcpJ2
 nJjZ8Lat/QVfU65ottYfi0MbHmxzgABUnqB4MJLGZojYy+eljUELZMDsJ4vrv0EidHZ1+tRD6v4
 V4CukJgE1wdnETKxGqC3DgD/oKcAahDat+AWLag3IJvB4y8utoffC90F44fLRXA5O1vaDMCVyFP
 tmzcXYsp2zy/cO33N9vMXYGVeRiI+I8pe1KQdhHBb5tGC1IK/JXUj0eN+LpsHBD/G6SV0JTB/e6
 MVnD/SPfP7tAygg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

This reverts commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1.

Changing the enable/disable sequence has caused regressions on multiple
platforms: R-Car, MCDE, Rockchip. A series (see link below)  was sent to
fix these, but it was decided that it's better to revert the original
patch and change the enable/disable sequence only in the tidss driver.

Reverting this commit breaks tidss's DSI and OLDI outputs, which will be
fixed in the following commits.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Link: https://lore.kernel.org/all/20251202-mcde-drm-regression-thirdfix-v6-0-f1bffd4ec0fa%40kernel.org/
Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable and post-disable")
Cc: stable@vger.kernel.org # v6.17+
---
 drivers/gpu/drm/drm_atomic_helper.c |   8 +-
 include/drm/drm_bridge.h            | 249 ++++++++++--------------------------
 2 files changed, 70 insertions(+), 187 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 10adac9397cf..ef97f37560b2 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1341,9 +1341,9 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *state)
 {
 	encoder_bridge_disable(dev, state);
 
-	crtc_disable(dev, state);
-
 	encoder_bridge_post_disable(dev, state);
+
+	crtc_disable(dev, state);
 }
 
 /**
@@ -1682,10 +1682,10 @@ encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *state)
 void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 					      struct drm_atomic_state *state)
 {
-	encoder_bridge_pre_enable(dev, state);
-
 	crtc_enable(dev, state);
 
+	encoder_bridge_pre_enable(dev, state);
+
 	encoder_bridge_enable(dev, state);
 
 	drm_atomic_helper_commit_writebacks(dev, state);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 0ff7ab4aa868..dbafe136833f 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -176,33 +176,17 @@ struct drm_bridge_funcs {
 	/**
 	 * @disable:
 	 *
-	 * The @disable callback should disable the bridge.
+	 * This callback should disable the bridge. It is called right before
+	 * the preceding element in the display pipe is disabled. If the
+	 * preceding element is a bridge this means it's called before that
+	 * bridge's @disable vfunc. If the preceding element is a &drm_encoder
+	 * it's called right before the &drm_encoder_helper_funcs.disable,
+	 * &drm_encoder_helper_funcs.prepare or &drm_encoder_helper_funcs.dpms
+	 * hook.
 	 *
 	 * The bridge can assume that the display pipe (i.e. clocks and timing
 	 * signals) feeding it is still running when this callback is called.
 	 *
-	 *
-	 * If the preceding element is a &drm_bridge, then this is called before
-	 * that bridge is disabled via one of:
-	 *
-	 * - &drm_bridge_funcs.disable
-	 * - &drm_bridge_funcs.atomic_disable
-	 *
-	 * If the preceding element of the bridge is a display controller, then
-	 * this callback is called before the encoder is disabled via one of:
-	 *
-	 * - &drm_encoder_helper_funcs.atomic_disable
-	 * - &drm_encoder_helper_funcs.prepare
-	 * - &drm_encoder_helper_funcs.disable
-	 * - &drm_encoder_helper_funcs.dpms
-	 *
-	 * and the CRTC is disabled via one of:
-	 *
-	 * - &drm_crtc_helper_funcs.prepare
-	 * - &drm_crtc_helper_funcs.atomic_disable
-	 * - &drm_crtc_helper_funcs.disable
-	 * - &drm_crtc_helper_funcs.dpms.
-	 *
 	 * The @disable callback is optional.
 	 *
 	 * NOTE:
@@ -215,34 +199,17 @@ struct drm_bridge_funcs {
 	/**
 	 * @post_disable:
 	 *
-	 * The bridge must assume that the display pipe (i.e. clocks and timing
-	 * signals) feeding this bridge is no longer running when the
-	 * @post_disable is called.
+	 * This callback should disable the bridge. It is called right after the
+	 * preceding element in the display pipe is disabled. If the preceding
+	 * element is a bridge this means it's called after that bridge's
+	 * @post_disable function. If the preceding element is a &drm_encoder
+	 * it's called right after the encoder's
+	 * &drm_encoder_helper_funcs.disable, &drm_encoder_helper_funcs.prepare
+	 * or &drm_encoder_helper_funcs.dpms hook.
 	 *
-	 * This callback should perform all the actions required by the hardware
-	 * after it has stopped receiving signals from the preceding element.
-	 *
-	 * If the preceding element is a &drm_bridge, then this is called after
-	 * that bridge is post-disabled (unless marked otherwise by the
-	 * @pre_enable_prev_first flag) via one of:
-	 *
-	 * - &drm_bridge_funcs.post_disable
-	 * - &drm_bridge_funcs.atomic_post_disable
-	 *
-	 * If the preceding element of the bridge is a display controller, then
-	 * this callback is called after the encoder is disabled via one of:
-	 *
-	 * - &drm_encoder_helper_funcs.atomic_disable
-	 * - &drm_encoder_helper_funcs.prepare
-	 * - &drm_encoder_helper_funcs.disable
-	 * - &drm_encoder_helper_funcs.dpms
-	 *
-	 * and the CRTC is disabled via one of:
-	 *
-	 * - &drm_crtc_helper_funcs.prepare
-	 * - &drm_crtc_helper_funcs.atomic_disable
-	 * - &drm_crtc_helper_funcs.disable
-	 * - &drm_crtc_helper_funcs.dpms
+	 * The bridge must assume that the display pipe (i.e. clocks and timing
+	 * signals) feeding it is no longer running when this callback is
+	 * called.
 	 *
 	 * The @post_disable callback is optional.
 	 *
@@ -285,30 +252,18 @@ struct drm_bridge_funcs {
 	/**
 	 * @pre_enable:
 	 *
-	 * The display pipe (i.e. clocks and timing signals) feeding this bridge
-	 * will not yet be running when the @pre_enable is called.
-	 *
-	 * This callback should perform all the necessary actions to prepare the
-	 * bridge to accept signals from the preceding element.
-	 *
-	 * If the preceding element is a &drm_bridge, then this is called before
-	 * that bridge is pre-enabled (unless marked otherwise by
-	 * @pre_enable_prev_first flag) via one of:
-	 *
-	 * - &drm_bridge_funcs.pre_enable
-	 * - &drm_bridge_funcs.atomic_pre_enable
-	 *
-	 * If the preceding element of the bridge is a display controller, then
-	 * this callback is called before the CRTC is enabled via one of:
-	 *
-	 * - &drm_crtc_helper_funcs.atomic_enable
-	 * - &drm_crtc_helper_funcs.commit
-	 *
-	 * and the encoder is enabled via one of:
+	 * This callback should enable the bridge. It is called right before
+	 * the preceding element in the display pipe is enabled. If the
+	 * preceding element is a bridge this means it's called before that
+	 * bridge's @pre_enable function. If the preceding element is a
+	 * &drm_encoder it's called right before the encoder's
+	 * &drm_encoder_helper_funcs.enable, &drm_encoder_helper_funcs.commit or
+	 * &drm_encoder_helper_funcs.dpms hook.
 	 *
-	 * - &drm_encoder_helper_funcs.atomic_enable
-	 * - &drm_encoder_helper_funcs.enable
-	 * - &drm_encoder_helper_funcs.commit
+	 * The display pipe (i.e. clocks and timing signals) feeding this bridge
+	 * will not yet be running when this callback is called. The bridge must
+	 * not enable the display link feeding the next bridge in the chain (if
+	 * there is one) when this callback is called.
 	 *
 	 * The @pre_enable callback is optional.
 	 *
@@ -322,31 +277,19 @@ struct drm_bridge_funcs {
 	/**
 	 * @enable:
 	 *
-	 * The @enable callback should enable the bridge.
+	 * This callback should enable the bridge. It is called right after
+	 * the preceding element in the display pipe is enabled. If the
+	 * preceding element is a bridge this means it's called after that
+	 * bridge's @enable function. If the preceding element is a
+	 * &drm_encoder it's called right after the encoder's
+	 * &drm_encoder_helper_funcs.enable, &drm_encoder_helper_funcs.commit or
+	 * &drm_encoder_helper_funcs.dpms hook.
 	 *
 	 * The bridge can assume that the display pipe (i.e. clocks and timing
 	 * signals) feeding it is running when this callback is called. This
 	 * callback must enable the display link feeding the next bridge in the
 	 * chain if there is one.
 	 *
-	 * If the preceding element is a &drm_bridge, then this is called after
-	 * that bridge is enabled via one of:
-	 *
-	 * - &drm_bridge_funcs.enable
-	 * - &drm_bridge_funcs.atomic_enable
-	 *
-	 * If the preceding element of the bridge is a display controller, then
-	 * this callback is called after the CRTC is enabled via one of:
-	 *
-	 * - &drm_crtc_helper_funcs.atomic_enable
-	 * - &drm_crtc_helper_funcs.commit
-	 *
-	 * and the encoder is enabled via one of:
-	 *
-	 * - &drm_encoder_helper_funcs.atomic_enable
-	 * - &drm_encoder_helper_funcs.enable
-	 * - drm_encoder_helper_funcs.commit
-	 *
 	 * The @enable callback is optional.
 	 *
 	 * NOTE:
@@ -359,30 +302,17 @@ struct drm_bridge_funcs {
 	/**
 	 * @atomic_pre_enable:
 	 *
-	 * The display pipe (i.e. clocks and timing signals) feeding this bridge
-	 * will not yet be running when the @atomic_pre_enable is called.
-	 *
-	 * This callback should perform all the necessary actions to prepare the
-	 * bridge to accept signals from the preceding element.
-	 *
-	 * If the preceding element is a &drm_bridge, then this is called before
-	 * that bridge is pre-enabled (unless marked otherwise by
-	 * @pre_enable_prev_first flag) via one of:
-	 *
-	 * - &drm_bridge_funcs.pre_enable
-	 * - &drm_bridge_funcs.atomic_pre_enable
+	 * This callback should enable the bridge. It is called right before
+	 * the preceding element in the display pipe is enabled. If the
+	 * preceding element is a bridge this means it's called before that
+	 * bridge's @atomic_pre_enable or @pre_enable function. If the preceding
+	 * element is a &drm_encoder it's called right before the encoder's
+	 * &drm_encoder_helper_funcs.atomic_enable hook.
 	 *
-	 * If the preceding element of the bridge is a display controller, then
-	 * this callback is called before the CRTC is enabled via one of:
-	 *
-	 * - &drm_crtc_helper_funcs.atomic_enable
-	 * - &drm_crtc_helper_funcs.commit
-	 *
-	 * and the encoder is enabled via one of:
-	 *
-	 * - &drm_encoder_helper_funcs.atomic_enable
-	 * - &drm_encoder_helper_funcs.enable
-	 * - &drm_encoder_helper_funcs.commit
+	 * The display pipe (i.e. clocks and timing signals) feeding this bridge
+	 * will not yet be running when this callback is called. The bridge must
+	 * not enable the display link feeding the next bridge in the chain (if
+	 * there is one) when this callback is called.
 	 *
 	 * The @atomic_pre_enable callback is optional.
 	 */
@@ -392,31 +322,18 @@ struct drm_bridge_funcs {
 	/**
 	 * @atomic_enable:
 	 *
-	 * The @atomic_enable callback should enable the bridge.
+	 * This callback should enable the bridge. It is called right after
+	 * the preceding element in the display pipe is enabled. If the
+	 * preceding element is a bridge this means it's called after that
+	 * bridge's @atomic_enable or @enable function. If the preceding element
+	 * is a &drm_encoder it's called right after the encoder's
+	 * &drm_encoder_helper_funcs.atomic_enable hook.
 	 *
 	 * The bridge can assume that the display pipe (i.e. clocks and timing
 	 * signals) feeding it is running when this callback is called. This
 	 * callback must enable the display link feeding the next bridge in the
 	 * chain if there is one.
 	 *
-	 * If the preceding element is a &drm_bridge, then this is called after
-	 * that bridge is enabled via one of:
-	 *
-	 * - &drm_bridge_funcs.enable
-	 * - &drm_bridge_funcs.atomic_enable
-	 *
-	 * If the preceding element of the bridge is a display controller, then
-	 * this callback is called after the CRTC is enabled via one of:
-	 *
-	 * - &drm_crtc_helper_funcs.atomic_enable
-	 * - &drm_crtc_helper_funcs.commit
-	 *
-	 * and the encoder is enabled via one of:
-	 *
-	 * - &drm_encoder_helper_funcs.atomic_enable
-	 * - &drm_encoder_helper_funcs.enable
-	 * - drm_encoder_helper_funcs.commit
-	 *
 	 * The @atomic_enable callback is optional.
 	 */
 	void (*atomic_enable)(struct drm_bridge *bridge,
@@ -424,32 +341,16 @@ struct drm_bridge_funcs {
 	/**
 	 * @atomic_disable:
 	 *
-	 * The @atomic_disable callback should disable the bridge.
+	 * This callback should disable the bridge. It is called right before
+	 * the preceding element in the display pipe is disabled. If the
+	 * preceding element is a bridge this means it's called before that
+	 * bridge's @atomic_disable or @disable vfunc. If the preceding element
+	 * is a &drm_encoder it's called right before the
+	 * &drm_encoder_helper_funcs.atomic_disable hook.
 	 *
 	 * The bridge can assume that the display pipe (i.e. clocks and timing
 	 * signals) feeding it is still running when this callback is called.
 	 *
-	 * If the preceding element is a &drm_bridge, then this is called before
-	 * that bridge is disabled via one of:
-	 *
-	 * - &drm_bridge_funcs.disable
-	 * - &drm_bridge_funcs.atomic_disable
-	 *
-	 * If the preceding element of the bridge is a display controller, then
-	 * this callback is called before the encoder is disabled via one of:
-	 *
-	 * - &drm_encoder_helper_funcs.atomic_disable
-	 * - &drm_encoder_helper_funcs.prepare
-	 * - &drm_encoder_helper_funcs.disable
-	 * - &drm_encoder_helper_funcs.dpms
-	 *
-	 * and the CRTC is disabled via one of:
-	 *
-	 * - &drm_crtc_helper_funcs.prepare
-	 * - &drm_crtc_helper_funcs.atomic_disable
-	 * - &drm_crtc_helper_funcs.disable
-	 * - &drm_crtc_helper_funcs.dpms.
-	 *
 	 * The @atomic_disable callback is optional.
 	 */
 	void (*atomic_disable)(struct drm_bridge *bridge,
@@ -458,34 +359,16 @@ struct drm_bridge_funcs {
 	/**
 	 * @atomic_post_disable:
 	 *
-	 * The bridge must assume that the display pipe (i.e. clocks and timing
-	 * signals) feeding this bridge is no longer running when the
-	 * @atomic_post_disable is called.
-	 *
-	 * This callback should perform all the actions required by the hardware
-	 * after it has stopped receiving signals from the preceding element.
+	 * This callback should disable the bridge. It is called right after the
+	 * preceding element in the display pipe is disabled. If the preceding
+	 * element is a bridge this means it's called after that bridge's
+	 * @atomic_post_disable or @post_disable function. If the preceding
+	 * element is a &drm_encoder it's called right after the encoder's
+	 * &drm_encoder_helper_funcs.atomic_disable hook.
 	 *
-	 * If the preceding element is a &drm_bridge, then this is called after
-	 * that bridge is post-disabled (unless marked otherwise by the
-	 * @pre_enable_prev_first flag) via one of:
-	 *
-	 * - &drm_bridge_funcs.post_disable
-	 * - &drm_bridge_funcs.atomic_post_disable
-	 *
-	 * If the preceding element of the bridge is a display controller, then
-	 * this callback is called after the encoder is disabled via one of:
-	 *
-	 * - &drm_encoder_helper_funcs.atomic_disable
-	 * - &drm_encoder_helper_funcs.prepare
-	 * - &drm_encoder_helper_funcs.disable
-	 * - &drm_encoder_helper_funcs.dpms
-	 *
-	 * and the CRTC is disabled via one of:
-	 *
-	 * - &drm_crtc_helper_funcs.prepare
-	 * - &drm_crtc_helper_funcs.atomic_disable
-	 * - &drm_crtc_helper_funcs.disable
-	 * - &drm_crtc_helper_funcs.dpms
+	 * The bridge must assume that the display pipe (i.e. clocks and timing
+	 * signals) feeding it is no longer running when this callback is
+	 * called.
 	 *
 	 * The @atomic_post_disable callback is optional.
 	 */

-- 
2.43.0

