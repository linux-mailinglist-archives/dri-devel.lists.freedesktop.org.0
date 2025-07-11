Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FF5B01243
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 06:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E4FB10E99D;
	Fri, 11 Jul 2025 04:33:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="QuIU7Rce";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BFB10E99F
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jul 2025 04:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752208385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mfn9L63NyGnHcCssK+9XeEnkkOjmDRSCTK1Dph1u3rQ=;
 b=QuIU7RceTW8NmyocjrNRxA57Z7vIleWHuu3S0x81kw46Cp5N9TQZtH6E7H7Y7r6TkXtalC
 VgEAg/isZ5e20YIXuvKVeg58GBtic/3zzgD2PhUBY8hIgAxC7uvfVeY0mrSXu/GmwG4+hz
 XdvIDWkFdlqognM9xOQZ/E6Ayb++O20=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-102-DHN0yI4lMT2wculgXQo02g-1; Fri,
 11 Jul 2025 00:32:59 -0400
X-MC-Unique: DHN0yI4lMT2wculgXQo02g-1
X-Mimecast-MFC-AGG-ID: DHN0yI4lMT2wculgXQo02g_1752208377
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 32A9118002ED; Fri, 11 Jul 2025 04:32:57 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.240])
 by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 1F841180045B; Fri, 11 Jul 2025 04:32:53 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 10 Jul 2025 23:31:20 -0500
Subject: [PATCH 09/14] drm/panel/jdi-lt070me05000: Use refcounted
 allocation in place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250710-b4-driver-convert-last-part-july-v1-9-de73ba81b2f5@redhat.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752208280; l=1496;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=ATz8x7koYgHgmVT1nHAx9zlNjogIDPekD0KoOrO4J1M=;
 b=InQRUyJBwdB1lNXv874qbjdyrZ9XkP3sY/uix3iwPoBIiQms7YjhEoOYkZxO8Mp6NtgvOWwc7
 g9DXi63tWKkAmBDAben3ngAA4tvqelfC41XYWET6IvpiM4sumVnnQbu
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
 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
index b1ce186de2616be03fa9f94d0e0724141e9dcbac..3513e5c4dd8c6ee3c9c8836e8d150d838d8666cd 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
@@ -402,9 +402,6 @@ static int jdi_panel_add(struct jdi_panel *jdi)
 		return dev_err_probe(dev, PTR_ERR(jdi->backlight),
 				     "failed to register backlight %d\n", ret);
 
-	drm_panel_init(&jdi->base, &jdi->dsi->dev, &jdi_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	drm_panel_add(&jdi->base);
 
 	return 0;
@@ -426,9 +423,11 @@ static int jdi_panel_probe(struct mipi_dsi_device *dsi)
 	dsi->mode_flags =  MIPI_DSI_MODE_VIDEO_HSE | MIPI_DSI_MODE_VIDEO |
 			   MIPI_DSI_CLOCK_NON_CONTINUOUS;
 
-	jdi = devm_kzalloc(&dsi->dev, sizeof(*jdi), GFP_KERNEL);
-	if (!jdi)
-		return -ENOMEM;
+	jdi = devm_drm_panel_alloc(&dsi->dev, __typeof(*jdi), base,
+				   &jdi_panel_funcs, DRM_MODE_CONNECTOR_DSI);
+
+	if (IS_ERR(jdi))
+		return PTR_ERR(jdi);
 
 	mipi_dsi_set_drvdata(dsi, jdi);
 

-- 
2.48.1

