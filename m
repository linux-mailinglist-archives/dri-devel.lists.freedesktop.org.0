Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B02E39F3647
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2024 17:41:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F041010E60F;
	Mon, 16 Dec 2024 16:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="bFHND2C2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEF3310E60F
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2024 16:41:11 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4AC9E000E;
 Mon, 16 Dec 2024 16:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1734367270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Gr5nT2Jnw+/2OVk2gGwP/gOTe4r8NyAUC5u+F+sceZw=;
 b=bFHND2C2mCjVfFmvgtYTrE9l4QjIlqVzSC3EiYV3vZlKWQfkpURtHJXHOTt8iFvYDSwM9s
 T8tVET48Pp+6JWLGs7lzo5AwyYT5ylSf37dVX9rkQSPxRvruQzFxFV43KFzrdcwtgN4N4l
 vdrhgrh72oElFMmtukaD69YAMIUsmhaYq9jBOtF4IVpe+2MLwVteWAgyoRTmKI/c3uGDAT
 4u479LHnpXjuvyG1bQtS1tKqZ7x4Mh4PgqfO0J2DMo4LtkltZzILNF/vetjVblQMpOWV8g
 umsyCPZyP9wgqmtj9Hb8FkrWwdVQaxifnSJHfPGOF44YmpYKsxyU0rx4jKdTYA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon, 16 Dec 2024 17:40:49 +0100
Subject: [PATCH RESEND v3 2/4] drm/atomic-helper: improve CRTC
 enabled/connectors mismatch logging message
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-drm-small-improvements-v3-2-78bbc95ac776@bootlin.com>
References: <20241216-drm-small-improvements-v3-0-78bbc95ac776@bootlin.com>
In-Reply-To: <20241216-drm-small-improvements-v3-0-78bbc95ac776@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: luca.ceresoli@bootlin.com
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

This message reports a mismatch between new_crtc_state->enable and
has_connectors, which should be either both true or both false. However it
does not mention which one is true and which is false, which can be useful
for debugging. Add the value of both avriables to the log message.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 43cdf39019a44537794cc5a519d139b0cb77073c..3c3bdef9bcf3c4ffcd861744f6607f317ab0c041 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -666,8 +666,9 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
 		}
 
 		if (new_crtc_state->enable != has_connectors) {
-			drm_dbg_atomic(dev, "[CRTC:%d:%s] enabled/connectors mismatch\n",
-				       crtc->base.id, crtc->name);
+			drm_dbg_atomic(dev, "[CRTC:%d:%s] enabled/connectors mismatch (%d/%d)\n",
+				       crtc->base.id, crtc->name,
+				       new_crtc_state->enable, has_connectors);
 
 			return -EINVAL;
 		}

-- 
2.34.1

