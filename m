Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9692BB675C
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 12:39:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F6E10E32E;
	Fri,  3 Oct 2025 10:39:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="TavQ+tKW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08E1E10E38B
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 10:39:47 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 87396C00D9D;
 Fri,  3 Oct 2025 10:39:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 87D9160683;
 Fri,  3 Oct 2025 10:39:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 44522102F1C34; 
 Fri,  3 Oct 2025 12:39:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1759487984; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=i5fUEUgIVWMunz1YPOYTWYL3LVH7gS/tsB8DL80Sfco=;
 b=TavQ+tKW/HRQ5PLxtRACT02jNmQLru465Io0wcsbv+cPYz6k/sFZUzp6HlYCS+RETRuqTl
 p+mC5LXxgAB6pPEEKBB1pg9kLsaEmrnNpDQ3jRsxenZ+7CMyJn3lBjWYle/qdjd+dl2gGF
 bFHUQZuajWIi1KTBuvk0J/j9HMAuPOBHV+4WjLp24x1pAeTWqLAFMk04RKQ8nSfS8NNf2o
 H1XX8UKGEpT6+XPnMoWS3eOoRzoLhcjdWc3RJK8DudQnJ4i3duha3dkRn8TgVFpvbrqQRX
 4dP0OMpgDaPTOVVizDgSvuJGYGg75oOHibkKay+1nayWwWSStQPcj6G2wDrzhA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 03 Oct 2025 12:39:25 +0200
Subject: [PATCH v2 3/7] drm/bridge: lock the encoder bridge chain mutex
 during insertion
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251003-drm-bridge-alloc-encoder-chain-mutex-v2-3-78bf61580a06@bootlin.com>
References: <20251003-drm-bridge-alloc-encoder-chain-mutex-v2-0-78bf61580a06@bootlin.com>
In-Reply-To: <20251003-drm-bridge-alloc-encoder-chain-mutex-v2-0-78bf61580a06@bootlin.com>
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

Changes in v2:
- Removed comment before on drm_bridge_detach()
---
 drivers/gpu/drm/drm_bridge.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 53e7ece36dd940aabd1c0880f296fce7224a12ac..d2ab7cef0b768b0ff674a77977833da27133912f 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -453,10 +453,12 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 	bridge->dev = encoder->dev;
 	bridge->encoder = encoder;
 
+	drm_encoder_chain_lock(encoder);
 	if (previous)
 		list_add(&bridge->chain_node, &previous->chain_node);
 	else
 		list_add(&bridge->chain_node, &encoder->bridge_chain);
+	drm_encoder_chain_unlock(encoder);
 
 	if (bridge->funcs->attach) {
 		ret = bridge->funcs->attach(bridge, encoder, flags);
@@ -487,7 +489,9 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 err_reset_bridge:
 	bridge->dev = NULL;
 	bridge->encoder = NULL;
+	drm_encoder_chain_lock(encoder);
 	list_del(&bridge->chain_node);
+	drm_encoder_chain_unlock(encoder);
 
 	if (ret != -EPROBE_DEFER)
 		DRM_ERROR("failed to attach bridge %pOF to encoder %s: %d\n",

-- 
2.51.0

