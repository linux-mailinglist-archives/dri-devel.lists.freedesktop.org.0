Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCCEA7B0E7
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 23:25:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2E8710EB74;
	Thu,  3 Apr 2025 21:25:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fJpDEANv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6873710EB72
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 21:25:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1743715511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aYOao/lcUdhT9WpqtVypVm5vpwcm60T+7oo0MXEul4I=;
 b=fJpDEANvk3GPuGTstGZ7/oTDW9AUA80RdGGyIiIcGvejEA4Y2G5UpxRh4p6tsffM6M5GFM
 2cEje+aMV8J4Y3jXKt9T5l05gMYQaL/woo3E+00f7rCwkeZGLDBlSYL/FEi3cUlYXu2r70
 E1gihHKIw0LMHNZxqaVCPlYl6D4CZ+E=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-175-f3oWeZpqPZ2C5CjGGT-lkA-1; Thu,
 03 Apr 2025 17:25:07 -0400
X-MC-Unique: f3oWeZpqPZ2C5CjGGT-lkA-1
X-Mimecast-MFC-AGG-ID: f3oWeZpqPZ2C5CjGGT-lkA_1743715504
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 58792195608D; Thu,  3 Apr 2025 21:25:04 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.30])
 by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 16AFE180B488; Thu,  3 Apr 2025 21:24:59 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 03 Apr 2025 16:21:06 -0400
Subject: [PATCH 35/46] panel/tpo-td043mtea1: Use refcounted allocation in
 place of devm_kzalloc()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-35-965b15ad5b8e@redhat.com>
References: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-0-965b15ad5b8e@redhat.com>
In-Reply-To: <20250403-b4-drm_panel_mass_driver_convert_part3-v1-0-965b15ad5b8e@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Chiras <robert.chiras@nxp.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Artur Weber <aweber.kernel@gmail.com>, 
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>, Janne Grunau <j@jannau.net>, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1743711639; l=1266;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=6QVstn7C4UPkXlQw6LFe6aeyNpq6m9ysrxYpNBJ2XVw=;
 b=Pq3ThAQaQnCn3xyQ+kVI/cCA2/be8QFJ21Ss43AuBuMI4+wvCsdMTCU04hLQd/HDCZ2+vOmjo
 JLP03fng7s3CvM92GBFHxKU8vDF9XEQ5lvnvCWfjE3DbMmaMdN5FETB
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
 drivers/gpu/drm/panel/panel-tpo-td043mtea1.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
index cf4609bb9b1da969973ac0ecc67436185691941a..b18af526b54c5e1580be8eb20b9bacf218c825ee 100644
--- a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
+++ b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
@@ -421,9 +421,10 @@ static int td043mtea1_probe(struct spi_device *spi)
 	struct td043mtea1_panel *lcd;
 	int ret;
 
-	lcd = devm_kzalloc(&spi->dev, sizeof(*lcd), GFP_KERNEL);
-	if (lcd == NULL)
-		return -ENOMEM;
+	lcd = devm_drm_panel_alloc(&spi->dev, struct td043mtea1_panel, panel,
+				   &td043mtea1_funcs, DRM_MODE_CONNECTOR_DPI);
+	if (IS_ERR(lcd))
+		return PTR_ERR(lcd);
 
 	spi_set_drvdata(spi, lcd);
 	lcd->spi = spi;
@@ -455,9 +456,6 @@ static int td043mtea1_probe(struct spi_device *spi)
 		return ret;
 	}
 
-	drm_panel_init(&lcd->panel, &lcd->spi->dev, &td043mtea1_funcs,
-		       DRM_MODE_CONNECTOR_DPI);
-
 	drm_panel_add(&lcd->panel);
 
 	return 0;

-- 
2.48.1

