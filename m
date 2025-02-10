Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F46EA2EDB2
	for <lists+dri-devel@lfdr.de>; Mon, 10 Feb 2025 14:27:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9661810E554;
	Mon, 10 Feb 2025 13:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="MOrinqxv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B66D810E53B
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Feb 2025 13:26:30 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 35FD420454;
 Mon, 10 Feb 2025 13:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1739193989;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=llutv1RdggJm734H0s9buclloGdDrf18DWhCjYzzD7s=;
 b=MOrinqxv8sSRMZ+44D4fU9tw4PNKguCukVZFlfwssQzPYkP0inQEPDkLiU/XRXuA9U15Ud
 dXP0Rv2sZV9w7Ziy0jKDJenxHU0TCTcClYRcrKCe8yn97n7veUMhnFALBuY9UxKGM2ZGTw
 e40PtoLHVtL9L2T4sxbz7Un+FJx514zdT1P2UVxi8PWMmFXaZqMwZSuZGlvzy00TJXXJjc
 xeRUlUOC4KqP6Rjc9+NGfWtYdG3zWDn96R+tUmn3cS+yavVYpKujJ9rZD85FxgODins434
 9MoMXNTxqz/qJtHkhA0/Lx1f85OU3Lvodbq9ReykdW3hW0ci9IV/4WWp69DLyQ==
From: Herve Codina <herve.codina@bootlin.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v6 3/4] drm/vc4: hdmi: Use drm_atomic_helper_reset_crtc()
Date: Mon, 10 Feb 2025 14:26:18 +0100
Message-ID: <20250210132620.42263-4-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250210132620.42263-1-herve.codina@bootlin.com>
References: <20250210132620.42263-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefkedukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehffeigfejueelueeuffelueefgfelhfejhfehieegudekteeiledttdfhffekffenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdrlhhotggrlhguohhmrghinhdpmhgrihhlfhhrohhmpehhvghrvhgvrdgtohguihhnrgessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdejpdhrtghpthhtoheprghlvgigrghnuggvrhdrshhtvghinhesvgifrdhtqhdqghhrohhuphdrtghomhdprhgtphhtthhopegrnhgurhiivghjrdhhrghjuggrsehinhhtvghlrdgtohhmpdhrtghpthhtohepnhgvihhlrdgrrhhmshhtrhhonhhgsehlihhnrghrohdrohhrghdprhgtphhtthhopehrfhhoshhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopefnrghurhgvnhhtr
 dhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhhonhgrsheskhifihgsohhordhsvgdprhgtphhtthhopehjvghrnhgvjhdrshhkrhgrsggvtgesghhmrghilhdrtghomhdprhgtphhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com
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

The current code uses a the reset_pipe() local function to reset the
CRTC outputs.

drm_atomic_helper_reset_crtc() has been introduced recently and it
performs exact same operations.

In order to avoid code duplication, use the new helper instead of the
local function.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/vc4/vc4_hdmi.c | 30 +-----------------------------
 1 file changed, 1 insertion(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_hdmi.c
index 47d9ada98430..e878eddc9c3f 100644
--- a/drivers/gpu/drm/vc4/vc4_hdmi.c
+++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
@@ -270,34 +270,6 @@ static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi)
 static void vc4_hdmi_cec_update_clk_div(struct vc4_hdmi *vc4_hdmi) {}
 #endif
 
-static int reset_pipe(struct drm_crtc *crtc,
-			struct drm_modeset_acquire_ctx *ctx)
-{
-	struct drm_atomic_state *state;
-	struct drm_crtc_state *crtc_state;
-	int ret;
-
-	state = drm_atomic_state_alloc(crtc->dev);
-	if (!state)
-		return -ENOMEM;
-
-	state->acquire_ctx = ctx;
-
-	crtc_state = drm_atomic_get_crtc_state(state, crtc);
-	if (IS_ERR(crtc_state)) {
-		ret = PTR_ERR(crtc_state);
-		goto out;
-	}
-
-	crtc_state->connectors_changed = true;
-
-	ret = drm_atomic_commit(state);
-out:
-	drm_atomic_state_put(state);
-
-	return ret;
-}
-
 static int vc4_hdmi_reset_link(struct drm_connector *connector,
 			       struct drm_modeset_acquire_ctx *ctx)
 {
@@ -376,7 +348,7 @@ static int vc4_hdmi_reset_link(struct drm_connector *connector,
 	 * would be perfectly happy if were to just reconfigure
 	 * the SCDC settings on the fly.
 	 */
-	return reset_pipe(crtc, ctx);
+	return drm_atomic_helper_reset_crtc(crtc, ctx);
 }
 
 static void vc4_hdmi_handle_hotplug(struct vc4_hdmi *vc4_hdmi,
-- 
2.48.1

