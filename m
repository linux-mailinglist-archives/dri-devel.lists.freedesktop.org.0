Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C915DA5A562
	for <lists+dri-devel@lfdr.de>; Mon, 10 Mar 2025 21:58:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3C810E4E1;
	Mon, 10 Mar 2025 20:58:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DvqWb4ma";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B2310E4E1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Mar 2025 20:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1741640320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qPgQv/hP8UqA5nzcqWb76E7oukotngIgYGzn+E1eUYQ=;
 b=DvqWb4maqf5ZZ6nwuys7xEzqrEFZfGlQFPMclBYpsMF0jh0Yf0fIpp6gv/S5RcOWf9bwlT
 i+LJcKSAjgHuIU6z18mnQNnQklBc4jzYbHkHHHD0YmYZFR+60SdJwVC9OUpbQkENETQW0n
 74FmrPMUM+tOKSFU3UDOAl2emZTKLrI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-672-zt7YUAseMROHvPzMeTqI_Q-1; Mon,
 10 Mar 2025 16:58:35 -0400
X-MC-Unique: zt7YUAseMROHvPzMeTqI_Q-1
X-Mimecast-MFC-AGG-ID: zt7YUAseMROHvPzMeTqI_Q_1741640313
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id EA0B11800262; Mon, 10 Mar 2025 20:58:32 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.186])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A14A41800265; Mon, 10 Mar 2025 20:58:29 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Mon, 10 Mar 2025 16:58:22 -0400
Subject: [PATCH v2] drm/panel/synaptics-r63353: Use _multi variants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250310-mipi-synaptic-1-v2-1-20ee4397c670@redhat.com>
X-B4-Tracking: v=1; b=H4sIAG1Sz2cC/3WNywrDIBREfyXcdS0+Yku66n+ULERv6l1Eg4o0B
 P+9NvtuBs7AnDkgYyLM8BgOSFgpUwwd5GUA6014IyPXGSSXmiuu2UobsbwHsxWyTDAj+aj0qKx
 TBvpqS7jQ5zS+5s6ecolpPw+q+LX/XVX0mCQXd+vEhMvtmdB5U642rjC31r6W7DHcrwAAAA==
X-Change-ID: 20250305-mipi-synaptic-1-a2043543cd3a
To: Michael Trimarchi <michael@amarulasolutions.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Tejas Vipin <tejasvipin76@gmail.com>, Doug Anderson <dianders@chromium.org>, 
 Anusha Srivatsa <asrivats@redhat.com>, Maxime Ripard <mripard@kernel.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741640309; l=6301;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=R9wFbiiTelT3DbPRos8B8hIqJ7+qKA8JPSdKic43iXA=;
 b=Z0LyBHcCadKlsxNblzVkG4nF48hqaB1lNBrIJD3WtCouqvogwmK5TOQGmfTJs5sdNqzXH+YGG
 IJIOGPlwIXNBGaVBmNIp8E7IUlELxu2tOwgksr2wikuD3PjSHNcg6s9
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

Used Coccinelle to find the multiple occurences.
SmPl patch:
@rule@
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
-mipi_dsi_dcs_write_seq(dsi_var,es)@p;
+mipi_dsi_dcs_write_seq_multi(&dsi_ctx,es);
|
-mipi_dsi_generic_write_seq(dsi_var,es)@p;
+mipi_dsi_generic_write_seq_multi(&dsi_ctx,es);
|
-mipi_dsi_generic_write(dsi_var,es)@p;
+mipi_dsi_generic_write_multi(&dsi_ctx,es);
|
-r = mipi_dsi_dcs_nop(dsi_var)@p;
+mipi_dsi_dcs_nop_multi(&dsi_ctx);
|
....rest of API
..
)
-if(r < 0) {
-...
-}
...+>

v2: Do not skip the reset in case of error during
panel activate (Dmitry)
- Convert all usleep_range()

Cc: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Tejas Vipin <tejasvipin76@gmail.com>
Cc: Doug Anderson <dianders@chromium.org>
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
Changes in v2:
- Handle the reset case properly 
- Handle msleep() and  usleep_range()

