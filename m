Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2717508AE
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 14:49:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0442810E51A;
	Wed, 12 Jul 2023 12:49:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8081E10E51D
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 12:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689166166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bsEKIkqQHk+U1Y9jLGhgytlgEjXqEJP6AFszekpVuq4=;
 b=aHO043RbtmBYGPpV/ad+ynAVTC2naf5OhI2y+cQH4RWQwf5Md6XJZDzRAaVmipfcUjxUgc
 4roSKMvVZKfaipiMioMnwClUhfOelnz/WHlgS5tnTkjOZ45SkYVuKPskLjuFgJZQLiK69C
 0680UNmxFCvlR36ALuParuk6RR+Strc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-570-81g7HmFwO--YD9-gmO7d5Q-1; Wed, 12 Jul 2023 08:49:19 -0400
X-MC-Unique: 81g7HmFwO--YD9-gmO7d5Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f42bcef2acso42540845e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 05:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689166158; x=1691758158;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bsEKIkqQHk+U1Y9jLGhgytlgEjXqEJP6AFszekpVuq4=;
 b=E2DAOl0FvIHtno83gqV7nmQhg553Wk7DXjeSOfgsOwtxKWNXTbef06zPH3k13/ZZkS
 2D95t0tPJ9KGJcSQo832Nzk16YW7AJiyhJCksuezodEEQOZaRD+tECCTZjfeHbEAlepu
 gz7rTNlMy35HSXuZ93bE/R5EEP6skdOxkH431PcJHDRKFdFbHM90sH2xOLwzWIB2/0sc
 2lzT8y+HcPZ0mGxzH9iHhgacf/79zlcaEerbxCSO1qxFSn9dNjeDMqI/k8wLClSBPKcm
 NMwtTShIifRw8uZ4XgJhmS8KcB1I1oSyRsX0IYri1rIGCTSzuY9o8NWTjz9y4P8QBmlT
 2VLA==
X-Gm-Message-State: ABy/qLaPMH3sy5GHbQKerM7iKYANuOMLpwvzH88oaneD7QUzSoQujNwq
 7TairCMdcd8Vhsma27T5X9VCBzVuy+8yRrU5QUL3q+48SE9CMmDUU0nUUKQydtytC/Lp32HOx0k
 Uz4h+ouFxaFzDDb56krSdKnCXT8D4
X-Received: by 2002:a1c:ed14:0:b0:3fb:4149:b816 with SMTP id
 l20-20020a1ced14000000b003fb4149b816mr17233556wmh.8.1689166158342; 
 Wed, 12 Jul 2023 05:49:18 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGKyi86cAluxp17f8UlvPyxPzuLBuL8BU6nxyZOatgeE/2M7ehQjzLYAWhX5Cp1Hc3LE1kZtw==
X-Received: by 2002:a1c:ed14:0:b0:3fb:4149:b816 with SMTP id
 l20-20020a1ced14000000b003fb4149b816mr17233541wmh.8.1689166157955; 
 Wed, 12 Jul 2023 05:49:17 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 u10-20020a7bcb0a000000b003fb739d27aesm15356728wmj.35.2023.07.12.05.49.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jul 2023 05:49:17 -0700 (PDT)
Message-ID: <c17d3f9b-dbe9-3398-1edc-05afb57a5929@redhat.com>
Date: Wed, 12 Jul 2023 14:49:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v3 1/2] drm/ast: Add BMC virtual connector
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 jani.nikula@linux.intel.com, dianders@chromium.org
References: <20230712083733.223275-1-jfalempe@redhat.com>
 <964a01c5-5db3-7fe0-a8fa-7f6bbbbba8a3@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <964a01c5-5db3-7fe0-a8fa-7f6bbbbba8a3@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/07/2023 12:44, Thomas Zimmermann wrote:
