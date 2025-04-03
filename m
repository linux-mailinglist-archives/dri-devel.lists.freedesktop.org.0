Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA6CA7A619
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 17:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D749C10E9F2;
	Thu,  3 Apr 2025 15:18:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UesGaGRr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D34C10E9F2
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 15:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743693484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EMU3PloeRuARTwG+9umSlnrdr1sfZ34QXypMQX2ASZM=;
 b=UesGaGRrDKN2F9PMzAODmARjcvM4scbjyYpEzi+itmLyOZj1q/3ezzNVds1lo17xcmKKRk
 yLPIJmGm7MByloqttsYcqsQ5S5es23IdNz7oO7i8EKaqcTTYRzLwp/bwCpooi1zceXBr9b
 lOd9dzU+Ur+aNSgYbYvIgEJYTUTgyK8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-205-ztZClWZfPveV1dZ_SyCvxA-1; Thu,
 03 Apr 2025 11:18:01 -0400
X-MC-Unique: ztZClWZfPveV1dZ_SyCvxA-1
X-Mimecast-MFC-AGG-ID: ztZClWZfPveV1dZ_SyCvxA_1743693475
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C4731195608B; Thu,  3 Apr 2025 15:17:54 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id EB0AA1809B65; Thu,  3 Apr 2025 15:17:49 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 10:16:09 -0400
Subject: [PATCH v2 02/30] panel/elida-kd35t133: Use refcounted allocation
 in place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_convert_part2-v2-2-260c8a44c56b@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743689775; l=1426;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=6RmOxjwclziFK7rWnTz/0HU51iXUv+3/k95vLWAUx+U=;
 b=AOYLzuA5RgfeAZIlS4FVkK3B7TygajM+nroYTC+CyDOBqaK/yLrrPcdhYKggzv5t31JEwkL3p
 FwGoPv+0Y61CDLnxStNA6+CEjnLnMORLp/BP3RY9m2qmNiY1m7J6aY2
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
 drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c b/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
index 986e3e192881b50ad3cdbbbc41a2adbf77e8791a..6225501cb174960b38b7672c6ef53fbc98ab4acf 100644
--- a/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
+++ b/drivers/gpu/drm/panel/panel-feixin-k101-im2ba02.c
@@ -443,9 +443,11 @@ static int k101_im2ba02_dsi_probe(struct mipi_dsi_device *dsi)
 	unsigned int i;
 	int ret;
 
-	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(&dsi->dev, struct k101_im2ba02, panel,
+				   &k101_im2ba02_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	mipi_dsi_set_drvdata(dsi, ctx);
 	ctx->dsi = dsi;
@@ -463,9 +465,6 @@ static int k101_im2ba02_dsi_probe(struct mipi_dsi_device *dsi)
 		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->reset),
 				     "Couldn't get our reset GPIO\n");
 
-	drm_panel_init(&ctx->panel, &dsi->dev, &k101_im2ba02_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ret = drm_panel_of_backlight(&ctx->panel);
 	if (ret)
 		return ret;

-- 
2.48.1

