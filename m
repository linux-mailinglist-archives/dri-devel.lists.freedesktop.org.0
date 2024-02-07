Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FCD84C152
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 01:23:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 490D2112FBA;
	Wed,  7 Feb 2024 00:23:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="QOgZ5z5N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
 [209.85.222.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9043C112FBF
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Feb 2024 00:23:34 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id
 af79cd13be357-783f553fdabso8303185a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Feb 2024 16:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707265413; x=1707870213; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=eJn6nkq8Q6d0DBnWdQTTcqf1BYRrhaP04tM4LL1oFOA=;
 b=QOgZ5z5NWoi/gIFT4JmbWV4SBx4enRTZBihUmoctq995tWsuMk2GITtzbnefKnsHi0
 CrhP6dW4HU1TBd5CxVjneXOCFZT2Gr2HvbUgERQffiAM+U9Zge7hWCLpItJeQvj5y5N9
 QUpI9YFYurTh8f3k5kGkkZsvMuOnCivNXSR6r2S8Qzy8ChMHXZPWk0YpB8ntcNt59sbc
 sanSbjjcq+2IMVLPhfrWFb1lVuhKTIdZbT2W1ldBoy53w88SN7cR0v2DJ04+ucpGTVuY
 GebNmkXaleGASuorGCXsQ7bQs88tGCw1VyJ68S5rAL3g2C9WicLJ93DB8IH3t0htWZgz
 pgKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707265413; x=1707870213;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eJn6nkq8Q6d0DBnWdQTTcqf1BYRrhaP04tM4LL1oFOA=;
 b=rbmw6Jc53naxoL+jPA+SlfM8pBSsHdaoVmj9EiGPfqEbSb3V4VkU1eFhlHgPEuv1Vw
 JjZTMHJCzWYN4ovVlPMimIZkTI1nAj0+Lulb8QzFcJDykHkm5ti5gULfu00M2CY8qpFq
 c7Cgya11OC6ATlGI+CGlPK/hI7fNnOTcvdUzE4kP5U2zFYVXsGzNQJa4vsW5tFmUNLLQ
 gEFOsEBT7jEeBtl1YhDH23SWjI/OsfLIRgYOwKdpCyosL/CnJKocgBVfP3GFn6VBpFZR
 jrYvXVmHNSCJdB7EClTdtZoStIZ4syFcpaOzicYheMCSH2fJtBof2xFdA4s+u4RfLWqL
 cCtQ==
X-Gm-Message-State: AOJu0Yzv5+pJlp6vD+QmTpT6BZiCsVgdXpfTwX/tPLIVg+yUq4nNKTRO
 UocTNnA+A/8AJyaoEAJ3JrId9hq8aik1DpckJpIpt/rGtZRD/Rg5m9yDxzrZEUs=
X-Google-Smtp-Source: AGHT+IHV6b1vWGsHIG5WoqcXN3fD8F47EWX0hNDQoEfiBK6EZgO4A05HU+eku6RwOHEX+NSQKmNNpA==
X-Received: by 2002:a05:620a:5601:b0:784:2f2c:7b47 with SMTP id
 vu1-20020a05620a560100b007842f2c7b47mr14647406qkn.17.1707265412990; 
 Tue, 06 Feb 2024 16:23:32 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUKqAZHciSBhjDkL93HSNwomj8WPup6WGlhY7hcp1+bBepyowCJcME+5DvSiTwCuo4I9OvgseJ7gAdxnopaPEgkDX8LvizgVLIp2x2/Xs1qLL4FLcCbxnhahVbF8hiWWVkL99ea8y/zdB6M8xSfrwRlh/aAkjyZZmwTaoWMLdmJD6M7ad9d7RRfYcf5B2Ih8lXWb0RsFCOtN+PE6kWS8zYacyOqFWvlbCaeKJWuVJ9SoK0J3UiOka/zQ+kEwLo1HXwEfGA2yywLwxlu5qbkXEYOwW1QIc14kPcx5EZlq09ObakrYL82tqDJfe16I3syDAwo4i8TKCrIC9NvdJrWuwDOqUD5r1TK/PONOfaVU6sYB8NNIpwqBGBtmBpyQEuuH7OTM7a+9gmZP1ycnmj1/uNpK1iOE0Jov4vAizwLDfVvhx85mOeF+VHPx0NBLWFTsJcyaAv6+9dioJ9m6vqA6+AbFjdPmezodvhrt+8Poit681nKmCj6QRsERdN0a5GoL0l0QtebUF75dKHYeIpfFcZL9xFsiF1OQLiRkIvgFy6KK+lBwp5YMq9LqVciGT0czfprTjMKQE9uu/IAfm3IVHO/JlMLXDexfEoUFwvkGnnqrLAQ06JxSbEirKbJVTqre71+uJ2HZOd9h/5BgWCzkR8Um5QhFpSL68WBpP3D8YyGwClGAK/UzDoda4xqCdYXIGuDkz/AWOdE6nFBpbnYIRP/isjJPgczZPjZugWy1Cicc3CW6TG+wpIREtKVYMGlroiBW0ShOSY9p8ht
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:a4c9:b449:4b2a:fb09])
 by smtp.gmail.com with ESMTPSA id
 s9-20020ae9f709000000b00784b5fc8f1dsm30107qkg.34.2024.02.06.16.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 16:23:32 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org
Cc: Adam Ford <aford173@gmail.com>, nathan@kernel.org,
 kernel test robot <lkp@intel.com>, Liu Ying <victor.liu@nxp.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Lucas Stach <l.stach@pengutronix.de>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/bridge: imx8mp-hdmi-pvi:  Fix build warnings
Date: Tue,  6 Feb 2024 18:23:04 -0600
Message-ID: <20240207002305.618499-1-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

Two separate build warnings were reported.  One from an
uninitialized variable, and the other from returning 0
instead of NULL from a pointer.

Fixes: 059c53e877ca ("drm/bridge: imx: add driver for HDMI TX Parallel Video Interface")
Reported-by: nathan@kernel.org
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202402062134.a6CqAt3s-lkp@intel.com/
Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
index a76b7669fe8a..f2a09c879e3d 100644
--- a/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
+++ b/drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c
@@ -57,7 +57,7 @@ static void imx8mp_hdmi_pvi_bridge_enable(struct drm_bridge *bridge,
 	const struct drm_display_mode *mode;
 	struct drm_crtc_state *crtc_state;
 	struct drm_connector *connector;
-	u32 bus_flags, val;
+	u32 bus_flags = 0, val;
 
 	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
 	conn_state = drm_atomic_get_new_connector_state(state, connector);
@@ -110,7 +110,7 @@ imx8mp_hdmi_pvi_bridge_get_input_bus_fmts(struct drm_bridge *bridge,
 	struct drm_bridge_state *next_state;
 
 	if (!next_bridge->funcs->atomic_get_input_bus_fmts)
-		return 0;
+		return NULL;
 
 	next_state = drm_atomic_get_new_bridge_state(crtc_state->state,
 						     next_bridge);
-- 
2.43.0

