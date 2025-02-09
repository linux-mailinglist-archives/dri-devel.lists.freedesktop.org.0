Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F00A2DD8E
	for <lists+dri-devel@lfdr.de>; Sun,  9 Feb 2025 13:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991DF10E313;
	Sun,  9 Feb 2025 12:16:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="Uxp1I5eE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com
 [95.215.58.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C195110E313
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Feb 2025 12:16:46 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1739103405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wDd9H+cpVECWFj/tV+zCYRPGelCzXuXhyaQoRRLjdZM=;
 b=Uxp1I5eEWVeCardaIf4k2BdQX+mZrkZe+w6AlWtbehK+ZaowWz1GbzDkLPitYdUPeg+SJ5
 dzCGgOuIuIjD2Lh8t6EVp1qfnK1SBr7WY6ndXBoGez2UiipzGk7jtQqPSGJzO84Rc5gg+W
 PhIr2bA17nMHPABzKNYw3rjKdjwW8/8=
From: Aradhya Bhatia <aradhya.bhatia@linux.dev>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
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
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
Subject: [PATCH v9 12/13] drm/atomic-helper: Re-order bridge chain pre-enable
 and post-disable
Date: Sun,  9 Feb 2025 17:46:20 +0530
Message-Id: <20250209121621.34677-5-aradhya.bhatia@linux.dev>
In-Reply-To: <20250209121621.34677-1-aradhya.bhatia@linux.dev>
References: <20250209121032.32655-1-aradhya.bhatia@linux.dev>
 <20250209121621.34677-1-aradhya.bhatia@linux.dev>
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

Move the bridge pre_enable call before crtc enable, and the bridge
post_disable call after the crtc disable.

The sequence of enable after this patch will look like:

	bridge[n]_pre_enable
	...
	bridge[1]_pre_enable

	crtc_enable
	encoder_enable

	bridge[1]_enable
	...
	bridge[n]_enable

And, the disable sequence for the display pipeline will look like:

	bridge[n]_disable
	...
	bridge[1]_disable

	encoder_disable
	crtc_disable

	bridge[1]_post_disable
	...
	bridge[n]_post_disable

The definition of bridge pre_enable hook says that,
"The display pipe (i.e. clocks and timing signals) feeding this bridge
will not yet be running when this callback is called".

Since CRTC is also a source feeding the bridge, it should not be enabled
before the bridges in the pipeline are pre_enabled. Fix that by
re-ordering the sequence of bridge pre_enable and bridge post_disable.

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
Signed-off-by: Aradhya Bhatia <aradhya.bhatia@linux.dev>
---
 drivers/gpu/drm/drm_atomic_helper.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index c9ffca796f32..348ef0c12949 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1298,9 +1298,9 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 {
 	encoder_bridge_disable(dev, old_state);
 
-	encoder_bridge_post_disable(dev, old_state);
-
 	crtc_disable(dev, old_state);
+
+	encoder_bridge_post_disable(dev, old_state);
 }
 
 /**
@@ -1636,10 +1636,10 @@ encoder_bridge_enable(struct drm_device *dev, struct drm_atomic_state *old_state
 void drm_atomic_helper_commit_modeset_enables(struct drm_device *dev,
 					      struct drm_atomic_state *old_state)
 {
-	crtc_enable(dev, old_state);
-
 	encoder_bridge_pre_enable(dev, old_state);
 
+	crtc_enable(dev, old_state);
+
 	encoder_bridge_enable(dev, old_state);
 
 	drm_atomic_helper_commit_writebacks(dev, old_state);
-- 
2.34.1

