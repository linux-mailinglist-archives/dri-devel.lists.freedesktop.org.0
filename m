Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 784579EE417
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 11:28:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 649D110ED4E;
	Thu, 12 Dec 2024 10:28:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="eoNrv3kT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B489910ED4E
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 10:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1733999283;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RVaq2qSCQwPtfs8iwrJJIk50sgodNy897IFKHraNxV0=;
 b=eoNrv3kTdyGCALLyubC7sVES50C1ca68qHvpX/blnr1ujX8Fb+Nmd27KhJ2hMy1i5b1/eu
 tP1a7i+yWJ1HT5vf7Kcy+5u2HbWF3yQ0qnHAja1QDdMm5RdA5MMnzvJJh+LTtrLJSmCuIW
 yf3AEyFt7qBAm5wWfAqrBwxVSwp0Z4I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-sggT7EcENfaJ_6P8XzC10A-1; Thu, 12 Dec 2024 05:28:02 -0500
X-MC-Unique: sggT7EcENfaJ_6P8XzC10A-1
X-Mimecast-MFC-AGG-ID: sggT7EcENfaJ_6P8XzC10A
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43624b08181so2609995e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 02:28:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733999281; x=1734604081;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RVaq2qSCQwPtfs8iwrJJIk50sgodNy897IFKHraNxV0=;
 b=P0pjdPcYs52PrThyRF/XHt4DOoAoc+cGAU+N8VuJvEtsp9OtqjERBoCF1BajKgib1c
 DCC6nOPl1p53HQIDPIxtIxkXlvgXlz0c3bx0MZ0yEE3TaEAO/TpK9V/lYovT9VfSVgEK
 qj54EFiv8LcDSGscwN/slm8barlsVwE5R8D1954fFsnwXx+N5pBr0SvPD+J96/8ZQyWd
 oUGnHya6inPnFRG3uEq12ve/2o3XcDKoB4xKkFTKE6AK/C07NdlgqKy6g0LxHt2mk2sP
 pLfpM1CAeeeK5SMYutM4qt+t13afQSgbfi6smXKnn8f5uOHFbgtXUwVgNy5GApEA00qd
 muPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGBTnfhA58xLZ684u34ol0Yf1ufBGWYq0q6WQcZDs7CYDAduVOQcitm4m9U6pUWODi57AqNbSD3GA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzFb86+Q58Xf1xipDqymGlyy3KSCARVP/gpTDJFplHeh5kpyyGn
 NS5hR9yOdEBEf4BPFRrMVSwQnNHRUGKm5OIbRdlwME7E4mSHoQjWJx7+ref+qRm10IaMJFWu7B/
 yhONBwGsxZ/elqjG2bjYyesH6JQH/YF9axhjyOjH5RBMMIpQIzILCoPWvAbfhXlAKng==
X-Gm-Gg: ASbGncuxQpBMybmcbalb1HklruKbUBvShHi9OgpkSqNt7TNnSiPW4nnwTRuQToIN1Bi
 6xbX4j6VlR2TzXhMAKko4+LPownNf4iXv8E3ppH3YJQtZzJvwtrQhxdRn1TGDL0ZzgRV8QACJnz
 krE5gDiChRO3InpFmKp0qMECzv5tzBXWkC3WgWK9BgtYdN+ovLHGmxdHtE1LvC925UL2SZoxv3b
 V2eOrqvDGLqyfm95U4cy18nGpYLvv2N2/ELgTMy2sT/0aT6W6uySoZFqTHHnuVsjPok3jOdPrWb
 maBd5WYDHazVvBv8FA91
X-Received: by 2002:a05:600c:1f13:b0:434:92f8:54a8 with SMTP id
 5b1f17b1804b1-43622e1d89fmr17568355e9.0.1733999281046; 
 Thu, 12 Dec 2024 02:28:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGJgRY5o2EC5V/rXg0TUe4GYsezYBjI8CpktJ+KXMUbQXgvlQPxsTnXuvrx2+8Cjx8dMTUWOQ==
X-Received: by 2002:a05:600c:1f13:b0:434:92f8:54a8 with SMTP id
 5b1f17b1804b1-43622e1d89fmr17568045e9.0.1733999280683; 
 Thu, 12 Dec 2024 02:28:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436256b7d46sm12216165e9.35.2024.12.12.02.27.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 02:28:00 -0800 (PST)
Message-ID: <4dccaf7d-09b1-49c6-a9de-ec327eafaf13@redhat.com>
Date: Thu, 12 Dec 2024 11:27:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/client: Fix drm client endless Kconfig loop
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 John Ogness <john.ogness@linutronix.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "Guilherme G . Piccoli" <gpiccoli@igalia.com>,
 bluescreen_avenger@verizon.net, Caleb Connolly <caleb.connolly@linaro.org>,
 Petr Mladek <pmladek@suse.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Dan Carpenter <dan.carpenter@linaro.org>
References: <20241212091153.1592096-1-jfalempe@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20241212091153.1592096-1-jfalempe@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nYoF64eI4-yRJtC0zw77hWvPj_HZdLf504zbC6jYUSM_1733999281
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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

On 12/12/2024 10:11, Jocelyn Falempe wrote:
> if DRM_CLIENT_SELECTION is enabled, and none of the client is, the
> "Default DRM Client" choice is empty, and this makes Kconfig goes
> into an infinite loop of:
> 
>    Default DRM Client
>    choice[1-0?]: 0
>    Default DRM Client
>    choice[1-0?]: 0
>    Default DRM Client
>    choice[1-0?]: 0
>    ....
> 
> So only allow the choice if at least one of the client is selected.

I've pushed it to drm-misc-next, endless Kconfig loop is not fun for CI.

Best regards,

-- 

Jocelyn

> 
> Fixes: f7b42442c4ac ("drm/log: Introduce a new boot logger to draw the kmsg on the screen")
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> Tested-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/gpu/drm/clients/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/gpu/drm/clients/Kconfig b/drivers/gpu/drm/clients/Kconfig
> index c18decc90200..82a7d4e584dd 100644
> --- a/drivers/gpu/drm/clients/Kconfig
> +++ b/drivers/gpu/drm/clients/Kconfig
> @@ -87,6 +87,7 @@ config DRM_CLIENT_LOG
>   choice
>   	prompt "Default DRM Client"
>   	depends on DRM_CLIENT_SELECTION
> +	depends on DRM_FBDEV_EMULATION || DRM_CLIENT_LOG
>   	default DRM_CLIENT_DEFAULT_FBDEV
>   	help
>   	  Selects the default drm client.
> 
> base-commit: 19851fa2ba9824bede16f55234f63d9423897c3d

