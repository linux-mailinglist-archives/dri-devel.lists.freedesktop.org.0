Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83199569D87
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 10:37:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4557614A2EB;
	Thu,  7 Jul 2022 08:37:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FC6714A2E7
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 08:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657183067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JgjCMYYYYbD+7nzC3JNyNoJAUPo1OhUBmzurjGPS2hA=;
 b=PqH1S19R4P9pRxEdpd7FZLsku4LPs+M4G++rKQHW2JlxIkJhlisrfJcp9Kjw378igWLhQh
 dcOlDSB8MPH6BPTjxEHGggpudnVLhPUmDgUxjrkMkpU50k+ovEw+c9R++43i0QOUsw+/cW
 z1S/u8whZaV6o+XtBLAXAzh1ipBxQYc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-fMDmFXtoONaZ0IDtIU9zNw-1; Thu, 07 Jul 2022 04:37:46 -0400
X-MC-Unique: fMDmFXtoONaZ0IDtIU9zNw-1
Received: by mail-wm1-f72.google.com with SMTP id
 h12-20020a05600c28cc00b003a2d3e91d7eso29483wmd.9
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 01:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JgjCMYYYYbD+7nzC3JNyNoJAUPo1OhUBmzurjGPS2hA=;
 b=zqm/mSeRhIWnFTyMEQjx0+jBcgge/sCsQWblFTVKkdjtrX3LRrSeqQhRpE47A+il5z
 7pxspJ7yYO3u3vnb9ks1lL6/IxtixM/DXeZlufPFgpIPZUBGLZLDpDNE9V/mQeOMUAo9
 RJdHzqWfELeujneiiM2wl+MHR8X9A5SGbJ3GOh9nr9zgCvcmxWY5l7feMSeqcjUmsLhl
 6k+s0GJCjyTux0LIbJvk0S36LUnW4FOL0d7I82H6BcMuzreO2s6q6LswzIg10bktP/eb
 fuX5WYBwvFXl5OJCmhAgvDo61trsHmuT+U2rd1xIRad5nK+JugZTkoskHsnB4OKYnhH0
 1iog==
X-Gm-Message-State: AJIora8SYZMUx/wlRUvBuyeRuOtfehKxffga3FbrxhsfsLAnGoy40Vh9
 Hddgv1LB4/jFF8+l45agckfC2Dj/Pan/63H4nVcRLxbkty2Gzu+Gleme8VmDQtccYKlTmYBr1UM
 eU8k4YMkfipTY4maxU7hHO0Rwojcf
X-Received: by 2002:adf:f345:0:b0:21d:6a26:6d8f with SMTP id
 e5-20020adff345000000b0021d6a266d8fmr20062523wrp.538.1657183065409; 
 Thu, 07 Jul 2022 01:37:45 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vGDFTJizoTec2RmWMWm7DPKvwwJtfgBlSf/7G51X5GmjZNAHupXyU1auc5WNVNR/wUiRxmyA==
X-Received: by 2002:adf:f345:0:b0:21d:6a26:6d8f with SMTP id
 e5-20020adff345000000b0021d6a266d8fmr20062507wrp.538.1657183065164; 
 Thu, 07 Jul 2022 01:37:45 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 v13-20020a1cf70d000000b0039747cf8354sm28347968wmh.39.2022.07.07.01.37.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jul 2022 01:37:44 -0700 (PDT)
Message-ID: <2ae24b07-92ae-8bdb-8b2d-f90a4a9557a9@redhat.com>
Date: Thu, 7 Jul 2022 10:37:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/ssd130x: Fix pre-charge period setting
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20220706184133.210888-1-ezequiel@vanguardiasur.com.ar>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220706184133.210888-1-ezequiel@vanguardiasur.com.ar>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: David Airlie <airlied@linux.ie>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Ezequiel,

Thanks a lot for your patch.

On 7/6/22 20:41, Ezequiel Garcia wrote:
> Fix small typo which causes the mask for the 'precharge1' setting
> to be used with the 'precharge2' value.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> ---
>  drivers/gpu/drm/solomon/ssd130x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
> index 08394444dd6e..f4886e66ff34 100644
> --- a/drivers/gpu/drm/solomon/ssd130x.c
> +++ b/drivers/gpu/drm/solomon/ssd130x.c
> @@ -350,7 +350,7 @@ static int ssd130x_init(struct ssd130x_device *ssd130x)
>  
>  	/* Set precharge period in number of ticks from the internal clock */
>  	precharge = (SSD130X_SET_PRECHARGE_PERIOD1_SET(ssd130x->prechargep1) |
> -		     SSD130X_SET_PRECHARGE_PERIOD1_SET(ssd130x->prechargep2));
> +		     SSD130X_SET_PRECHARGE_PERIOD2_SET(ssd130x->prechargep2));

It's a typo indeed. Nice catch!

I wonder how did you notice this. Or was it just looking at the code ?

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

I'll push it to drm-misc (drm-misc-fixes).

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

