Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD469AC1A0
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 10:30:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9E010E0A8;
	Wed, 23 Oct 2024 08:30:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WVI7O0t8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C66AB10E0A8
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 08:30:36 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-43158625112so64731055e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 01:30:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729672235; x=1730277035; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=95Cs3StsmPVbQEmy5DYBdaAp5pMh1zUcYS64FB9PkOw=;
 b=WVI7O0t8K8dAbKCLsxjRBX5zD9Lbb7CR2de+f1TCfwEypVxCoU4osP/o04jS2gBqQr
 5FZX0XbGNaMYR2R1Mvri/uZjBjyriV68zJiQRmT+VJe8X0honmobiDTJk80IUOHk2VGm
 TAywkD49TqNgEkbr8qkq2ZX7jqHlawt5Mxc3/14cv4CcY7gfiucA7pdBpCMbBZEKUI+S
 12TE5gyEPvrBJ6JBQ4wNczqyMZDix0O1tKn9yix9lLRz58ZR0ALKcZ4W8hx1nvh7s8nY
 oVt5b3OdxA/Ywyv7A//M46Qh5lMNOrvvMVPCtGByv5V+8oNfZTMmOdlFQbxxWIr6ljzX
 cDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729672235; x=1730277035;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=95Cs3StsmPVbQEmy5DYBdaAp5pMh1zUcYS64FB9PkOw=;
 b=LSLAJfcpkJz0WRBo6pdTloTNKplQGPu/grCIh6yubI2TGfe2L/nElmIoduu5ab1xFd
 o8UVwjixAUWXPYodP+3xrc26HSCPlWFxBD3bSwRg/+lwZc9vwbk7RzxsSnyx2AQqk6SA
 XOrZhO9EiGEx6cDLn6aWTPLxlj29O097C+RI2kdJbJ7gmTw90hW/oNW9ZhjaNgfcLRxz
 Ub6igoM85StlROTTxqfegkSd5ji97ErTu2LPKl1+WNQ+ObvyFtK3nqFBhmiUSKIn/p7m
 KTY7tBm8d5nAd/IRiK9k+j67XkX8qEJ7HVCtf4EdCK3N4JtDd4Ng40K7mvjZH9wbqqzE
 Qh+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjiStHNgPZzreE8WWiGEgivhZvC5jY34QAmKCCiJch35fN0bZviDBsgmIakYoWr1ECGQ0joh9TkRk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxU0wsFyN+FiOCcyva8vmV+tO2ab0XtOsbe7wRnzfS2E/Zj3N93
 yBunhuUoN5CLAbHJ2oIAywTfsy/jnerG66pXqXYz8YRALaivZh0MxO6CB5mGFQw=
X-Google-Smtp-Source: AGHT+IGb/UB2CSjQVVmaOHKT/K4GreGbDp8bdWYCdX3b6WAbVqGRAZOZ8sPRqWUJoRUK+LtTVQFvnw==
X-Received: by 2002:a05:600c:46d0:b0:431:57e5:b251 with SMTP id
 5b1f17b1804b1-4318424ea03mr15362385e9.28.1729672235246; 
 Wed, 23 Oct 2024 01:30:35 -0700 (PDT)
Received: from localhost ([196.207.164.177]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4317d03ea4asm24552605e9.0.2024.10.23.01.30.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2024 01:30:34 -0700 (PDT)
Date: Wed, 23 Oct 2024 11:30:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Alex Lanzano <lanzano.alex@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Mehdi Djait <mehdi.djait@bootlin.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH next] drm/sharp-memory: Fix some checks in sharp_memory_probe()
Message-ID: <0d307349-c141-49ee-8b34-67caf5f8b638@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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

The devm_drm_dev_alloc() function returns error pointers, it never
returns NULL.  Change that check to IS_ERR().

The devm_gpiod_get_optional() function returns a mix of error pointers
if there is an error, or NULL if there is no GPIO assigned.  Add a check
for error pointers.

Fixes: b8f9f21716fe ("drm/tiny: Add driver for Sharp Memory LCD")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/tiny/sharp-memory.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/tiny/sharp-memory.c b/drivers/gpu/drm/tiny/sharp-memory.c
index 2d2315bd6aef..1bcdd79166a4 100644
--- a/drivers/gpu/drm/tiny/sharp-memory.c
+++ b/drivers/gpu/drm/tiny/sharp-memory.c
@@ -543,8 +543,8 @@ static int sharp_memory_probe(struct spi_device *spi)
 
 	smd = devm_drm_dev_alloc(dev, &sharp_memory_drm_driver,
 				 struct sharp_memory_device, drm);
-	if (!smd)
-		return -ENOMEM;
+	if (IS_ERR(smd))
+		return PTR_ERR(smd);
 
 	spi_set_drvdata(spi, smd);
 
@@ -555,6 +555,8 @@ static int sharp_memory_probe(struct spi_device *spi)
 		return dev_err_probe(dev, ret, "Failed to initialize drm config\n");
 
 	smd->enable_gpio = devm_gpiod_get_optional(dev, "enable", GPIOD_OUT_HIGH);
+	if (IS_ERR(smd->enable_gpio))
+		return PTR_ERR(smd->enable_gpio);
 	if (!smd->enable_gpio)
 		dev_warn(dev, "Enable gpio not defined\n");
 
-- 
2.45.2

