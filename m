Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 492D651C451
	for <lists+dri-devel@lfdr.de>; Thu,  5 May 2022 17:55:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E74210E7C3;
	Thu,  5 May 2022 15:55:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 366 seconds by postgrey-1.36 at gabe;
 Thu, 05 May 2022 15:55:22 UTC
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [170.10.133.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78B210E7C3
 for <dri-devel@lists.freedesktop.org>; Thu,  5 May 2022 15:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651766121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3DujHRZPWKQxGHu1Dc+MmlfOal8z9LDR4RX2qZyWhIk=;
 b=MqbfaOox1N7iKH1oSgPqgqcg/LE0jOYq0Z3CSp+5ckHDXorvzOwJg0SjzZ5Ox+AA+U4LG4
 TvAQsUENuGzpWW07t8UUa4S/DkaZqAUwDQvsViNPu4AUnSaCAVyPyui+Yn+HkieN2wro9/
 wnyJP2yI4KZZc4DbMxfeaMw+83BciA0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-428-mMbTk4hpM-KJuKSky1zfgA-1; Thu, 05 May 2022 11:49:14 -0400
X-MC-Unique: mMbTk4hpM-KJuKSky1zfgA-1
Received: by mail-wm1-f69.google.com with SMTP id
 t184-20020a1c46c1000000b00394209f54f1so1871450wma.4
 for <dri-devel@lists.freedesktop.org>; Thu, 05 May 2022 08:49:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3DujHRZPWKQxGHu1Dc+MmlfOal8z9LDR4RX2qZyWhIk=;
 b=gu/iv/lJxwNQ7LObqZtMR/4iq1g/fUjTuO3IDnKtDwQf92MZM5hFaNTKXUHKkWJkPQ
 JjDrfQuAbtT+iv3BAJ6YAX2pZyUsb4MKkB4As/E36uErtEiIEUxFBUpIONtpaHxuBnPK
 2DwvhK66E0V2sug9Mtp1iJ2+JRM4DrGqAjFtVfkfeub2UQLDzQDrT+NGW3btSLAWsf1y
 /qWaJDSe0zJr7+PbnYItt/mjo4uVrWFFUFR5izDmrfHuNWkVoiHit7Pn/h3e/TkPhxsX
 h+C9DKmwUmf6LPkjLYwpV1IkidO/PYw3RzfR/7+rm+rN4P+JTbvd8xawebK5Jo7LTUxm
 WdlQ==
X-Gm-Message-State: AOAM530was+Me6Ae1mdmwVY0/F6fYXfocKvaJG1Gd660lKtfc2bZvJJl
 BCk2vN1DNMjDGtQsqiLG7O+YjWw7Lbaj5ElucO2q9mmriKgC3fhvfTEbS3QqicQBIPuGvTrsmaq
 zOM2/Tss0pU3lkk4eOIXFE5Lh6gHO
X-Received: by 2002:a1c:2b86:0:b0:392:ae97:2fec with SMTP id
 r128-20020a1c2b86000000b00392ae972fecmr5519835wmr.165.1651765753664; 
 Thu, 05 May 2022 08:49:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHSJ75gAGVQ0TuAd6HrQ8sJjJjQS8kcVjnCpx1gZSeei+IXy9EfOjqKauEofd8hN92t0K0aw==
X-Received: by 2002:a1c:2b86:0:b0:392:ae97:2fec with SMTP id
 r128-20020a1c2b86000000b00392ae972fecmr5519804wmr.165.1651765753166; 
 Thu, 05 May 2022 08:49:13 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:a765:79fb:b5ef:c480?
 ([2a01:e0a:d5:a000:a765:79fb:b5ef:c480])
 by smtp.gmail.com with ESMTPSA id
 l6-20020a05600c1d0600b003942a244f34sm5237362wms.13.2022.05.05.08.49.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 May 2022 08:49:12 -0700 (PDT)
Message-ID: <fe418b2e-10be-154c-59bc-e1870c37ef28@redhat.com>
Date: Thu, 5 May 2022 17:49:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] drm/mgag200: Fail on I2C initialization errors
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 daniel@ffwll.ch
References: <20220505152244.413-1-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20220505152244.413-1-tzimmermann@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jfalempe@redhat.com
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/05/2022 17:22, Thomas Zimmermann wrote:
> Initialization of the I2C adapter was allowed to fail. The mgag200
> driver would have continued without DDC support. Had this happened in
> practice, it would have led to segmentation faults in the connector
> code. Resolve this problem by failing driver initialization on I2C-
> related errors.

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>

> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/mgag200/mgag200_i2c.c  | 13 ++++++++-----
>   drivers/gpu/drm/mgag200/mgag200_mode.c |  6 ++++--
>   2 files changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_i2c.c b/drivers/gpu/drm/mgag200/mgag200_i2c.c
> index ac8e34eef5138..31e2c641a7814 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_i2c.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_i2c.c
> @@ -120,7 +120,7 @@ struct mga_i2c_chan *mgag200_i2c_create(struct drm_device *dev)
>   
>   	i2c = kzalloc(sizeof(struct mga_i2c_chan), GFP_KERNEL);
>   	if (!i2c)
> -		return NULL;
> +		return ERR_PTR(-ENOMEM);
>   
>   	i2c->data = data;
>   	i2c->clock = clock;
> @@ -142,11 +142,14 @@ struct mga_i2c_chan *mgag200_i2c_create(struct drm_device *dev)
>   	i2c->bit.getscl		= mga_gpio_getscl;
>   
>   	ret = i2c_bit_add_bus(&i2c->adapter);
> -	if (ret) {
> -		kfree(i2c);
> -		i2c = NULL;
> -	}
> +	if (ret)
> +		goto err_kfree;
> +
>   	return i2c;
> +
> +err_kfree:
> +	kfree(i2c);
> +	return ERR_PTR(ret);
>   }
>   
>   void mgag200_i2c_destroy(struct mga_i2c_chan *i2c)
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index abde7655477db..79557ca056f08 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -815,8 +815,10 @@ static int mgag200_vga_connector_init(struct mga_device *mdev)
>   	int ret;
>   
>   	i2c = mgag200_i2c_create(dev);
> -	if (!i2c)
> -		drm_warn(dev, "failed to add DDC bus\n");
> +	if (IS_ERR(i2c)) {
> +		drm_err(dev, "failed to add DDC bus: %d\n", ret);
> +		return PTR_ERR(i2c);
> +	}
>   
>   	ret = drm_connector_init_with_ddc(dev, connector,
>   					  &mga_vga_connector_funcs,

