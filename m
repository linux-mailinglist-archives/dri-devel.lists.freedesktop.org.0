Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A59A6E46F
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 21:31:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C14B110E35D;
	Mon, 24 Mar 2025 20:31:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dpNovw7n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF3C110E35D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 20:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742848294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZQXmgId17NqYCkpehAEWbLxxoEzCTxEfhH9JTo1Iqec=;
 b=dpNovw7nMzknkKXkfXWoFENtpX205BMFsoVOa3iEtXEZuWJkevC1LJN2X3NXUyyaFBss0a
 LdvdP+yGsr7SvuOaI7L6aE9vr+oMuDunMsxiFxzYAzPzflO6sQBuKnKpM4bV+Jr6yDptqE
 owjBA1tq84uxObd+U9UP+pIVWnlAtmk=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-453-amJBmTcROwiT9Mml3HLBNg-1; Mon,
 24 Mar 2025 16:31:31 -0400
X-MC-Unique: amJBmTcROwiT9Mml3HLBNg-1
X-Mimecast-MFC-AGG-ID: amJBmTcROwiT9Mml3HLBNg_1742848290
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CE8F6180035E; Mon, 24 Mar 2025 20:31:29 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.186])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 199841801751; Mon, 24 Mar 2025 20:31:26 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Mon, 24 Mar 2025 16:30:37 -0400
Subject: [PATCH v2] drm/panel/sharp-ls043t1le01: Use _multi variants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250324-b4-panel-ls043t1le01-v2-1-e43aedc115be@redhat.com>
X-B4-Tracking: v=1; b=H4sIAOzA4WcC/4WNQQ6CMBBFr0Jm7ZgZWimy8h6GRQujNEEgLSEa0
 rtbuYDL95L//g5RgpcITbFDkM1HP08ZylMB3WCnp6DvM0NJ5YUUV+g0LnaSEcdIWq08CjEaTcb
 V18oZW0OeLkEe/n1k723mwcd1Dp/jZeOf/RPcGBlFVK0MO3KWbkH6wa7nbn5Bm1L6AgRcV8S5A
 AAA
X-Change-ID: 20250316-b4-panel-ls043t1le01-7407b896b7a8
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Tejas Vipin <tejasvipin76@gmail.com>, Doug Anderson <dianders@chromium.org>, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742848286; l=6641;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=I82bUt36akakw4PeQklNb36F8Ps/rlHeJ3heFaGcDjU=;
 b=fcDDMRzNlmFph1VXbdy/ZDXkyV06cXVvrulvazHEghoyO9h46evlSoM3vW23rkTAUNf4wl6dz
 WAb8g7bjdUKDq6eo5S+H5EqQQbW7FvrXK+1FFCT0Wlm2RE/HJWiNQCP
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

Move away from using deprecated API and use _multi
variants if available. Use mipi_dsi_msleep()
and mipi_dsi_usleep_range() instead of msleep()
and usleep_range() respectively.

Used Coccinelle to find the _multi variant APIs,
replacing mpi_dsi_msleep() where necessary and for returning
dsi_ctx.accum_err in these functions. mipi_dsi_dcs_write()
does not have a corresponding _multi() variant. Replacing it with
mipi_dsi_dcs_write_buffer_multi() instead. This change is manual

@rule_1@
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
-r = mipi_dsi_dcs_nop(dsi_var)@p;
+mipi_dsi_dcs_nop_multi(&dsi_ctx);
|
-r = mipi_dsi_dcs_exit_sleep_mode(dsi_var)@p;
+mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
|
-r = mipi_dsi_dcs_enter_sleep_mode(dsi_var)@p;
+mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
|
-r = mipi_dsi_dcs_write_buffer(dsi_var,es)@p;
+mipi_dsi_dcs_write_buffer_multi(&dsi_ctx,es);
|
-r = mipi_dsi_dcs_set_display_off(dsi_var,es)@p;
+mipi_dsi_dcs_set_display_off_multi(&dsi_ctx,es);
|
-r = mipi_dsi_compression_mode_ext(dsi_var,es)@p;
+mipi_dsi_compression_mode_ext_multi(&dsi_ctx,es);
|
-r = mipi_dsi_compression_mode(dsi_var,es)@p;
+mipi_dsi_compression_mode_multi(&dsi_ctx,es);
|
-r = mipi_dsi_picture_parameter_set(dsi_var,es)@p;
+mipi_dsi_picture_parameter_set_multi(&dsi_ctx,es);
|
-r = mipi_dsi_dcs_set_display_on(dsi_var,es)@p;
+mipi_dsi_dcs_set_display_on_multi(&dsi_ctx,es);
|
-r = mipi_dsi_dcs_set_tear_on(dsi_var)@p;
+mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx);
|
-r = mipi_dsi_turn_on_peripheral(dsi_var)@p;
+mipi_dsi_turn_on_peripheral_multi(&dsi_ctx);
|
-r = mipi_dsi_dcs_soft_reset(dsi_var)@p;
+mipi_dsi_dcs_soft_reset_multi(&dsi_ctx);
|
-r = mipi_dsi_dcs_set_display_brightness(dsi_var,es)@p;
+mipi_dsi_dcs_set_display_brightness_multi(&dsi_ctx,es);
|
-r = mipi_dsi_dcs_set_pixel_format(dsi_var,es)@p;
+mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx,es);
|
-r = mipi_dsi_dcs_set_column_address(dsi_var,es)@p;
+mipi_dsi_dcs_set_column_address_multi(&dsi_ctx,es);
|
-r = mipi_dsi_dcs_set_page_address(dsi_var,es)@p;
+mipi_dsi_dcs_set_page_address_multi(&dsi_ctx,es);
|
-r = mipi_dsi_dcs_set_tear_scanline(dsi_var,es)@p;
+mipi_dsi_dcs_set_tear_scanline_multi(&dsi_ctx,es);
)
-if(r < 0) {
-...
-}
...+>
}

