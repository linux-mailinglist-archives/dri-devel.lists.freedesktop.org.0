Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB00D82A082
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jan 2024 19:54:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0FBB10E79F;
	Wed, 10 Jan 2024 18:54:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2239E10E79F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 18:54:36 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-40e4d64a3d8so30805625e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jan 2024 10:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704912874; x=1705517674; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=73PtAtAQoIY6F0H1ZkLmeiJputC15zIn9NBYF0IdrpQ=;
 b=A2Ri39mFcXM+TXvx82MZBeHrqv27mBpqsBa97ly/fXYrI2kzedcYPzJzixEnHeSiNo
 96vxPtyvTxpZadvAwVaasq1AF2+3+EXu0I6YZEiaKeCAzolLV8QjMwzFV47zETG/AyJa
 081ol41soadW/7aV7qBdWl449+l/csrxiKaY0DCK5l0PhDiNCLnTpqHrVZC7iCfR6j9i
 O9rHQt9e1Ll50+lZzCcNTTNSQjB3GNfcFfpgkb7aN0pEZQO/ZYCKUUl0yxZCMEuYZTMU
 KqJztYAMRnQ8Db21Z+b9xUEAOXl3oP5os5wRLgXhU2NB2YcOPWf/lRSHAKCgGCbazUxo
 9hqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704912874; x=1705517674;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=73PtAtAQoIY6F0H1ZkLmeiJputC15zIn9NBYF0IdrpQ=;
 b=GcA2Mwx+gDspAndDnLPjYwkBY8Q573zGPBSgnqFcz8BB3rKSTfrgSG+3oOv5rRHucf
 BvBPrQhFk1qYYIkm/khIF4BNdJoNYxZ6XvqQUbOcZdiC045K9c8PWvkVFBH3ylEM1nBI
 GzorXICncZYJy6nQZI/cJ+VBqZPjXHnNlFoRsq5rD0WE4j4z9G+mLz2QA+g+awCgQMQg
 TZrZUvAIJd6xH+5ATTIiIsBrZs52/M1qs6rQoXEv7w8id969rWW0tSIOX5OlAU0nMZdO
 HrmRmtR3O3UJTZ3TrwdYy1hyw2/z3KVQ18t3/BH3ZofJqdv1bLaO8qgenRFwGb+ypMHv
 KBAA==
X-Gm-Message-State: AOJu0YycNpDWM5gKS5162F2QGQbWSiZwvv000rh/qHKNxMCvyn93Wdvn
 j9L3VoxZuh5T8foxe1yMz4WFgRF69mxhYlHTjFmi69wMmdw=
X-Google-Smtp-Source: AGHT+IEPwuOIWlpLyfp3c4dAJX6qv4OYPd7otwEIEcODj1q0y2DbNY1CO/fMXQ7lzLkRgvy4rJGg9A==
X-Received: by 2002:a05:600c:5246:b0:40e:5808:53f9 with SMTP id
 fc6-20020a05600c524600b0040e580853f9mr616410wmb.73.1704912874512; 
 Wed, 10 Jan 2024 10:54:34 -0800 (PST)
Received: from localhost ([102.140.209.237]) by smtp.gmail.com with ESMTPSA id
 i8-20020a05600c354800b0040e555f12d8sm3105395wmq.8.2024.01.10.10.54.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 10:54:34 -0800 (PST)
Date: Wed, 10 Jan 2024 21:54:31 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: andriy.shevchenko@linux.intel.com
Subject: [bug report] backlight: hx8357: Convert to agnostic GPIO API
Message-ID: <642e1230-3358-4006-a17f-3f297897ae74@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Andy Shevchenko,

The patch 7d84a63a39b7: "backlight: hx8357: Convert to agnostic GPIO
API" from Dec 7, 2023 (linux-next), leads to the following Smatch
static checker warning:

	drivers/video/backlight/hx8357.c:612 hx8357_probe()
	error: potential NULL/IS_ERR bug 'lcd->im_pins'

drivers/video/backlight/hx8357.c
    580 static int hx8357_probe(struct spi_device *spi)
    581 {
    582         struct device *dev = &spi->dev;
    583         struct lcd_device *lcdev;
    584         struct hx8357_data *lcd;
    585         const struct of_device_id *match;
    586         int i, ret;
    587 
    588         lcd = devm_kzalloc(&spi->dev, sizeof(*lcd), GFP_KERNEL);
    589         if (!lcd)
    590                 return -ENOMEM;
    591 
    592         ret = spi_setup(spi);
    593         if (ret < 0) {
    594                 dev_err(&spi->dev, "SPI setup failed.\n");
    595                 return ret;
    596         }
    597 
    598         lcd->spi = spi;
    599 
    600         match = of_match_device(hx8357_dt_ids, &spi->dev);
    601         if (!match || !match->data)
    602                 return -EINVAL;
    603 
    604         lcd->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
    605         if (IS_ERR(lcd->reset))
    606                 return dev_err_probe(dev, PTR_ERR(lcd->reset), "failed to request reset GPIO\n");
    607         gpiod_set_consumer_name(lcd->reset, "hx8357-reset");
    608 
    609         lcd->im_pins = devm_gpiod_get_array_optional(dev, "im", GPIOD_OUT_LOW);
    610         if (IS_ERR(lcd->im_pins))
    611                 return dev_err_probe(dev, PTR_ERR(lcd->im_pins), "failed to request im GPIOs\n");
--> 612         if (lcd->im_pins->ndescs < HX8357_NUM_IM_PINS)
                    ^^^^^^^^^^^^
I think _optional() functions can return NULL.

    613                 return dev_err_probe(dev, -EINVAL, "not enough im GPIOs\n");
    614 
    615         for (i = 0; i < HX8357_NUM_IM_PINS; i++)
    616                 gpiod_set_consumer_name(lcd->im_pins->desc[i], "im_pins");
    617 
    618         lcdev = devm_lcd_device_register(&spi->dev, "mxsfb", &spi->dev, lcd,
    619                                         &hx8357_ops);
    620         if (IS_ERR(lcdev)) {
    621                 ret = PTR_ERR(lcdev);
    622                 return ret;
    623         }
    624         spi_set_drvdata(spi, lcdev);
    625 
    626         hx8357_lcd_reset(lcdev);
    627 
    628         ret = ((int (*)(struct lcd_device *))match->data)(lcdev);
    629         if (ret) {
    630                 dev_err(&spi->dev, "Couldn't initialize panel\n");
    631                 return ret;
    632         }
    633 
    634         dev_info(&spi->dev, "Panel probed\n");
    635 
    636         return 0;
    637 }

regards,
dan carpenter
