Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B65E7A2B3D4
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 22:08:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C4F10E94F;
	Thu,  6 Feb 2025 21:08:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iNNmY1Qs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 877D710E94F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 21:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1738876024;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PaarOz2yOuBjngqkqPkX9AOPmxK1sqLgP+dU58InA3M=;
 b=iNNmY1Qs18CG5THya5nPDwQzdne/mPmqjrsQopWDwLB24+rwD73ZouWuHItWdKYnibhYLz
 Sy4fTfzU5KkY9799Xr7geQ3uHwe7wCyKbpwI7k8gDu058/wCbG4kH2fhOJ96Y1r75XHTin
 y18mZ+S+MT6YiGTRjE3ZtpmoFo1uwW0=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-142-ASZSKOo8M4OY7KWX9xTTYw-1; Thu,
 06 Feb 2025 16:07:01 -0500
X-MC-Unique: ASZSKOo8M4OY7KWX9xTTYw-1
X-Mimecast-MFC-AGG-ID: ASZSKOo8M4OY7KWX9xTTYw
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C96BE180087B; Thu,  6 Feb 2025 21:06:58 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.17.21])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 7A81E1800570; Thu,  6 Feb 2025 21:06:55 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 06 Feb 2025 16:06:07 -0500
Subject: [PATCH 12/14] drm/panel/novatek-nt36523: Move to using
 mipi_dsi_dcs_write_seq_multi()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-mipi-cocci-v1-12-4ff0c69e8897@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738875969; l=92657;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=ftPkE/o6HprqSZbEGFsSZ42szYg1ndhIDlARjwRsUD0=;
 b=EhYCPPniaJUzPpPgpsjmk1vFLQKeoadc0FMOQWwEvPg1T3U1yJj+AZ6xYibPyPkFY0b/13i2n
 e3ZjuQBnqyHDKQPeBqC8tyf4yh5h9D9raHWe704NeoLeF1ftg48c/qk
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

While at it, also change mipi_dsi_dual_dcs_write_seq()
accordingly.

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

@rule_3@
expression dsi_var;
expression list es;
identifier jdi;
@@
struct mipi_dsi_device *dsi0 = pinfo->dsi[0];
struct mipi_dsi_device *dsi1 = pinfo->dsi[1];
+struct mipi_dsi_multi_context dsi_ctx0 = { .dsi = dsi0 };
+struct mipi_dsi_multi_context dsi_ctx1 = { .dsi = dsi1 };
<+...
-mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, es);
+mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, es);
...+>

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-novatek-nt36523.c | 1588 +++++++++++++------------
 1 file changed, 818 insertions(+), 770 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36523.c b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
index 04f1d2676c783516574b7dc22d22eea45f5b4fc6..9f9d82acc34f926a194dd741ed88c7bb35e53a11 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36523.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36523.c
@@ -23,10 +23,10 @@
 
 #define DSI_NUM_MIN 1
 
