Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FC8AC866C
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 04:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDBB410E256;
	Fri, 30 May 2025 02:50:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eg14hd4o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF78E10E256
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 02:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748573454;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DUtoG8C1NKSzIHhR8Z/03iU1YNJNSD47MIfqiE5akS4=;
 b=eg14hd4oq8w89PnEUk6GFcV12xhbnkix9ordXlPxPMHxCOf7YYuEtdEn21MK1lb6NTmGCk
 WKRuXOOX2AKnwUFVk0JBd0NA5xp4cJguhBx8+MK0vx7OgAT0J1RIt1T0nU4WO6wPfCaJG8
 Ukqqjuc24/rcvIWnnh4TBpI0mtRxhaw=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-325-oTwVc3EwNSipWZPsGdfv4A-1; Thu,
 29 May 2025 22:50:50 -0400
X-MC-Unique: oTwVc3EwNSipWZPsGdfv4A-1
X-Mimecast-MFC-AGG-ID: oTwVc3EwNSipWZPsGdfv4A_1748573447
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 2F05F195608B; Fri, 30 May 2025 02:50:47 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id CC1F41955D82; Fri, 30 May 2025 02:50:42 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 29 May 2025 21:46:13 -0500
Subject: [PATCH v2 11/46] panel/samsung-db7430: Use refcounted allocation
 in place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-11-5d75a3711e40@redhat.com>
References: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
In-Reply-To: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-0-5d75a3711e40@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Chiras <robert.chiras@nxp.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Artur Weber <aweber.kernel@gmail.com>, 
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748573168; l=1379;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=yHc2jtKs8bmVqt/0ehd+VoQUXIdqsYEXb/zHQfrpfn8=;
 b=PPX8YTy0hr1+TcztO+vpVAG5WWY9Q+IEMLSo5p03vPvq7gXvktI/4mcF2qr7yq5mzAl4qkZ+g
 DWcebegqag1Ccps84aBgJMGCX9wlvAbafCilOvmw0G0K6HgrSCft9Ah
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
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
v2: none.
---
 drivers/gpu/drm/panel/panel-samsung-db7430.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-db7430.c b/drivers/gpu/drm/panel/panel-samsung-db7430.c
index 14c6700e37b30a58e7081423c18bff8db7896c5b..a97182f3c9907ad33ab6e7717129029e3bc4cd8b 100644
--- a/drivers/gpu/drm/panel/panel-samsung-db7430.c
+++ b/drivers/gpu/drm/panel/panel-samsung-db7430.c
@@ -267,9 +267,11 @@ static int db7430_probe(struct spi_device *spi)
 	struct db7430 *db;
 	int ret;
 
-	db = devm_kzalloc(dev, sizeof(*db), GFP_KERNEL);
-	if (!db)
-		return -ENOMEM;
+	db = devm_drm_panel_alloc(dev, struct db7430, panel, &db7430_drm_funcs,
+				  DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(db))
+		return PTR_ERR(db);
+
 	db->dev = dev;
 
 	/*
@@ -294,9 +296,6 @@ static int db7430_probe(struct spi_device *spi)
 	if (ret)
 		return dev_err_probe(dev, ret, "MIPI DBI init failed\n");
 
-	drm_panel_init(&db->panel, dev, &db7430_drm_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	/* FIXME: if no external backlight, use internal backlight */
 	ret = drm_panel_of_backlight(&db->panel);
 	if (ret)

-- 
2.48.1

