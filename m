Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70456990D7D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 21:11:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D0D10E0CE;
	Fri,  4 Oct 2024 19:11:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Hq8MCkBk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B138910E0CE
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 19:11:39 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id
 ca18e2360f4ac-82aa7c3b482so96652839f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Oct 2024 12:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1728069098; x=1728673898;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7DGtjofFLon4QI6Cl3zgL4lNfBVb4VEqAk2u1rUhYQc=;
 b=Hq8MCkBkP+nzLM5FuB+mX91srA4Cdtit80P/4lfOkD0oVy1Sm8Bkr8OPw+kxRXSi+I
 xq+e95wohIAlxHvn9W4cr+4pH8gZ7l7hEYfvFhe3yzcNPLpG9Bv7yPltfW09r+gHYjQ9
 2n/susC1YCAwwlZh24M9d7xMh+EfFpwEEC54I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728069098; x=1728673898;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7DGtjofFLon4QI6Cl3zgL4lNfBVb4VEqAk2u1rUhYQc=;
 b=QrNjqQcKUdmMQUYf0fTU9D0rDmBBJ2DqU2iEITa9nRUmqeyfDYQ16dQ2kztI9VfHCi
 svcABfrTAOVdsiqduFUaCV/Dh2nTQ+ZdRIh7ZziL54SOHNIKQRhUQGbqjy6GnVwJurZo
 VCD/D2/0gOzZTY5iDy+UNvETorGoDc6mVmpag4L6m/zclS6tsJfzIcVPlxV7dZhwAOhb
 0KEzn23z5lneVmiMyqrnRzEIJ6KMMSh9I2XLGyS6vkwTwP4T0KPiK08/qsFg2Fo3Zbbn
 1DUYgMtWvgtvq54L5HXwkIkRup5ae3AHMdWa+J+bXDR4qesF67nAzrQG+ATk5BEsL4nR
 G+NQ==
X-Gm-Message-State: AOJu0YxsX3t2j6r3QHkndp2auHMTF2ueROloTOAku95cWhKYG5Kcpiev
 JPzl7wv7o+R2WvbEEejwe1KkpPa4mi7M6cvBGcnXuFfa+Jq7yuEzbOHk6HTWWjc=
X-Google-Smtp-Source: AGHT+IFNSzR4jqR8T4dR5f3ZGvvXjjrep3zTEoQa8V0+74iUAXaRYs9EdKpIP63gWvQZvCpNMFctZg==
X-Received: by 2002:a05:6e02:12e5:b0:3a1:d180:15b4 with SMTP id
 e9e14a558f8ab-3a375bd2fb8mr34757425ab.23.1728069098538; 
 Fri, 04 Oct 2024 12:11:38 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
 by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a37a7e7c23sm980315ab.4.2024.10.04.12.11.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Oct 2024 12:11:37 -0700 (PDT)
Message-ID: <532edd71-93c3-4d90-ac98-9763993807fa@linuxfoundation.org>
Date: Fri, 4 Oct 2024 13:11:36 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/atmel_hlcdc: Fix uninitialized variable
To: Advait Dhamorikar <advaitdhamorikar@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Boris Brezillon <bbrezillon@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, anupnewsmail@gmail.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20241004150849.70883-1-advaitdhamorikar@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20241004150849.70883-1-advaitdhamorikar@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 10/4/24 09:08, Advait Dhamorikar wrote:
> atmel_hlcdc_plane_update_buffers: may use an uninitialized
> sr variable when the if condition remains unsatisfied
> 

As mentioned in my response to another one of your patches,
include how you found the problem in the change log.

> Signed-off-by: Advait Dhamorikar <advaitdhamorikar@gmail.com>
> ---
>   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> index 4a7ba0918eca..4150c4d0b4f2 100644
> --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> @@ -559,7 +559,7 @@ static void atmel_hlcdc_plane_update_buffers(struct atmel_hlcdc_plane *plane,
>   	const struct atmel_hlcdc_layer_desc *desc = plane->layer.desc;
>   	struct atmel_hlcdc_dc *dc = plane->base.dev->dev_private;
>   	struct drm_framebuffer *fb = state->base.fb;
> -	u32 sr;
> +	u32 sr = 0;
  
>   	int i;
>   
>   	if (!dc->desc->is_xlcdc)

sr could be used uninitialized in the for loop, !dc->desc->is_xlcdc
case. However, is 0 the right initialization for this value?

thanks,
-- Shuah
