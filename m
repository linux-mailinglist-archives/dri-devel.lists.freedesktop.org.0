Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B78E0BC8DA0
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 13:39:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7FD510E9CD;
	Thu,  9 Oct 2025 11:39:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="QFMsvjrR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F002810E9CD
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 11:39:23 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id D8F8C4E40FB5;
 Thu,  9 Oct 2025 11:39:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id AF0BE6062C;
 Thu,  9 Oct 2025 11:39:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 28950102F21B6; 
 Thu,  9 Oct 2025 13:39:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760009961; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=BD8pO2vjph10EPQeLoSgNYytCgMXgCKx/eXc4dPQitE=;
 b=QFMsvjrRXXJAssZzomnw7eR3oUWhyXs9YikFK1Z59KfiWZSa968jrZzrT1pFxnWeoqjcjl
 7yI5k986Uqsh2Q0hcUuarZwCd3IcezMS63wkLDoGnp1GVRjWgND3RpdpmCyxFf0jdn7hvE
 HnT7fj+SK1Ci84SY1Tf0NrEUrcpaHuee8ZFORHmeaqjes3uI2acoJlkGPWgo6+NWyZJkuw
 DRyzvcxz8p+SFM1X4tqJcrzM92iTWEYEEd2SCfLGteM0qgZCwYDcLXQ5hVVKXMtVNZxWTt
 DI4zLbtPX5Ney/xGWJH3V+AUeKALWCLLBmRfOOQ9twovSwSPcQHwoFDHsy1F6A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Thu, 09 Oct 2025 13:38:58 +0200
Subject: [PATCH v3 3/7] drm/bridge: drm_bridge_attach: lock the encoder
 chain mutex during insertion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-drm-bridge-alloc-encoder-chain-mutex-v3-3-c90ed744efec@bootlin.com>
References: <20251009-drm-bridge-alloc-encoder-chain-mutex-v3-0-c90ed744efec@bootlin.com>
In-Reply-To: <20251009-drm-bridge-alloc-encoder-chain-mutex-v3-0-c90ed744efec@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
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

drm_bridge_attach() modifies the encoder bridge chain, so take a mutex
around such operations to allow users of the chain to protect themselves
from chain modifications while iterating.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- Lock encoder->bridge_chain_mutex directly, no wrappers

Changes in v2:
- Removed comment before on drm_bridge_detach()
---
 drivers/gpu/drm/drm_bridge.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 53e7ece36dd940aabd1c0880f296fce7224a12ac..a25e379237f95c037eddc7602d405f958a4efa44 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -453,10 +453,12 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 	bridge->dev = encoder->dev;
 	bridge->encoder = encoder;
 
+	mutex_lock(&encoder->bridge_chain_mutex);
 	if (previous)
 		list_add(&bridge->chain_node, &previous->chain_node);
 	else
 		list_add(&bridge->chain_node, &encoder->bridge_chain);
+	mutex_unlock(&encoder->bridge_chain_mutex);
 
 	if (bridge->funcs->attach) {
 		ret = bridge->funcs->attach(bridge, encoder, flags);
@@ -487,7 +489,9 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 err_reset_bridge:
 	bridge->dev = NULL;
 	bridge->encoder = NULL;
+	mutex_lock(&encoder->bridge_chain_mutex);
 	list_del(&bridge->chain_node);
+	mutex_unlock(&encoder->bridge_chain_mutex);
 
 	if (ret != -EPROBE_DEFER)
 		DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",

-- 
2.51.0

