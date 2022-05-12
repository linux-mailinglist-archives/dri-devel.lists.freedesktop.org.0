Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E5C524B41
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 13:17:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF7210EC64;
	Thu, 12 May 2022 11:17:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [IPv6:2607:f8b0:4864:20::1033])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C47A10EC64
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 11:17:11 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id e24so4868706pjt.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 04:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=6WezROkLudrlqv8GY4bLrfI4SSzTy6BukYeueDgyVAo=;
 b=ZG4L8aWgWUMIdLTyMqlfwkAvbyFWFtdzShi8yQzpV4ha+8gdXHZZbgGM494CmV8pHZ
 KUM31+rCVQ+f+rjslddzbgtjw3rn2C95dgsbihhOPl5X/XaYuU7/xuS7HEoVPL+MIk5u
 2dGxoWbTHtMbwHgMC1tIngmH3I9TG8Ii0cpcFNvtmK1pBuJwOdRj5ivaKn72u2n//pOl
 oslhRY2fn1Kt39pV7ZEAnqs6g27CqHEPGBSBrFvSVn2KaWTNymdXDZ/zeIJDVKHfydiw
 kY/GrcdP6EysrjF/PAdFREfVaKlF+p9Bs81hJBKQDUh+Kftl4QmhGyooqZcSnMdtPjw7
 skeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=6WezROkLudrlqv8GY4bLrfI4SSzTy6BukYeueDgyVAo=;
 b=Lw4PiZjg1gk29ZCfZ5AzKWHFiYwp7NlLk8vGyqfeSKKBbXYHgvmy4jzL443UQWWPxX
 BQ/tW2cXI6zpMY9rpnuD4SOksevW7jgcuZ7AyWIbFuWeSURh6kdIE6VoLX68ApLvGrV/
 fAONOuyPjbK8KwjZasJB3LCM9NkHzTU3rS9ZlKQnCBV5NOkljGE4+TYBZ5tqJQfB4MPW
 Ty9/fphLDxZxFW1a0hqx0sOgJdyfMwMU9LnLMl8NtBGC74sxYEgPnKX9JLVFYoZfhPDp
 IGOvLQ1wdWkY4TZV7EPBQJPNThVC9uWx+OMuExRmX2q4ZrYygovaqxVGcgaZhxrEZ2R9
 3tjg==
X-Gm-Message-State: AOAM532vXHkFYuyAf1Ox/nNMoTNN4WMFkpzz6nl8bHi1tLh4Tn4PvdSU
 oNubHQLEApAkif+c7ZBAwgw=
X-Google-Smtp-Source: ABdhPJxOk00NN95KoR0NkGvXDc/PUUEbhiITRueHgKA7v2vPBSykitNg4nZw/ehY2YRTSOAYec1gmg==
X-Received: by 2002:a17:902:ea46:b0:15d:dbc:34f2 with SMTP id
 r6-20020a170902ea4600b0015d0dbc34f2mr29455881plg.60.1652354230773; 
 Thu, 12 May 2022 04:17:10 -0700 (PDT)
Received: from [172.16.10.243] ([219.142.146.170])
 by smtp.gmail.com with ESMTPSA id
 w15-20020a63474f000000b003c14af5060asm1663230pgk.34.2022.05.12.04.17.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 May 2022 04:17:10 -0700 (PDT)
Message-ID: <e778d50a-81c6-6dfa-a58b-73cda452f4e3@gmail.com>
Date: Thu, 12 May 2022 19:17:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/meson: Fix refcount leak in meson_encoder_hdmi_init
Content-Language: en-US
To: Neil Armstrong <narmstrong@baylibre.com>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220512092114.38426-1-linmq006@gmail.com>
 <a811a26e-ec34-f9ce-589f-82e96a975594@baylibre.com>
From: Miaoqian Lin <linmq006@gmail.com>
In-Reply-To: <a811a26e-ec34-f9ce-589f-82e96a975594@baylibre.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 2022/5/12 17:32, Neil Armstrong wrote:
> Hi,
>
> On 12/05/2022 11:21, Miaoqian Lin wrote:
>> of_find_device_by_node() takes a reference to the embedded struct device,
>> we should use put_device() to release it when not need anymore.
>> Add missing put_device() in error path to avoid refcount leak.
>>
>> Fixes: 0af5e0b41110 ("drm/meson: encoder_hdmi: switch to bridge DRM_BRIDGE_ATTACH_NO_CONNECTOR")
>> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
>
> You already sent the same patch yesterday, please avoid this.
>
Sorry for the mistake, I realized this after I sent it. I will be more careful.


> Neil
>
>> ---
>>   drivers/gpu/drm/meson/meson_encoder_hdmi.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
>> index 5e306de6f485..de87f02cd388 100644
>> --- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
>> +++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
>> @@ -435,8 +435,10 @@ int meson_encoder_hdmi_init(struct meson_drm *priv)
>>           cec_fill_conn_info_from_drm(&conn_info, meson_encoder_hdmi->connector);
>>             notifier = cec_notifier_conn_register(&pdev->dev, NULL, &conn_info);
>> -        if (!notifier)
>> +        if (!notifier) {
>> +            put_device(&pdev->dev);
>>               return -ENOMEM;
>> +        }
>>             meson_encoder_hdmi->cec_notifier = notifier;
>>       }
>
