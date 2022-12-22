Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F013654856
	for <lists+dri-devel@lfdr.de>; Thu, 22 Dec 2022 23:23:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9690F10E593;
	Thu, 22 Dec 2022 22:22:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EB710E593
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 22:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671747749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rJEghjc//bUeirJO3BVHy7SfdNAruAMz/OF8PYUtCm8=;
 b=GjhXNTQOgeMjDDLB9xewtM8tenS5on2i8/T/qarrai6polMJWcvhzGqvO+oWTe4XPLhBmO
 2l5KBh7WWVUxXkr3fLjSwdRFiTsGbjIADBIMYKYzyYDaWEd92T4g3ETjop5YvJniHKr7UU
 uGiNSe6nzNdLaWamc9tSP8wohPDiah4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-401-b6gnYB5-N1iQYCnhclem3g-1; Thu, 22 Dec 2022 17:22:20 -0500
X-MC-Unique: b6gnYB5-N1iQYCnhclem3g-1
Received: by mail-wm1-f69.google.com with SMTP id
 m38-20020a05600c3b2600b003d23f8c6ebdso2466547wms.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 14:22:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rJEghjc//bUeirJO3BVHy7SfdNAruAMz/OF8PYUtCm8=;
 b=VR3fEHPt+zLJ6r2GZo+mLJSnTOq8GqCKwDT6cmdlMmHv/qcCtBLVqGo7hdfCtk4bjR
 FEwLEHu8phlFVpdnEmaQ/ee8BijtjH+bqZzsdwrbds/xC9O8/hcVxbeMbPZC6nwX8OI1
 4ccp3qO/8OtRT2BYoRUz4cMNZDQXqOF2rdFlXuWsdBsoUzrSqNuj3li7FTw1nb0Lm2tw
 kPpHE07RdM6ejIND+iz+GdJTNleKqAwDJS5UEcv1yLXen6zYdnOKkiQ3UZyMdnsFFTiy
 z2E27Vl+b0un7AJcqFoyWXX2bpP+TxDglgBqyadZQ8h6yBvX060RaxJ7evmIJV6jsTp/
 O5QA==
X-Gm-Message-State: AFqh2krqQ/xBaMAWf3iMCJ5ZatGVOYfeGdRBVMDjK9PdKhF4q54Yu3Mz
 lxDXY/GKhl9xMq/wmgs2JwuPABZS/rUhwfL4Oip97f2tMInLwykgY3pIOmQ5eS+RvLeXG4wm/gG
 NTcEi+FgyaZrjYpgnL2xXoVk8PadD
X-Received: by 2002:adf:f2cd:0:b0:242:29fc:ad51 with SMTP id
 d13-20020adff2cd000000b0024229fcad51mr8268070wrp.20.1671747739182; 
 Thu, 22 Dec 2022 14:22:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv9To1v5Iv9TiwO8kmYC/5NHNtZZRcyqV34bOlzRZgspniUuLr0DE8wZ3mzxPXLDhw/Fztolw==
X-Received: by 2002:adf:f2cd:0:b0:242:29fc:ad51 with SMTP id
 d13-20020adff2cd000000b0024229fcad51mr8268051wrp.20.1671747738899; 
 Thu, 22 Dec 2022 14:22:18 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 u11-20020a5d514b000000b0022cdeba3f83sm1496111wrt.84.2022.12.22.14.22.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Dec 2022 14:22:18 -0800 (PST)
Message-ID: <d45f52c1-1fe7-3210-25d2-259e3c07b5db@redhat.com>
Date: Thu, 22 Dec 2022 23:22:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 038/606] drm/i2c/ch7006: Convert to i2c's .probe_new()
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <uwe@kleine-koenig.org>,
 Angel Iglesias <ang.iglesiasg@gmail.com>, Lee Jones <lee.jones@linaro.org>,
 Grant Likely <grant.likely@linaro.org>, Wolfram Sang <wsa@kernel.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Ajay Gupta <ajayg@nvidia.com>,
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-39-uwe@kleine-koenig.org>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221118224540.619276-39-uwe@kleine-koenig.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-i2c@vger.kernel.org, kernel@pengutronix.de, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Uwe,

On 11/18/22 23:36, Uwe Kleine-König wrote:
> The probe function doesn't make use of the i2c_device_id * parameter so it
> can be trivially converted.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/gpu/drm/i2c/ch7006_drv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch7006_drv.c
> index 578b738859b9..e0476a5bf84c 100644
> --- a/drivers/gpu/drm/i2c/ch7006_drv.c
> +++ b/drivers/gpu/drm/i2c/ch7006_drv.c
> @@ -386,7 +386,7 @@ static const struct drm_encoder_slave_funcs ch7006_encoder_funcs = {
>  
>  /* I2C driver functions */
>  
> -static int ch7006_probe(struct i2c_client *client, const struct i2c_device_id *id)
> +static int ch7006_probe(struct i2c_client *client)
>  {
>  	uint8_t addr = CH7006_VERSION_ID;
>  	uint8_t val;
> @@ -495,7 +495,7 @@ static const struct dev_pm_ops ch7006_pm_ops = {
>  
>  static struct drm_i2c_encoder_driver ch7006_driver = {
>  	.i2c_driver = {
> -		.probe = ch7006_probe,
> +		.probe_new = ch7006_probe,
>  		.remove = ch7006_remove,
>  
>  		.driver = {

Looks good to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

