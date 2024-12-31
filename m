Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 715809FF041
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 16:34:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD26D10E67F;
	Tue, 31 Dec 2024 15:34:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="h0IxTvBu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C79C110E67F
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 15:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1735659279;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tmEjGEm1qqJclDuwwxfz/LXp5iHfy6EB/oyyHkg1LM0=;
 b=h0IxTvBulVWoR2bKIYzNLSAg7MymA7+myXFcvO4bl0oLvvVtyaF9TFeOgJ+IsL5UCGO/RR
 AMUkCcE5mla+VGAlv8VR4sOFsjJw15vgUItjPhlnI4RryaiShg2SCiZ6jYa/ZaaK09l+91
 tloYDWy8Ag7b1mm0auLOG+UsVPlINvQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-343-WtMSGK6INWCSrvvvVNuTQA-1; Tue, 31 Dec 2024 10:34:37 -0500
X-MC-Unique: WtMSGK6INWCSrvvvVNuTQA-1
X-Mimecast-MFC-AGG-ID: WtMSGK6INWCSrvvvVNuTQA
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4361ac607b6so78959565e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 07:34:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735659277; x=1736264077;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tmEjGEm1qqJclDuwwxfz/LXp5iHfy6EB/oyyHkg1LM0=;
 b=AV/zNEV03/8tjJ883whB13+gULfD2OY4RWGKmB+HY4kMMqKC0un3jgbeb+bfOkcwzn
 dZpzjAPWiAeCWAHfyjj+RDY0C9A2RpT7igfKO5fg0HYfYSLHMDt/PjK2E1E3Iz1QpnMQ
 KDeRjqIO/6RRIMYqRA9tn59vRh8KNyzsLWLxKUu647hzJbX846cS8Bd4ck+Dl6rrosA1
 +n9uWmVRsJlz6CduGfQ9+NXU1LNtaNBodREzKn23Vqzr2vYhqULxNzw8BuoyFHg2BGD7
 +mi5CdZW9KIIObSKSPhS6EvO8I0esDgn2jCNMBhBvmT4D6p1fxCiSomOkKO30kwI1M7q
 olww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNwmJ2vk2O16P4ayUr6QRJ9HIuzGyvhgptE81t3Je+sr7pRCKUbYYReO+bkoAPfnQ/8hdbuo7YOm0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzg9t0wUnpFOnpqTOFdNYt5jyLSw/aYscurij0p+BxMAHYnweQS
 j/68c1WDm6HzhfyAsjaMPbGWuvRlp2BZkGtMSBmjvW1fciqScRqyAmtTJGbDxx3r5o7dQHBuoSy
 uNgEUDJ5lznQsgjErK4H6HQERNZBnimUsSfCJxgN2BChVOuv/QNKCxCAEc8NSTJ0Q+w==
X-Gm-Gg: ASbGncv3qNqR0rlVlFi6Q55vSKHQEzmbEik2kEtbSB/nE1wSVAwVAoFSysNc8ylw0dV
 GcTg1No59nHhmCYACiJjAWW154NlrKzOJt9lO92o+OOwvtsrp2h57jjEZ83unry744y81hS4K/O
 /xE4rJhuLj7JGvPwOfg8F3GpWonTGV6MzIWq7rYhScPpFxMXfoauHGP8G2qOxTiu9DfSEjWwQ/y
 jOTZH7LdFhruygK8cnmu4uXPiUUNvTRCLhRyHOJ4h4oL/lhbUqiNVwMT/nXPS4M582AWPuX/GlC
 tjcZoVRSvYqPRztxeZGIWgzrKQ/7JjmeugB0pfM=
X-Received: by 2002:a05:600c:1c9f:b0:435:32e:8270 with SMTP id
 5b1f17b1804b1-43668642f9dmr333672065e9.14.1735659276711; 
 Tue, 31 Dec 2024 07:34:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG57ftpliFy4dkSMDQZZqJ3i+cFxIRMiXgo6LlmWrA0RD280HM2gTGmvzxIoyDtNbaErbk63g==