> Hi,
> 
> thanks for this patch.
> 
> Am 12.07.23 um 10:35 schrieb Jocelyn Falempe:
>> Most aspeed devices have a BMC, which allows to remotely see the screen.
>> Also in the common use case, those servers don't have a display 
>> connected.
>> So add a Virtual connector, to reflect that even if no display is
>> connected, the framebuffer can still be seen remotely.
>> This prepares the work to implement a detect_ctx() for the Display port
>> connector.
>>
>> Fixes: fae7d186403e ("drm/probe-helper: Default to 640x480 if no EDID 
>> on DP")
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/ast/ast_drv.h  |  4 ++
>>   drivers/gpu/drm/ast/ast_mode.c | 67 ++++++++++++++++++++++++++++++++++
>>   2 files changed, 71 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/ast/ast_drv.h 
>> b/drivers/gpu/drm/ast/ast_drv.h
>> index 3f6e0c984523..c9659e72002f 100644
>> --- a/drivers/gpu/drm/ast/ast_drv.h
>> +++ b/drivers/gpu/drm/ast/ast_drv.h
>> @@ -214,6 +214,10 @@ struct ast_device {
>>               struct drm_encoder encoder;
>>               struct drm_connector connector;
>>           } astdp;
>> +        struct {
>> +            struct drm_encoder encoder;
>> +            struct drm_connector connector;
>> +        } bmc;
>>       } output;
>>       bool support_wide_screen;
>> diff --git a/drivers/gpu/drm/ast/ast_mode.c 
>> b/drivers/gpu/drm/ast/ast_mode.c
>> index f711d592da52..8896b22eb5cf 100644
>> --- a/drivers/gpu/drm/ast/ast_mode.c
>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>> @@ -1735,6 +1735,70 @@ static int ast_astdp_output_init(struct 
>> ast_device *ast)
>>       return 0;
>>   }
>> +/*
>> + * BMC virtual Connector
>> + */
>> +
>> +static int ast_bmc_connector_helper_get_modes(struct drm_connector 
>> *connector)
>> +{
>> +    return drm_add_modes_noedid(connector, 1024, 768);
> 
> That's probably too small. The CRTC lists resolutions up to 1920x1200. 
> Returning 1024x768 could easily filter out those higher-res modes.
> 
> The BMC can probably just use whatever the CRTC offers. So rather call 
> drm_add_modes_noedid() with 4096x4096. At 32 bpp, this covers the max 
> memory of 64 MiB.  The CRTC will filter out unsupported modes.

Thanks for pointing this, I didn't realize it will prevent higher 
resolutions. With this change, the bmc resolution becomes 1920x1200 
(with "disabled vga" and no DP connected), which is much nicer.

With vga, it stays at 1024x768. So maybe adding a .detect_ctx() for vga 
too would be worth it. But that's for another series.

> 
> 
>> +}
>> +
>> +static const struct drm_connector_helper_funcs 
>> ast_bmc_connector_helper_funcs = {
>> +    .get_modes = ast_bmc_connector_helper_get_modes,
>> +};
>> +
>> +static const struct drm_connector_funcs ast_bmc_connector_funcs = {
>> +    .reset = drm_atomic_helper_connector_reset,
>> +    .fill_modes = drm_helper_probe_single_connector_modes,
>> +    .destroy = drm_connector_cleanup,
>> +    .atomic_duplicate_state = 
>> drm_atomic_helper_connector_duplicate_state,
>> +    .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>> +};
>> +
>> +static int ast_bmc_connector_init(struct drm_device *dev,
>> +                  struct drm_connector *connector)
>> +{
>> +    int ret;
>> +
>> +    ret = drm_connector_init(dev, connector, &ast_bmc_connector_funcs,
>> +                 DRM_MODE_CONNECTOR_VIRTUAL);
>> +    if (ret)
>> +        return ret;
>> +
>> +    drm_connector_helper_add(connector, 
>> &ast_bmc_connector_helper_funcs);
>> +
>> +    connector->interlace_allowed = 0;
>> +    connector->doublescan_allowed = 0;
>> +    connector->polled = 0;
> 
> It's zero-allocated memory. Please don't clear these fields manually. (I 
> know that ast doesn't get this right.)

Done

> 
>> +
>> +    return 0;
>> +}
>> +
>> +static int ast_bmc_output_init(struct ast_device *ast)
>> +{
>> +    struct drm_device *dev = &ast->base;
>> +    struct drm_crtc *crtc = &ast->crtc;
>> +    struct drm_encoder *encoder = &ast->output.bmc.encoder;
>> +    struct drm_connector *connector = &ast->output.bmc.connector;
>> +    int ret;
>> +
>> +    ret = drm_simple_encoder_init(dev, encoder, 
>> DRM_MODE_ENCODER_VIRTUAL);
> 
> Adding the simple_encoder helper was a mistake. Please open-code its 
> functionality in ast. (Also something that ast currently does not.)

ok, it's simple enough to call drm_encoder_init() directly.

> 
>> +    if (ret)
>> +        return ret;
>> +    encoder->possible_crtcs = drm_crtc_mask(crtc);
>> +
>> +    ret = ast_bmc_connector_init(dev, connector);
> 
> Maybe just inline this call. It's simple enough.
Done

> 
> Best regards
> Thomas

Thanks for the review, I will push a v4 shortly.

-- 

Jocelyn

> 
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = drm_connector_attach_encoder(connector, encoder);
>> +    if (ret)
>> +        return ret;
>> +
>> +    return 0;
>> +}
>> +
>>   /*
>>    * Mode config
>>    */
>> @@ -1842,6 +1906,9 @@ int ast_mode_config_init(struct ast_device *ast)
>>           if (ret)
>>               return ret;
>>       }
>> +    ret = ast_bmc_output_init(ast);
>> +    if (ret)
>> +        return ret;
>>       drm_mode_config_reset(dev);
>>
>> base-commit: b32d5a51f3c21843011d68a58e6ac0b897bce9f2
> 

