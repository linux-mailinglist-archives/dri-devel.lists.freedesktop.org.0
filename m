Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EED81C968
	for <lists+dri-devel@lfdr.de>; Fri, 22 Dec 2023 12:52:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 691AA10E0BE;
	Fri, 22 Dec 2023 11:52:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100A710E0BE
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 11:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1703245954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qeM/S/omrfSVhML5YUobmUmWfHTQ46GRH696mY5TNyo=;
 b=IAnIkzYhban8PRIe7nvIIiCs59gr7O5nT/p9UaLm4hwiHQopGAYz704YK1A/JL1BAB6I8r
 TXJtHOLyGbXcRGj9lEn821IvdhX9QMSaDLApDarPN9pJkDXflOG1OHfqJXSMa/2ix3JcE2
 vF8frdQsepY+hFpEQynqJ0zZjY43qcw=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-8-ad1IOzU5O4uVvlcN6kIlnA-1; Fri, 22 Dec 2023 06:52:32 -0500
X-MC-Unique: ad1IOzU5O4uVvlcN6kIlnA-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-50e3288601bso342677e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Dec 2023 03:52:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703245951; x=1703850751;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qeM/S/omrfSVhML5YUobmUmWfHTQ46GRH696mY5TNyo=;
 b=ePvzQfZnZJvZ2ZtTmwkvfeQXIvMw8NiUQ9yN96OLHkpxDkuWxj98o66a+/M9C2O4kW
 wMN4BN6+w0nEPkNF7s050MlqoDo8NZp0rhJp3/3prmUo/AYkv+YEYgQ8zUR4yzYrgKCL
 ixkO7AAr8U3uJE8PAVaGW30UXyIJc2u7QL/WyA6Pe+78Pt1JRDtxehXrGd+nuB+0hLP3
 /aFzN1MznTdqnHQ2ElKtKzS1i5XGXXxugzgf8Pi0nVgp/qDmCMhDLjAxfpdfvjv8kR0r
 1XQ16vd10ecZoXEsEd+PatO+6Zdt0uF/1d6wEy7G1Jo2Dd0/vpCFkGshOPUKbA2WyQoH
 Md5w==
X-Gm-Message-State: AOJu0YxpKaJTPovkH4jy+ExeduUf3Ieg8cV+vOWJSI/DzQMpA57xSGEd
 CNsaKiuiQWHELuEeEWC/oqhIrn54e5PlBeWhxklajPU83EIQetLSpljbUXdpxvE7C6uwU8L4zyA
 fOFt2FFQcU98TkjnTrt3f/MpGcN3b2XvPIDTQ
X-Received: by 2002:a05:6512:3127:b0:50e:2460:d703 with SMTP id
 p7-20020a056512312700b0050e2460d703mr1361166lfd.0.1703245951142; 
 Fri, 22 Dec 2023 03:52:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1vvC6LH7skIEuy9Objfe1rs8IpDRitZkcFcKkuSjJ+mvjDH0GtZ0gmLOqEGqEtPCyCz7BQA==
X-Received: by 2002:a05:6512:3127:b0:50e:2460:d703 with SMTP id
 p7-20020a056512312700b0050e2460d703mr1361141lfd.0.1703245950241; 
 Fri, 22 Dec 2023 03:52:30 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 ([2001:9e8:32ea:8600:227b:d2ff:fe26:2a7a])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a05600c314800b003fee6e170f9sm6602732wmo.45.2023.12.22.03.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 03:52:29 -0800 (PST)
From: Philipp Stanner <pstanner@redhat.com>
To: Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/tilcdc: request and mapp iomem with devres
Date: Fri, 22 Dec 2023 12:52:17 +0100
Message-ID: <20231222115216.19218-2-pstanner@redhat.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Philipp Stanner <pstanner@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

tilcdc currently just ioremaps its iomem, without doing the (a bit more
robust) request on the memory first. The devm_ functions provide a handy
way to both request and ioremap the memory with automatic cleanup.

Replace the manual ioremap with the devm_ version.

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Philipp Stanner <pstanner@redhat.com>
---
 drivers/gpu/drm/tilcdc/tilcdc_drv.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/tilcdc/tilcdc_drv.c b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
index 8ebd7134ee21..2ad3f44a6e2d 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_drv.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_drv.c
@@ -182,9 +182,6 @@ static void tilcdc_fini(struct drm_device *dev)
 	if (priv->clk)
 		clk_put(priv->clk);
 
-	if (priv->mmio)
-		iounmap(priv->mmio);
-
 	if (priv->wq)
 		destroy_workqueue(priv->wq);
 
@@ -201,7 +198,6 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 	struct platform_device *pdev = to_platform_device(dev);
 	struct device_node *node = dev->of_node;
 	struct tilcdc_drm_private *priv;
-	struct resource *res;
 	u32 bpp = 0;
 	int ret;
 
@@ -226,17 +222,10 @@ static int tilcdc_init(const struct drm_driver *ddrv, struct device *dev)
 		goto init_failed;
 	}
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	if (!res) {
-		dev_err(dev, "failed to get memory resource\n");
-		ret = -EINVAL;
-		goto init_failed;
-	}
-
-	priv->mmio = ioremap(res->start, resource_size(res));
-	if (!priv->mmio) {
-		dev_err(dev, "failed to ioremap\n");
-		ret = -ENOMEM;
+	priv->mmio = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->mmio)) {
+		dev_err(dev, "failed to request / ioremap\n");
+		ret = PTR_ERR(priv->mmio);
 		goto init_failed;
 	}
 
-- 
2.43.0

