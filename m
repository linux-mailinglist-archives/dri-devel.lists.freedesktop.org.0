Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 611C0B01240
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 06:33:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FBB10E9A0;
	Fri, 11 Jul 2025 04:33:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="I36Q6NM3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E9E10E99D
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 04:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752208380;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YjkJzvRipTzp+ViQ7DkSw4r2UUyVDonMjVkrCXThIuM=;
 b=I36Q6NM3TgnalEHXZGoouRMbXHjC7/R6KiSwfK1OghaOxfO1z6MGdwsJB+GzfD7kucFPzc
 pAJG5pTUpDVHi9YyGKaXTvkOk1F6aNqanRlGDpEB/VsATamrEiKegALkFlmg/MttIWM6c+
 0dceajZ0UO2rhkB5hTeS71jtwyY+R0k=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-354-z5djmlITMDyF89o1KXnNuA-1; Fri,
 11 Jul 2025 00:32:55 -0400
X-MC-Unique: z5djmlITMDyF89o1KXnNuA-1
X-Mimecast-MFC-AGG-ID: z5djmlITMDyF89o1KXnNuA_1752208373
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C60701808993; Fri, 11 Jul 2025 04:32:53 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.240])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 81E79180045B; Fri, 11 Jul 2025 04:32:50 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 10 Jul 2025 23:31:19 -0500
Subject: [PATCH 08/14] drm/panel/khadas-ts050: Use refcounted allocation in
 place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-b4-driver-convert-last-part-july-v1-8-de73ba81b2f5@redhat.com>
References: <20250710-b4-driver-convert-last-part-july-v1-0-de73ba81b2f5@redhat.com>
In-Reply-To: <20250710-b4-driver-convert-last-part-july-v1-0-de73ba81b2f5@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752208280; l=1766;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=sC7hJNhLBTGwlsurJrF4c4E+VjrBjq/LvgkqLeMWBdI=;
 b=e7w+iVZjJAsXxox20NsYj+sIYSiAm1aGycR978yeHzau82ipn4YvzNOzqVtQZ5KteICMhjtdP
 Fv8o9lnh5BnCNr9c35mNjnrYxFmlIY27Zdtm+VtP3IYaxHg/RYjQBle
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
panel. In the call to the new API, avoid using explicit type and use
__typeof() for more type safety.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-khadas-ts050.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-khadas-ts050.c b/drivers/gpu/drm/panel/panel-khadas-ts050.c
index 0e5e8e57bd1e573af934fe22b59f6513aac4dae4..67ca055f06f39f74ec4c34120c644d97b62c3921 100644
--- a/drivers/gpu/drm/panel/panel-khadas-ts050.c
+++ b/drivers/gpu/drm/panel/panel-khadas-ts050.c
@@ -821,9 +821,6 @@ static int khadas_ts050_panel_add(struct khadas_ts050_panel *khadas_ts050)
 		return dev_err_probe(dev, PTR_ERR(khadas_ts050->enable_gpio),
 				     "failed to get enable gpio");
 
-	drm_panel_init(&khadas_ts050->base, &khadas_ts050->link->dev,
-		       &khadas_ts050_panel_funcs, DRM_MODE_CONNECTOR_DSI);
-
 	err = drm_panel_of_backlight(&khadas_ts050->base);
 	if (err)
 		return err;
@@ -850,10 +847,12 @@ static int khadas_ts050_panel_probe(struct mipi_dsi_device *dsi)
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
 			  MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET;
 
-	khadas_ts050 = devm_kzalloc(&dsi->dev, sizeof(*khadas_ts050),
-				    GFP_KERNEL);
-	if (!khadas_ts050)
-		return -ENOMEM;
+	khadas_ts050 = devm_drm_panel_alloc(&dsi->dev, __typeof(*khadas_ts050),
+					    base, &khadas_ts050_panel_funcs,
+					    DRM_MODE_CONNECTOR_DSI);
+
+	if (IS_ERR(khadas_ts050))
+		return PTR_ERR(khadas_ts050);
 
 	khadas_ts050->panel_data = (struct khadas_ts050_panel_data *)data;
 	mipi_dsi_set_drvdata(dsi, khadas_ts050);

-- 
2.48.1

