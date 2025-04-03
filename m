Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D14A7B0A4
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 23:22:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51B9710EB4E;
	Thu,  3 Apr 2025 21:22:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DlT/3q8s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1507710E11E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 21:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743715341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=noq2DYGvx7oiqda+uEJHX7q+Y5hOzQiTkSW0qrYbikE=;
 b=DlT/3q8sIYoAT1RbDZNk4/HmbQ+dzkaIZVA1HFCAhqbKvam4YAXQZyENoRTUmHHhz8EJzP
 j6Wt5T8G4AbJJdBaZzM24oA+rcIA7vASsvgYlPaQ+KltxBUm7cFoFvoBt96vPwjkbP14/1
 1ToKW6qrWxu9EH7OggCIA9GHH4nLebw=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-206-_xQOTS7AMy29UqNkqXyisA-1; Thu,
 03 Apr 2025 17:22:19 -0400
X-MC-Unique: _xQOTS7AMy29UqNkqXyisA-1
X-Mimecast-MFC-AGG-ID: _xQOTS7AMy29UqNkqXyisA_1743715336
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id B272F195608B; Thu,  3 Apr 2025 21:22:14 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 010F31828A9F; Thu,  3 Apr 2025 21:22:08 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:20:32 -0400
Subject: [PATCH 01/46] panel/orisetech-otm8009a: Use refcounted allocation
 in place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-1-965b15ad5b8e@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1510;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=W8FV7oK0BEWb6RjqsDXxlK65bfxTuzz0WrpEojb85TM=;
 b=eFE9NN5BQ9VhkOcQExgTbccwuUKo9O7DS+AGqPSJuSsmq7PYgSrI+tHkEz15nMgG/kSbfH12W
 U2UFOns18M2DNx6MLK5MYxoB1+mIUybQPUfsOWpIU/2THOIoUFAueXs
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
 drivers/gpu/drm/panel/panel-orisetech-otm8009a.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
index 87bbb25d119a38a0d92bf3eece5c00b4ab38f4a7..a0f58c3b73f693511d146ae191e2e42862336841 100644
--- a/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
+++ b/drivers/gpu/drm/panel/panel-orisetech-otm8009a.c
@@ -424,9 +424,11 @@ static int otm8009a_probe(struct mipi_dsi_device *dsi)
 	struct otm8009a *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct otm8009a, panel,
+				   &otm8009a_drm_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->reset_gpio = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->reset_gpio)) {
@@ -451,9 +453,6 @@ static int otm8009a_probe(struct mipi_dsi_device *dsi)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
 			  MIPI_DSI_MODE_LPM | MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
-	drm_panel_init(&ctx->panel, dev, &otm8009a_drm_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ctx->bl_dev = devm_backlight_device_register(dev, dev_name(dev),
 						     dev, ctx,
 						     &otm8009a_backlight_ops,

-- 
2.48.1