-#define mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, cmd, seq...)        \
+#define mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, cmd, seq...)        \
 		do {                                                 \
-			mipi_dsi_dcs_write_seq(dsi0, cmd, seq);      \
-			mipi_dsi_dcs_write_seq(dsi1, cmd, seq);      \
+			mipi_dsi_dcs_write_seq_multi(&dsi_ctx0, cmd, seq);      \
+			mipi_dsi_dcs_write_seq_multi(&dsi_ctx1, cmd, seq);      \
 		} while (0)
 
 struct panel_info {
@@ -67,218 +67,221 @@ static int elish_boe_init_sequence(struct panel_info *pinfo)
 {
 	struct mipi_dsi_device *dsi0 = pinfo->dsi[0];
 	struct mipi_dsi_device *dsi1 = pinfo->dsi[1];
+	struct mipi_dsi_multi_context dsi_ctx0 = { .dsi = dsi0 };
+	struct mipi_dsi_multi_context dsi_ctx1 = { .dsi = dsi1 };
 	/* No datasheet, so write magic init sequence directly */
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb9, 0x05);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x20);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x18, 0x40);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb9, 0x02);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x23);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x00, 0x80);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x01, 0x84);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x05, 0x2d);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x06, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x07, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x08, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x09, 0x45);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x11, 0x02);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x12, 0x80);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x15, 0x83);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x16, 0x0c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x29, 0x0a);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x30, 0xff);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x31, 0xfe);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x32, 0xfd);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x33, 0xfb);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x34, 0xf8);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x35, 0xf5);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x36, 0xf3);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x37, 0xf2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x38, 0xf2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x39, 0xf2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3a, 0xef);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3b, 0xec);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3d, 0xe9);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3f, 0xe5);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x40, 0xe5);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x41, 0xe5);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2a, 0x13);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x45, 0xff);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x46, 0xf4);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x47, 0xe7);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x48, 0xda);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x49, 0xcd);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4a, 0xc0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4b, 0xb3);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4c, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4d, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4e, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4f, 0x99);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x50, 0x80);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x51, 0x68);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x52, 0x66);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x53, 0x66);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x54, 0x66);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2b, 0x0e);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x58, 0xff);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x59, 0xfb);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5a, 0xf7);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5b, 0xf3);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5c, 0xef);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5d, 0xe3);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5e, 0xda);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5f, 0xd8);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x60, 0xd8);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x61, 0xd8);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x62, 0xcb);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x63, 0xbf);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x64, 0xb3);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x65, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x66, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x67, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x2a);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x25, 0x47);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x30, 0x47);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x39, 0x47);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x26);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x19, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1a, 0xe0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1b, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1c, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2a, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2b, 0xe0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xf0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x84, 0x08);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x85, 0x0c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x20);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x51, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x25);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x91, 0x1f);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x92, 0x0f);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x93, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x94, 0x18);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x95, 0x03);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x96, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb0, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x25);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x19, 0x1f);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1b, 0x1b);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x24);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb8, 0x28);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x27);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd0, 0x31);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd1, 0x20);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd2, 0x30);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd4, 0x08);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xde, 0x80);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xdf, 0x02);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x26);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x00, 0x81);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x01, 0xb0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x22);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9f, 0x50);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x6f, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x70, 0x11);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x73, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x74, 0x49);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x76, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x77, 0x49);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xa0, 0x3f);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xa9, 0x50);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xaa, 0x28);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xab, 0x28);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xad, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb8, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb9, 0x49);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xba, 0x49);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbb, 0x49);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbe, 0x04);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbf, 0x49);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc0, 0x04);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc1, 0x59);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc2, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc5, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc6, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc7, 0x48);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xca, 0x43);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xcb, 0x3c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xce, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xcf, 0x43);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd0, 0x3c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd3, 0x43);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd4, 0x3c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd7, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xdc, 0x43);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xdd, 0x3c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xe1, 0x43);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xe2, 0x3c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xf2, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xf3, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xf4, 0x48);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x25);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x13, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x14, 0x23);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbc, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbd, 0x23);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x2a);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x97, 0x3c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x98, 0x02);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x99, 0x95);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9a, 0x03);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9b, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9c, 0x0b);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9d, 0x0a);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9e, 0x90);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x22);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9f, 0x50);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x23);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xa3, 0x50);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xe0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x14, 0x60);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x16, 0xc0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4f, 0x02);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xf0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3a, 0x08);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xd0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x02, 0xaf);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x09, 0xee);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1c, 0x99);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1d, 0x09);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x51, 0x0f, 0xff);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x53, 0x2c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x35, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbb, 0x13);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3b, 0x03, 0xac, 0x1a, 0x04, 0x04);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x11);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xb9, 0x05);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x20);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x18, 0x40);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xb9, 0x02);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x23);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x00, 0x80);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x01, 0x84);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x05, 0x2d);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x06, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x07, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x08, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x09, 0x45);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x11, 0x02);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x12, 0x80);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x15, 0x83);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x16, 0x0c);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x29, 0x0a);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x30, 0xff);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x31, 0xfe);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x32, 0xfd);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x33, 0xfb);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x34, 0xf8);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x35, 0xf5);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x36, 0xf3);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x37, 0xf2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x38, 0xf2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x39, 0xf2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x3a, 0xef);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x3b, 0xec);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x3d, 0xe9);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x3f, 0xe5);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x40, 0xe5);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x41, 0xe5);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x2a, 0x13);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x45, 0xff);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x46, 0xf4);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x47, 0xe7);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x48, 0xda);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x49, 0xcd);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x4a, 0xc0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x4b, 0xb3);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x4c, 0xb2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x4d, 0xb2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x4e, 0xb2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x4f, 0x99);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x50, 0x80);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x51, 0x68);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x52, 0x66);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x53, 0x66);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x54, 0x66);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x2b, 0x0e);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x58, 0xff);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x59, 0xfb);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x5a, 0xf7);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x5b, 0xf3);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x5c, 0xef);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x5d, 0xe3);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x5e, 0xda);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x5f, 0xd8);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x60, 0xd8);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x61, 0xd8);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x62, 0xcb);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x63, 0xbf);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x64, 0xb3);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x65, 0xb2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x66, 0xb2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x67, 0xb2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x2a);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x25, 0x47);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x30, 0x47);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x39, 0x47);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x26);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x19, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x1a, 0xe0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x1b, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x1c, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x2a, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x2b, 0xe0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0xf0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x84, 0x08);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x85, 0x0c);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x20);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x51, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x25);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x91, 0x1f);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x92, 0x0f);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x93, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x94, 0x18);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x95, 0x03);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x96, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xb0, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x25);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x19, 0x1f);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x1b, 0x1b);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x24);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xb8, 0x28);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x27);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xd0, 0x31);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xd1, 0x20);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xd2, 0x30);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xd4, 0x08);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xde, 0x80);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xdf, 0x02);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x26);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x00, 0x81);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x01, 0xb0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x22);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x9f, 0x50);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x6f, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x70, 0x11);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x73, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x74, 0x49);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x76, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x77, 0x49);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xa0, 0x3f);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xa9, 0x50);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xaa, 0x28);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xab, 0x28);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xad, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xb8, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xb9, 0x49);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xba, 0x49);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xbb, 0x49);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xbe, 0x04);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xbf, 0x49);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xc0, 0x04);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xc1, 0x59);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xc2, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xc5, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xc6, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xc7, 0x48);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xca, 0x43);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xcb, 0x3c);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xce, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xcf, 0x43);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xd0, 0x3c);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xd3, 0x43);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xd4, 0x3c);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xd7, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xdc, 0x43);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xdd, 0x3c);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xe1, 0x43);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xe2, 0x3c);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xf2, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xf3, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xf4, 0x48);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x25);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x13, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x14, 0x23);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xbc, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xbd, 0x23);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x2a);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x97, 0x3c);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x98, 0x02);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x99, 0x95);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x9a, 0x03);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x9b, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x9c, 0x0b);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x9d, 0x0a);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x9e, 0x90);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x22);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x9f, 0x50);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x23);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xa3, 0x50);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0xe0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x14, 0x60);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x16, 0xc0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x4f, 0x02);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0xf0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x3a, 0x08);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0xd0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x02, 0xaf);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x09, 0xee);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x1c, 0x99);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x1d, 0x09);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x51, 0x0f, 0xff);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x53, 0x2c);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x35, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xbb, 0x13);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x3b, 0x03, 0xac,
+				    0x1a, 0x04, 0x04);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x11);
 	msleep(70);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x29);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x29);
 
 	return 0;
 }
