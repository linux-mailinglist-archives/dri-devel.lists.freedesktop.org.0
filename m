Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC2BAC868A
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 04:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11B7610E7AE;
	Fri, 30 May 2025 02:52:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="CovrWlKS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF4B310E7AF
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 02:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748573552;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WqkGcoAKWo5VrLS+AhxF5qaDYWELv6xstEXyTL2DsKM=;
 b=CovrWlKS6LJdd1T12JFXIgokdyD1RTbDK+SUYWp8M43dGy+QS+1PXfLCDH2fptCaAAHmLK
 zt/db7Sn9a5vWU5r5WM9aRukX5vprZVD49GYItnXlNnrbKw7ycntZ5jvd4YJVxV+7dcJ5I
 1dV/9gYfVoFOEiDfypq5drZaxRtapuI=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-28-NEYQa8mCO3aAtH_TW0vxVg-1; Thu,
 29 May 2025 22:52:30 -0400
X-MC-Unique: NEYQa8mCO3aAtH_TW0vxVg-1
X-Mimecast-MFC-AGG-ID: NEYQa8mCO3aAtH_TW0vxVg_1748573547
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 6829B1955DB3; Fri, 30 May 2025 02:52:27 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0E9EB1955D82; Fri, 30 May 2025 02:52:22 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 29 May 2025 21:46:34 -0500
Subject: [PATCH v2 32/46] panel/panel-summit: Use refcounted allocation in
 place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-32-5d75a3711e40@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748573168; l=1422;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=HXGA7dzp4/Dj3Rx7qAhpbJ4GY9ei3E9AojQjOdLR7Wc=;
 b=wRpsp4C2BExhwKFIVF8af6nTZha6EH/v3v4PmH3BpXZywfTPg+DFVVv9AyYDo88GHPIECLITT
 yUOriDdT2fFCSfjnKpJeAUg5QW+10pO2g1hReNTnAPVu5noQ/rlWAiU
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
v2: refactor.Use already dereferenced dev instead of &dsi->dev.
---
 drivers/gpu/drm/panel/panel-summit.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-summit.c b/drivers/gpu/drm/panel/panel-summit.c
index e780faee18570c9970d381b3f7c65b95665469cd..4854437e2899126c74d8060433a9064cc3812de7 100644
--- a/drivers/gpu/drm/panel/panel-summit.c
+++ b/drivers/gpu/drm/panel/panel-summit.c
@@ -68,9 +68,11 @@ static int summit_probe(struct mipi_dsi_device *dsi)
 	struct summit_data *s_data;
 	int ret;
 
-	s_data = devm_kzalloc(dev, sizeof(*s_data), GFP_KERNEL);
-	if (!s_data)
-		return -ENOMEM;
+	s_data = devm_drm_panel_alloc(dev, struct summit_data, panel,
+				      &summit_panel_funcs,
+				      DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(s_data))
+		return PTR_ERR(s_data);
 
 	mipi_dsi_set_drvdata(dsi, s_data);
 	s_data->dsi = dsi;
@@ -85,8 +87,6 @@ static int summit_probe(struct mipi_dsi_device *dsi)
 	if (IS_ERR(s_data->bl))
 		return PTR_ERR(s_data->bl);
 
-	drm_panel_init(&s_data->panel, dev, &summit_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
 	drm_panel_add(&s_data->panel);
 
 	return mipi_dsi_attach(dsi);

-- 
2.48.1

