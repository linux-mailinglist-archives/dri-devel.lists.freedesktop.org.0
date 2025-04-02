Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3948DA7930D
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 18:27:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6313D10E848;
	Wed,  2 Apr 2025 16:27:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BeQ4Yq+y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2096310E849
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 16:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743611221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PF3326fVU7EkcW3hdKGVCgStfM4AKl0CPV6LOBOueVY=;
 b=BeQ4Yq+yuoW4UPC9XYGKN2fJb9aK4pJLNThCBwiTAgju8nyCp4/GykwSk28OVbzovGVxfX
 3PfiAuykxh6cNrxYAdmwaCMWRTrC52In+bLrUnnFus98bVMm/kJY29nXKSdsjbAY20T90N
 +nXCSHHWJHgMr5k/2fKHH+pMrHwMUFE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-685-o1h0161CNnO7F6tlJ6PPkA-1; Wed,
 02 Apr 2025 12:26:58 -0400
X-MC-Unique: o1h0161CNnO7F6tlJ6PPkA-1
X-Mimecast-MFC-AGG-ID: o1h0161CNnO7F6tlJ6PPkA_1743611215
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B914B180034D; Wed,  2 Apr 2025 16:26:55 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B241B195609D; Wed,  2 Apr 2025 16:26:51 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 02 Apr 2025 11:23:57 -0400
Subject: [PATCH 19/30] panel/magnachip-d53e6ea8966: Use refcounted
 allocation in place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-b4-drm_panel_mass_convert_part2-v1-19-903b70999ea6@redhat.com>
References: <20250402-b4-drm_panel_mass_convert_part2-v1-0-903b70999ea6@redhat.com>
In-Reply-To: <20250402-b4-drm_panel_mass_convert_part2-v1-0-903b70999ea6@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>, 
 Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Michael Walle <mwalle@kernel.org>, Jagan Teki <jagan@edgeble.ai>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Jianhua Lu <lujianhua000@gmail.com>, Stefan Mavrodiev <stefan@olimex.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743607440; l=1421;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=Dc8uKXlqTDknhwrvVeBmpqtls+s5KcMmvtGSnNVdukg=;
 b=5dtBANBxn6IdGQaEVw0WdHGM8TCjfStG01MD+kqCQI/IpGBIaSCdtgarS1pw/y80QsNEEnJ6U
 HggUToInNvjD40qSwWXSImkjBv3zDBK5LPMEakNPL8pkYKFQDVMWfft
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c b/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
index 799c2161fc85b24e1fb236fd63b397bf66fc15c8..ee225286ce6df0ce48cf7a2c60d600332d02ed86 100644
--- a/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
+++ b/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
@@ -370,9 +370,11 @@ static int d53e6ea8966_probe(struct spi_device *spi)
 		.node = NULL,
 	};
 
-	db = devm_kzalloc(dev, sizeof(*db), GFP_KERNEL);
-	if (!db)
-		return -ENOMEM;
+	db = devm_drm_panel_alloc(dev, struct ili9881c, panel,
+				  &d53e6ea8966_panel_funcs,
+				  DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(db))
+		return PTR_ERR(db);
 
 	spi_set_drvdata(spi, db);
 
@@ -425,9 +427,6 @@ static int d53e6ea8966_probe(struct spi_device *spi)
 	db->dsi_dev->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
 			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
 
-	drm_panel_init(&db->panel, dev, &d53e6ea8966_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	if (db->panel_info->backlight_register) {
 		ret = db->panel_info->backlight_register(db);
 		if (ret < 0)

-- 
2.48.1