@@ -287,196 +290,199 @@ static int elish_csot_init_sequence(struct panel_info *pinfo)
 {
 	struct mipi_dsi_device *dsi0 = pinfo->dsi[0];
 	struct mipi_dsi_device *dsi1 = pinfo->dsi[1];
+	struct mipi_dsi_multi_context dsi_ctx0 = { .dsi = dsi0 };
+	struct mipi_dsi_multi_context dsi_ctx1 = { .dsi = dsi1 };
 	/* No datasheet, so write magic init sequence directly */
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb9, 0x05);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x20);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x18, 0x40);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb9, 0x02);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xd0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x02, 0xaf);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x00, 0x30);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x09, 0xee);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1c, 0x99);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1d, 0x09);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xf0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3a, 0x08);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xe0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4f, 0x02);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x20);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x58, 0x40);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x35, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x23);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x00, 0x80);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x01, 0x84);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x05, 0x2d);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x06, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x07, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x08, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x09, 0x45);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x11, 0x02);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x12, 0x80);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x15, 0x83);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x16, 0x0c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x29, 0x0a);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x30, 0xff);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x31, 0xfe);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x32, 0xfd);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x33, 0xfb);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x34, 0xf8);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x35, 0xf5);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x36, 0xf3);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x37, 0xf2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x38, 0xf2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x39, 0xf2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3a, 0xef);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3b, 0xec);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3d, 0xe9);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3f, 0xe5);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x40, 0xe5);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x41, 0xe5);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2a, 0x13);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x45, 0xff);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x46, 0xf4);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x47, 0xe7);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x48, 0xda);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x49, 0xcd);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4a, 0xc0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4b, 0xb3);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4c, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4d, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4e, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x4f, 0x99);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x50, 0x80);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x51, 0x68);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x52, 0x66);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x53, 0x66);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x54, 0x66);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2b, 0x0e);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x58, 0xff);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x59, 0xfb);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5a, 0xf7);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5b, 0xf3);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5c, 0xef);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5d, 0xe3);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5e, 0xda);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x5f, 0xd8);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x60, 0xd8);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x61, 0xd8);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x62, 0xcb);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x63, 0xbf);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x64, 0xb3);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x65, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x66, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x67, 0xb2);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x51, 0x0f, 0xff);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x53, 0x2c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x55, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbb, 0x13);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x3b, 0x03, 0xac, 0x1a, 0x04, 0x04);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x2a);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x25, 0x46);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x30, 0x46);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x39, 0x46);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x26);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x01, 0xb0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x19, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1a, 0xe0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1b, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1c, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2a, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x2b, 0xe0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0xf0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x84, 0x08);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x85, 0x0c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x20);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x51, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x25);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x91, 0x1f);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x92, 0x0f);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x93, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x94, 0x18);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x95, 0x03);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x96, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb0, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x25);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x19, 0x1f);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x1b, 0x1b);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x24);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb8, 0x28);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x27);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd0, 0x31);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd1, 0x20);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd4, 0x08);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xde, 0x80);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xdf, 0x02);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x26);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x00, 0x81);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x01, 0xb0);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x22);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x6f, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x70, 0x11);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x73, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x74, 0x4d);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xa0, 0x3f);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xa9, 0x50);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xaa, 0x28);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xab, 0x28);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xad, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb8, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xb9, 0x4b);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xba, 0x96);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbb, 0x4b);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbe, 0x07);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbf, 0x4b);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc0, 0x07);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc1, 0x5c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc2, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc5, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc6, 0x3f);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xc7, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xca, 0x08);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xcb, 0x40);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xce, 0x00);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xcf, 0x08);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd0, 0x40);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd3, 0x08);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xd4, 0x40);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x25);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbc, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xbd, 0x1c);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x2a);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xfb, 0x01);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x9a, 0x03);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0xff, 0x10);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x11);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xb9, 0x05);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x20);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x18, 0x40);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xb9, 0x02);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0xd0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x02, 0xaf);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x00, 0x30);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x09, 0xee);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x1c, 0x99);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x1d, 0x09);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0xf0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x3a, 0x08);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0xe0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x4f, 0x02);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x20);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x58, 0x40);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x35, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x23);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x00, 0x80);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x01, 0x84);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x05, 0x2d);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x06, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x07, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x08, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x09, 0x45);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x11, 0x02);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x12, 0x80);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x15, 0x83);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x16, 0x0c);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x29, 0x0a);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x30, 0xff);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x31, 0xfe);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x32, 0xfd);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x33, 0xfb);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x34, 0xf8);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x35, 0xf5);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x36, 0xf3);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x37, 0xf2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x38, 0xf2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x39, 0xf2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x3a, 0xef);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x3b, 0xec);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x3d, 0xe9);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x3f, 0xe5);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x40, 0xe5);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x41, 0xe5);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x2a, 0x13);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x45, 0xff);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x46, 0xf4);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x47, 0xe7);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x48, 0xda);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x49, 0xcd);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x4a, 0xc0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x4b, 0xb3);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x4c, 0xb2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x4d, 0xb2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x4e, 0xb2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x4f, 0x99);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x50, 0x80);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x51, 0x68);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x52, 0x66);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x53, 0x66);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x54, 0x66);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x2b, 0x0e);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x58, 0xff);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x59, 0xfb);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x5a, 0xf7);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x5b, 0xf3);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x5c, 0xef);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x5d, 0xe3);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x5e, 0xda);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x5f, 0xd8);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x60, 0xd8);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x61, 0xd8);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x62, 0xcb);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x63, 0xbf);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x64, 0xb3);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x65, 0xb2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x66, 0xb2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x67, 0xb2);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x51, 0x0f, 0xff);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x53, 0x2c);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x55, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xbb, 0x13);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x3b, 0x03, 0xac,
+				    0x1a, 0x04, 0x04);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x2a);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x25, 0x46);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x30, 0x46);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x39, 0x46);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x26);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x01, 0xb0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x19, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x1a, 0xe0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x1b, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x1c, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x2a, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x2b, 0xe0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0xf0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x84, 0x08);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x85, 0x0c);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x20);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x51, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x25);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x91, 0x1f);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x92, 0x0f);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x93, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x94, 0x18);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x95, 0x03);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x96, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xb0, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x25);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x19, 0x1f);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x1b, 0x1b);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x24);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xb8, 0x28);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x27);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xd0, 0x31);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xd1, 0x20);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xd4, 0x08);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xde, 0x80);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xdf, 0x02);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x26);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x00, 0x81);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x01, 0xb0);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x22);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x6f, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x70, 0x11);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x73, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x74, 0x4d);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xa0, 0x3f);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xa9, 0x50);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xaa, 0x28);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xab, 0x28);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xad, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xb8, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xb9, 0x4b);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xba, 0x96);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xbb, 0x4b);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xbe, 0x07);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xbf, 0x4b);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xc0, 0x07);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xc1, 0x5c);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xc2, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xc5, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xc6, 0x3f);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xc7, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xca, 0x08);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xcb, 0x40);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xce, 0x00);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xcf, 0x08);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xd0, 0x40);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xd3, 0x08);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xd4, 0x40);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x25);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xbc, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xbd, 0x1c);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x2a);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xfb, 0x01);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x9a, 0x03);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0xff, 0x10);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x11);
 	msleep(70);
-	mipi_dsi_dual_dcs_write_seq(dsi0, dsi1, 0x29);
+	mipi_dsi_dual_dcs_write_seq(dsi_ctx0, dsi_ctx1, 0x29);
 
 	return 0;
 }
