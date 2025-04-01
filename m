Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DD0A78105
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 19:05:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F1F510E629;
	Tue,  1 Apr 2025 17:05:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FoVk2VOu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09E8E10E11B
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 17:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743527130;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uOUxTLcoOh+ubNQJGUIK0Jf022g1JzkzObL9tNbdE5c=;
 b=FoVk2VOux/apvaeHcmE0Ic4tuhiSyekuTa7qBDGUAiYG8eGuBpYRCeJJHu9ziFByqtqEB8
 GH6nsnRDKDNQDAugb1p868sx59g4hzQfvTDqBkhdlwJVNrNGklhgt3HFmShsXfcpTAvkii
 umn3FbzGgYUsAX0awyse54suXXn4gzc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-381-D4umeVjoPeKvwZlQf97Arw-1; Tue,
 01 Apr 2025 13:05:26 -0400
X-MC-Unique: D4umeVjoPeKvwZlQf97Arw-1
X-Mimecast-MFC-AGG-ID: D4umeVjoPeKvwZlQf97Arw_1743527125
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 08EAE1809CA6; Tue,  1 Apr 2025 17:05:25 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 14DE4180B48C; Tue,  1 Apr 2025 17:05:21 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 01 Apr 2025 12:03:46 -0400
Subject: [PATCH 03/10] panel/z00t-tm5p5-n35596: Use refcounted allocation
 in place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-b4-drm-panel-mass-driver-convert-v1-3-cdd7615e1f93@redhat.com>
References: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
In-Reply-To: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, Joel Selvaraj <jo@jsfamily.in>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743523429; l=1535;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=Yw3L+jHcFHC7CZ76zn/KRCSpyNXGQngVaA7V3jGHGnY=;
 b=DRjTuyF9wKJaN48Te/lswlpRZ6PXWuEua/jn4IEg6ZSd+SRPloSbTJT25q7UE3nmGb6lZz5Mf
 N+r+6HXORP6DSeS5cQYlejsf35HUZLlRqBA+jyrRqUmRa9YtlqMz4qG
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
 drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
index b05a663c134c974df2909e228d6b2e67e39d54c0..db006576d7046b65eb698c64c9ac3c5f7b69b68d 100644
--- a/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
+++ b/drivers/gpu/drm/panel/panel-asus-z00t-tm5p5-n35596.c
@@ -224,9 +224,11 @@ static int tm5p5_nt35596_probe(struct mipi_dsi_device *dsi)
 	struct tm5p5_nt35596 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
-	if (!ctx)
-		return -ENOMEM;
+	ctx = devm_drm_panel_alloc(dev, struct tm5p5_nt35596, panel,
+				   &tm5p5_nt35596_panel_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ctx))
+		return PTR_ERR(ctx);
 
 	ctx->supplies[0].supply = "vdd";
 	ctx->supplies[1].supply = "vddio";
@@ -253,9 +255,6 @@ static int tm5p5_nt35596_probe(struct mipi_dsi_device *dsi)
 			  MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_NO_EOT_PACKET |
 			  MIPI_DSI_CLOCK_NON_CONTINUOUS | MIPI_DSI_MODE_LPM;
 
-	drm_panel_init(&ctx->panel, dev, &tm5p5_nt35596_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ctx->panel.backlight = tm5p5_nt35596_create_backlight(dsi);
 	if (IS_ERR(ctx->panel.backlight)) {
 		ret = PTR_ERR(ctx->panel.backlight);

-- 
2.48.1

