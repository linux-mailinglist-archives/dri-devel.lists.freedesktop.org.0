Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6388CA2B3D8
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 22:09:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 347E710E95D;
	Thu,  6 Feb 2025 21:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="L3+Pn+Gq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC50910E94F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 21:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738876021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GlXo7vmlnmgIEmQ11hFo3VRP0K3oPKPNV0eUfbJIu2g=;
 b=L3+Pn+GqE56BoITiIxCdBRviRvnOn0CN2gHaBxd97h6CSX/p+fIQIW8qhH+ssj8kfJT1rr
 Ud483ThvxxpLOxExB0iEhZQkjgsXWPyc7jqLxWjr0CJbhiI1RbK6hRnP1+LPgqfNgMw3Og
 Hufm51Z1qnjmycoTUlqTqtc5nakYwFo=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-638-EuK3b61WPpy92965OhANRQ-1; Thu,
 06 Feb 2025 16:06:57 -0500
X-MC-Unique: EuK3b61WPpy92965OhANRQ-1
X-Mimecast-MFC-AGG-ID: EuK3b61WPpy92965OhANRQ
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 30CCE1956094; Thu,  6 Feb 2025 21:06:55 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.21])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C984E1800570; Thu,  6 Feb 2025 21:06:51 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 06 Feb 2025 16:06:06 -0500
Subject: [PATCH 11/14] drm/panel/xpp055c272: Move to using
 mipi_dsi_dcs_write_seq_multi()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-mipi-cocci-v1-11-4ff0c69e8897@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738875969; l=7528;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=wbE7uYVtdOIHzOUKy0i3iCZQQ5nZT49/uaoUYL3CwHc=;
 b=jQdUGcnvNdf/4KBe+E8PStHpNm8HebtJ1BK3hKjEtEraBRgTvXju35iVDDc5Wy1r/lbKtbJhR
 2rfDRYLCV2HBX58nUJxpybf81tRMbw1kuCp/4s0N3jf5DE00KUfEohs
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
 drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c | 113 ++++++++++++-----------
 1 file changed, 61 insertions(+), 52 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
