Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68199C6E5D1
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 13:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E649C10E5DA;
	Wed, 19 Nov 2025 12:03:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="paJ2Bppv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE57D10E5DA
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 12:03:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id D6037C11188;
 Wed, 19 Nov 2025 12:02:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0A2D860720;
 Wed, 19 Nov 2025 12:03:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1E24C10371A4A; Wed, 19 Nov 2025 13:03:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1763553800; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=zPUlO2R5eXMWotkNTVCSB8Dpcd7nY6Qnl2imtQ6Qgvw=;
 b=paJ2BppvoZ0NPRDAzneJwTOUDx3IdZgsXIxQVeL2jmJrsiCCCc0wrSbxmvRZK+elTnit/3
 aIpCopQ1lyHo2oCSXnt1en71XLOt+PsQOgmr3LDQgWDWTA17zaO55iYFjc+JLF4VimE5BO
 sVA31zD11qHfH6qRp/2aBxX9UYIQUZEzV8WL3cyAZguksUhIC51PFigWfuZoc4Lc+rTZDW
 NtcREBhV0ktknWKiXSpnXgzvygXrjiTdoXYBwDdpqnJfIIXlFCh4jjgjOY+WdsN2it2j8k
 PJTEsowe60ibBHjkRYYpU3UpoPu3lvfifXE6RgTFc4yTjzcBf1xmMoiTwYHj8Q==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Wed, 19 Nov 2025 13:03:02 +0100
Subject: [PATCH] drm/arcgpu: fix device node leak
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-drm-arcgpu-fix-device-node-leak-v1-1-06229edcfe6e@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAPWxHWkC/x2NSwqEQAwFryJZGzCCDO1Vhln0J+0EtZU0iiDef
 cIsC169uqGyClcYmxuUT6myFQNqG4hfXyZGScbQd/1ARA6Trug1TvuBWS5M5kTGsiXGhf2M2XU
 uRMqvHALYy65su3/h/XmeHy/19ZtxAAAA
X-Change-ID: 20251119-drm-arcgpu-fix-device-node-leak-f909bc1f7fbb
To: Simona Vetter <simona.vetter@ffwll.ch>, 
 Alexey Brodkin <abrodkin@synopsys.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 stable@vger.kernel.org, Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
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

This function gets a device_node reference via
of_graph_get_remote_port_parent() and stores it in encoder_node, but necer
puts that reference. Add it.

There used to be a of_node_put(encoder_node) but it has been removed by
mistake during a rework in commit 3ea66a794fdc ("drm/arc: Inline
arcpgu_drm_hdmi_init").

Fixes: 3ea66a794fdc ("drm/arc: Inline arcpgu_drm_hdmi_init")
Cc: stable@vger.kernel.org
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/tiny/arcpgu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index 7cf0f0ea1bfe..c74466ea2535 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -250,7 +250,8 @@ DEFINE_DRM_GEM_DMA_FOPS(arcpgu_drm_ops);
 static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 {
 	struct platform_device *pdev = to_platform_device(arcpgu->drm.dev);
-	struct device_node *encoder_node = NULL, *endpoint_node = NULL;
+	struct device_node *encoder_node __free(device_node) = NULL;
+	struct device_node *endpoint_node = NULL;
 	struct drm_connector *connector = NULL;
 	struct drm_device *drm = &arcpgu->drm;
 	int ret;

---
base-commit: 949f1fd2225baefbea2995afa807dba5cbdb6bd3
change-id: 20251119-drm-arcgpu-fix-device-node-leak-f909bc1f7fbb

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

