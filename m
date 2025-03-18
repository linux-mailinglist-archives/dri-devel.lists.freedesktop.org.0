Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 938F5A67689
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 15:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 776EC10E178;
	Tue, 18 Mar 2025 14:37:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YfTS0kdA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BEDF10E178
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 14:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1742308639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cTtYKvcl39MN/nTt+q1Tyxw/viQFdYgLueQkRaa8pQM=;
 b=YfTS0kdA2FCSZm0SaRaxKzpcquiecy1VaFK8Ay2Zu9D88S23tKdMhyW5b19nomKkXN73fI
 Ok4HnoBTS2YpoqAOy9tKNax5S3QGJQ0UMYjU9vgmtWI6Z+RBMevP3WcUlj9Ahpw5gBg5aA
 sen2RVSdtJhblaaHW16a1trcvK09anQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-502-kQiXLfhUP_eEMjKJ7O7m-A-1; Tue,
 18 Mar 2025 10:37:18 -0400
X-MC-Unique: kQiXLfhUP_eEMjKJ7O7m-A-1
X-Mimecast-MFC-AGG-ID: kQiXLfhUP_eEMjKJ7O7m-A_1742308636
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C7F9C1800263; Tue, 18 Mar 2025 14:37:15 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.186])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id C139D1828A87; Tue, 18 Mar 2025 14:37:12 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 18 Mar 2025 10:37:07 -0400
Subject: [PATCH v4] drm/panel/synaptics-r63353: Use _multi variants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250318-synaptic-expt-v1-1-fa3831a7d883@redhat.com>
X-B4-Tracking: v=1; b=H4sIABKF2WcC/x3MTQqAIBBA4avErBPUin6uEi1Ep5qNiYoY4t2Tl
 t/ivQIBPWGArSvgMVGgxzaIvgN9K3shI9MMksuJD2Jh4bXKRdIMs4tMGbHMq5nVKiW0xnk8Kf+
 /HdIIR60fmnzn52MAAAA=
X-Change-ID: 20250318-synaptic-expt-ad1879d7a922
To: Michael Trimarchi <michael@amarulasolutions.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Tejas Vipin <tejasvipin76@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742308632; l=8377;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=QawqVVeA46NmRIjtJLOS5HnoDTk0+Ss88Ts9PeOkKT8=;
 b=N1XPjjAEd3MAkXo9vcaII8U15X6o9c8ICmm7YQesX7fCdJpA3NByHpoMjnbIN9TJ3ptf18XoG
 0v5OCOgz/VYDhle2gamlKo8cguGbFcXKqROrVaujrp14sFxoRfASDU5
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

Move away from using deprecated API and use _multi
variants if available. Use mipi_dsi_msleep()
and mipi_dsi_usleep_range() instead of msleep()
and usleep_range() respectively.

Used Coccinelle to find the _multi variant APIs,
replacing mpi_dsi_msleep() where necessary and for returning
dsi_ctx.accum_err in these functions. Manually handled the
reset step before returning from r63353_panel_activate()

v2: Do not skip the reset in case of error during
panel activate (Dmitry)
- Convert all usleep_range()

v3: mipi_dsi_usleep_range() is to be used only when in
between _multi commands(Doug)
- Check for error once in the end while using _multi
variants (Doug)

v4: Change return type of r63353_panel_deactivate() to void (Doug)

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

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Tejas Vipin <tejasvipin76@gmail.com>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
Previous attempt for this change was addressed in:[1]
The series did not handle returns properly and still
used msleep() and usleep_range() API.
It also collided with an Tejas's similar efforts.
   
Will be sending the patches per driver instead of
major haul of changes.
    
Following [2] for reference.
    
[1] -> https://patchwork.freedesktop.org/series/144824/
[2] -> https://lore.kernel.org/dri-devel/20250220045721.145905-1-tejasvipin76@gmail.com/#iZ31drivers:gpu:drm:panel:panel-sony-td4353-jdi.c
---
Changes in v4:
- Change return type for r63353_panel_deactivate() from int to void
- Link to v3: https://lore.kernel.org/all/20250314-b4-mipi-synaptic-v1-1-a64ccb5e5c66@redhat.com/
  
