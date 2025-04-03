Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A00C0A7A62A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 17:19:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA0FE10EA2A;
	Thu,  3 Apr 2025 15:19:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="jNGK5Nos";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD4810EA25
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 15:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743693546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fYjOc31IM7Oo07Nfha8yyDynYP8TqXG/V+W+BOFZIns=;
 b=jNGK5NosT57saSdRcPvwkcRPgvz5h1lUZS3KpqWvJ8ut/Fuaf71Wp0WPgDgxOq2AlQez2B
 xgZ1RMTu6MIyapMctKSELMnaJNkIgxcS1tBor1k8syRt0b+RqS3595fhV7FwIgRnMTkqwY
 DQbYXRYqqwODXnzd9iXnAcUpO2ro0gI=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-125-Fy2TZ9fXPqK_HAkB3fhtMw-1; Thu,
 03 Apr 2025 11:19:01 -0400
X-MC-Unique: Fy2TZ9fXPqK_HAkB3fhtMw-1
X-Mimecast-MFC-AGG-ID: Fy2TZ9fXPqK_HAkB3fhtMw_1743693538
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id AC33D1955DDE; Thu,  3 Apr 2025 15:18:58 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A477A1801752; Thu,  3 Apr 2025 15:18:54 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 10:16:23 -0400
Subject: [PATCH v2 16/30] panel/ltk500hd1829: Use refcounted allocation in
 place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_convert_part2-v2-16-260c8a44c56b@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743689775; l=1481;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=dnyvdnxLIV7/Rp0jGtPo/BCXzDHL74RWYO6YqxftI7s=;
 b=iFurR+/Qlz2MHQq2jG6WEm6DU62xK47QhyqCv3apZGjRI/0ZntNr2A+FQQqVtHDEF4g+xX9AV
 BvX5KiX3YSSDQ8Jlx0oRWykoEZt3VPMQp2sKHXJmY49d4Dq1RTC6zf8
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
 drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
index 6b18cf00fd4a7a1d12a3577eced49ad6f9c3e955..7f19fd5b80600c2db3236f2d0e3ee44fd91fe4f9 100644
--- a/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
+++ b/drivers/gpu/drm/panel/panel-leadtek-ltk500hd1829.c
@@ -604,9 +604,11 @@ static int ltk500hd1829_probe(struct mipi_dsi_device *dsi)
 	struct device *dev = &dsi->dev;
 	int ret;
 
-	ctx = devm_kzalloc(&dsi->dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct ltk500hd1829, panel,
+				   &ltk500hd1829_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->panel_desc = of_device_get_match_data(dev);
 	if (!ctx->panel_desc)
@@ -643,9 +645,6 @@ static int ltk500hd1829_probe(struct mipi_dsi_device *dsi)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
 			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
 
-	drm_panel_init(&ctx->panel, &dsi->dev, &ltk500hd1829_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ret = drm_panel_of_backlight(&ctx->panel);
 	if (ret)
 		return ret;

-- 
2.48.1

