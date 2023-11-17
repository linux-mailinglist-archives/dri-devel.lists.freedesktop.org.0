Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B053B7EED10
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 09:04:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B8A710E722;
	Fri, 17 Nov 2023 08:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C8610E722
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 08:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1700208235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SSjGLJu7XF01eP3l5L5+n+lDfOwEOlxpIkXKZr/vgis=;
 b=AMPzoTTFJWM+vhe7yacMlTYJwYh5aR2DvTIv1eWwheL4CM8PM2GfeTlrRG0OylHv5KpLx+
 bZjB5QVfWk6A1mcV2WaiGnbsi/puEGs0dVeuBW4Ry/2HXlXT6XVYhmxEuJyd8dlzZwx2p0
 1A5Gn6XT+6b7wP3J19qNbFv59ihZnu0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-fbda6O4LMveglv1tGY2EoQ-1; Fri, 17 Nov 2023 03:03:54 -0500
X-MC-Unique: fbda6O4LMveglv1tGY2EoQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-32f8c4e9b88so796420f8f.0
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Nov 2023 00:03:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700208233; x=1700813033;
 h=mime-version:message-id:date:references:in-reply-to:subject:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SSjGLJu7XF01eP3l5L5+n+lDfOwEOlxpIkXKZr/vgis=;
 b=a5tEI6hxuf+9Hq/Qq4129WJMeZqOUU+Vqp7uQqdWiMdZfUcR//6MH4eNq9SkXm7SSR
 VoWsy4IN94QQyNr0z5tpv4Cm9Kt5HSQ8c4mCBE/ihKAlgt1XgSmcjdv5srNR7ZPoexOI
 l6/tWDpfhvZoT1p6ex5uRb/uY7m+wQyjQcljlxbsenTIt8hsfkaaQ6VHjsW4HGJ4CJiU
 Bj6LmE79oDnWmTKdcfNr6tjhbb7ZKUsb+dFhsW9YZE+fLQzuPIT5br4et+Qzv0f25uZh
 ZR/h/EAMy3wmrHzcItEbxj9FJD0npmW7UsQnAp6iycbZPa+ywQbqUP2yNYK8yMP86e2D
 PbRQ==
X-Gm-Message-State: AOJu0Ywms8aqOTPwY80UDz87JngIe1EJJk/WRQ5kpgGoQx5E9/An/mo1
 +ilfNEBT17iPJf9FW1upOwX80ypKtJIiLKEbDY8zXh3VMzMjZDByb3wDT6aq/qmyhF2m5XClSmp
 8Ej+HuC9+XvNchTue4lFe1silgQv5
X-Received: by 2002:a5d:47c2:0:b0:32f:c188:38ec with SMTP id
 o2-20020a5d47c2000000b0032fc18838ecmr4365808wrc.16.1700208233052; 
 Fri, 17 Nov 2023 00:03:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZ3B8sBxZjOwVSuhhG1BKCYOiHR+59JD/uoZSEiTZfAGQV+12ksFl2dbvoDPKTF+TX0GP6HQ==
X-Received: by 2002:a5d:47c2:0:b0:32f:c188:38ec with SMTP id
 o2-20020a5d47c2000000b0032fc18838ecmr4365785wrc.16.1700208232750; 
 Fri, 17 Nov 2023 00:03:52 -0800 (PST)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r7-20020a056000014700b0032fab28e9c9sm1525182wrx.73.2023.11.17.00.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 00:03:52 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Mostafa Weshahy <mweshahy@yahoo.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org, mweshahy@yahoo.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 daniel@zonque.org
Subject: Re: [PATCH] drm/ili9163: Add "1.8-128160EF" to spi_device_id table
In-Reply-To: <20231116185124.13887-1-mweshahy@yahoo.com>
References: <20231116185124.13887-1-mweshahy.ref@yahoo.com>
 <20231116185124.13887-1-mweshahy@yahoo.com>
Date: Fri, 17 Nov 2023 09:03:51 +0100
Message-ID: <87fs1424d4.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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

Mostafa Weshahy <mweshahy@yahoo.com> writes:

Hello Mostafa,

> drm/ili9163: Add "1.8-128160EF" to spi_device_id table
>
> Currently enabling CONFIG_TINYDRM_ILI9163 driver - regardless of the device
> tree - results in the below confusing log line:
> SPI driver ili9163 has no spi_device_id for newhaven,1.8-128160EF
>
> This commit fixes this false alarm by adding "1.8-128160EF" to
> spi_device_id table of ili9163 driver.
>

It's not actually a false alarm, this is needed if you want the driver
module to be automatically loaded. Because the SPI core always reports
a MODALIAS of the form "spi:1.8-128160EF" even if the device has been
registered by OF.

So this is an actual fix since this driver can be built as a module.

> Signed-off-by: Mostafa Weshahy <mweshahy@yahoo.com>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

