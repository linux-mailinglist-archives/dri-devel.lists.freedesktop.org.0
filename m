Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 758DE537E5F
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 16:03:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B740310EDA4;
	Mon, 30 May 2022 14:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8AD910EDA4
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 14:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653919399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=rC0eN7t3z6ODekS0ZqenuKqbnlhAc460c9vZw1utlEU=;
 b=RETIWVj6VUy1+TCXRtlPcQnp2oxjwcRN7269H3SxczoO45fZshjc22YZHjbjdy7I4zshj+
 yrH985sATdIG1O5LuPwy8lm/eXLO4lMDk0G3NyvjopZG4GxT/L7RnEzbPhu896Oi40b6Hh
 RHdvlEoygEJk0jfLR/aTrqH8ZDS2NMI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-ySF2SHkSMOavIbm2gUB-6A-1; Mon, 30 May 2022 10:03:14 -0400
X-MC-Unique: ySF2SHkSMOavIbm2gUB-6A-1
Received: by mail-wm1-f69.google.com with SMTP id
 c125-20020a1c3583000000b003978decffedso5689413wma.5
 for <dri-devel@lists.freedesktop.org>; Mon, 30 May 2022 07:03:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rC0eN7t3z6ODekS0ZqenuKqbnlhAc460c9vZw1utlEU=;
 b=P1P3dZ+A47bJ0jXTqMrMGGEezjayFxaH4hjJ150Ruldmwgb+OwXfVbbVcvl3HWzBdh
 ycJQ+GL96n2h/u+D7pTAZiBREmnIpIsI2xx0udlAGICUMClGdpX/i7rR6TVfc779CV/z
 YMHNzrbY2xbOc8xUd03q6FkotrGAb9EDxySy4I+SqRPzqsTsBvdBsFaDKyZucO2cVwTE
 P4WRQ9BldXeJ1FOtuvhKt8wt5xyDoGyWVZshy68O31X3HPraa3tf2NA+oW6twJQpVdq8
 QlweepryPvtpjbuDYZTyV1iVxtvLio4A5dRCmF6zI75J0FR7SyofiqFsq7uI0l5/jTYu
 sYBA==
X-Gm-Message-State: AOAM5309QU79BVZmBqRKHgiXQ0uDChbAHw68g1uTbko0Km4bOO8l5NdX
 zLS6dlYmhsJ8R4PZ18NTiQ0ATC17yUBFd71gh7RBsJVgRsEqPorI9KiI9UXEKgAerxAFT3twVua
 1+1hwGMysO2yORfTNIk42I5610+Xa
X-Received: by 2002:a05:6000:15c1:b0:20f:c1d3:8a89 with SMTP id
 y1-20020a05600015c100b0020fc1d38a89mr40174117wry.287.1653919392615; 
 Mon, 30 May 2022 07:03:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygJwMi3I5Al7M7Nn7GvI6xqupt54m+kg76DqqOBO1hzb2Izc3i81He1uttnWN3YXnrWy+hgw==
X-Received: by 2002:a05:6000:15c1:b0:20f:c1d3:8a89 with SMTP id
 y1-20020a05600015c100b0020fc1d38a89mr40174093wry.287.1653919392345; 
 Mon, 30 May 2022 07:03:12 -0700 (PDT)
Received: from minerva.home (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 ay5-20020a05600c1e0500b0039765a7add4sm10539109wmb.29.2022.05.30.07.03.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 May 2022 07:03:12 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] drm/ssd130x: Only define a SPI device ID table when built as
 a module
Date: Mon, 30 May 2022 16:02:46 +0200
Message-Id: <20220530140246.742469-1-javierm@redhat.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: kernel test robot <lkp@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>, Mark Brown <broonie@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The kernel test robot reports a compile warning due the ssd130x_spi_table
variable being defined but not used. This happen when ssd130x-spi driver
is built-in instead of being built as a module, i.e:

  CC      drivers/gpu/drm/solomon/ssd130x-spi.o
  AR      drivers/base/firmware_loader/built-in.a
  AR      drivers/base/built-in.a
  CC      kernel/trace/trace.o
drivers/gpu/drm/solomon/ssd130x-spi.c:155:35: warning: ‘ssd130x_spi_table’ defined but not used [-Wunused-const-variable=]
  155 | static const struct spi_device_id ssd130x_spi_table[] = {
      |                                   ^~~~~~~~~~~~~~~~~

The driver shouldn't need a SPI device ID table and only have an OF device
ID table, but the former is needed to workaround an issue in the SPI core.
This always reports a MODALIAS of the form "spi:<device>" even for devices
registered through Device Trees.

But the table is only needed when the driver built as a module to populate
the .ko alias info. It's not needed when the driver is built-in the kernel.

Fixes: 74373977d2ca ("drm/solomon: Add SSD130x OLED displays SPI support")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/solomon/ssd130x-spi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/solomon/ssd130x-spi.c b/drivers/gpu/drm/solomon/ssd130x-spi.c
index 43722adab1f8..07802907e39a 100644
--- a/drivers/gpu/drm/solomon/ssd130x-spi.c
+++ b/drivers/gpu/drm/solomon/ssd130x-spi.c
@@ -143,6 +143,7 @@ static const struct of_device_id ssd130x_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ssd130x_of_match);
 
+#if IS_MODULE(CONFIG_DRM_SSD130X_SPI)
 /*
  * The SPI core always reports a MODALIAS uevent of the form "spi:<dev>", even
  * if the device was registered via OF. This means that the module will not be
@@ -160,6 +161,7 @@ static const struct spi_device_id ssd130x_spi_table[] = {
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(spi, ssd130x_spi_table);
+#endif
 
 static struct spi_driver ssd130x_spi_driver = {
 	.driver = {
-- 
2.36.1