@@ -484,135 +490,164 @@ static int elish_csot_init_sequence(struct panel_info *pinfo)
 static int j606f_boe_init_sequence(struct panel_info *pinfo)
 {
 	struct mipi_dsi_device *dsi = pinfo->dsi[0];
+	struct mipi_dsi_multi_context dsi_ctx = {
+		.dsi = dsi
+		};
 	struct device *dev = &dsi->dev;
 	int ret;
 
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x20);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x05, 0xd9);
-	mipi_dsi_dcs_write_seq(dsi, 0x07, 0x78);
-	mipi_dsi_dcs_write_seq(dsi, 0x08, 0x5a);
-	mipi_dsi_dcs_write_seq(dsi, 0x0d, 0x63);
-	mipi_dsi_dcs_write_seq(dsi, 0x0e, 0x91);
-	mipi_dsi_dcs_write_seq(dsi, 0x0f, 0x73);
-	mipi_dsi_dcs_write_seq(dsi, 0x95, 0xeb);
-	mipi_dsi_dcs_write_seq(dsi, 0x96, 0xeb);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_ROWS, 0x11);
-	mipi_dsi_dcs_write_seq(dsi, 0x6d, 0x66);
-	mipi_dsi_dcs_write_seq(dsi, 0x75, 0xa2);
-	mipi_dsi_dcs_write_seq(dsi, 0x77, 0xb3);
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00, 0x08, 0x00, 0x23, 0x00, 0x4d, 0x00, 0x6d, 0x00,
-			       0x89, 0x00, 0xa1, 0x00, 0xb6, 0x00, 0xc9);
-	mipi_dsi_dcs_write_seq(dsi, 0xb1, 0x00, 0xda, 0x01, 0x13, 0x01, 0x3c, 0x01, 0x7e, 0x01,
-			       0xab, 0x01, 0xf7, 0x02, 0x2f, 0x02, 0x31);
-	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x02, 0x67, 0x02, 0xa6, 0x02, 0xd1, 0x03, 0x08, 0x03,
-			       0x2e, 0x03, 0x5b, 0x03, 0x6b, 0x03, 0x7b);
-	mipi_dsi_dcs_write_seq(dsi, 0xb3, 0x03, 0x8e, 0x03, 0xa2, 0x03, 0xb7, 0x03, 0xe7, 0x03,
-			       0xfd, 0x03, 0xff);
-	mipi_dsi_dcs_write_seq(dsi, 0xb4, 0x00, 0x08, 0x00, 0x23, 0x00, 0x4d, 0x00, 0x6d, 0x00,
-			       0x89, 0x00, 0xa1, 0x00, 0xb6, 0x00, 0xc9);
-	mipi_dsi_dcs_write_seq(dsi, 0xb5, 0x00, 0xda, 0x01, 0x13, 0x01, 0x3c, 0x01, 0x7e, 0x01,
-			       0xab, 0x01, 0xf7, 0x02, 0x2f, 0x02, 0x31);
-	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x02, 0x67, 0x02, 0xa6, 0x02, 0xd1, 0x03, 0x08, 0x03,
-			       0x2e, 0x03, 0x5b, 0x03, 0x6b, 0x03, 0x7b);
-	mipi_dsi_dcs_write_seq(dsi, 0xb7, 0x03, 0x8e, 0x03, 0xa2, 0x03, 0xb7, 0x03, 0xe7, 0x03,
-			       0xfd, 0x03, 0xff);
-	mipi_dsi_dcs_write_seq(dsi, 0xb8, 0x00, 0x08, 0x00, 0x23, 0x00, 0x4d, 0x00, 0x6d, 0x00,
-			       0x89, 0x00, 0xa1, 0x00, 0xb6, 0x00, 0xc9);
-	mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x00, 0xda, 0x01, 0x13, 0x01, 0x3c, 0x01, 0x7e, 0x01,
-			       0xab, 0x01, 0xf7, 0x02, 0x2f, 0x02, 0x31);
-	mipi_dsi_dcs_write_seq(dsi, 0xba, 0x02, 0x67, 0x02, 0xa6, 0x02, 0xd1, 0x03, 0x08, 0x03,
-			       0x2e, 0x03, 0x5b, 0x03, 0x6b, 0x03, 0x7b);
-	mipi_dsi_dcs_write_seq(dsi, 0xbb, 0x03, 0x8e, 0x03, 0xa2, 0x03, 0xb7, 0x03, 0xe7, 0x03,
-			       0xfd, 0x03, 0xff);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x21);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x45, 0x00, 0x65, 0x00,
-			       0x81, 0x00, 0x99, 0x00, 0xae, 0x00, 0xc1);
-	mipi_dsi_dcs_write_seq(dsi, 0xb1, 0x00, 0xd2, 0x01, 0x0b, 0x01, 0x34, 0x01, 0x76, 0x01,
-			       0xa3, 0x01, 0xef, 0x02, 0x27, 0x02, 0x29);
-	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x02, 0x5f, 0x02, 0x9e, 0x02, 0xc9, 0x03, 0x00, 0x03,
-			       0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73);
-	mipi_dsi_dcs_write_seq(dsi, 0xb3, 0x03, 0x86, 0x03, 0x9a, 0x03, 0xaf, 0x03, 0xdf, 0x03,
-			       0xf5, 0x03, 0xf7);
-	mipi_dsi_dcs_write_seq(dsi, 0xb4, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x45, 0x00, 0x65, 0x00,
-			       0x81, 0x00, 0x99, 0x00, 0xae, 0x00, 0xc1);
-	mipi_dsi_dcs_write_seq(dsi, 0xb5, 0x00, 0xd2, 0x01, 0x0b, 0x01, 0x34, 0x01, 0x76, 0x01,
-			       0xa3, 0x01, 0xef, 0x02, 0x27, 0x02, 0x29);
-	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x02, 0x5f, 0x02, 0x9e, 0x02, 0xc9, 0x03, 0x00, 0x03,
-			       0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73);
-	mipi_dsi_dcs_write_seq(dsi, 0xb7, 0x03, 0x86, 0x03, 0x9a, 0x03, 0xaf, 0x03, 0xdf, 0x03,
-			       0xf5, 0x03, 0xf7);
-	mipi_dsi_dcs_write_seq(dsi, 0xb8, 0x00, 0x00, 0x00, 0x1b, 0x00, 0x45, 0x00, 0x65, 0x00,
-			       0x81, 0x00, 0x99, 0x00, 0xae, 0x00, 0xc1);
-	mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x00, 0xd2, 0x01, 0x0b, 0x01, 0x34, 0x01, 0x76, 0x01,
-			       0xa3, 0x01, 0xef, 0x02, 0x27, 0x02, 0x29);
-	mipi_dsi_dcs_write_seq(dsi, 0xba, 0x02, 0x5f, 0x02, 0x9e, 0x02, 0xc9, 0x03, 0x00, 0x03,
-			       0x26, 0x03, 0x53, 0x03, 0x63, 0x03, 0x73);
-	mipi_dsi_dcs_write_seq(dsi, 0xbb, 0x03, 0x86, 0x03, 0x9a, 0x03, 0xaf, 0x03, 0xdf, 0x03,
-			       0xf5, 0x03, 0xf7);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x23);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x00, 0x80);
-	mipi_dsi_dcs_write_seq(dsi, 0x07, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x11, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x12, 0x77);
-	mipi_dsi_dcs_write_seq(dsi, 0x15, 0x07);
-	mipi_dsi_dcs_write_seq(dsi, 0x16, 0x07);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x24);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x01, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x02, 0x1c);
-	mipi_dsi_dcs_write_seq(dsi, 0x03, 0x1c);
-	mipi_dsi_dcs_write_seq(dsi, 0x04, 0x1d);
-	mipi_dsi_dcs_write_seq(dsi, 0x05, 0x1d);
-	mipi_dsi_dcs_write_seq(dsi, 0x06, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x07, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x08, 0x0f);
-	mipi_dsi_dcs_write_seq(dsi, 0x09, 0x0f);
-	mipi_dsi_dcs_write_seq(dsi, 0x0a, 0x0e);
-	mipi_dsi_dcs_write_seq(dsi, 0x0b, 0x0e);
-	mipi_dsi_dcs_write_seq(dsi, 0x0c, 0x0d);
-	mipi_dsi_dcs_write_seq(dsi, 0x0d, 0x0d);
-	mipi_dsi_dcs_write_seq(dsi, 0x0e, 0x0c);
-	mipi_dsi_dcs_write_seq(dsi, 0x0f, 0x0c);
-	mipi_dsi_dcs_write_seq(dsi, 0x10, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0x11, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0x12, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x13, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x14, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x15, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x16, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x17, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x18, 0x1c);
-	mipi_dsi_dcs_write_seq(dsi, 0x19, 0x1c);
-	mipi_dsi_dcs_write_seq(dsi, 0x1a, 0x1d);
-	mipi_dsi_dcs_write_seq(dsi, 0x1b, 0x1d);
-	mipi_dsi_dcs_write_seq(dsi, 0x1c, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x1d, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x1e, 0x0f);
-	mipi_dsi_dcs_write_seq(dsi, 0x1f, 0x0f);
-	mipi_dsi_dcs_write_seq(dsi, 0x20, 0x0e);
-	mipi_dsi_dcs_write_seq(dsi, 0x21, 0x0e);
-	mipi_dsi_dcs_write_seq(dsi, 0x22, 0x0d);
-	mipi_dsi_dcs_write_seq(dsi, 0x23, 0x0d);
-	mipi_dsi_dcs_write_seq(dsi, 0x24, 0x0c);
-	mipi_dsi_dcs_write_seq(dsi, 0x25, 0x0c);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_GAMMA_CURVE, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0x27, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0x28, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x29, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x2a, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x2b, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_LUT, 0x20);
-	mipi_dsi_dcs_write_seq(dsi, 0x2f, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_ROWS, 0x44);
-	mipi_dsi_dcs_write_seq(dsi, 0x33, 0x0c);
-	mipi_dsi_dcs_write_seq(dsi, 0x34, 0x32);
-	mipi_dsi_dcs_write_seq(dsi, 0x37, 0x44);
-	mipi_dsi_dcs_write_seq(dsi, 0x38, 0x40);
-	mipi_dsi_dcs_write_seq(dsi, 0x39, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0xd9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x5a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x63);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x91);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x95, 0xeb);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x96, 0xeb);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_PARTIAL_ROWS,
+				     0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6d, 0x66);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x75, 0xa2);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x77, 0xb3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x00, 0x08, 0x00, 0x23,
+				     0x00, 0x4d, 0x00, 0x6d, 0x00, 0x89, 0x00,
+				     0xa1, 0x00, 0xb6, 0x00, 0xc9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb1, 0x00, 0xda, 0x01, 0x13,
+				     0x01, 0x3c, 0x01, 0x7e, 0x01, 0xab, 0x01,
+				     0xf7, 0x02, 0x2f, 0x02, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x02, 0x67, 0x02, 0xa6,
+				     0x02, 0xd1, 0x03, 0x08, 0x03, 0x2e, 0x03,
+				     0x5b, 0x03, 0x6b, 0x03, 0x7b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb3, 0x03, 0x8e, 0x03, 0xa2,
+				     0x03, 0xb7, 0x03, 0xe7, 0x03, 0xfd, 0x03,
+				     0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb4, 0x00, 0x08, 0x00, 0x23,
+				     0x00, 0x4d, 0x00, 0x6d, 0x00, 0x89, 0x00,
+				     0xa1, 0x00, 0xb6, 0x00, 0xc9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb5, 0x00, 0xda, 0x01, 0x13,
+				     0x01, 0x3c, 0x01, 0x7e, 0x01, 0xab, 0x01,
+				     0xf7, 0x02, 0x2f, 0x02, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6, 0x02, 0x67, 0x02, 0xa6,
+				     0x02, 0xd1, 0x03, 0x08, 0x03, 0x2e, 0x03,
+				     0x5b, 0x03, 0x6b, 0x03, 0x7b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb7, 0x03, 0x8e, 0x03, 0xa2,
+				     0x03, 0xb7, 0x03, 0xe7, 0x03, 0xfd, 0x03,
+				     0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb8, 0x00, 0x08, 0x00, 0x23,
+				     0x00, 0x4d, 0x00, 0x6d, 0x00, 0x89, 0x00,
+				     0xa1, 0x00, 0xb6, 0x00, 0xc9);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb9, 0x00, 0xda, 0x01, 0x13,
+				     0x01, 0x3c, 0x01, 0x7e, 0x01, 0xab, 0x01,
+				     0xf7, 0x02, 0x2f, 0x02, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba, 0x02, 0x67, 0x02, 0xa6,
+				     0x02, 0xd1, 0x03, 0x08, 0x03, 0x2e, 0x03,
+				     0x5b, 0x03, 0x6b, 0x03, 0x7b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbb, 0x03, 0x8e, 0x03, 0xa2,
+				     0x03, 0xb7, 0x03, 0xe7, 0x03, 0xfd, 0x03,
+				     0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x21);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x00, 0x00, 0x00, 0x1b,
+				     0x00, 0x45, 0x00, 0x65, 0x00, 0x81, 0x00,
+				     0x99, 0x00, 0xae, 0x00, 0xc1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb1, 0x00, 0xd2, 0x01, 0x0b,
+				     0x01, 0x34, 0x01, 0x76, 0x01, 0xa3, 0x01,
+				     0xef, 0x02, 0x27, 0x02, 0x29);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb2, 0x02, 0x5f, 0x02, 0x9e,
+				     0x02, 0xc9, 0x03, 0x00, 0x03, 0x26, 0x03,
+				     0x53, 0x03, 0x63, 0x03, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb3, 0x03, 0x86, 0x03, 0x9a,
+				     0x03, 0xaf, 0x03, 0xdf, 0x03, 0xf5, 0x03,
+				     0xf7);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb4, 0x00, 0x00, 0x00, 0x1b,
+				     0x00, 0x45, 0x00, 0x65, 0x00, 0x81, 0x00,
+				     0x99, 0x00, 0xae, 0x00, 0xc1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb5, 0x00, 0xd2, 0x01, 0x0b,
+				     0x01, 0x34, 0x01, 0x76, 0x01, 0xa3, 0x01,
+				     0xef, 0x02, 0x27, 0x02, 0x29);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6, 0x02, 0x5f, 0x02, 0x9e,
+				     0x02, 0xc9, 0x03, 0x00, 0x03, 0x26, 0x03,
+				     0x53, 0x03, 0x63, 0x03, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb7, 0x03, 0x86, 0x03, 0x9a,
+				     0x03, 0xaf, 0x03, 0xdf, 0x03, 0xf5, 0x03,
+				     0xf7);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb8, 0x00, 0x00, 0x00, 0x1b,
+				     0x00, 0x45, 0x00, 0x65, 0x00, 0x81, 0x00,
+				     0x99, 0x00, 0xae, 0x00, 0xc1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb9, 0x00, 0xd2, 0x01, 0x0b,
+				     0x01, 0x34, 0x01, 0x76, 0x01, 0xa3, 0x01,
+				     0xef, 0x02, 0x27, 0x02, 0x29);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xba, 0x02, 0x5f, 0x02, 0x9e,
+				     0x02, 0xc9, 0x03, 0x00, 0x03, 0x26, 0x03,
+				     0x53, 0x03, 0x63, 0x03, 0x73);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbb, 0x03, 0x86, 0x03, 0x9a,
+				     0x03, 0xaf, 0x03, 0xdf, 0x03, 0xf5, 0x03,
+				     0xf7);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x23);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x77);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x01, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x03, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x1d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x1d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x07, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x08, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x09, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0b, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x0d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x0d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0e, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x10, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x13, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x1d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x1d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x0f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x21, 0x0e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x0d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x0d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_GAMMA_CURVE, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_LUT, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_PARTIAL_ROWS,
+				     0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0x32);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x37, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x38, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x00);
 
 	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x9a);
 	if (ret < 0) {
@@ -620,16 +655,16 @@ static int j606f_boe_init_sequence(struct panel_info *pinfo)
 		return ret;
 	}
 
