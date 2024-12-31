Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CE69FF018
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 16:05:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4429410E0A6;
	Tue, 31 Dec 2024 15:05:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qE72FhV3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A6F510E0A6
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 15:05:46 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-30167f4c1e3so37459361fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 07:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1735657485; x=1736262285; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=i1vigFnqxA3XKtyGRWWvxidGs45utZTgwpjbKLpb7hw=;
 b=qE72FhV3j85d+chkIBL+mAbkIcN5gvNjhiJTI7zIGRPFoAe9QY0i9plvZHUA0Pq1Ao
 fHKe2ht1a0ub/b7DKjR0ljhd6PVadVGIGYMKuw+I+OdRyEQZBb3MN1bIyXKHEutasM/y
 HGYwZruOyLkK1mWG2G8J6LG/d0LDWQgAQxyGWqlZRP+YgB4U95FA4W3FjpJ0nAgga0eR
 ylJ40J90RS13B76C9zeIBA+2gg1X0Ao32bRPITOyiLcRf0XdHAk8X0EC242WA3cO9FEv
 IwexHHFoEQzbAiZhuNHln4ZlwdJi/4ze8o4nhZNSi2sFZTjZtJu5ijSg3CDcr9sI/OSO
 +lKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735657485; x=1736262285;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i1vigFnqxA3XKtyGRWWvxidGs45utZTgwpjbKLpb7hw=;
 b=AKhw/+0pLhVm719xAbKGS7jVyorJIGf2OBVg033h1SPOUEZ3PxwAuL2Y+UOlwZO+LB
 eNv24F5cTCT/tyDOifox3Z9ZmlKWfKut9Xbc3ijD/Pq97oEprUF7lMa1sOuLThGxI1Mg
 TOR7EJ0+dKZ6p2SR/cac4bPJQkZqhV9LfK+Pw8Pa8KmjJeyalNklygE8L8dUkUXR29h3
 DBFT8RMmSNZjLAFqGsgXUtQGrngYiMdRw+TOKcqZfd53ov8GeKWOuyHMxVIxQl4dw0Xw
 VnjGenc9hKwdia/Ul7P+84snkZvSwaVUMnFD48cBYz31yRmEXZAS/Rv3JgETwUE2FCT7
 NyvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcWpYmCxnZzxtLoIh5ymZ6kffq+nVV/8DK0/4mcD1Ez1+Kvo9UI4apeGcM6Ta6b7I30z5M6xQx1lQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyfxv/3P6E3EkIG+bI/zGTmsNK6DCf2xBORUPtUpvNqRH61rSXW
 tnVhDPavLHSEmWcBjbHuVEALuXfXTXMyPyXN2QHW01Y9SdpyLr5astJLqT+3wh5xQJCd02h/bdD
 Z
X-Gm-Gg: ASbGnctekQXn9GoREIAYl5B/nWWdzwuRs0wQZhbDe3Rhy7ETq2N38gjD7sh0Wil2m16
 bYJaYdSKt87QipfXTLSf/83S8Nkt89Qo0JV8GywSHZgUJcDvfoPPwhcf8rVzE/Vh3zKDJo19N0x
 MqSnUFqQPJ3REYU1dJJPMYgm2t0AieuJtTvzq+QUbzvWx/H32hLlD6oL0j+vhVkFFtqf7fCFCTw
 b7Kkiw7jbsR9FDS5nB7ZseN1FBtBkqq5zxbZ4RFOq4KMXYOfE08YT7fMiPb+bXzqewExO7TW/Dd
 9UCu6SaEsbuFU8f7TQ7oyJtYr2qArMUgjR4/
X-Google-Smtp-Source: AGHT+IF2xVrrT8EcrTcdjbd6aaWZisUeUxKqFjnOFff4bH/wNVNLQkEIRK6it0prQ4rVsFMEdsxE4A==
X-Received: by 2002:a05:6512:23a7:b0:541:4900:7c42 with SMTP id
 2adb3069b0e04-5422955fdebmr13222167e87.43.1735655797819; 
 Tue, 31 Dec 2024 06:36:37 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54223821449sm3369148e87.172.2024.12.31.06.36.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Dec 2024 06:36:36 -0800 (PST)
Date: Tue, 31 Dec 2024 16:36:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/ssd130x: Set SPI .id_table to prevent an SPI core
 warning
Message-ID: <p2hzb3ysmthgfi4j6ehwulzk44zf4s5d6bm3nqs2rww47boshl@jr6aqmas4l5p>
References: <20241231114516.2063201-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241231114516.2063201-1-javierm@redhat.com>
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

On Tue, Dec 31, 2024 at 12:44:58PM +0100, Javier Martinez Canillas wrote:
> The only reason for the ssd130x-spi driver to have an spi_device_id table
> is that the SPI core always reports an "spi:" MODALIAS, even when the SPI
> device has been registered via a Device Tree Blob.
> 
> Without spi_device_id table information in the module's metadata, module
> autoloading would not work because there won't be an alias that matches
> the MODALIAS reported by the SPI core.
> 
> This spi_device_id table is not needed for device matching though, since
> the of_device_id table is always used in this case. For this reason, the
> struct spi_driver .id_table field is currently not set in the SPI driver.
> 
> Because the spi_device_id table is always required for module autoloading,
> the SPI core checks during driver registration that both an of_device_id
> table and a spi_device_id table are present and that they contain the same
> entries for all the SPI devices.
> 
> Not setting the .id_table field in the driver then confuses the core and
> leads to the following warning when the ssd130x-spi driver is registered:
> 
>   [   41.091198] SPI driver ssd130x-spi has no spi_device_id for sinowealth,sh1106
>   [   41.098614] SPI driver ssd130x-spi has no spi_device_id for solomon,ssd1305
>   [   41.105862] SPI driver ssd130x-spi has no spi_device_id for solomon,ssd1306
>   [   41.113062] SPI driver ssd130x-spi has no spi_device_id for solomon,ssd1307
>   [   41.120247] SPI driver ssd130x-spi has no spi_device_id for solomon,ssd1309
>   [   41.127449] SPI driver ssd130x-spi has no spi_device_id for solomon,ssd1322
>   [   41.134627] SPI driver ssd130x-spi has no spi_device_id for solomon,ssd1325
>   [   41.141784] SPI driver ssd130x-spi has no spi_device_id for solomon,ssd1327
>   [   41.149021] SPI driver ssd130x-spi has no spi_device_id for solomon,ssd1331
> 
> To prevent the warning, set the .id_table even though it's not necessary.
> 
> Since the check is done even for built-in drivers, drop the condition to
> only define the ID table when the driver is built as a module. Finally,
> rename the variable to use the "_spi_id" convention used for ID tables.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Fixes: 74373977d2ca ("drm/solomon: Add SSD130x OLED displays SPI support")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> ---
> 
>  drivers/gpu/drm/solomon/ssd130x-spi.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 

-- 
With best wishes
Dmitry