X-Received: by 2002:a05:600c:1c9f:b0:435:32e:8270 with SMTP id
 5b1f17b1804b1-43668642f9dmr333671815e9.14.1735659276343; 
 Tue, 31 Dec 2024 07:34:36 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c828cc8sm32991575f8f.17.2024.12.31.07.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Dec 2024 07:34:35 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, David
 Airlie <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/ssd130x: Set SPI .id_table to prevent an SPI core
 warning
In-Reply-To: <p2hzb3ysmthgfi4j6ehwulzk44zf4s5d6bm3nqs2rww47boshl@jr6aqmas4l5p>
References: <20241231114516.2063201-1-javierm@redhat.com>
 <p2hzb3ysmthgfi4j6ehwulzk44zf4s5d6bm3nqs2rww47boshl@jr6aqmas4l5p>
Date: Tue, 31 Dec 2024 16:34:34 +0100
Message-ID: <877c7fkgs5.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KBwWnc8004sl_-7o5V_OLWxaWcXHqd-zLMjEBNgAOIQ_1735659277
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

Hello Dmitry,

> On Tue, Dec 31, 2024 at 12:44:58PM +0100, Javier Martinez Canillas wrote:
>> The only reason for the ssd130x-spi driver to have an spi_device_id table
>> is that the SPI core always reports an "spi:" MODALIAS, even when the SPI
>> device has been registered via a Device Tree Blob.
>> 
>> Without spi_device_id table information in the module's metadata, module
>> autoloading would not work because there won't be an alias that matches
>> the MODALIAS reported by the SPI core.
>> 
>> This spi_device_id table is not needed for device matching though, since
>> the of_device_id table is always used in this case. For this reason, the
>> struct spi_driver .id_table field is currently not set in the SPI driver.
>> 
>> Because the spi_device_id table is always required for module autoloading,
>> the SPI core checks during driver registration that both an of_device_id
>> table and a spi_device_id table are present and that they contain the same
>> entries for all the SPI devices.
>> 
>> Not setting the .id_table field in the driver then confuses the core and
>> leads to the following warning when the ssd130x-spi driver is registered:
>> 
>>   [   41.091198] SPI driver ssd130x-spi has no spi_device_id for sinowealth,sh1106
>>   [   41.098614] SPI driver ssd130x-spi has no spi_device_id for solomon,ssd1305
>>   [   41.105862] SPI driver ssd130x-spi has no spi_device_id for solomon,ssd1306
>>   [   41.113062] SPI driver ssd130x-spi has no spi_device_id for solomon,ssd1307
>>   [   41.120247] SPI driver ssd130x-spi has no spi_device_id for solomon,ssd1309
>>   [   41.127449] SPI driver ssd130x-spi has no spi_device_id for solomon,ssd1322
>>   [   41.134627] SPI driver ssd130x-spi has no spi_device_id for solomon,ssd1325
>>   [   41.141784] SPI driver ssd130x-spi has no spi_device_id for solomon,ssd1327
>>   [   41.149021] SPI driver ssd130x-spi has no spi_device_id for solomon,ssd1331
>> 
>> To prevent the warning, set the .id_table even though it's not necessary.
>> 
>> Since the check is done even for built-in drivers, drop the condition to
>> only define the ID table when the driver is built as a module. Finally,
>> rename the variable to use the "_spi_id" convention used for ID tables.
>> 
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>
> Fixes: 74373977d2ca ("drm/solomon: Add SSD130x OLED displays SPI support")
>

I was on the fence about adding a Fixes: tag due a) the issue being there
from the beginning as you pointed out and b) the warning being harmless.

But I'll add it to v2 or just before pushing it to drm-misc-next.

> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>

Thanks for your review!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

