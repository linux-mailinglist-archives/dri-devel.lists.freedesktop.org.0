Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6250DA7B0BB
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 23:23:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF5F10EB5E;
	Thu,  3 Apr 2025 21:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HThZvGAy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA18910EB5A
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 21:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743715397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0euA2BNVZVmUNDUqSRsiptnpnBHJh1mpEHiTlqrUOyk=;
 b=HThZvGAyqdLjqXiv4IZQe6jUJbsu37Lthb/WjKWupE6asWcGB/oyVnd8o1JOLzWHDF9V9n
 HA1fLydQ0j9KphoOhy750aUq53rrc3ygPsa5FPx69eXDpmKDCTt4DW2h9S5Nr4uM6EgE03
 FGk0PaEl9MWFulxmvlfD+sNWJeJlT/g=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-358-NolDOIazNgqqQsqUmcTSWw-1; Thu,
 03 Apr 2025 17:23:11 -0400
X-MC-Unique: NolDOIazNgqqQsqUmcTSWw-1
X-Mimecast-MFC-AGG-ID: NolDOIazNgqqQsqUmcTSWw_1743715389
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id DE303180034D; Thu,  3 Apr 2025 21:23:08 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7E5F4180B488; Thu,  3 Apr 2025 21:23:04 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:20:42 -0400
Subject: [PATCH 11/46] panel/samsung-db7430: Use refcounted allocation in
 place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-11-965b15ad5b8e@redhat.com>
References: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-0-965b15ad5b8e@redhat.com>
In-Reply-To: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-0-965b15ad5b8e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1306;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=nLkhEhWqxBkHr9HZAzxzL5N30PvbIzwllPLao3lK10o=;
 b=tSazrLQsPap77XsG9vkQWCmXMq1ufg/lwYpF7n+MaWoRRYRtv8DaSNuUXqGtxCZyU6ynW00yO
 qlKj3gbz837D7wvKy9FrZvpaR2BQBfQarktG31VNHqAXvdmdvQC1TjL
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
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

