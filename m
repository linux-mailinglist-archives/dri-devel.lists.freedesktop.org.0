Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A990AC866F
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 04:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 846D910E287;
	Fri, 30 May 2025 02:51:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FXpKmkjh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE92A10E286
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 02:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748573463;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yP7Yt1jdLtFrb1Btt/Q1OM3FtCssfEiWBP5ZLXFx4yw=;
 b=FXpKmkjhUGxjxW0kFPeG7n1GEPTofZ1+a+Cdp3JF/8GRLnK6aOvRfFOUD/Engdk/uQ/t7x
 xmIrPdsvcBLpB67RYIEat0u/KPtNteTzWA3dD1fLUXtr9q5J7cNYepSD2yjZYV++heGL5p
 vPVbHt75eq0zvsTFrQ+4DDCGdDCLop4=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-654-DV1Vas-AMoWd6EatHYOJow-1; Thu,
 29 May 2025 22:50:59 -0400
X-MC-Unique: DV1Vas-AMoWd6EatHYOJow-1
X-Mimecast-MFC-AGG-ID: DV1Vas-AMoWd6EatHYOJow_1748573456
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 95546195609F; Fri, 30 May 2025 02:50:56 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 41E581955D88; Fri, 30 May 2025 02:50:52 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 29 May 2025 21:46:15 -0500
Subject: [PATCH v2 13/46] panel/samsung-s6d16d0: Use refcounted allocation
 in place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-13-5d75a3711e40@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748573168; l=1333;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=/IguybTUHkmGHl4lDAwtJQanC4yCGuEFJDQ8Rz/GQX4=;
 b=6S3pdqP8BsjmXVgW7wtwDM+bIYD/KhDrsuHFULHQ+IS7+u94ShbgvDYNCYHQfJrGWSiQpKoya
 hBl3BGSRxq/DzgL051eHfzO7esy6zfZmmXnKVdB+F47lcTOHUATMqtI
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
 drivers/gpu/drm/panel/panel-samsung-s6d16d0.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
index 79f611963c6183218b42c7b6c3e2ab298e3fdb99..ba1a02000bb9def0b4afa8a43e13bc7c3c92a51d 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6d16d0.c
@@ -166,9 +166,11 @@ static int s6d16d0_probe(struct mipi_dsi_device *dsi)
 	struct s6d16d0 *s6;
 	int ret;
 
-	s6 = devm_kzalloc(dev, sizeof(struct s6d16d0), GFP_KERNEL);
-	if (!s6)
-		return -ENOMEM;
+	s6 = devm_drm_panel_alloc(dev, struct s6d16d0, panel,
+				  &s6d16d0_drm_funcs,
+				  DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(s6))
+		return PTR_ERR(s6);
 
 	mipi_dsi_set_drvdata(dsi, s6);
 	s6->dev = dev;
@@ -200,9 +202,6 @@ static int s6d16d0_probe(struct mipi_dsi_device *dsi)
 		return ret;
 	}
 
-	drm_panel_init(&s6->panel, dev, &s6d16d0_drm_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	drm_panel_add(&s6->panel);
 
 	ret = mipi_dsi_attach(dsi);

-- 
2.48.1

