Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AD157F68D
	for <lists+dri-devel@lfdr.de>; Sun, 24 Jul 2022 20:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CAC711B4AD;
	Sun, 24 Jul 2022 18:41:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278321125D2
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jul 2022 18:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658688116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gIe4/7e2xCRrMXD7HUhMOPa/pdJzjLUmsuMLjrqfl6A=;
 b=IE2KQqX/YT6s9pbtw7utDFBTycezBUd1Zf8bsV/NGc1DVX7lH2wPG7lwrGhwJED+bp3qpf
 ojhH93qer4CO6iMeJrCbIMAI3PcdmpAq/YUr0y0NxD2WCZ5wTcJO6Ty3Jyvyeh2TgaDF+n
 NSOqPBASXTyA98Heym4E793lhdfKpo0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-537-nxT87W2tNraHhblTBCc3Cw-1; Sun, 24 Jul 2022 14:41:54 -0400
X-MC-Unique: nxT87W2tNraHhblTBCc3Cw-1
Received: by mail-wm1-f71.google.com with SMTP id
 r10-20020a05600c284a00b003a2ff6c9d6aso7492380wmb.4
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Jul 2022 11:41:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gIe4/7e2xCRrMXD7HUhMOPa/pdJzjLUmsuMLjrqfl6A=;
 b=B2Ih4TAG1dIEVXRAdeJOnvrncw4yGkuNwIEBvPWB7TWiuUWBPZGna13p8SYw/nDjSr
 IcmmEB0wkJEUz+7FLEoVeQbyvoq8hp8YNNLw5IX5JIIyKt1OaFKYR2HkWRfobxIAI43y
 J579DZ+xw423G9Tzbkra8OtuMo6cA9eCsK6twfAINEI6iYAFYojIQi5Czbk78HBuwf/Z
 qvhHm/Xeevvk0Dy91zNvaZGgBhJIoH6D0/rwkF2tZYIK4uqXIaHyQkUPxsv+fWnULvn9
 DxwgUkmx5Ta6JO3VQG/1UwEIiqavm1XBdMRCkwK96N8amDay193QF/86q+LvpAfRtVWI
 KDrg==
X-Gm-Message-State: AJIora/lsLHOMZS8oiUd34BsxdeeMENoKlBvzcIcC7b/2YuDoR+ctznK
 cMRS8ZSSukWoC3tFDbW4/k4XEsUjYcrpGWRkXx/+2RvdlhLxt5E2qpZ0m4TbDykLPraMmZneU5f
 XtdrPvc/xDN6yxTqSl6ihwDAT2tR1
X-Received: by 2002:a5d:6dae:0:b0:21d:ac34:d087 with SMTP id
 u14-20020a5d6dae000000b0021dac34d087mr6121756wrs.336.1658688113626; 
 Sun, 24 Jul 2022 11:41:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sm5M97cVJghcjpTtHe7vDZxpG3Ni/nmo/EqvERBxjz+1W4Vb+26sc27+eLVyAgJWACpipLGg==
X-Received: by 2002:a5d:6dae:0:b0:21d:ac34:d087 with SMTP id
 u14-20020a5d6dae000000b0021dac34d087mr6121744wrs.336.1658688113431; 
 Sun, 24 Jul 2022 11:41:53 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 b6-20020a056000054600b0021badf3cb26sm12426838wrf.63.2022.07.24.11.41.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Jul 2022 11:41:53 -0700 (PDT)
Message-ID: <38128880-5b47-7ba0-54f3-97c4d6e04028@redhat.com>
Date: Sun, 24 Jul 2022 20:41:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm: Prevent modeset helpers to access an uninitialized
 drm_mode_config
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220724123741.1268536-1-javierm@redhat.com>
 <e6ed25b0-49d2-7e3b-91e5-72e431310610@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <e6ed25b0-49d2-7e3b-91e5-72e431310610@suse.de>
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
Cc: David Airlie <airlied@linux.ie>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

Thanks for your feedback.

On 7/24/22 20:24, Thomas Zimmermann wrote:
> Hi Javier
> 
> Am 24.07.22 um 14:37 schrieb Javier Martinez Canillas:
>> DRM drivers initialize the mode configuration with drmm_mode_config_init()
>> and that function (among other things) initializes mutexes that are later
>> used by modeset helpers.
>>
>> But the helpers should only attempt to grab those locks if the mode config
>> was properly initialized. Otherwise it can lead to kernel oops. An example
>> is when a DRM driver using the component framework does not initialize the
>> drm_mode_config, because its .bind callback was not being executed due one
>> of its expected sub-devices' driver failing to probe.
>>
>> Some drivers check the struct drm_driver.registered field as an indication
>> on whether their .shutdown callback should call helpers to tearn down the
>> mode configuration or not, but most drivers just assume that it is always
>> safe to call helpers such as drm_atomic_helper_shutdown() during shutdown.
>>
>> Let make the DRM core more robust and prevent this to happen, by marking a
>> struct drm_mode_config as initialized during drmm_mode_config_init(). that
>> way helpers can check for it and not attempt to grab uninitialized mutexes.
> 
> I disagree. This patch looks like cargo-cult programming and entirely 
> arbitrary.  The solution here is to fix drivers.  The actual test to 
> perform is to instrument the mutex implementation to detect 
> uninitialized mutexes.
>

While I do agree that drivers should be fixed, IMO we should try to make it
hard for the kernel to crash. We already have checks in other DRM helpers to
avoid accessing uninitialized data, so I don't see why we couldn't do the
same here.

I wrote this patch after fixing a bug in the drm/msm driver [0]. By looking
at how other drivers handled this case, I'm pretty sure that they have the
same problem. A warning is much better than a kernel crash during shutdown.

[0]: https://patchwork.kernel.org/project/dri-devel/patch/20220724111327.1195693-1-javierm@redhat.com/
 
> Best regards
> Thomas
> 

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

