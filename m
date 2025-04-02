Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2BAA79301
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 18:26:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA3E10E823;
	Wed,  2 Apr 2025 16:26:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EPCiw/gV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D908910E823
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 16:26:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743611189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HSEO70ahAubWGEM4TPHZlNJ5/BiWYj6e1K2ja+EnewY=;
 b=EPCiw/gV1CfRgk0aHyL9Qn+Bq8MtqgmtgLr8PnjZrS/ZflJ8th3AjvoABI1HuL35gFkh0O
 niD6b+O+5z1+jTJ8qlUynsRQP2ihCmrmzyHmozDVFjw/lyyJP4+Q+wP521hlyNAKBsyY0a
 Q3iykAqzIHWd9CZhEHa+Ug6rO0LgWCE=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-458-C3aW6570P7ilLtWgnmWP9g-1; Wed,
 02 Apr 2025 12:26:24 -0400
X-MC-Unique: C3aW6570P7ilLtWgnmWP9g-1
X-Mimecast-MFC-AGG-ID: C3aW6570P7ilLtWgnmWP9g_1743611181
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EBF0A1800265; Wed,  2 Apr 2025 16:26:20 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id AE240195609D; Wed,  2 Apr 2025 16:26:16 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 02 Apr 2025 11:23:49 -0400
Subject: [PATCH 11/30] panel/innolux-ej030na: Use refcounted allocation in
 place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-b4-drm_panel_mass_convert_part2-v1-11-903b70999ea6@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743607440; l=1339;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=EuyM0klfe+I7/TbF4SujatT69lvtURfeKp1CiiGFgHk=;
 b=aFfSovD+14j5EtKmbY581WDEB83u02a65C4XKUkEmsDPraj9d5PZCNTII5gHHaioVQAp8wLis
 miNVTPzhY6iBRJ4ujlkJx5MHP6Gi8SsYlXmy6d3OTe/+GOkfuZJkfGq
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
 drivers/gpu/drm/panel/panel-innolux-ej030na.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-innolux-ej030na.c b/drivers/gpu/drm/panel/panel-innolux-ej030na.c
index f85b7a4cbb4206bea7b5a019ba1de1dd05b13fe2..b2309900873b28f98707f79f4332763369a27d72 100644
--- a/drivers/gpu/drm/panel/panel-innolux-ej030na.c
+++ b/drivers/gpu/drm/panel/panel-innolux-ej030na.c
@@ -204,9 +204,11 @@ static int ej030na_probe(struct spi_device *spi)
 	struct ej030na *priv;
 	int err;
 
-	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
-	if (!priv)
-		return -ENOMEM;
+	priv = devm_drm_panel_alloc(dev, struct ej030na, panel,
+				    &ej030na_funcs,
+				    DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(priv))
+		return PTR_ERR(priv);
 
 	priv->spi = spi;
 	spi_set_drvdata(spi, priv);
@@ -231,9 +233,6 @@ static int ej030na_probe(struct spi_device *spi)
 		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
 				     "Failed to get reset GPIO\n");
 
-	drm_panel_init(&priv->panel, dev, &ej030na_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	err = drm_panel_of_backlight(&priv->panel);
 	if (err)
 		return err;

-- 
2.48.1

