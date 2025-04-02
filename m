Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE2E8A79315
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 18:27:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3061610E84E;
	Wed,  2 Apr 2025 16:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GOMCFKKW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 167BC10E84C
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 16:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743611250;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JMSY6BG+NT2RuPWqoFycvt4UrQtakGrNy8xvGs/972k=;
 b=GOMCFKKW/XXIaK+0L3lQawtdDeD3CReEQB1DDL0v4+21esbifzMUsW1qrkHjCOYloDH3XT
 nGTtZ4DPl9MujvNSshGoYUyd3JViF+SIFfjpwXsHu5M/U3qXP7YIwE2DNffstUXB5KxeCZ
 /iV5Z0mFUYChbwcyX38noJWZJQLPKrE=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-479-DlLAs-z3MJCCf6mh596LeA-1; Wed,
 02 Apr 2025 12:27:24 -0400
X-MC-Unique: DlLAs-z3MJCCf6mh596LeA-1
X-Mimecast-MFC-AGG-ID: DlLAs-z3MJCCf6mh596LeA_1743611241
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B90BC19560AB; Wed,  2 Apr 2025 16:27:21 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C9C23192C7C3; Wed,  2 Apr 2025 16:27:17 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 02 Apr 2025 11:24:03 -0400
Subject: [PATCH 25/30] panel/novatek-nt35950: Use refcounted allocation in
 place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-b4-drm_panel_mass_convert_part2-v1-25-903b70999ea6@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743607440; l=1338;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=LwqSq4oKZvcHlRbJzaAP/suiJNWW5npADCQHzdnYEEk=;
 b=ItJfZaUyksn3tOUWukVCcXh1jOEJKd+DY2OvfVKaHQT3LzLeVaIiLis58aituaKRL6GAGpK4B
 iIGubQe5npmAITwUAMkcIGsiY2ySPt19iCsexTb87vTmtBEMGUIgE+T
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
 drivers/gpu/drm/panel/panel-novatek-nt35950.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35950.c b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
index 08b22b592ab0452973aa7373dd0692a9bf98e5f2..94aa6489d99fc88f1602c4dbbf4f7f78c04799a9 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35950.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
@@ -449,9 +449,10 @@ static int nt35950_probe(struct mipi_dsi_device *dsi)
 	const struct mipi_dsi_device_info *info;
 	int i, num_dsis = 1, ret;
 
-	nt = devm_kzalloc(dev, sizeof(*nt), GFP_KERNEL);
-	if (!nt)
-		return -ENOMEM;
+	nt = devm_drm_panel_alloc(dev, struct nt35950, panel, &nt35950_panel_funcs,
+				  DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(nt))
+		return PTR_ERR(nt);
 
 	ret = nt35950_sharp_init_vregs(nt, dev);
 	if (ret)
@@ -491,9 +492,6 @@ static int nt35950_probe(struct mipi_dsi_device *dsi)
 	nt->dsi[0] = dsi;
 	mipi_dsi_set_drvdata(dsi, nt);
 
-	drm_panel_init(&nt->panel, dev, &nt35950_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ret = drm_panel_of_backlight(&nt->panel);
 	if (ret) {
 		if (num_dsis == 2)

-- 
2.48.1

