Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF59FA79312
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 18:27:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF60710E84A;
	Wed,  2 Apr 2025 16:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Qxlrw3Vv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22BF110E84A
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 16:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743611240;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VVqEqYlEksIxNQfBqzZj+eis5ZBLA1H2NQkSXSycgoo=;
 b=Qxlrw3Vvdl5rHmAdZb8WX7KZbqWKI5rgOd6xg6RA+yk8nb+KCVG3Yi9c2lZ419B4JWhl8t
 r6hfPsE1Ovg470QnHT+CtAy/YNjOLvPCIdLZ6KMSHh0lsV3Supiqr2Z0zcIDAdfSwzHkSh
 +BiEdxWavxrL/pEunRF+Z0D9oaBIMpo=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-627-CIREWCmDP6G_xv5r-5Lb7A-1; Wed,
 02 Apr 2025 12:27:16 -0400
X-MC-Unique: CIREWCmDP6G_xv5r-5Lb7A-1
X-Mimecast-MFC-AGG-ID: CIREWCmDP6G_xv5r-5Lb7A_1743611233
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 27426195605E; Wed,  2 Apr 2025 16:27:13 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 10932191F245; Wed,  2 Apr 2025 16:27:08 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 02 Apr 2025 11:24:01 -0400
Subject: [PATCH 23/30] panel/novatek-nt35510: Use refcounted allocation in
 place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-b4-drm_panel_mass_convert_part2-v1-23-903b70999ea6@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743607440; l=1368;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=I7W1h7y85hF3oihzp+50kZ9MQE3NLWSf3yckSqcNmYE=;
 b=67m0mbFT7Pqt5RCUUsx+HYtlwhX4egUNr5loKmkCGvx3Ens6umVxxC9e8A9i6yF6ZMy/HM8SY
 af59+8Fxd9rAxbTHUqaO1LqFeFFu62Z4W51ERFNa+onYNVsnGbeKmgp
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
 drivers/gpu/drm/panel/panel-novatek-nt35510.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35510.c b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
index 549b86f2cc288741897992ce5cad6325f4289dba..3189d89c7ca00074314a6f4fec330a3e625c24f4 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35510.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35510.c
@@ -1087,9 +1087,12 @@ static int nt35510_probe(struct mipi_dsi_device *dsi)
 	struct nt35510 *nt;
 	int ret;
 
-	nt = devm_kzalloc(dev, sizeof(struct nt35510), GFP_KERNEL);
-	if (!nt)
-		return -ENOMEM;
+	nt = devm_drm_panel_alloc(dev, struct nt35510, panel,
+				  &nt35510_drm_funcs,
+				  DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(nt))
+		return PTR_ERR(nt);
+
 	mipi_dsi_set_drvdata(dsi, nt);
 	nt->dev = dev;
 
@@ -1142,9 +1145,6 @@ static int nt35510_probe(struct mipi_dsi_device *dsi)
 		return PTR_ERR(nt->reset_gpio);
 	}
 
-	drm_panel_init(&nt->panel, dev, &nt35510_drm_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	/*
 	 * First, try to locate an external backlight (such as on GPIO)
 	 * if this fails, assume we will want to use the internal backlight

-- 
2.48.1

