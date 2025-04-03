Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91951A7A62D
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 17:19:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D143C10EA29;
	Thu,  3 Apr 2025 15:19:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Lcj+CT1h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 689F810EA29
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 15:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743693554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X7DMmMZXzdF8LXmcYrCvtE/dHZ3PGksX88vhJy1Fbto=;
 b=Lcj+CT1hL9l9eoO+DH7RpLejM/GvzcE4QGGHjiLlZT2Xen17oFl2+2kWjZZz7QZb0NpZ7A
 /TXU1YPNoGDKVMAGupVdtdBv/hHbNnoz9BSCLThbm9b3rAguT/K70IxY+OyIYHkGn0WTzE
 lQKJ8jWQr2miv281wVG6er0dPpJ1fvc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-154-pKqar8g1NA6JHj2UnsrDCA-1; Thu,
 03 Apr 2025 11:19:11 -0400
X-MC-Unique: pKqar8g1NA6JHj2UnsrDCA-1
X-Mimecast-MFC-AGG-ID: pKqar8g1NA6JHj2UnsrDCA_1743693547
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id ABEAF1801A07; Thu,  3 Apr 2025 15:19:07 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id BA3881801752; Thu,  3 Apr 2025 15:19:03 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 10:16:25 -0400
Subject: [PATCH v2 18/30] panel/lincolntech-lcd197: Use refcounted
 allocation in place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_convert_part2-v2-18-260c8a44c56b@redhat.com>
References: <20250403-b4-drm_panel_mass_convert_part2-v2-0-260c8a44c56b@redhat.com>
In-Reply-To: <20250403-b4-drm_panel_mass_convert_part2-v2-0-260c8a44c56b@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743689775; l=1484;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=ivekhNNXLgy47sf15VedzyJGzNnLprsWSCrRsqDwUjc=;
 b=346C1nWjrEdcK+Kimp4OdelZiEooQuqMqIziJyblxGUgPicN6/KC8QgwW+zzDkZD/jgrmmnaY
 Kf7Wuv679sXBLsqtEPzULVjIti2AjfkGr+DiXWh3GzDEmr8cpA55Ye2
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
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
v2: none.
---
 drivers/gpu/drm/panel/panel-lincolntech-lcd197.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lincolntech-lcd197.c b/drivers/gpu/drm/panel/panel-lincolntech-lcd197.c
index 032c542aab0f788e8a244721c838d9d740af98fb..54ad17704072213b00292df487a9f28cffd45f6c 100644
--- a/drivers/gpu/drm/panel/panel-lincolntech-lcd197.c
+++ b/drivers/gpu/drm/panel/panel-lincolntech-lcd197.c
@@ -190,9 +190,11 @@ static int lincoln_lcd197_panel_probe(struct mipi_dsi_device *dsi)
 	dsi->mode_flags = (MIPI_DSI_MODE_VIDEO |
 			   MIPI_DSI_MODE_VIDEO_BURST);
 
-	lcd = devm_kzalloc(&dsi->dev, sizeof(*lcd), GFP_KERNEL);
-	if (!lcd)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct lincoln_lcd197_panel, panel,
+				   &lincoln_lcd197_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	mipi_dsi_set_drvdata(dsi, lcd);
 	lcd->dsi = dsi;
@@ -214,9 +216,6 @@ static int lincoln_lcd197_panel_probe(struct mipi_dsi_device *dsi)
 		return dev_err_probe(dev, PTR_ERR(lcd->reset_gpio),
 				     "failed to get reset gpio");
 
-	drm_panel_init(&lcd->panel, dev,
-		       &lincoln_lcd197_panel_funcs, DRM_MODE_CONNECTOR_DSI);
-
 	err = drm_panel_of_backlight(&lcd->panel);
 	if (err)
 		return err;

-- 
2.48.1

