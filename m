Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F80DA7293D
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 04:29:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80BF310E25A;
	Thu, 27 Mar 2025 03:29:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="gJnaUlOA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D807410E25A
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 03:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743046179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=J9sUT1zQdr1iMuWoTj8QMxB+/sZm9ihq4uBH2+5b2TE=;
 b=gJnaUlOAkG3cfvaTQXxcY6OiRtx4qIc6VOEOdVu3U7Bj9oNv+ys6R/hajsa3PpeZbmuORa
 wJok1rYo2rXzJED01cOc4mYZrhuR8CR+MjARqerZorsDja8SZBLJK2LNNJxVoDJMwpkbI+
 xrMTZKf1ZFPPpRZ2c8rdeVSkl7SFG6A=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-47-45nOt47TNtmeIWXDDguQ2A-1; Wed,
 26 Mar 2025 23:29:36 -0400
X-MC-Unique: 45nOt47TNtmeIWXDDguQ2A-1
X-Mimecast-MFC-AGG-ID: 45nOt47TNtmeIWXDDguQ2A_1743046174
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id E24651933B41; Thu, 27 Mar 2025 03:29:33 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 3ABB21955D81; Thu, 27 Mar 2025 03:29:31 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 26 Mar 2025 23:29:19 -0400
Subject: [PATCH v3] drm/panel/sharp-ls043t1le01: Use _multi variants
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250326-b4-panel-ls043t1le01-v3-1-96c554c0ea2b@redhat.com>
X-B4-Tracking: v=1; b=H4sIAA/G5GcC/4XNQQ6CMBCF4auYWVsz0xaKrryHcdHCKE0QSEsaD
 eHuFla6MC7/l8w3M0QOniOcdjMETj76oc+h9juoW9vfWfgmN0iUBSoqhdNitD13oouo1UQdIwm
 j0bjqWDpjK8inY+Cbf27s5Zq79XEawmv7kmhd/4CJBAlmVSlDDp3Fc+CmtdOhHh6wikl+KFL/U
 OSqaGW5qYkKx1/KsixvAGo0xf8AAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743046170; l=4481;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=isa6qrKp6OPmRzz5C8NkyzpBQvVFL2TwIeOhL9jVN80=;
 b=OuYZqDlYqE8+XsoAIM29FpuOuCuGcst+JkYc/QqT8T7i3hdYc/6nY3+++Pz5PmaB5dZ12Z1Pe
 nEjzZ7J5VkCBp7LzLwQmNuOimB3juf1ocptXcECjAdEcxmP7wUcJtTo
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

Move away from using deprecated API and use _multi variants
if available. Use mipi_dsi_msleep() and mipi_dsi_usleep_range()
instead of msleep() and usleep_range() respectively.

Used Coccinelle to find the _multi variant APIs,replacing
mpi_dsi_msleep() where necessary and for returning
dsi_ctx.accum_err in these functions. mipi_dsi_dcs_write()
does not have a corresponding _multi() variant. Replacing it with
mipi_dsi_dcs_write_seq_multi() instead. This change is manual.

The Coccinelle script is the same as the one in commit c8ba07caaecc
("drm/panel/synaptics-r63353: Use _multi variants")

v2: Use mipi_dsi_write_buffer_multi() in place of
mipi_dsi_dcs_write(). (Dmitry)

v3: add commit details where the same coccinelle script is
used and remove the actual script from commit log.
Use mipi_dsi_dcs_write_seq_multi() for mipi_dsi_dcs_write() (Doug)

Cc: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Tejas Vipin <tejasvipin76@gmail.com>
Cc: Doug Anderson <dianders@chromium.org>
Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
Changes in v3:
- Simplify commit log by adding a reference to a patch that uses the
  same script.
- Simplify code by using a helper that doesnt need additional code
  changes other then using the helper itself.

- Link to v2: https://lore.kernel.org/r/20250324-b4-panel-ls043t1le01-v2-1-e43aedc115be@redhat.com

Changes in v2:
- While mipi_dsi_dcs_write() does not have a corresponding _multi()
  variant replace it with mipi_dsi_dcs_write_buffer_multi() to have all
  APIs following _multi() usage for easier error handling

- Link to v1: https://lore.kernel.org/r/20250316-b4-panel-ls043t1le01-v1-1-ee38371b0ba0@redhat.com
---
 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c | 41 +++++++++----------------
 1 file changed, 15 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
index 729cbb0d8403ff7c0c4b9d21774909cc298904a2..36abfa2e65e962af2a08aec3e63ba1077a2c43d4 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
@@ -36,60 +36,49 @@ static inline struct sharp_nt_panel *to_sharp_nt_panel(struct drm_panel *panel)
 static int sharp_nt_panel_init(struct sharp_nt_panel *sharp_nt)
 {
 	struct mipi_dsi_device *dsi = sharp_nt->dsi;
-	int ret;
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
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
+	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xae,  0x03);
 
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