-	mipi_dsi_dcs_write_seq(dsi, 0x3b, 0xa0);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_3D_CONTROL, 0x42);
-	mipi_dsi_dcs_write_seq(dsi, 0x3f, 0x06);
-	mipi_dsi_dcs_write_seq(dsi, 0x43, 0x06);
-	mipi_dsi_dcs_write_seq(dsi, 0x47, 0x66);
-	mipi_dsi_dcs_write_seq(dsi, 0x4a, 0x9a);
-	mipi_dsi_dcs_write_seq(dsi, 0x4b, 0xa0);
-	mipi_dsi_dcs_write_seq(dsi, 0x4c, 0x91);
-	mipi_dsi_dcs_write_seq(dsi, 0x4d, 0x21);
-	mipi_dsi_dcs_write_seq(dsi, 0x4e, 0x43);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_3D_CONTROL, 0x42);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x43, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x47, 0x66);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4a, 0x9a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4b, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4c, 0x91);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4d, 0x21);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4e, 0x43);
 
 	ret = mipi_dsi_dcs_set_display_brightness(dsi, 18);
 	if (ret < 0) {
@@ -637,114 +672,120 @@ static int j606f_boe_init_sequence(struct panel_info *pinfo)
 		return ret;
 	}
 
-	mipi_dsi_dcs_write_seq(dsi, 0x52, 0x34);
-	mipi_dsi_dcs_write_seq(dsi, 0x55, 0x82, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, 0x56, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x58, 0x21);
-	mipi_dsi_dcs_write_seq(dsi, 0x59, 0x30);
-	mipi_dsi_dcs_write_seq(dsi, 0x5a, 0xba);
-	mipi_dsi_dcs_write_seq(dsi, 0x5b, 0xa0);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0x00, 0x06);
-	mipi_dsi_dcs_write_seq(dsi, 0x5f, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x65, 0x82);
-	mipi_dsi_dcs_write_seq(dsi, 0x7e, 0x20);
-	mipi_dsi_dcs_write_seq(dsi, 0x7f, 0x3c);
-	mipi_dsi_dcs_write_seq(dsi, 0x82, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0x97, 0xc0);
-	mipi_dsi_dcs_write_seq(dsi, 0xb6,
-			       0x05, 0x00, 0x05, 0x00, 0x00, 0x00, 0x00, 0x00, 0x05,
-			       0x05, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x92, 0xc4);
-	mipi_dsi_dcs_write_seq(dsi, 0x93, 0x1a);
-	mipi_dsi_dcs_write_seq(dsi, 0x94, 0x5f);
-	mipi_dsi_dcs_write_seq(dsi, 0xd7, 0x55);
-	mipi_dsi_dcs_write_seq(dsi, 0xda, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, 0xde, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0xdb, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xdc, 0xc4);
-	mipi_dsi_dcs_write_seq(dsi, 0xdd, 0x22);
-	mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xe0, 0xc4);
-	mipi_dsi_dcs_write_seq(dsi, 0xe1, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xe2, 0xc4);
-	mipi_dsi_dcs_write_seq(dsi, 0xe3, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xe4, 0xc4);
-	mipi_dsi_dcs_write_seq(dsi, 0xe5, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xe6, 0xc4);
-	mipi_dsi_dcs_write_seq(dsi, 0x5c, 0x88);
-	mipi_dsi_dcs_write_seq(dsi, 0x5d, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0x8d, 0x88);
-	mipi_dsi_dcs_write_seq(dsi, 0x8e, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0xb5, 0x90);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x25);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x05, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x19, 0x07);
-	mipi_dsi_dcs_write_seq(dsi, 0x1f, 0xba);
-	mipi_dsi_dcs_write_seq(dsi, 0x20, 0xa0);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_GAMMA_CURVE, 0xba);
-	mipi_dsi_dcs_write_seq(dsi, 0x27, 0xa0);
-	mipi_dsi_dcs_write_seq(dsi, 0x33, 0xba);
-	mipi_dsi_dcs_write_seq(dsi, 0x34, 0xa0);
-	mipi_dsi_dcs_write_seq(dsi, 0x3f, 0xe0);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_VSYNC_TIMING, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x44, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_GET_SCANLINE, 0x40);
-	mipi_dsi_dcs_write_seq(dsi, 0x48, 0xba);
-	mipi_dsi_dcs_write_seq(dsi, 0x49, 0xa0);
-	mipi_dsi_dcs_write_seq(dsi, 0x5b, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x5c, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x5d, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0xd0);
-	mipi_dsi_dcs_write_seq(dsi, 0x61, 0xba);
-	mipi_dsi_dcs_write_seq(dsi, 0x62, 0xa0);
-	mipi_dsi_dcs_write_seq(dsi, 0xf1, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x2a);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x64, 0x16);
-	mipi_dsi_dcs_write_seq(dsi, 0x67, 0x16);
-	mipi_dsi_dcs_write_seq(dsi, 0x6a, 0x16);
-	mipi_dsi_dcs_write_seq(dsi, 0x70, 0x30);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_READ_PPS_START, 0xf3);
-	mipi_dsi_dcs_write_seq(dsi, 0xa3, 0xff);
-	mipi_dsi_dcs_write_seq(dsi, 0xa4, 0xff);
-	mipi_dsi_dcs_write_seq(dsi, 0xa5, 0xff);
-	mipi_dsi_dcs_write_seq(dsi, 0xd6, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x26);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x00, 0xa1);
-	mipi_dsi_dcs_write_seq(dsi, 0x0a, 0xf2);
-	mipi_dsi_dcs_write_seq(dsi, 0x04, 0x28);
-	mipi_dsi_dcs_write_seq(dsi, 0x06, 0x30);
-	mipi_dsi_dcs_write_seq(dsi, 0x0c, 0x13);
-	mipi_dsi_dcs_write_seq(dsi, 0x0d, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, 0x0f, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, 0x11, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x12, 0x50);
-	mipi_dsi_dcs_write_seq(dsi, 0x13, 0x51);
-	mipi_dsi_dcs_write_seq(dsi, 0x14, 0x65);
-	mipi_dsi_dcs_write_seq(dsi, 0x15, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x16, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, 0x17, 0xa0);
-	mipi_dsi_dcs_write_seq(dsi, 0x18, 0x86);
-	mipi_dsi_dcs_write_seq(dsi, 0x19, 0x11);
-	mipi_dsi_dcs_write_seq(dsi, 0x1a, 0x7b);
-	mipi_dsi_dcs_write_seq(dsi, 0x1b, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, 0x1c, 0xbb);
-	mipi_dsi_dcs_write_seq(dsi, 0x22, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x23, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x2a, 0x11);
-	mipi_dsi_dcs_write_seq(dsi, 0x2b, 0x7b);
-	mipi_dsi_dcs_write_seq(dsi, 0x1d, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x1e, 0xc3);
-	mipi_dsi_dcs_write_seq(dsi, 0x1f, 0xc3);
-	mipi_dsi_dcs_write_seq(dsi, 0x24, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x25, 0xc3);
-	mipi_dsi_dcs_write_seq(dsi, 0x2f, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_ROWS, 0xc3);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_COLUMNS, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x32, 0xc3);
-	mipi_dsi_dcs_write_seq(dsi, 0x39, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x52, 0x34);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x55, 0x82, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x21);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0xba);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx,
+				     MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0x00,
+				     0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x82);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7e, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x7f, 0x3c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x82, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x97, 0xc0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6, 0x05, 0x00, 0x05, 0x00,
+				     0x00, 0x00, 0x00, 0x00, 0x05, 0x05, 0x00,
+				     0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x92, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x93, 0x1a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x94, 0x5f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd7, 0x55);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xda, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xde, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdb, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdc, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdd, 0x22);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdf, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe2, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe3, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe4, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe5, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6, 0xc4);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x8d, 0x88);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x8e, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb5, 0x90);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x05, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x07);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0xba);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_GAMMA_CURVE, 0xba);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0xba);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3f, 0xe0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_VSYNC_TIMING,
+				     0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x44, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_GET_SCANLINE, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x48, 0xba);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x49, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx,
+				     MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0xd0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0xba);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf1, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x6a, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x70, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_READ_PPS_START, 0xf3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xa3, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xa4, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xa5, 0xff);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd6, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x26);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0xa1);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0a, 0xf2);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x04, 0x28);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x06, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0c, 0x13);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0d, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x0f, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x11, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x12, 0x50);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x13, 0x51);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x65);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x15, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x17, 0xa0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x86);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x7b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0xbb);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x7b);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0xc3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0xc3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0xc3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2f, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_PARTIAL_ROWS,
+				     0xc3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_PARTIAL_COLUMNS,
+				     0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x32, 0xc3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x39, 0x00);
 
 	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0xc3);
 	if (ret < 0) {
@@ -752,60 +793,62 @@ static int j606f_boe_init_sequence(struct panel_info *pinfo)
 		return ret;
 	}
 