- Link to v1: https://lore.kernel.org/r/20250305-mipi-synaptic-1-v1-1-92017cd19ef6@redhat.com
---
 drivers/gpu/drm/panel/panel-synaptics-r63353.c | 69 ++++++++++----------------
 1 file changed, 27 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-synaptics-r63353.c b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
index 17349825543fe6a117bbfd9cb92a564ce433d13a..991723e5545725ac1de8e1f1968e3eea8254e2b2 100644
--- a/drivers/gpu/drm/panel/panel-synaptics-r63353.c
+++ b/drivers/gpu/drm/panel/panel-synaptics-r63353.c
@@ -70,6 +70,7 @@ static int r63353_panel_power_on(struct r63353_panel *rpanel)
 {
 	struct mipi_dsi_device *dsi = rpanel->dsi;
 	struct device *dev = &dsi->dev;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 	int ret;
 
 	ret = regulator_enable(rpanel->avdd);
@@ -78,7 +79,7 @@ static int r63353_panel_power_on(struct r63353_panel *rpanel)
 		return ret;
 	}
 
-	usleep_range(15000, 25000);
+	mipi_dsi_usleep_range(&dsi_ctx, 15000, 25000);
 
 	ret = regulator_enable(rpanel->dvdd);
 	if (ret) {
@@ -87,9 +88,9 @@ static int r63353_panel_power_on(struct r63353_panel *rpanel)
 		return ret;
 	}
 
-	usleep_range(300000, 350000);
+	mipi_dsi_usleep_range(&dsi_ctx, 300000, 350000);
 	gpiod_set_value(rpanel->reset_gpio, 1);
-	usleep_range(15000, 25000);
+	mipi_dsi_usleep_range(&dsi_ctx, 15000, 25000);
 
 	return 0;
 }
@@ -106,53 +107,46 @@ static int r63353_panel_power_off(struct r63353_panel *rpanel)
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
+	mipi_dsi_dcs_soft_reset_multi(&dsi_ctx);
+	if (dsi_ctx.accum_err)
 		goto fail;
-	}
 
-	usleep_range(15000, 17000);
+	mipi_dsi_usleep_range(&dsi_ctx, 15000, 17000);
 
-	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to enter sleep mode (%d)\n", ret);
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
+	if (dsi_ctx.accum_err)
 		goto fail;
-	}
 
 	for (i = 0; i < rpanel->pdata->init_length; i++) {
 		const struct r63353_instr *instr = &rpanel->pdata->init[i];
 
-		ret = mipi_dsi_dcs_write_buffer(dsi, instr->data, instr->len);
-		if (ret < 0)
+		mipi_dsi_dcs_write_buffer_multi(&dsi_ctx, instr->data,
+						instr->len);
+		if (dsi_ctx.accum_err)
 			goto fail;
 	}
 
-	msleep(120);
+	mipi_dsi_msleep(&dsi_ctx, 120);
 
-	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to exit sleep mode (%d)\n", ret);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
+	if (dsi_ctx.accum_err)
 		goto fail;
-	}
 
-	usleep_range(5000, 10000);
+	mipi_dsi_usleep_range(&dsi_ctx, 5000, 10000);
 
-	ret = mipi_dsi_dcs_set_display_on(dsi);
-	if (ret < 0) {
-		dev_err(dev, "Failed to set display ON (%d)\n", ret);
+	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
+	if (dsi_ctx.accum_err)
 		goto fail;
-	}
 
-	return 0;
+	return dsi_ctx.accum_err;
 
 fail:
 	gpiod_set_value(rpanel->reset_gpio, 0);
 
-	return ret;
+	return dsi_ctx.accum_err;
 }
 
 static int r63353_panel_prepare(struct drm_panel *panel)
@@ -181,24 +175,15 @@ static int r63353_panel_prepare(struct drm_panel *panel)
 static int r63353_panel_deactivate(struct r63353_panel *rpanel)
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
+	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
-	return 0;
+	return dsi_ctx.accum_err;
 }
 
 static int r63353_panel_unprepare(struct drm_panel *panel)

---
base-commit: ced7486468ac3b38d59a69fca5d97998499c936b
change-id: 20250305-mipi-synaptic-1-a2043543cd3a

Best regards,
-- 
Anusha Srivatsa <asrivats@redhat.com>

