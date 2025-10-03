Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B2D1BB645D
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 11:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2380E10E0FC;
	Fri,  3 Oct 2025 09:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="xH7vQ5m/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D318B10E0FC
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Oct 2025 09:00:48 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B47131A10C5;
 Fri,  3 Oct 2025 09:00:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 89D7F60683;
 Fri,  3 Oct 2025 09:00:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 7BDB2102F1C33; 
 Fri,  3 Oct 2025 11:00:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1759482046; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=ebfUGkYH5pGjBKB+Sf434xFBeiTl0SZ+ny8lNc0QXfU=;
 b=xH7vQ5m/dsvHtjScC488kOPlgbneze3g9Xbx0zuE4G4meEKLY/IGuzDaKTeGJT2UByCXHM
 SxBF9ZivjWXs5m+tOlJZ39gAPkNfDVC7rE76kTq7wvh9/r1sdOZAU4SPwUA0XJUHEmd5KQ
 Y7exiY3dgKKXlv6WC+jBmrkFhUtyrf6Z9P17IO9knzwKz99/9Dq2Z02BjyToC1Bk5GhVYn
 DrDKsgtaBls8lBHKGL0gAyUXYJh6XL3zlfEG5YoUWb+lG71BD9mlNNJR/sSEztomNMrr+y
 qBtO7rgUSdGvQqxt0USJF6hSdMScGhGPu3prU4w6cbn3qvfgeDkLTxhgXpNqaw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 03 Oct 2025 10:59:56 +0200
Subject: [PATCH 2/4] drm/sti: hdmi: add bridge before attaching
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251003-b4-drm-bridge-alloc-add-before-attach-v1-2-92fb40d27704@bootlin.com>
References: <20251003-b4-drm-bridge-alloc-add-before-attach-v1-0-92fb40d27704@bootlin.com>
In-Reply-To: <20251003-b4-drm-bridge-alloc-add-before-attach-v1-0-92fb40d27704@bootlin.com>
To: Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
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

DRM bridges should be always added to the global bridge list before being
attached.

Link: https://lore.kernel.org/all/20250709-sophisticated-loon-of-rain-6ccdd8@houat/
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
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

