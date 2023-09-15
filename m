Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE95B7A2B0D
	for <lists+dri-devel@lfdr.de>; Sat, 16 Sep 2023 01:42:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C36B610E09C;
	Fri, 15 Sep 2023 23:41:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9629B10E09C
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 23:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694821308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=edIC9kHaNwOD1pTTtXCPXcwng2iTsOm0qnQsvYt9crA=;
 b=F6ThmuDN9ED2sLno5eLgNJ3TOSZQhpyLX57KgErm7KOqMJ5mOmG+0aS+EUAJZPms7ja1ws
 ceODlCr3WEzenjsR6wo3IcUfo893rxQQ0znEDyVPBxS2/EjKnxhORzXiBV8d6kL6rg8DLR
 /y07wrvRVtljsobOS1/40ZIbACUyZWo=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-541-fjHxCJ6MM4iSZ4frcj3itA-1; Fri, 15 Sep 2023 19:41:47 -0400
X-MC-Unique: fjHxCJ6MM4iSZ4frcj3itA-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2bcba79cedcso33600201fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Sep 2023 16:41:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694821305; x=1695426105;
 h=content-transfer-encoding:in-reply-to:organization:content-language
 :references:cc:to:subject:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=edIC9kHaNwOD1pTTtXCPXcwng2iTsOm0qnQsvYt9crA=;
 b=runnLHoMy+Nry9TyzXK4crgBp2VDrjV8iWENBix60C8ihFG8vm6W7ZFmo6g49T2ocC
 v7/tRHh+lgIpNKHRdKNuIGaEtfDYiz9g0BzBFN5Q7EJ5IQH2351mWw5xs6NrlhtdmseG
 0V/aArwUSKuYB8FEn0bQWqJKChOqqK7yTB5R+r4CdD1KdyRp7xWJFyPAmkfyUNVhZTio
 r3Np38crmq0ZLzxTsneVoU4Dvg5Ys0EVf3AdUzd2S0aD/j/cgwWNJyrIvR7dCpK7A7nl
 UrFhn172X9hyfn6/suc24gtbtWrmyymtmrLY6LEfcB1KwAwCB5Bb4D2VlJBvM9aoLyVY
 X4+Q==
X-Gm-Message-State: AOJu0Yxl1QhfxHWgZoTa+AI8jpnruLlmwvrvzwqLFPtqvAA43EZicULw
 8N8s0Oq3US5LJzoxY/uMFZHdwBtEFJFxAyTurRbBSpB0K17cPZY9uQs1b4IPNW7cgaBWNUCE2ZR
 h771JRoeAdo9ljI77dqfHvA2VTKPc
X-Received: by 2002:a2e:9253:0:b0:2bc:cdcf:d888 with SMTP id
 v19-20020a2e9253000000b002bccdcfd888mr2658339ljg.46.1694821305691; 
 Fri, 15 Sep 2023 16:41:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9+l585nVbXHSkBW0mkzB95UWueF5p/qZnXWYxc2gJoge0k2BB4n4o2GvzYDyCESm4Esitfg==
X-Received: by 2002:a2e:9253:0:b0:2bc:cdcf:d888 with SMTP id
 v19-20020a2e9253000000b002bccdcfd888mr2658325ljg.46.1694821305374; 
 Fri, 15 Sep 2023 16:41:45 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a1709064f0200b0099bcf1c07c6sm2989814eju.138.2023.09.15.16.41.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Sep 2023 16:41:44 -0700 (PDT)
Message-ID: <91865741-dd19-39ad-9042-d34ed32e0552@redhat.com>
Date: Sat, 16 Sep 2023 01:41:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [Nouveau] [PATCH] nouveau/u_memcpya: fix NULL vs error pointer bug
To: Dan Carpenter <dan.carpenter@linaro.org>, Dave Airlie <airlied@redhat.com>
References: <10fd258b-466f-4c5b-9d48-fe61a3f21424@moroto.mountain>
Organization: RedHat
In-Reply-To: <10fd258b-466f-4c5b-9d48-fe61a3f21424@moroto.mountain>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dan,

On 9/15/23 14:59, Dan Carpenter wrote:
> The u_memcpya() function is supposed to return error pointers on
> error.  Returning NULL will lead to an Oops.
> 
> Fixes: 68132cc6d1bc ("nouveau/u_memcpya: use vmemdup_user")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>   drivers/gpu/drm/nouveau/nouveau_drv.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
> index 3666a7403e47..52a708a98915 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -193,7 +193,7 @@ u_memcpya(uint64_t user, unsigned int nmemb, unsigned int size)
>   	size_t bytes;
>   
>   	if (unlikely(check_mul_overflow(nmemb, size, &bytes)))
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);

I plan to replace this function with an upcoming vmemdup_array_user() helper,
which returns -EOVERFLOW instead, hence mind using that?

Unless you disagree, no need to resubmit the patch, I can change it before applying
the patch.

- Danilo

>   	return vmemdup_user(userptr, bytes);
>   }
>   

