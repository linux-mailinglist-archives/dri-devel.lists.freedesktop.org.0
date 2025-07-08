Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F9DAFD87E
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 22:36:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 468C510E6DF;
	Tue,  8 Jul 2025 20:36:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZoHCBpz6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A9A10E6DA
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jul 2025 20:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752007001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8wAdm8EgZ19ZtLJf1xnpXfqNiLVj4jykasvbsH4XpNo=;
 b=ZoHCBpz618pR422tEHeCK4/ypn0kjLAeINzJGgLh3e3CHobTTNX7xQSomUAGZYteNSrbiR
 z3dgUYFm+Wbl3FCpIOubqEwZsyppvNQqA9WD0cQ4sDf0at8DdtrERNhCGRr3RjOJbZlkIB
 TLiRvc0bWIBz+/xsK2xIxOjEkupIY0k=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-155-Mjiizd7EPNGYg-2nA6kE6g-1; Tue,
 08 Jul 2025 16:36:32 -0400
X-MC-Unique: Mjiizd7EPNGYg-2nA6kE6g-1
X-Mimecast-MFC-AGG-ID: Mjiizd7EPNGYg-2nA6kE6g_1752006990
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 681C5193F064; Tue,  8 Jul 2025 20:36:29 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.132])
 by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 265F319560B0; Tue,  8 Jul 2025 20:36:26 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 08 Jul 2025 15:35:15 -0500
Subject: [PATCH 3/6] drm/panel/tdo-tl070wsh30: Use refcounted allocation in
 place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-b4-simple-panel-api-convert-july-v1-3-630902123ea1@redhat.com>
References: <20250708-b4-simple-panel-api-convert-july-v1-0-630902123ea1@redhat.com>
In-Reply-To: <20250708-b4-simple-panel-api-convert-july-v1-0-630902123ea1@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752006919; l=1690;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=uyApYRrEF9+GSs4SPYkesqW8R4lf6hPABmIXOL9M6zc=;
 b=yEZIT5kSaWisEXm3aW1tjkoL1TybhCN0ez2mOpQA+0tFKFaTVaZl1erEpDG7Og2ayz89LCTfV
 /AptxioQt6HC9QsIp0EeE3Ojw+jvXoOOm44DNfqIvdjIVEqIdK4cfHm
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
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
 drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c b/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
index 227f97f9b136f07c7c7ea8d8fd005261b878e5ca..e87b8de0f0f267bc6b4d4ed3e2dc7feb0250194b 100644
--- a/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
+++ b/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
@@ -162,9 +162,6 @@ static int tdo_tl070wsh30_panel_add(struct tdo_tl070wsh30_panel *tdo_tl070wsh30)
 		return err;
 	}
 
-	drm_panel_init(&tdo_tl070wsh30->base, &tdo_tl070wsh30->link->dev,
-		       &tdo_tl070wsh30_panel_funcs, DRM_MODE_CONNECTOR_DSI);
-
 	err = drm_panel_of_backlight(&tdo_tl070wsh30->base);
 	if (err)
 		return err;
@@ -183,10 +180,12 @@ static int tdo_tl070wsh30_panel_probe(struct mipi_dsi_device *dsi)
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST | MIPI_DSI_MODE_LPM;
 
-	tdo_tl070wsh30 = devm_kzalloc(&dsi->dev, sizeof(*tdo_tl070wsh30),
-				    GFP_KERNEL);
-	if (!tdo_tl070wsh30)
-		return -ENOMEM;
+	tdo_tl070wsh30 = devm_drm_panel_alloc(&dsi->dev, __typeof(*tdo_tl070wsh30),
+					      base, &tdo_tl070wsh30_panel_funcs,
+					      DRM_MODE_CONNECTOR_DSI);
+
+	if (IS_ERR(tdo_tl070wsh30))
+		return PTR_ERR(tdo_tl070wsh30);
 
 	mipi_dsi_set_drvdata(dsi, tdo_tl070wsh30);
 	tdo_tl070wsh30->link = dsi;

-- 
2.48.1

