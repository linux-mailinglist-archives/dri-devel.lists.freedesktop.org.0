Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB48B3E6AF
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 16:08:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B6F010E463;
	Mon,  1 Sep 2025 14:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZX4cs4sF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0D1B10E463
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Sep 2025 14:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756735713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JG3k34WesFMCtdXqENehSrO9ASZMVDjiI7ZPCvnu0ec=;
 b=ZX4cs4sFiBdF2+1cf6HgNVp0GxD7qy1P1BvSrs6hZ7JFZduHhm9R5c7Sx3TdA7dm2QwUEL
 W4ISZ0KkBuFjasAOKBEwDNHhHiJUx++zRvs66MoNJ33g89LHfkkApQoGEINObYJ/xpamWy
 fHkXWFW5YgEYSlt8fju3AtdvwzRXqU0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-4CetT7ACNTe-WSn7O5eo1A-1; Mon, 01 Sep 2025 10:08:32 -0400
X-MC-Unique: 4CetT7ACNTe-WSn7O5eo1A-1
X-Mimecast-MFC-AGG-ID: 4CetT7ACNTe-WSn7O5eo1A_1756735711
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-45a15f10f31so41390285e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Sep 2025 07:08:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756735711; x=1757340511;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JG3k34WesFMCtdXqENehSrO9ASZMVDjiI7ZPCvnu0ec=;
 b=CrNbVyz1wnhg6m6UGDIPysZrqmPs4kTdu4rtc3v/ZHL4cAHzD8maRxuBcsR+QfE6QE
 QNfpN6BcwTHp1WeHHK85oRkUjnQr1aqK/qtqjH1C0irUlrTvkNcik3pw2lvEgH2dR5nm
 DMPC4apqPGeA2ULaMoxgoID+bjxkxIXLn0HaNqvV1kUjF/79K+qoWvXTbJWssGOxMBzZ
 stTnue8V7QA5Uq1PDV+rUEviYsz/Vy6DMlQNCKUXpbGCmuIfbro4AIUT8oHW9dtnUW7r
 YLBCzFb3hq830wqHArvaWk13qaij+Qg4rT0i4h9e4qOo3hdAQ2tuw+Dqio+Grdx6rJBF
 MbeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5Jaaqu0FEhqRrADfLRmu23+JxiBDZKvn48IO20gUbVEyEOHxqQ6Z0WqlXFP06nyg0Kc/KToiNifc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKzokcn8AjvpDT1dgwcjnb8VMIPq3izE/qUfjj6G8Y8LmtGeu3
 dLwYj4dY7LBUfqIbukEXEiQVgMQiXWz/1DcJPkxCxA40dN/85JIrPQpsIkScPgpSSNoFnPsc9gV
 XGkpx28Pz0d0bynBIOJXaH9HzObaFKXsLznFd+Iflj6K68uV8rPXdkdTBK8wEU5GpyTb9ig==
X-Gm-Gg: ASbGncttML3zDUc6lLGHvfWLL9sWVUlDBmhfJ7jOBHFOyB8fkoqjXaUXGfJRShWGSi6
 cvGEhju/V2LyLp5dstiIpNCdYxlgRxr3H8ieD7pFusXl7fyh8mLNpy9Yi1IgvMgFe3lJITgcF8D
 ugfzY7xh0876fmsGElB+7DN4+KCoHZ04t56osKOLnOmRjbTXZuJ0L4QTvvCyRyAPgYQejoXjefI
 wID/vtBhSzwL41OtiC6ESTRropGKKE55cTd9sHfD3T6H9HAmWqFwmem25/iBwEgBbLOaOliNqrC
 /I43jfJm0w7BfPk886/mMkD/KrsM+NxLwQI7S0net6oRh+8i4YbWpQsPK/y+Oolpcw==
X-Received: by 2002:a05:600d:1c:b0:45b:8b95:7119 with SMTP id
 5b1f17b1804b1-45b8b957228mr38686445e9.8.1756735711431; 
 Mon, 01 Sep 2025 07:08:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF65HlIg6+uyOeqqsJwBsKXgJDxHMdxpxLS9KnNW9siKf0q8SvCMuKt144dJd4GbtZBArffKQ==
X-Received: by 2002:a05:600d:1c:b0:45b:8b95:7119 with SMTP id
 5b1f17b1804b1-45b8b957228mr38686065e9.8.1756735710875; 
 Mon, 01 Sep 2025 07:08:30 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45b6f0c6b99sm239483635e9.4.2025.09.01.07.08.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Sep 2025 07:08:30 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Liao Yuanhong <liaoyuanhong@vivo.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Subject: Re: [PATCH] drm/ssd130x: Remove the use of dev_err_probe()
In-Reply-To: <20250820131416.500048-1-liaoyuanhong@vivo.com>
References: <20250820131416.500048-1-liaoyuanhong@vivo.com>
Date: Mon, 01 Sep 2025 16:08:28 +0200
Message-ID: <87plcafeoz.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xw_Oc2bhkUuWptwt4q-_VXZZabs375quTbirmMdfo8w_1756735711
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

Liao Yuanhong <liaoyuanhong@vivo.com> writes:

Hello Liao,

Thanks for your patch.

> Logging messages that show some type of "out of memory" error are generally
> unnecessary as there is a generic message and a stack dump done by the
> memory subsystem. These messages generally increase kernel size without
> much added value[1].
>
> The dev_err_probe() doesn't do anything when error is '-ENOMEM'. Therefore,
> remove the useless call to dev_err_probe(), and just return the value
> instead.
>
> [1]: https://lore.kernel.org/lkml/1402419340.30479.18.camel@joe-AO725/
>
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---
>  drivers/gpu/drm/solomon/ssd130x-spi.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/solomon/ssd130x-spi.c b/drivers/gpu/drm/solomon/ssd130x-spi.c
> index 7c935870f7d2..b52f5fd592a1 100644
> --- a/drivers/gpu/drm/solomon/ssd130x-spi.c
> +++ b/drivers/gpu/drm/solomon/ssd130x-spi.c
> @@ -74,8 +74,7 @@ static int ssd130x_spi_probe(struct spi_device *spi)
>  
>  	t = devm_kzalloc(dev, sizeof(*t), GFP_KERNEL);
>  	if (!t)
> -		return dev_err_probe(dev, -ENOMEM,
> -				     "Failed to allocate SPI transport data\n");
> +		return -ENOMEM;
>  
>  	t->spi = spi;
>  	t->dc = dc;
> -- 
> 2.34.1
>

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