-	mipi_dsi_dcs_write_seq(dsi, 0x20, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x33, 0x11);
-	mipi_dsi_dcs_write_seq(dsi, 0x34, 0x78);
-	mipi_dsi_dcs_write_seq(dsi, 0x35, 0x16);
-	mipi_dsi_dcs_write_seq(dsi, 0xc8, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0xc9, 0x82);
-	mipi_dsi_dcs_write_seq(dsi, 0xca, 0x4e);
-	mipi_dsi_dcs_write_seq(dsi, 0xcb, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_READ_PPS_CONTINUE, 0x4c);
-	mipi_dsi_dcs_write_seq(dsi, 0xaa, 0x47);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x27);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x56, 0x06);
-	mipi_dsi_dcs_write_seq(dsi, 0x58, 0x80);
-	mipi_dsi_dcs_write_seq(dsi, 0x59, 0x53);
-	mipi_dsi_dcs_write_seq(dsi, 0x5a, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x5b, 0x14);
-	mipi_dsi_dcs_write_seq(dsi, 0x5c, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x5d, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0x20);
-	mipi_dsi_dcs_write_seq(dsi, 0x5f, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, 0x60, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x61, 0x1d);
-	mipi_dsi_dcs_write_seq(dsi, 0x62, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x63, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x64, 0x24);
-	mipi_dsi_dcs_write_seq(dsi, 0x65, 0x1c);
-	mipi_dsi_dcs_write_seq(dsi, 0x66, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x67, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x68, 0x25);
-	mipi_dsi_dcs_write_seq(dsi, 0x00, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x78, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xc3, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xd1, 0x24);
-	mipi_dsi_dcs_write_seq(dsi, 0xd2, 0x30);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x2a);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x22, 0x2f);
-	mipi_dsi_dcs_write_seq(dsi, 0x23, 0x08);
-	mipi_dsi_dcs_write_seq(dsi, 0x24, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x25, 0xc3);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_GAMMA_CURVE, 0xf8);
-	mipi_dsi_dcs_write_seq(dsi, 0x27, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x28, 0x1a);
-	mipi_dsi_dcs_write_seq(dsi, 0x29, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x2a, 0x1a);
-	mipi_dsi_dcs_write_seq(dsi, 0x2b, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_LUT, 0x1a);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0xe0);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x14, 0x60);
-	mipi_dsi_dcs_write_seq(dsi, 0x16, 0xc0);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0xf0);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0x11);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0x78);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x35, 0x16);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc8, 0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc9, 0x82);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xca, 0x4e);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xcb, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_READ_PPS_CONTINUE,
+				     0x4c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xaa, 0x47);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x27);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x56, 0x06);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x58, 0x80);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x59, 0x53);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x14);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx,
+				     MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5f, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x60, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x1d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x63, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x64, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x65, 0x1c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x66, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x67, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x00, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x78, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xc3, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd1, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xd2, 0x30);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x22, 0x2f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x23, 0x08);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x24, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0xc3);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_GAMMA_CURVE, 0xf8);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x28, 0x1a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x29, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x1a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_LUT, 0x1a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xe0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x14, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x16, 0xc0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0xf0);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
 
 	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x08);
 	if (ret < 0) {
@@ -813,8 +856,8 @@ static int j606f_boe_init_sequence(struct panel_info *pinfo)
 		return ret;
 	}
 
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x24);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x24);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
 
 	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x5d);
 	if (ret < 0) {
@@ -822,56 +865,58 @@ static int j606f_boe_init_sequence(struct panel_info *pinfo)
 		return ret;
 	}
 