@rule_2@
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
struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi_var };
<+...
(
-r = msleep(es)@p;
+r = mipi_dsi_msleep(&dsi_ctx,es);
|
-msleep(es)@p;
+mipi_dsi_msleep(&dsi_ctx,es);
|
-r = usleep_range(es)@p;
+r = mipi_dsi_usleep_range(&dsi_ctx,es);
|
-usleep_range(es)@p;
+mipi_dsi_usleep_range(&dsi_ctx,es);
)
...+>
}

@rule_3@
identifier dsi_var;
identifier func;
type t;
position p;
expression list es;
@@
t func(...) {
...
struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi_var };
...
-return 0;
+return dsi_ctx.accum_err;
}

v2: Use mipi_dsi_dcs_write_buffer_multi() in place of
mipi_dsi_dcs_write(). (Dmitry)

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Tejas Vipin <tejasvipin76@gmail.com>
Cc: Doug Anderson <dianders@chromium.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
Changes in v2:
- While mipi_dsi_dcs_write() does not have a corresponding _multi()
  variant replace it with mipi_dsi_dcs_write_buffer_multi() to have all
  APIs following _multi() usage for easier error handling

- Link to v1: https://lore.kernel.org/r/20250316-b4-panel-ls043t1le01-v1-1-ee38371b0ba0@redhat.com
---
 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c | 42 ++++++++++---------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
index 729cbb0d8403ff7c0c4b9d21774909cc298904a2..e3dc99ff711e388660d6d39251876de8cec50dbc 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
@@ -36,60 +36,50 @@ static inline struct sharp_nt_panel *to_sharp_nt_panel(struct drm_panel *panel)
 static int sharp_nt_panel_init(struct sharp_nt_panel *sharp_nt)
 {
 	struct mipi_dsi_device *dsi = sharp_nt->dsi;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
+	static const u8 d[] = { 0xae,  0x03 };
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0)
-		return ret;
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 
-	msleep(120);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
 	/* Novatek two-lane operation */
-	ret = mipi_dsi_dcs_write(dsi, 0xae, (u8[]){ 0x03 }, 1);
-	if (ret < 0)
-		return ret;
+	mipi_dsi_dcs_write_buffer_multi(&dsi_ctx, d, ARRAY_SIZE(d));
 
 	/* Set both MCU and RGB I/F to 24bpp */
-	ret = mipi_dsi_dcs_set_pixel_format(dsi, MIPI_DCS_PIXEL_FMT_24BIT |
-					(MIPI_DCS_PIXEL_FMT_24BIT << 4));
-	if (ret < 0)
-		return ret;
+	mipi_dsi_dcs_set_pixel_format_multi(&dsi_ctx,
+					    MIPI_DCS_PIXEL_FMT_24BIT |
+					    (MIPI_DCS_PIXEL_FMT_24BIT << 4));
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int sharp_nt_panel_on(struct sharp_nt_panel *sharp_nt)
 {
 	struct mipi_dsi_device *dsi = sharp_nt->dsi;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0)
-		return ret;
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int sharp_nt_panel_off(struct sharp_nt_panel *sharp_nt)
 {
 	struct mipi_dsi_device *dsi = sharp_nt->dsi;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
 	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0)
-		return ret;
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0)
-		return ret;
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int sharp_nt_panel_unprepare(struct drm_panel *panel)

---
base-commit: dbe74119ff71c00f2d863a32f72aab2d15e61c39
change-id: 20250316-b4-panel-ls043t1le01-7407b896b7a8

Best regards,
-- 
Anusha Srivatsa <asrivats@redhat.com>

