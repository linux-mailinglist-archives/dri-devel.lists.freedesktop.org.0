Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E859FEF1A
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 12:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1588810E660;
	Tue, 31 Dec 2024 11:45:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="itigBI9w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C311410E660
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 11:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1735645537;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=SaUM8anQHJEebN3v7sDN1GGuFLjgIRayHtbBjV0JEOk=;
 b=itigBI9w++tni4rsoRoYV4irx025tEFAKoWBUNM9JT7kgrcOPARWjSyhI1tzY1cMpBi3LZ
 j67KAi+heX1rxgcguhlbepWW8FwA3X2BLJfW1CQteB10ZeOa0BHU92DHg4l5px38xBLCLY
 UsKPCdVxe7hef65Bl0d4uSy6bE2lRYI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-LkeTMC3wMlaoerz4MFOOvg-1; Tue, 31 Dec 2024 06:45:31 -0500
X-MC-Unique: LkeTMC3wMlaoerz4MFOOvg-1
X-Mimecast-MFC-AGG-ID: LkeTMC3wMlaoerz4MFOOvg
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43651b1ba8aso70538105e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 03:45:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735645530; x=1736250330;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SaUM8anQHJEebN3v7sDN1GGuFLjgIRayHtbBjV0JEOk=;
 b=mwgLe+OT9vbHaW5sBe0e05u46c+9dL+86moGuzkkfv5UmIjTWUc4JyUtlplaBUCunz
 0S74mNusFIVdgBCh1f+RphQJrX9MXKPI5ZqNGZwxmikuv+BO7ytyJ1OXE8gYpmfWO0/N
 963h4Br1HEQGuTS2riV60sgkGzBcEWUdomA1rtI8jsnv+wOE4U5/8EfMFbvRcGzj2k4w
 3tJjZri7w2V3FISQBLve8SRknNnNCAWwhf1ILjH88IenYE6Jm6KdXqfT4jVklV5O3XQY
 7KjsAfy7JSmZOUc58kDwD6408k+RlTRdMhg4VXLBDBMgIp7mPiQZ7RVl7HQLZDU1kyRp
 YD0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWE1b6n4CHUlg6G6rBiPabyCmkqibccHj6oiBqT0/j78vQ8+WbImnK+OiRtSRuaTASVDC1Eg7lnoFw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJYPjhkJvpHIxkKDrOjG1qjRMz2P+2Z9qCUpFnOc3ZHtATKdbJ
 6XfTGhS3vu0RosiI2OkLuznKLnoxwVq5wNUN0DUO8hfycrT3UiTSBeBhsceMfyyHIWTU7IXTD43
 7vbp1+n9ufXzfacZspS7YrOUPOcm6WBfGff8Cb3b1p4hgF2ozhtE35N3rEtm+h2o+Lw==
X-Gm-Gg: ASbGncsDX3hRU8UoLclEYiOPDuj8XrQd4vOBkkpUgEc1Sfy9W/dtsJMc1ROFL/rWZFx
 N8HTVej1TTNKA70B8dP3oWSM+n38RL1m2qAtwABgUIZYeEBGNRiKFAzG8W3+Hq+oMGD5f5VfO2t
 A71B8hHcNDJvhrPLORbO9us9jkMz+/aB/tn0heH8DJo0u1ggze3FrU17Wp0Y6i5K0vtY62RgnEw
 LrwXBwyxsviiQz55+inni7K4389uLqNIQE26bDxqvbkCsGL6DWlDTqJslMyBA/ceLUU9CvJxtFF
 IJFdPA==
X-Received: by 2002:a05:600c:3ca4:b0:436:6460:e680 with SMTP id
 5b1f17b1804b1-43668646b20mr343878515e9.16.1735645530347; 
 Tue, 31 Dec 2024 03:45:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF4dB4nSgsL3IVAP4OZxA2dZtA2jibQtzQsdMVBXkuz+8i2GFB2rBmneZcS22MdY4Mmt76ESA==
X-Received: by 2002:a05:600c:3ca4:b0:436:6460:e680 with SMTP id
 5b1f17b1804b1-43668646b20mr343878305e9.16.1735645530009; 
 Tue, 31 Dec 2024 03:45:30 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43661219a7csm383876635e9.24.2024.12.31.03.45.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Dec 2024 03:45:29 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ssd130x: Set SPI .id_table to prevent an SPI core warning
