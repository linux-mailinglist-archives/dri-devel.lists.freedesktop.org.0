Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A07AC868B
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 04:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F028510E7AD;
	Fri, 30 May 2025 02:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="c9Vh9xuG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D658E10E7AA
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 02:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748573559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vajfhnfHqawIqhOaSHsC1qlXFa4ZgW/NVqQj7pPIDeQ=;
 b=c9Vh9xuGHI4digbULbzw7u/tMuT5K8V/S3Dxj37wf5ci3U4Hp4D2AC/Q+cxddJNr5BKoFT
 NHWqgyAYgPiZcq1P/Sje+oKlLvoirWZGFW7SVy3RxHKDHKEm/Kxos7dusjDhnUf2dHlpcF
 B2K/Tgs/4f//pORhU57H34Wmf5uLobY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-648-SkX5Wz_fPIG8bTTTDAQqNg-1; Thu,
 29 May 2025 22:52:35 -0400
X-MC-Unique: SkX5Wz_fPIG8bTTTDAQqNg-1
X-Mimecast-MFC-AGG-ID: SkX5Wz_fPIG8bTTTDAQqNg_1748573552
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 40EC9180034A; Fri, 30 May 2025 02:52:32 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B670F1955D82; Fri, 30 May 2025 02:52:27 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 29 May 2025 21:46:35 -0500
Subject: [PATCH v2 33/46] panel/synaptics-r63353: allocation in place of
 devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-33-5d75a3711e40@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748573168; l=1472;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=nQICs1jxitzDInMhmfwCuDqh/MQujXHZ7USZm1fdiSg=;
 b=4q/XAqqd74KnO/HyTG1x/jyQZA/LapSvfBAQp3GLlwjNS/3R9VTdAp1gorOXEu/j8Kd0nDKSC
 cGFuwIhj7SOBMKVs3U3c3hSLgvNWkykBfWpFBbyJ6RXXnfueXjwvpNW
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
 drivers/gpu/drm/panel/panel-synaptics-r63353.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-synaptics-r63353.c b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
index b148e6cba9bd1184a8c3e9e264e31536ad78ce28..3a74d48753d9c55d4b5618fbc1167f28bc5f6c5e 100644
--- a/drivers/gpu/drm/panel/panel-synaptics-r63353.c
+++ b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
@@ -229,9 +229,11 @@ static int r63353_panel_probe(struct mipi_dsi_device *dsi)
 	struct device *dev = &dsi->dev;
 	struct r63353_panel *panel;
 
-	panel = devm_kzalloc(&dsi->dev, sizeof(*panel), GFP_KERNEL);
-	if (!panel)
-		return -ENOMEM;
+	panel = devm_drm_panel_alloc(dev, struct r63353_panel, base,
+				     &r63353_panel_funcs,
+				     DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(panel))
+		return PTR_ERR(panel);
 
 	mipi_dsi_set_drvdata(dsi, panel);
 	panel->dsi = dsi;
@@ -258,9 +260,6 @@ static int r63353_panel_probe(struct mipi_dsi_device *dsi)
 		return PTR_ERR(panel->reset_gpio);
 	}
 
-	drm_panel_init(&panel->base, dev, &r63353_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	panel->base.prepare_prev_first = true;
 	ret = drm_panel_of_backlight(&panel->base);
 	if (ret)

-- 
2.48.1

