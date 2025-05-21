Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF0CABEAB0
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 06:11:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7F5510E68C;
	Wed, 21 May 2025 04:11:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="B6h/s71m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E684310E684
 for <dri-devel@lists.freedesktop.org>; Wed, 21 May 2025 04:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747800663;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BkrNono46FWWXHPun5vhX1sWscczaQ6pvGc2N+Rnu7o=;
 b=B6h/s71mc0Qau/CC2S2Rer/x7sMMZHLKm2j753m/e1TAOGrROFb4Z4iLVjn3TH0LlcbEX0
 pd0bFEgyiXsdRot6HDss/np5CAzlHtCltSz4xbbnc9kwXdW+gPNKgDu54d16wpM+oJ9UGN
 hxq9khKVUtLuH+fIvA6lk6zW4baoKrI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-304-wWLvSrvUN0C1cTbQ5QgpxA-1; Wed,
 21 May 2025 00:10:57 -0400
X-MC-Unique: wWLvSrvUN0C1cTbQ5QgpxA-1
X-Mimecast-MFC-AGG-ID: wWLvSrvUN0C1cTbQ5QgpxA_1747800655
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id ECA11180045C; Wed, 21 May 2025 04:10:54 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.184])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7ACAE1956095; Wed, 21 May 2025 04:10:49 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 20 May 2025 22:03:50 -0500
Subject: [PATCH v3 19/30] panel/magnachip-d53e6ea8966: Use refcounted
 allocation in place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-drivers-mass-convert-part2-v3-19-f7ae7b723c68@redhat.com>
References: <20250520-drivers-mass-convert-part2-v3-0-f7ae7b723c68@redhat.com>
In-Reply-To: <20250520-drivers-mass-convert-part2-v3-0-f7ae7b723c68@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747796667; l=1519;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=IH9ycYv2vALU35t6qzJFEdusmSs6ZiL2JiuFJt9f6u8=;
 b=V8i+FJ1X2qKIPOOWZ6e+9RKnMYwwi8NK/Ic3G68z8k43k2UvR2Wg5hoXluygznVo5koT0gxJm
 LPiZ8QgNWj/DzmAxYyoK3kYCrl7HTKQ3sJIMouVMf/+MoBg+7CPLqYe
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

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
v3: fix compilation.
v2: none.
---
 drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c b/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
index 799c2161fc85b24e1fb236fd63b397bf66fc15c8..cde168ec631c43cef2a8180bff55d00331426d86 100644
--- a/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
+++ b/drivers/gpu/drm/panel/panel-magnachip-d53e6ea8966.c
@@ -370,9 +370,11 @@ static int d53e6ea8966_probe(struct spi_device *spi)
 		.node = NULL,
 	};
 
-	db = devm_kzalloc(dev, sizeof(*db), GFP_KERNEL);
-	if (!db)
-		return -ENOMEM;
+	db = devm_drm_panel_alloc(dev, struct d53e6ea8966, panel,
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

