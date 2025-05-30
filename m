Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FF0AC8663
	for <lists+dri-devel@lfdr.de>; Fri, 30 May 2025 04:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A246610E22D;
	Fri, 30 May 2025 02:50:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IvVOoEy7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D778110E22D
 for <dri-devel@lists.freedesktop.org>; Fri, 30 May 2025 02:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748573425;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ypacXSqpmyPs7g9z1rgfl6oEdkIYZLcxPVvT43+yJLc=;
 b=IvVOoEy7pO3nf4Mt/ct5SnDT2iieMiQXIDVxUBRc+Zgnyw++gxP0Fp7Lb/R1wRPNwnWvZa
 xpJmXPR30SW6peFTTSjGHqjnsTC/9OUjihj5qw/2KYYiNedZ41EhqSlWmMsfIrwH8z5XdU
 jOy349eqxjnJny3S9vkiIFM2VPgMGLc=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-448-fBW9ht0ePuKi5ZvJPesICw-1; Thu,
 29 May 2025 22:50:20 -0400
X-MC-Unique: fBW9ht0ePuKi5ZvJPesICw-1
X-Mimecast-MFC-AGG-ID: fBW9ht0ePuKi5ZvJPesICw_1748573418
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EA25A1954B17; Fri, 30 May 2025 02:50:17 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.97])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 95FCC1955D88; Fri, 30 May 2025 02:50:13 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 29 May 2025 21:46:07 -0500
Subject: [PATCH v2 05/46] panel/raydium-rm692e5: Use refcounted allocation
 in place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-b4-drm_panel_mass_driver_convert_part3-v2-5-5d75a3711e40@redhat.com>
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
 bh=TYBKi6QZh/NrxqPHYX4bPEptG/ojLS6iQ9Vquw5UTWo=;
 b=/Vlkn8Gz2VyOCiGKeIdUjfIj3oO8JVNPQ1bHKrS1AqZ506ZQwAtURU6nBy8d7dHvuEV5Onksb
 vyPvEVM39ibA/lpz6IgVrXMaEkODcSgRR1Clu3U08cNCNObhyov7TGi
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
 drivers/gpu/drm/panel/panel-raydium-rm692e5.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm692e5.c b/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
index ea1b728e85a2ece226d3df48dbd45a763bc6bd5d..8e9484768657b68a300d42594ab921ee37a5d5a3 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm692e5.c
@@ -281,9 +281,11 @@ static int rm692e5_probe(struct mipi_dsi_device *dsi)
 	struct rm692e5_panel *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct rm692e5_panel, panel,
+				   &rm692e5_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->supplies[0].supply = "vddio";
 	ctx->supplies[1].supply = "dvdd";
@@ -306,8 +308,6 @@ static int rm692e5_probe(struct mipi_dsi_device *dsi)
 	dsi->mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET |
 			  MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
-	drm_panel_init(&ctx->panel, dev, &rm692e5_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
 	ctx->panel.prepare_prev_first = true;
 
 	ctx->panel.backlight = rm692e5_create_backlight(dsi);

-- 
2.48.1