Date: Tue, 31 Dec 2024 12:44:58 +0100
Message-ID: <20241231114516.2063201-1-javierm@redhat.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k8TDQF3QkS9QB6x1pygZCUjCOJodGoBpuSOb7UMsjF4_1735645530
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
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

The only reason for the ssd130x-spi driver to have an spi_device_id table
is that the SPI core always reports an "spi:" MODALIAS, even when the SPI
device has been registered via a Device Tree Blob.

Without spi_device_id table information in the module's metadata, module
autoloading would not work because there won't be an alias that matches
the MODALIAS reported by the SPI core.

This spi_device_id table is not needed for device matching though, since
the of_device_id table is always used in this case. For this reason, the
struct spi_driver .id_table field is currently not set in the SPI driver.

Because the spi_device_id table is always required for module autoloading,
the SPI core checks during driver registration that both an of_device_id
table and a spi_device_id table are present and that they contain the same
entries for all the SPI devices.

Not setting the .id_table field in the driver then confuses the core and
leads to the following warning when the ssd130x-spi driver is registered:

  [   41.091198] SPI driver ssd130x-spi has no spi_device_id for sinowealth,sh1106
  [   41.098614] SPI driver ssd130x-spi has no spi_device_id for solomon,ssd1305
  [   41.105862] SPI driver ssd130x-spi has no spi_device_id for solomon,ssd1306
  [   41.113062] SPI driver ssd130x-spi has no spi_device_id for solomon,ssd1307
  [   41.120247] SPI driver ssd130x-spi has no spi_device_id for solomon,ssd1309
  [   41.127449] SPI driver ssd130x-spi has no spi_device_id for solomon,ssd1322
  [   41.134627] SPI driver ssd130x-spi has no spi_device_id for solomon,ssd1325
  [   41.141784] SPI driver ssd130x-spi has no spi_device_id for solomon,ssd1327
  [   41.149021] SPI driver ssd130x-spi has no spi_device_id for solomon,ssd1331

To prevent the warning, set the .id_table even though it's not necessary.

Since the check is done even for built-in drivers, drop the condition to
only define the ID table when the driver is built as a module. Finally,
rename the variable to use the "_spi_id" convention used for ID tables.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

 drivers/gpu/drm/solomon/ssd130x-spi.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/solomon/ssd130x-spi.c b/drivers/gpu/drm/solomon/ssd130x-spi.c
index 08334be38694..7c935870f7d2 100644
--- a/drivers/gpu/drm/solomon/ssd130x-spi.c
+++ b/drivers/gpu/drm/solomon/ssd130x-spi.c
@@ -151,7 +151,6 @@ static const struct of_device_id ssd130x_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, ssd130x_of_match);
 
-#if IS_MODULE(CONFIG_DRM_SSD130X_SPI)
 /*
  * The SPI core always reports a MODALIAS uevent of the form "spi:<dev>", even
  * if the device was registered via OF. This means that the module will not be
@@ -160,7 +159,7 @@ MODULE_DEVICE_TABLE(of, ssd130x_of_match);
  * To workaround this issue, add a SPI device ID table. Even when this should
  * not be needed for this driver to match the registered SPI devices.
  */
-static const struct spi_device_id ssd130x_spi_table[] = {
+static const struct spi_device_id ssd130x_spi_id[] = {
 	/* ssd130x family */
 	{ "sh1106",  SH1106_ID },
 	{ "ssd1305", SSD1305_ID },
@@ -175,14 +174,14 @@ static const struct spi_device_id ssd130x_spi_table[] = {
 	{ "ssd1331", SSD1331_ID },
 	{ /* sentinel */ }
 };
-MODULE_DEVICE_TABLE(spi, ssd130x_spi_table);
-#endif
+MODULE_DEVICE_TABLE(spi, ssd130x_spi_id);
 
 static struct spi_driver ssd130x_spi_driver = {
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = ssd130x_of_match,
 	},
+	.id_table = ssd130x_spi_id,
 	.probe = ssd130x_spi_probe,
 	.remove = ssd130x_spi_remove,
 	.shutdown = ssd130x_spi_shutdown,
-- 
2.47.1

