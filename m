Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 748A5A7810D
	for <lists+dri-devel@lfdr.de>; Tue,  1 Apr 2025 19:05:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B855510E630;
	Tue,  1 Apr 2025 17:05:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Y+tWcWLz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55EB610E630
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Apr 2025 17:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743527146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mUKnnvYyn+coNsWluPrWHQ14aAy143VL7GAIbKLN55A=;
 b=Y+tWcWLzrBdL6VS0WjeEX7CFL6ruh8Lt94UdESRQdNZT1m5UmlHezVbroujPgR8prIe4Jt
 3lk85wc2mGchH7yRZohVxAgEw9OQ2/sB6tNVIlkH7fdfxIkV6g4dfiVJaTJhNXYuQR/AFm
 OUTsWceTwlbSNaYJEwoAXYR61Ri3xu8=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-175-zeVlDFwvPRO3PBoKRrEoig-1; Tue,
 01 Apr 2025 13:05:41 -0400
X-MC-Unique: zeVlDFwvPRO3PBoKRrEoig-1
X-Mimecast-MFC-AGG-ID: zeVlDFwvPRO3PBoKRrEoig_1743527139
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 469951954B38; Tue,  1 Apr 2025 17:05:39 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B9F00180B487; Tue,  1 Apr 2025 17:05:36 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Tue, 01 Apr 2025 12:03:51 -0400
Subject: [PATCH 08/10] panel/dsi-cm: Use refcounted allocation in place of
 devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-b4-drm-panel-mass-driver-convert-v1-8-cdd7615e1f93@redhat.com>
References: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
In-Reply-To: <20250401-b4-drm-panel-mass-driver-convert-v1-0-cdd7615e1f93@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Linus Walleij <linus.walleij@linaro.org>, Joel Selvaraj <jo@jsfamily.in>, 
 Douglas Anderson <dianders@chromium.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743523429; l=1282;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=JoNfquM7qzkcKmUulZWWjNdY1sPbIefQYKUNSp2RtSI=;
 b=eDIYj8leCHW/fg3jtbOZ/on02VaQERqAbuIJUsXuldSHijRYqFT/G+yL8eUUuTKmp35iBgVwt
 KCxYj5Ds+ffAhr2Zqg+6xvDRa6DXMP/20hSQycRVyfWiO5tbNLHwDGD
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

Move to using the new API devm_drm_panel_alloc() to allocate the
panel.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/panel/panel-dsi-cm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
index 6b3f4d664d2ade668525660394cf81924436492e..ae6e9ffc46cb49ddb53981815ad248953bb37fbb 100644
--- a/drivers/gpu/drm/panel/panel-dsi-cm.c
+++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
@@ -511,9 +511,10 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 
 	dev_dbg(dev, "probe\n");
 
-	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
-	if (!ddata)
-		return -ENOMEM;
+	ddata = devm_drm_panel_alloc(dev, struct panel_drv_data, panel,
+				     &dsicm_panel_funcs, DRM_MODE_CONNECTOR_DSI);
+	if (IS_ERR(ddata))
+		return PTR_ERR(ddata);
 
 	mipi_dsi_set_drvdata(dsi, ddata);
 	ddata->dsi = dsi;
@@ -530,9 +531,6 @@ static int dsicm_probe(struct mipi_dsi_device *dsi)
 
 	dsicm_hw_reset(ddata);
 
-	drm_panel_init(&ddata->panel, dev, &dsicm_panel_funcs,
-		       DRM_MODE_CONNECTOR_DSI);
-
 	if (ddata->use_dsi_backlight) {
 		struct backlight_properties props = { 0 };
 		props.max_brightness = 255;

-- 
2.48.1

