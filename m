Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 924BEC14098
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 11:16:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B508D10E376;
	Tue, 28 Oct 2025 10:16:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="NJsb70WG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9574410E376
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 10:16:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 251DCC0C408;
 Tue, 28 Oct 2025 10:16:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 61E8F606AB;
 Tue, 28 Oct 2025 10:16:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2A1731179B1A0; Tue, 28 Oct 2025 11:16:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761646609; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=+OuXZMnaZ4fecFxPcq14M2NVMZIWpSpSGN4BrirylB4=;
 b=NJsb70WGj3gzFkkHQ9peasIqc9ipmU2eFTBxN8RViZloU3PbUejLbAfegZxMQrRJ9pbQeA
 jFEtjUGrbDob/mQD3Pc8W8/iktEPQ+7opkZCyPE6OrxgODiOudGzeZMFVZfWRj4nyDHyDq
 v/FAH0o7JLITPliZLxdofG/N0asK7GVTO8pP+qxcama1CZNYkw9X7QTb2vAIp9ZLogx2hY
 M8m9GdiXvnn9W+Fh2UxnDZ5E2x71+rkREBoFLqNJPnHhOxLGGlWNNYJtvAzqn+8iAKd7Xx
 gqP2Aq49d4l5YmAFKBcsw377SOb1j6jfIuzhTTYy36W1As6negm8txob1Y3F2g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 28 Oct 2025 11:15:47 +0100
Subject: [PATCH v3 6/6] drm/bridge: synopsys: dw-dp: add bridge before
 attaching
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-b4-drm-bridge-alloc-add-before-attach-v3-6-bb8611acbbfb@bootlin.com>
References: <20251028-b4-drm-bridge-alloc-add-before-attach-v3-0-bb8611acbbfb@bootlin.com>
In-Reply-To: <20251028-b4-drm-bridge-alloc-add-before-attach-v3-0-bb8611acbbfb@bootlin.com>
To: Alain Volmat <alain.volmat@foss.st.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Andy Yan <andy.yan@rock-chips.com>
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

DRM bridges should be always added to the global bridge list before being
attached.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch was added in v3 after searching for any remaining bridges not
using drm_bridge_add().
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 9bbfe8da3de0264acbf8725d54f2f9627662e595..82aaf74e1bc070603bdda0be3a1c6dc631ff00da 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -2049,6 +2049,8 @@ struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
 	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
 	bridge->ycbcr_420_allowed = true;
 
+	devm_drm_bridge_add(dev, bridge);
+
 	dp->aux.dev = dev;
 	dp->aux.drm_dev = encoder->dev;
 	dp->aux.name = dev_name(dev);

-- 
2.51.0

