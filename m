Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D456AA2B3DE
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 22:09:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9B010E964;
	Thu,  6 Feb 2025 21:08:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="bpCJhxOM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9BA10E94F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 21:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738876016;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YQoTigHQbJ4dwxfyMraLqszMcvvsitMtJlyCloWmRnA=;
 b=bpCJhxOMlBtqTqp8OabpTw1wpKLszX9vrzS0gC/SzEkNaq5qP8AK9f94xLsvRsJ4BiXsQw
 QgoqdT+3ibYPOhViPvDeGgxBSq1tRV+oQAu0cXnT0od8I0iwArvIwD3aMCu05SfPCQqQve
 MtMYWl41brxB4k3IkFfpNzPoWp8DgPw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-607-k167-e6hOXOtfJodOr5g-g-1; Thu,
 06 Feb 2025 16:06:53 -0500
X-MC-Unique: k167-e6hOXOtfJodOr5g-g-1
X-Mimecast-MFC-AGG-ID: k167-e6hOXOtfJodOr5g-g
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7DC931800570; Thu,  6 Feb 2025 21:06:51 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.21])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 780401800115; Thu,  6 Feb 2025 21:06:48 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 06 Feb 2025 16:06:05 -0500
Subject: [PATCH 10/14] drm/panel/visionox-r66451: Move to using
 mipi_dsi_dcs_write_seq_multi()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-mipi-cocci-v1-10-4ff0c69e8897@redhat.com>
References: <20250206-mipi-cocci-v1-0-4ff0c69e8897@redhat.com>
In-Reply-To: <20250206-mipi-cocci-v1-0-4ff0c69e8897@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Joel Selvaraj <jo@jsfamily.in>, Ondrej Jirman <megi@xff.cz>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Artur Weber <aweber.kernel@gmail.com>, Jianhua Lu <lujianhua000@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738875969; l=7735;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=rcOYFwPQfRAU3APR4rkecMHa1pO4ou4ZbBf2oyKESIE=;
 b=MmkBMjrJLfMjU8/wLsKce4/Wu4NTom9lY/7/LH5o4cOdJB715yEiqxROo7IENzbBP9JkRQplk
 Rtw7VotWtLeA2rEpI0p/Nvv/OZV8JIuexLK9Zb/s34QzfnwlPtpptHo
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

Use mipi_dsi_dcs_write_seq_multi() instead of
mipi_dsi_dcs_write_seq()

Used Coccinelle to do this change. SmPl patch:
@rule_1@
identifier dsi_var;
expression dsi_device;
expression list es;
@@
struct mipi_dsi_device *dsi_var = dsi_device;
+struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi_var };
<+...
-mipi_dsi_dcs_write_seq(dsi_var,es);
+mipi_dsi_dcs_write_seq_multi(&dsi_ctx,es);
...+>

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-visionox-r66451.c | 118 ++++++++++++++------------
 1 file changed, 62 insertions(+), 56 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-visionox-r66451.c b/drivers/gpu/drm/panel/panel-visionox-r66451.c
