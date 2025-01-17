Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E367DA14BCC
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 10:05:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6313610EAB4;
	Fri, 17 Jan 2025 09:05:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fWA2e4ai";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F7D10EAB7
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 09:05:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id F314C1C0009;
 Fri, 17 Jan 2025 09:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737104704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UH25UKOSefoYrEAbHRQeYBzUXJbPh1Sxl6qIkPlZZBc=;
 b=fWA2e4aihCsh4pFn/eh3zYXk+/5+0qPvPw4qlFDUhKyTcTr3I54H8D+gGS2s3g231jqnI2
 tv5FnemgNgItkXdKrt6PzXWYBCmwjMfjQHKtYSw3c0l6b1e+NOgTUggPeaDWyDys6INwu7
 tz+unjnEAVp8mXrULsG3JBR6lCIfoPTIKc26tGbrF4e/xBAok1lORNoRzt3O+41lbmMHlY
 i1zaCIMKsM9/whsZMqP4hOKr2fTb4d1fRte6hU8rAzuGjZv6pCUb4xKrlTfhVwYX8O/S1N
 j8vb/ru91HJ85WBy2g+1XZCO7NNZ5b9F8/3OaqUKb08/STCCxofIDpExJxwRQw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 17 Jan 2025 10:04:27 +0100
Subject: [PATCH v4 1/3] drm/vkms: Switch to dynamic allocation for
 connector
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250117-b4-vkms-allocated-v4-1-8ec8fd21aaf6@bootlin.com>
References: <20250117-b4-vkms-allocated-v4-0-8ec8fd21aaf6@bootlin.com>
In-Reply-To: <20250117-b4-vkms-allocated-v4-0-8ec8fd21aaf6@bootlin.com>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2122;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=enHRBlfdsE5QZNehJNK38SNKP+L6XCHO8f0wPknVXf0=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnih09tGNip0D3AekdbB6kFGPJ9jn4DaZmLWrTt
 3uJ+yKtY/qJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4odPQAKCRAgrS7GWxAs
 4iJ1D/9TIUBs/kq8xpfoL2w9AtNhbzB9MJYwvTdvIJ/wa7eKCZv5FoJhtvmJueu6l+LpBtJzlpe
 xKamZyWqij9vkMT/Poco4WFy5ZhCNMvyqYXT0UsUrBumG4G6bxqE66pl7r6Sanf/XwgW4ZnR1uz
 c6kHIg7ztrcJqozMwDv6JYJs6+k8NiTKMllU5zS1Y4zCIje99gWf8lOG54LGmhCBr96hiQlkLtY
 2wyMrRdUPBoJGEEIR9s2flA7LwXIOSU/m9BRAQeuXmGtkm+OceFvIPii++BFa7g/wkupzf50LWC
 PMoS7Aapxu+SRyJNOd4uj+rreRpyAUvgEfTt2PRA4XWaG3bMWtEGR1BhpYbEo3nA89gZfsXCKYI
 kFU+L8WD9yK534UHVEEadrmUZq4eYgAZ8Fj0pbKC2Ph30uQrpdRmfyrnKxwgV8FODVfwPHQGEzg
 d3KqpkD/Gj+1PwyFX6BfNedYEi4k7leVMsv8K9wkQT/8Z56AeHySWBYAuci2mazLZ732/C0hHFg
 1AGotfGFGeF9gdiWulUfWThcrsDR4Ppwhw8N8NXPC8BO98EjY+Q39bu48ERQcvWIS2Oh0JzDZl+
 BbSwmixrh0F8Gy3RsqIE6hVG5dS9xNRbSQFkxbuvFgf2bTgcU+mao35/7g9QWRMrswCKs5eD053
 dS9z6pcn+vWw7kQ==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

A specific allocation for the connector is not strictly necessary
at this point, but in order to implement dynamic configuration of
VKMS (configFS), it will be easier to have one allocation per
connector.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h    | 1 -
 drivers/gpu/drm/vkms/vkms_output.c | 8 +++++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 46ac36aebb27ce8d9018224735007c1b3fe7d0a5..afa625457b6156135d2b07cbd5b5e3f3c7f8f33a 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -177,7 +177,6 @@ struct vkms_crtc_state {
 struct vkms_output {
 	struct drm_crtc crtc;
 	struct drm_encoder encoder;
-	struct drm_connector connector;
 	struct drm_writeback_connector wb_connector;
 	struct drm_encoder wb_encoder;
 	struct hrtimer vblank_hrtimer;
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index de817e2794860f9071a71b3631460691e0d73a85..a41d7a29a377c14a3281968dfeb8f2b43000b120 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -32,7 +32,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 {
 	struct vkms_output *output = &vkmsdev->output;
 	struct drm_device *dev = &vkmsdev->drm;
-	struct drm_connector *connector = &output->connector;
+	struct drm_connector *connector;
 	struct drm_encoder *encoder = &output->encoder;
 	struct drm_crtc *crtc = &output->crtc;
 	struct vkms_plane *primary, *overlay, *cursor = NULL;
@@ -71,6 +71,12 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		}
 	}
 
+	connector = drmm_kzalloc(dev, sizeof(*connector), GFP_KERNEL);
+	if (!connector) {
+		DRM_ERROR("Failed to allocate connector\n");
+		return -ENOMEM;
+	}
+
 	ret = drmm_connector_init(dev, connector, &vkms_connector_funcs,
 				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
 	if (ret) {

-- 
2.47.1