index 22a14006765ed23da23da9cb39c637913c4f3090..b676253fdb46cd0ff75ad022e8bc14fae80c7344 100644
--- a/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
+++ b/drivers/gpu/drm/panel/panel-xinpeng-xpp055c272.c
@@ -62,66 +62,75 @@ static inline struct xpp055c272 *panel_to_xpp055c272(struct drm_panel *panel)
 static int xpp055c272_init_sequence(struct xpp055c272 *ctx)
 {
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	struct device *dev = ctx->dev;
 
 	/*
 	 * Init sequence was supplied by the panel vendor without much
 	 * documentation.
 	 */
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETEXTC, 0xf1, 0x12, 0x83);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETMIPI,
-			       0x33, 0x81, 0x05, 0xf9, 0x0e, 0x0e, 0x00, 0x00,
-			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44, 0x25,
-			       0x00, 0x91, 0x0a, 0x00, 0x00, 0x02, 0x4f, 0x01,
-			       0x00, 0x00, 0x37);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETPOWER_EXT, 0x25);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETPCR, 0x02, 0x11, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETRGBIF,
-			       0x0c, 0x10, 0x0a, 0x50, 0x03, 0xff, 0x00, 0x00,
-			       0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETSCR,
-			       0x73, 0x73, 0x50, 0x50, 0x00, 0x00, 0x08, 0x70,
-			       0x00);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETVDC, 0x46);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETPANEL, 0x0b);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETCYC, 0x80);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETDISP, 0xc8, 0x12, 0x30);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETEQ,
-			       0x07, 0x07, 0x0B, 0x0B, 0x03, 0x0B, 0x00, 0x00,
-			       0x00, 0x00, 0xFF, 0x00, 0xC0, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETPOWER,
-			       0x53, 0x00, 0x1e, 0x1e, 0x77, 0xe1, 0xcc, 0xdd,
-			       0x67, 0x77, 0x33, 0x33);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETECO, 0x00, 0x00, 0xff,
-			       0xff, 0x01, 0xff);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETBGP, 0x09, 0x09);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETEXTC, 0xf1,
+				     0x12, 0x83);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETMIPI, 0x33,
+				     0x81, 0x05, 0xf9, 0x0e, 0x0e, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x44,
+				     0x25, 0x00, 0x91, 0x0a, 0x00, 0x00, 0x02,
+				     0x4f, 0x01, 0x00, 0x00, 0x37);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETPOWER_EXT,
+				     0x25);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETPCR, 0x02,
+				     0x11, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETRGBIF, 0x0c,
+				     0x10, 0x0a, 0x50, 0x03, 0xff, 0x00, 0x00,
+				     0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETSCR, 0x73,
+				     0x73, 0x50, 0x50, 0x00, 0x00, 0x08, 0x70,
+				     0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETVDC, 0x46);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETPANEL, 0x0b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETCYC, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETDISP, 0xc8,
+				     0x12, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETEQ, 0x07,
+				     0x07, 0x0B, 0x0B, 0x03, 0x0B, 0x00, 0x00,
+				     0x00, 0x00, 0xFF, 0x00, 0xC0, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETPOWER, 0x53,
+				     0x00, 0x1e, 0x1e, 0x77, 0xe1, 0xcc, 0xdd,
+				     0x67, 0x77, 0x33, 0x33);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETECO, 0x00,
+				     0x00, 0xff, 0xff, 0x01, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETBGP, 0x09,
+				     0x09);
 	msleep(20);
 
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETVCOM, 0x87, 0x95);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETGIP1,
-			       0xc2, 0x10, 0x05, 0x05, 0x10, 0x05, 0xa0, 0x12,
-			       0x31, 0x23, 0x3f, 0x81, 0x0a, 0xa0, 0x37, 0x18,
-			       0x00, 0x80, 0x01, 0x00, 0x00, 0x00, 0x00, 0x80,
-			       0x01, 0x00, 0x00, 0x00, 0x48, 0xf8, 0x86, 0x42,
-			       0x08, 0x88, 0x88, 0x80, 0x88, 0x88, 0x88, 0x58,
-			       0xf8, 0x87, 0x53, 0x18, 0x88, 0x88, 0x81, 0x88,
-			       0x88, 0x88, 0x00, 0x00, 0x00, 0x01, 0x00, 0x00,
-			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETGIP2,
-			       0x00, 0x1a, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00,
-			       0x00, 0x00, 0x00, 0x00, 0x1f, 0x88, 0x81, 0x35,
-			       0x78, 0x88, 0x88, 0x85, 0x88, 0x88, 0x88, 0x0f,
-			       0x88, 0x80, 0x24, 0x68, 0x88, 0x88, 0x84, 0x88,
-			       0x88, 0x88, 0x23, 0x10, 0x00, 0x00, 0x1c, 0x00,
-			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
-			       0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x30, 0x05,
-			       0xa0, 0x00, 0x00, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, XPP055C272_CMD_SETGAMMA,
-			       0x00, 0x06, 0x08, 0x2a, 0x31, 0x3f, 0x38, 0x36,
-			       0x07, 0x0c, 0x0d, 0x11, 0x13, 0x12, 0x13, 0x11,
-			       0x18, 0x00, 0x06, 0x08, 0x2a, 0x31, 0x3f, 0x38,
-			       0x36, 0x07, 0x0c, 0x0d, 0x11, 0x13, 0x12, 0x13,
-			       0x11, 0x18);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETVCOM, 0x87,
+				     0x95);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETGIP1, 0xc2,
+				     0x10, 0x05, 0x05, 0x10, 0x05, 0xa0, 0x12,
+				     0x31, 0x23, 0x3f, 0x81, 0x0a, 0xa0, 0x37,
+				     0x18, 0x00, 0x80, 0x01, 0x00, 0x00, 0x00,
+				     0x00, 0x80, 0x01, 0x00, 0x00, 0x00, 0x48,
+				     0xf8, 0x86, 0x42, 0x08, 0x88, 0x88, 0x80,
+				     0x88, 0x88, 0x88, 0x58, 0xf8, 0x87, 0x53,
+				     0x18, 0x88, 0x88, 0x81, 0x88, 0x88, 0x88,
+				     0x00, 0x00, 0x00, 0x01, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETGIP2, 0x00,
+				     0x1a, 0x00, 0x00, 0x00, 0x00, 0x02, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x1f, 0x88, 0x81,
+				     0x35, 0x78, 0x88, 0x88, 0x85, 0x88, 0x88,
+				     0x88, 0x0f, 0x88, 0x80, 0x24, 0x68, 0x88,
+				     0x88, 0x84, 0x88, 0x88, 0x88, 0x23, 0x10,
+				     0x00, 0x00, 0x1c, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x30, 0x05, 0xa0,
+				     0x00, 0x00, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, XPP055C272_CMD_SETGAMMA, 0x00,
+				     0x06, 0x08, 0x2a, 0x31, 0x3f, 0x38, 0x36,
+				     0x07, 0x0c, 0x0d, 0x11, 0x13, 0x12, 0x13,
+				     0x11, 0x18, 0x00, 0x06, 0x08, 0x2a, 0x31,
+				     0x3f, 0x38, 0x36, 0x07, 0x0c, 0x0d, 0x11,
+				     0x13, 0x12, 0x13, 0x11, 0x18);
 
 	msleep(60);
 

-- 
2.47.0