index 493f2a6076f8d878606e0644b100bc98f275dc12..0194c63f5482d1a816b0d3b4e0152c328f8e056b 100644
--- a/drivers/gpu/drm/panel/panel-visionox-r66451.c
+++ b/drivers/gpu/drm/panel/panel-visionox-r66451.c
@@ -42,65 +42,71 @@ static void visionox_r66451_reset(struct visionox_r66451 *ctx)
 static int visionox_r66451_on(struct visionox_r66451 *ctx)
 {
 	struct mipi_dsi_device *dsi = ctx->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xc2,
-			       0x09, 0x24, 0x0c, 0x00, 0x00, 0x0c, 0x00, 0x00, 0x00,
-			       0x09, 0x3c);
-	mipi_dsi_dcs_write_seq(dsi, 0xd7,
-			       0x00, 0xb9, 0x3c, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a,
-			       0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19,
-			       0x3c, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x80);
-	mipi_dsi_dcs_write_seq(dsi, 0xde,
-			       0x40, 0x00, 0x18, 0x00, 0x18, 0x00, 0x18, 0x00, 0x18,
-			       0x10, 0x00, 0x18, 0x00, 0x18, 0x00, 0x18, 0x02, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0xe8, 0x00, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, 0xe4, 0x00, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xc4,
-			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-			       0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x32);
-	mipi_dsi_dcs_write_seq(dsi, 0xcf,
-			       0x64, 0x0b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x08,
-			       0x00, 0x0b, 0x77, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
-			       0x02, 0x02, 0x02, 0x02, 0x02, 0x03);
-	mipi_dsi_dcs_write_seq(dsi, 0xd3,
-			       0x45, 0x00, 0x00, 0x01, 0x13, 0x15, 0x00, 0x15, 0x07,
-			       0x0f, 0x77, 0x77, 0x77, 0x37, 0xb2, 0x11, 0x00, 0xa0,
-			       0x3c, 0x9c);
-	mipi_dsi_dcs_write_seq(dsi, 0xd7,
-			       0x00, 0xb9, 0x34, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a,
-			       0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19,
-			       0x34, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, 0xd8,
-			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-			       0x3a, 0x00, 0x3a, 0x00, 0x3a, 0x00, 0x3a, 0x00, 0x3a,
-			       0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-			       0x00, 0x0a, 0x00, 0x0a, 0x00, 0x00, 0x00, 0x00, 0x00,
-			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0a,
-			       0x00, 0x32, 0x00, 0x0a, 0x00, 0x22);
-	mipi_dsi_dcs_write_seq(dsi, 0xdf,
-			       0x50, 0x42, 0x58, 0x81, 0x2d, 0x00, 0x00, 0x00, 0x00,
-			       0x00, 0x00, 0x6b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-			       0x00, 0x00, 0x01, 0x0f, 0xff, 0xd4, 0x0e, 0x00, 0x00,
-			       0x00, 0x00, 0x00, 0x00, 0x0f, 0x53, 0xf1, 0x00, 0x00,
-			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xf7, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x80);
-	mipi_dsi_dcs_write_seq(dsi, 0xe4, 0x34, 0xb4, 0x00, 0x00, 0x00, 0x39, 0x04, 0x09, 0x34);
-	mipi_dsi_dcs_write_seq(dsi, 0xe6, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x50, 0x40);
-	mipi_dsi_dcs_write_seq(dsi, 0xf3, 0x50, 0x00, 0x00, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x11);
-	mipi_dsi_dcs_write_seq(dsi, 0xf3, 0x01, 0x00, 0x00, 0x00, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xf4, 0x00, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, 0xf2, 0x19);
-	mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x50, 0x42);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc2, 0x09, 0x24, 0x0c, 0x00,
+				     0x00, 0x0c, 0x00, 0x00, 0x00, 0x09, 0x3c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd7, 0x00, 0xb9, 0x3c, 0x00,
+				     0x40, 0x04, 0x00, 0xa0, 0x0a, 0x00, 0x40,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19,
+				     0x3c, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xde, 0x40, 0x00, 0x18, 0x00,
+				     0x18, 0x00, 0x18, 0x00, 0x18, 0x10, 0x00,
+				     0x18, 0x00, 0x18, 0x00, 0x18, 0x02, 0x00,
+				     0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe8, 0x00, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe4, 0x00, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc4, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x02, 0x00, 0x00, 0x00, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcf, 0x64, 0x0b, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x08, 0x00, 0x0b,
+				     0x77, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01,
+				     0x02, 0x02, 0x02, 0x02, 0x02, 0x03);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd3, 0x45, 0x00, 0x00, 0x01,
+				     0x13, 0x15, 0x00, 0x15, 0x07, 0x0f, 0x77,
+				     0x77, 0x77, 0x37, 0xb2, 0x11, 0x00, 0xa0,
+				     0x3c, 0x9c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd7, 0x00, 0xb9, 0x34, 0x00,
+				     0x40, 0x04, 0x00, 0xa0, 0x0a, 0x00, 0x40,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x19,
+				     0x34, 0x00, 0x40, 0x04, 0x00, 0xa0, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd8, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x3a, 0x00,
+				     0x3a, 0x00, 0x3a, 0x00, 0x3a, 0x00, 0x3a,
+				     0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x0a, 0x00, 0x0a, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x0a, 0x00,
+				     0x32, 0x00, 0x0a, 0x00, 0x22);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdf, 0x50, 0x42, 0x58, 0x81,
+				     0x2d, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x6b, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x01, 0x0f, 0xff, 0xd4, 0x0e,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x0f,
+				     0x53, 0xf1, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf7, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe4, 0x34, 0xb4, 0x00, 0x00,
+				     0x00, 0x39, 0x04, 0x09, 0x34);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdf, 0x50, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0x50, 0x00, 0x00, 0x00,
+				     0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf3, 0x01, 0x00, 0x00, 0x00,
+				     0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf4, 0x00, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf2, 0x19);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdf, 0x50, 0x42);
 	mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
 	mipi_dsi_dcs_set_column_address(dsi, 0, 1080 - 1);
 	mipi_dsi_dcs_set_page_address(dsi, 0, 2340 - 1);

-- 
2.47.0

