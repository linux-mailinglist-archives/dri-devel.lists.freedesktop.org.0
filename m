Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2365FA79304
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 18:26:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67FDC10E845;
	Wed,  2 Apr 2025 16:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dq3OWs1C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D12910E844
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Apr 2025 16:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743611197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=npvZMXfvWV8eo3hpNGDEvptxCke1n/j0iwAHzQnv9eU=;
 b=dq3OWs1Cdmxsq4HTzIOJpnZhSFAPKUaFaTArK1NVtkwDXzXhOePJR5s0/0ag2v51HqBuFM
 CPatj0OuCBRBtRSq0PjrvmzKc32/2ppy82A+QrVXBx3G4JS2RUT2JGVAY+G796ZO9EYuRv
 V+AolwuVgGVMDbGvdvspkFkBnDRC+jI=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-94-TKHCiYN4Ms2LV3bRiZtoRQ-1; Wed,
 02 Apr 2025 12:26:32 -0400
X-MC-Unique: TKHCiYN4Ms2LV3bRiZtoRQ-1
X-Mimecast-MFC-AGG-ID: TKHCiYN4Ms2LV3bRiZtoRQ_1743611189
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 9249F180025E; Wed,  2 Apr 2025 16:26:29 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
 by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 9B554195609D; Wed,  2 Apr 2025 16:26:25 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Wed, 02 Apr 2025 11:23:51 -0400
Subject: [PATCH 13/30] panel/jadard-jd9365da-h3: Use refcounted allocation
 in place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250402-b4-drm_panel_mass_convert_part2-v1-13-903b70999ea6@redhat.com>
References: <20250402-b4-drm_panel_mass_convert_part2-v1-0-903b70999ea6@redhat.com>
In-Reply-To: <20250402-b4-drm_panel_mass_convert_part2-v1-0-903b70999ea6@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>, 
 Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Michael Walle <mwalle@kernel.org>, Jagan Teki <jagan@edgeble.ai>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Jianhua Lu <lujianhua000@gmail.com>, Stefan Mavrodiev <stefan@olimex.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743607440; l=1465;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=IMFre+7l7tWbk4mIS8m6SZxjRxqcMTkoQU9WfWpKabg=;
 b=2FSpbmOvXfcINUMAYycqUf/pnm8cHIiO41KUyMkAKzkiNVBDC7eE3BtcejqyuqNaHJGws2peh
 A0DB6ZXoHZrAJkz/xFkRm12K3t0F54y/qXm1ZQLx1b8VOd0Wf5qVKet
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

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
index 7d68a8acfe2ea45a913dff25eb5e9f0663503f08..6b02923de3f0778f45a6f9ce20d70d667772c64c 100644
--- a/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
+++ b/drivers/gpu/drm/panel/panel-jadard-jd9365da-h3.c
@@ -1120,9 +1120,10 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
 	struct jadard *jadard;
 	int ret;
 
-	jadard = devm_kzalloc(&dsi->dev, sizeof(*jadard), GFP_KERNEL);
-	if (!jadard)
-		return -ENOMEM;
+	jadard = devm_drm_panel_alloc(dev, struct jadard, panel, &jadard_funcs,
+				   DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(jadard))
+		return PTR_ERR(jadard);
 
 	desc = of_device_get_match_data(dev);
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
@@ -1148,9 +1149,6 @@ static int jadard_dsi_probe(struct mipi_dsi_device *dsi)
 		return PTR_ERR(jadard->vccio);
 	}
 
-	drm_panel_init(&jadard->panel, dev, &jadard_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	ret = of_drm_get_panel_orientation(dev->of_node, &jadard->orientation);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "failed to get orientation\n");

-- 
2.48.1

