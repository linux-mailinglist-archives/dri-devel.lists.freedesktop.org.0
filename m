Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BC8C14089
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 11:16:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A06010E372;
	Tue, 28 Oct 2025 10:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ZQoiuq/g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D44B10E371
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 10:16:38 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 6611E1A16F8;
 Tue, 28 Oct 2025 10:16:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 351D8606AB;
 Tue, 28 Oct 2025 10:16:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 3E9361179B14C; Tue, 28 Oct 2025 11:16:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761646596; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=Pbf/CGcLpewLgLdKRQhA80Qa7Mx65sj1bmKZQ1GINdc=;
 b=ZQoiuq/gQMnwBUKeeos5Z27KdRZdCIgcUFjRSL8JdEeuh/NkS1gI3yIt7XheNTYpQJYbot
 ALgs6yDieHKQJ1pXFXUomXKsVOSCOnhTCwvrDILiD+ZUpHFjOAJZjlMhDBJAQ9+Vvt1gL+
 gYTRTndraZXJdjk/f2Q3pOUoiuMhuG36dpeJXtLT/w9WLXuWAml46KOl+/73+s3R8sbSTn
 ZODKyl1InDUYffGe7M5guuHme/NKG+25cMqOxXf5rRRb88gNcylLhsf1oOkqTTJc7qL+rH
 TtUR94xFcJ5htSmf/Wh62f8lKMu3nn2GEbVdwVtAsLD9CKZMcvWtWNZatV6Fxw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 28 Oct 2025 11:15:43 +0100
Subject: [PATCH v3 2/6] drm/sti: hdmi: add bridge before attaching
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-b4-drm-bridge-alloc-add-before-attach-v3-2-bb8611acbbfb@bootlin.com>
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

Acked-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
Acked-by: Alain Volmat <alain.volmat@foss.st.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- removed misplaced 'Link:' tag
---
 drivers/gpu/drm/sti/sti_hdmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 4e7c3d78b2b971f8083deae96f3967b44a6499cb..f8222e60b1e01afb6d93f816915f17056c060f22 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -1459,6 +1459,7 @@ static int sti_hdmi_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, hdmi);
 
+	drm_bridge_add(&hdmi->bridge);
 	return component_add(&pdev->dev, &sti_hdmi_ops);
 
  release_adapter:
@@ -1475,6 +1476,7 @@ static void sti_hdmi_remove(struct platform_device *pdev)
 	if (hdmi->audio_pdev)
 		platform_device_unregister(hdmi->audio_pdev);
 	component_del(&pdev->dev, &sti_hdmi_ops);
+	drm_bridge_remove(&hdmi->bridge);
 }
 
 struct platform_driver sti_hdmi_driver = {

-- 
2.51.0