-	mipi_dsi_dcs_write_seq(dsi, 0x3b, 0x60);
-	mipi_dsi_dcs_write_seq(dsi, 0x4a, 0x5d);
-	mipi_dsi_dcs_write_seq(dsi, 0x4b, 0x60);
-	mipi_dsi_dcs_write_seq(dsi, 0x5a, 0x70);
-	mipi_dsi_dcs_write_seq(dsi, 0x5b, 0x60);
-	mipi_dsi_dcs_write_seq(dsi, 0x91, 0x44);
-	mipi_dsi_dcs_write_seq(dsi, 0x92, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, 0xdb, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xdc, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, 0xdd, 0x22);
-	mipi_dsi_dcs_write_seq(dsi, 0xdf, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xe0, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, 0xe1, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xe2, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, 0xe3, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xe4, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, 0xe5, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0xe6, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, 0x5c, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x5d, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x8d, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x8e, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x25);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x1f, 0x70);
-	mipi_dsi_dcs_write_seq(dsi, 0x20, 0x60);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_GAMMA_CURVE, 0x70);
-	mipi_dsi_dcs_write_seq(dsi, 0x27, 0x60);
-	mipi_dsi_dcs_write_seq(dsi, 0x33, 0x70);
-	mipi_dsi_dcs_write_seq(dsi, 0x34, 0x60);
-	mipi_dsi_dcs_write_seq(dsi, 0x48, 0x70);
-	mipi_dsi_dcs_write_seq(dsi, 0x49, 0x60);
-	mipi_dsi_dcs_write_seq(dsi, 0x5b, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x61, 0x70);
-	mipi_dsi_dcs_write_seq(dsi, 0x62, 0x60);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x26);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x02, 0x31);
-	mipi_dsi_dcs_write_seq(dsi, 0x19, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, 0x1a, 0x7f);
-	mipi_dsi_dcs_write_seq(dsi, 0x1b, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, 0x1c, 0x0c);
-	mipi_dsi_dcs_write_seq(dsi, 0x2a, 0x0a);
-	mipi_dsi_dcs_write_seq(dsi, 0x2b, 0x7f);
-	mipi_dsi_dcs_write_seq(dsi, 0x1e, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, 0x1f, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, 0x25, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_ROWS, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_PARTIAL_COLUMNS, 0x05);
-	mipi_dsi_dcs_write_seq(dsi, 0x32, 0x8d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4a, 0x5d);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x4b, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5a, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x91, 0x44);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x92, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdb, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdc, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdd, 0x22);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xdf, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe0, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe1, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe2, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe3, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe4, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe5, 0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xe6, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5c, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x8d, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x8e, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x25);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x20, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_GAMMA_CURVE, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x27, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x33, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x34, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x48, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x49, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x5b, 0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x61, 0x70);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x62, 0x60);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x26);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x02, 0x31);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x19, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1a, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1b, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1c, 0x0c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2a, 0x0a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x2b, 0x7f);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1e, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x1f, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_PARTIAL_ROWS,
+				     0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_SET_PARTIAL_COLUMNS,
+				     0x05);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x32, 0x8d);
 
 	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x75);
 	if (ret < 0) {
@@ -879,18 +924,18 @@ static int j606f_boe_init_sequence(struct panel_info *pinfo)
 		return ret;
 	}
 
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x2a);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x25, 0x75);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x20);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0x18, 0x40);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x10);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
-	mipi_dsi_dcs_write_seq(dsi, 0xb9, 0x02);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x2a);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x25, 0x75);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb9, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x20);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x18, 0x40);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb9, 0x02);
 
 	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
 	if (ret < 0) {
@@ -898,11 +943,12 @@ static int j606f_boe_init_sequence(struct panel_info *pinfo)
 		return ret;
 	}
 
-	mipi_dsi_dcs_write_seq(dsi, 0xbb, 0x13);
-	mipi_dsi_dcs_write_seq(dsi, 0x3b, 0x03, 0x5f, 0x1a, 0x04, 0x04);
-	mipi_dsi_dcs_write_seq(dsi, 0xff, 0x10);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xbb, 0x13);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x3b, 0x03, 0x5f, 0x1a, 0x04,
+				     0x04);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xff, 0x10);
 	usleep_range(10000, 11000);
-	mipi_dsi_dcs_write_seq(dsi, 0xfb, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xfb, 0x01);
 
 	ret = mipi_dsi_dcs_set_display_brightness(dsi, 0);
 	if (ret < 0) {
@@ -910,9 +956,11 @@ static int j606f_boe_init_sequence(struct panel_info *pinfo)
 		return ret;
 	}
 
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x2c);
-	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
-	mipi_dsi_dcs_write_seq(dsi, 0x68, 0x05, 0x01);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY,
+				     0x2c);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE,
+				     0x00);
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0x68, 0x05, 0x01);
 
 	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
 	if (ret < 0) {

-- 
2.47.0