Changes in v3:
- Modify the script to handle returns and msleeps ()
- handle reset in case of error properly
   
- Link to v2: https://lore.kernel.org/all/20250310-mipi-synaptic-1-v2-1-20ee4397c670@redhat.com/

Changes in v2:
- Handle the reset case properly
- Handle msleep() and  usleep_range()
  
- Link to v1: https://lore.kernel.org/r/20250305-mipi-synaptic-1-v1-1-92017cd19ef6@redhat.com
---
 drivers/gpu/drm/panel/panel-synaptics-r63353.c | 68 +++++++-------------------
 1 file changed, 19 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-synaptics-r63353.c b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
index 17349825543fe6a117bbfd9cb92a564ce433d13a..b148e6cba9bd1184a8c3e9e264e31536ad78ce28 100644
--- a/drivers/gpu/drm/panel/panel-synaptics-r63353.c
+++ b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
@@ -106,53 +106,34 @@ static int r63353_panel_power_off(struct r63353_panel *rpanel)
 static int r63353_panel_activate(struct r63353_panel *rpanel)
 {
 	struct mipi_dsi_device *dsi = rpanel->dsi;
-	struct device *dev = &dsi->dev;
-	int i, ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
+	int i;
 
-	ret = mipi_dsi_dcs_soft_reset(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to do Software Reset (%d)\n", ret);
-		goto fail;
-	}
+	mipi_dsi_dcs_soft_reset_multi(&dsi_ctx);
 
-	usleep_range(15000, 17000);
+	mipi_dsi_usleep_range(&dsi_ctx, 15000, 17000);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enter sleep mode (%d)\n", ret);
-		goto fail;
-	}
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
 	for (i = 0; i < rpanel->pdata->init_length; i++) {
 		const struct r63353_instr *instr = &rpanel->pdata->init[i];
 
-		ret = mipi_dsi_dcs_write_buffer(dsi, instr->data, instr->len);
-		if (ret < 0)
-			goto fail;
+		mipi_dsi_dcs_write_buffer_multi(&dsi_ctx, instr->data,
+						instr->len);
 	}
 
-	msleep(120);
-
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode (%d)\n", ret);
-		goto fail;
-	}
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
-	usleep_range(5000, 10000);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display ON (%d)\n", ret);
-		goto fail;
-	}
+	mipi_dsi_usleep_range(&dsi_ctx, 5000, 10000);
 
-	return 0;
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
-fail:
-	gpiod_set_value(rpanel->reset_gpio, 0);
+	if (dsi_ctx.accum_err)
+		gpiod_set_value(rpanel->reset_gpio, 0);
 
-	return ret;
+	return dsi_ctx.accum_err;
 }
 
 static int r63353_panel_prepare(struct drm_panel *panel)
@@ -178,27 +159,16 @@ static int r63353_panel_prepare(struct drm_panel *panel)
 	return 0;
 }
 
-static int r63353_panel_deactivate(struct r63353_panel *rpanel)
+static void r63353_panel_deactivate(struct r63353_panel *rpanel)
 {
 	struct mipi_dsi_device *dsi = rpanel->dsi;
-	struct device *dev = &dsi->dev;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	ret = mipi_dsi_dcs_set_display_off(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display OFF (%d)\n", ret);
-		return ret;
-	}
+	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 
-	usleep_range(5000, 10000);
+	mipi_dsi_usleep_range(&dsi_ctx, 5000, 10000);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enter sleep mode (%d)\n", ret);
-		return ret;
-	}
-
-	return 0;
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 }
 
 static int r63353_panel_unprepare(struct drm_panel *panel)

---
base-commit: dbe74119ff71c00f2d863a32f72aab2d15e61c39
change-id: 20250318-synaptic-expt-ad1879d7a922

Best regards,
-- 
Anusha Srivatsa <asrivats@redhat.com>

