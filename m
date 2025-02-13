Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D883A34FAE
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 21:45:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE22B10E121;
	Thu, 13 Feb 2025 20:45:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="evDnn8e8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D44510EB93
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 20:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1739479509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GTmB/dfMlzAgl1U49z+Y0Y51wk1y8f5umbl38jx8Z08=;
 b=evDnn8e8vqVVY9q1RCaqXqOdDez/xbyjYusitjGLxiMI+wDpVnxIAPRp+BpASOsm7boJIQ
 MPZJElpv2GoSOcu+KnDZMxwAQXa+zb9jQ6aHljHfLuqJFACRBFHyJMVwThQnBcnPmi5uaK
 5290QM1n3Z0KzjWbCJH9W4tFg3LEhAI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-308-hhO3B1rtO-yklqqekuKyVQ-1; Thu,
 13 Feb 2025 15:45:05 -0500
X-MC-Unique: hhO3B1rtO-yklqqekuKyVQ-1
X-Mimecast-MFC-AGG-ID: hhO3B1rtO-yklqqekuKyVQ_1739479503
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E27CB19783B7; Thu, 13 Feb 2025 20:45:02 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.199])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 33F96190C541; Thu, 13 Feb 2025 20:44:59 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 13 Feb 2025 15:44:22 -0500
Subject: [PATCH 05/20] drm/panel/dsi-cm: Move to using mipi_dsi_*_multi()
 variants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250213-mipi_cocci_multi-v1-5-67d94ff319cc@redhat.com>
References: <20250213-mipi_cocci_multi-v1-0-67d94ff319cc@redhat.com>
In-Reply-To: <20250213-mipi_cocci_multi-v1-0-67d94ff319cc@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Joel Selvaraj <jo@jsfamily.in>, Ondrej Jirman <megi@xff.cz>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Jianhua Lu <lujianhua000@gmail.com>, Robert Chiras <robert.chiras@nxp.com>, 
 Artur Weber <aweber.kernel@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739479476; l=4345;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=aA7Krnx3RiN3avBA3Jg0kKYn1dXJln9r4d3VrVV6xLc=;
 b=1tq4wKhGy1R2eFNZiMlpZdHVpuQ2ABeZo2e3T3EDUMqzNMvN8GJbSL82pk94WYz6XZZEO+p71
 826wO5WgYb1BMtMZgmdVE0b6PJ7ANAShVVOfXs11Krm6od6MAS963gr
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
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

Stop using deprecated API.
Used Coccinelle to make the change.

@rule_3@
identifier dsi_var;
identifier r;
identifier func;
type t;
position p;
expression dsi_device;
expression list es;
@@
t func(...) {
...
struct mipi_dsi_device *dsi_var = dsi_device;
+struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi_var };
<+...
(
-mipi_dsi_dcs_write_seq(dsi_var,es);
+mipi_dsi_dcs_write_seq_multi(&dsi_ctx,es);
|
-r = mipi_dsi_dcs_exit_sleep_mode(dsi_var)@p;
+mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
|
-r = mipi_dsi_dcs_enter_sleep_mode(dsi_var)@p;
+mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
|
-r = mipi_dsi_dcs_set_display_off(dsi_var)@p;
+mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
|
.....//rest of the mipi APIs with _multi variant
)
<+...
-if(r < 0) {
-...
-}
...+>
}

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-dsi-cm.c | 44 +++++++++++++++---------------------
 1 file changed, 18 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
index 6b3f4d664d2ade668525660394cf81924436492e..420a2c017354584ae75ce43fe5c5def528f1883e 100644
--- a/drivers/gpu/drm/panel/panel-dsi-cm.c
+++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
@@ -115,18 +115,18 @@ static int dsicm_dcs_read_1(struct panel_drv_data *ddata, u8 dcs_cmd, u8 *data)
 static int dsicm_dcs_write_1(struct panel_drv_data *ddata, u8 dcs_cmd, u8 param)
 {
 	return mipi_dsi_dcs_write(ddata->dsi, dcs_cmd, &param, 1);
+
 }
 
 static int dsicm_sleep_in(struct panel_drv_data *ddata)
 
 {
-	int r;
+	struct mipi_dsi_device *dsi = ddata->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	hw_guard_wait(ddata);
 
-	r = mipi_dsi_dcs_enter_sleep_mode(ddata->dsi);
-	if (r)
-		return r;
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
 	hw_guard_start(ddata, 120);
 
@@ -137,13 +137,12 @@ static int dsicm_sleep_in(struct panel_drv_data *ddata)
 
 static int dsicm_sleep_out(struct panel_drv_data *ddata)
 {
-	int r;
+	struct mipi_dsi_device *dsi = ddata->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	hw_guard_wait(ddata);
 
-	r = mipi_dsi_dcs_exit_sleep_mode(ddata->dsi);
-	if (r)
-		return r;
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 
 	hw_guard_start(ddata, 120);
 
@@ -172,15 +171,12 @@ static int dsicm_get_id(struct panel_drv_data *ddata, u8 *id1, u8 *id2, u8 *id3)
 static int dsicm_set_update_window(struct panel_drv_data *ddata)
 {
 	struct mipi_dsi_device *dsi = ddata->dsi;
-	int r;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	r = mipi_dsi_dcs_set_column_address(dsi, 0, ddata->mode.hdisplay - 1);
-	if (r < 0)
-		return r;
+	mipi_dsi_dcs_set_column_address_multi(&dsi_ctx, 0,
+					      ddata->mode.hdisplay - 1);
 
-	r = mipi_dsi_dcs_set_page_address(dsi, 0, ddata->mode.vdisplay - 1);
-	if (r < 0)
-		return r;
+	mipi_dsi_dcs_set_page_address_multi(&dsi_ctx, 0, ddata->mode.vdisplay - 1);
 
 	return 0;
 }
@@ -282,6 +278,8 @@ static void dsicm_hw_reset(struct panel_drv_data *ddata)
 
 static int dsicm_power_on(struct panel_drv_data *ddata)
 {
+	struct mipi_dsi_device *dsi = ddata->dsi;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	u8 id1, id2, id3;
 	int r;
 
@@ -306,23 +304,16 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
 	if (r)
 		goto err;
 
-	r = mipi_dsi_dcs_set_pixel_format(ddata->dsi, MIPI_DCS_PIXEL_FMT_24BIT);
-	if (r)
-		goto err;
+	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx, MIPI_DCS_PIXEL_FMT_24BIT);
 
 	r = dsicm_set_update_window(ddata);
 	if (r)
 		goto err;
 
-	r = mipi_dsi_dcs_set_display_on(ddata->dsi);
-	if (r)
-		goto err;
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
-	if (ddata->panel_data->te_support) {
-		r = mipi_dsi_dcs_set_tear_on(ddata->dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
-		if (r)
-			goto err;
-	}
+	if (ddata->panel_data->te_support)
+		mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
 
 	/* possible panel bug */
 	msleep(100);
@@ -353,6 +344,7 @@ static int dsicm_power_off(struct panel_drv_data *ddata)
 	ddata->enabled = false;
 
 	r = mipi_dsi_dcs_set_display_off(ddata->dsi);
+
 	if (!r)
 		r = dsicm_sleep_in(ddata);
 

-- 
2.47.0

