Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8281E763D04
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 18:56:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A0B210E49D;
	Wed, 26 Jul 2023 16:55:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C90010E49D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 16:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690390554;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MLJxcSfut4Py2OIdbJRnp6SDYEgq1UuV5OQa+35hWVU=;
 b=Lfl/MzvgNog9XSLmQI/LVfUIR65EWP1Yeg0vBeHEosew1LiIc1Hmq+TjgNsLam+ARHKwkl
 /iPwbDIe1FBNleotEej3RO7ySmDBNFCN0WqpcKMEtxrHozARPP9M11fNSO09KEe7mBx5XN
 WxghIMA3z1HOIXf4Dbcy/wsFxzyVdI8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-46-8zAF3uyMO6SjiXWE0vtfvg-1; Wed, 26 Jul 2023 12:55:53 -0400
X-MC-Unique: 8zAF3uyMO6SjiXWE0vtfvg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3fa8cd898e0so43061725e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 09:55:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690390552; x=1690995352;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MLJxcSfut4Py2OIdbJRnp6SDYEgq1UuV5OQa+35hWVU=;
 b=NOgZjqletmcddQeCqBGsQub9rKdaDNSlhV1WkYYuSYwcTDUtK5Wy5DM+CPh78gDuOc
 r9wOhHOxByG6GpoI/xpMR91uxg0Un4zwHHZXY315d6DWc5tWHpWzsSfR/sMW0SsyC/J5
 AO9zoLXlDRwfL2SHOxzGL22/lNxxSE+Evm7ZCp+zTIZhu48FMdkNB9Pa+4bv5m0rA/7U
 ga1O+VRjWYiVREgNCZ/8YsJkoUdHlk1fsnq8VCx6pxlQquUyer4ZI2IUmu7cqCTb8ZwM
 i1qMqxSUufTpqMmw8ipPLtMmWk7bo/BD/Rwi+iqhmrZdmABgey+oRou6R8HDfIpHYS4T
 KcMg==
X-Gm-Message-State: ABy/qLbu5igzrzITy1bPXLMXHrtJ+BqEL6Rkt/W8qcNutc13kfcDTR5S
 0yT4+z+dT9F2rOdD7dQ/Bq/Abx0DX1R1j5ebhLJJl581A2+lsAZMrCuFyL2m+1QqUlrNFgjgiBv
 9saXkqoAvIsSjPCjnDbjdn//J59i1
X-Received: by 2002:a1c:7903:0:b0:3fb:e4ce:cc7a with SMTP id
 l3-20020a1c7903000000b003fbe4cecc7amr1908089wme.0.1690390551914; 
 Wed, 26 Jul 2023 09:55:51 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFTD9pmrbO/ml8E38ALM9xeARSpGzA08yVSiVZL48+nBnbpJ5GbMYRv/lP93rqPE+yDMZJPog==
X-Received: by 2002:a1c:7903:0:b0:3fb:e4ce:cc7a with SMTP id
 l3-20020a1c7903000000b003fbe4cecc7amr1908081wme.0.1690390551563; 
 Wed, 26 Jul 2023 09:55:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:680e:9bf4:b6a9:959b?
 ([2a01:e0a:d5:a000:680e:9bf4:b6a9:959b])
 by smtp.gmail.com with ESMTPSA id
 u17-20020a05600c211100b003f90b9b2c31sm2476741wml.28.2023.07.26.09.55.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 09:55:51 -0700 (PDT)
Message-ID: <257914ee-a55d-f19d-5b57-b572757bd953@redhat.com>
Date: Wed, 26 Jul 2023 18:55:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v6 1/2] drm/ast: Add BMC virtual connector
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@redhat.com,
 kuohsiang_chou@aspeedtech.com, jammy_huang@aspeedtech.com,
 jani.nikula@linux.intel.com, dianders@chromium.org
References: <20230713134316.332502-1-jfalempe@redhat.com>
 <64d97bb4-e95a-3b03-a2f4-e000930f3ac9@redhat.com>
 <2404f05b-7acc-2b5c-e3d8-ea1301f186d2@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <2404f05b-7acc-2b5c-e3d8-ea1301f186d2@suse.de>
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

On 26/07/2023 17:46, Thomas Zimmermann wrote:
> Hi
> 
> Am 26.07.23 um 10:41 schrieb Jocelyn Falempe:
>> On 13/07/2023 15:41, Jocelyn Falempe wrote:
>>> Most aspeed devices have a BMC, which allows to remotely see the screen.
>>> Also in the common use case, those servers don't have a display 
>>> connected.
>>> So add a Virtual connector, to reflect that even if no display is
>>> connected, the framebuffer can still be seen remotely.
>>> This prepares the work to implement a detect_ctx() for the Display port
>>> connector.
>>>
>>> v4: call drm_add_modes_noedid() with 4096x4096 (Thomas Zimmermann)
>>>      remove useless struct field init to 0 (Thomas Zimmermann)
>>>      don't use drm_simple_encoder_init() (Thomas Zimmermann)
>>>      inline ast_bmc_connector_init() (Thomas Zimmermann)
>>>
>>> Fixes: fae7d186403e ("drm/probe-helper: Default to 640x480 if no EDID 
>>> on DP")
>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>> ---
>>>   drivers/gpu/drm/ast/ast_drv.h  |  4 +++
>>>   drivers/gpu/drm/ast/ast_mode.c | 58 ++++++++++++++++++++++++++++++++++
>>>   2 files changed, 62 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/ast/ast_drv.h 
>>> b/drivers/gpu/drm/ast/ast_drv.h
>>> index 3f6e0c984523..c9659e72002f 100644
>>> --- a/drivers/gpu/drm/ast/ast_drv.h
>>> +++ b/drivers/gpu/drm/ast/ast_drv.h
>>> @@ -214,6 +214,10 @@ struct ast_device {
>>>               struct drm_encoder encoder;
>>>               struct drm_connector connector;
>>>           } astdp;
>>> +        struct {
>>> +            struct drm_encoder encoder;
>>> +            struct drm_connector connector;
>>> +        } bmc;
>>>       } output;
>>>       bool support_wide_screen;
>>> diff --git a/drivers/gpu/drm/ast/ast_mode.c 
>>> b/drivers/gpu/drm/ast/ast_mode.c
>>> index f711d592da52..1a8293162fec 100644
>>> --- a/drivers/gpu/drm/ast/ast_mode.c
>>> +++ b/drivers/gpu/drm/ast/ast_mode.c
>>> @@ -1735,6 +1735,61 @@ static int ast_astdp_output_init(struct 
>>> ast_device *ast)
>>>       return 0;
>>>   }
>>> +/*
>>> + * BMC virtual Connector
>>> + */
>>> +
>>> +static int ast_bmc_connector_helper_get_modes(struct drm_connector 
>>> *connector)
>>> +{
>>> +    return drm_add_modes_noedid(connector, 4096, 4096);
>>> +}
>>> +
>>> +static const struct drm_connector_helper_funcs 
>>> ast_bmc_connector_helper_funcs = {
>>> +    .get_modes = ast_bmc_connector_helper_get_modes,
>>> +};
>>> +
>>> +static const struct drm_connector_funcs ast_bmc_connector_funcs = {
>>> +    .reset = drm_atomic_helper_connector_reset,
>>> +    .fill_modes = drm_helper_probe_single_connector_modes,
>>> +    .destroy = drm_connector_cleanup,
>>> +    .atomic_duplicate_state = 
>>> drm_atomic_helper_connector_duplicate_state,
>>> +    .atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
>>> +};
>>> +
>>> +static const struct drm_encoder_funcs ast_bmc_encoder_funcs = {
>>> +    .destroy = drm_encoder_cleanup,
>>> +};
> 
> Can you please move the encoder_funcs struct before the connector stuff?

Yes, sure.
> 
>>> +
>>> +static int ast_bmc_output_init(struct ast_device *ast)
>>> +{
>>> +    struct drm_device *dev = &ast->base;
>>> +    struct drm_crtc *crtc = &ast->crtc;
>>> +    struct drm_encoder *encoder = &ast->output.bmc.encoder;
>>> +    struct drm_connector *connector = &ast->output.bmc.connector;
>>> +    int ret;
>>> +
>>> +
>>> +    ret = drm_encoder_init(dev, encoder,
>>> +                &ast_bmc_encoder_funcs,
>>> +                DRM_MODE_ENCODER_VIRTUAL, "ast_bmc");
>>> +    if (ret)
>>> +        return ret;
>>> +    encoder->possible_crtcs = drm_crtc_mask(crtc);
>>> +
>>> +    ret = drm_connector_init(dev, connector, &ast_bmc_connector_funcs,
>>> +                 DRM_MODE_CONNECTOR_VIRTUAL);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    drm_connector_helper_add(connector, 
>>> &ast_bmc_connector_helper_funcs);
>>> +
>>> +    ret = drm_connector_attach_encoder(connector, encoder);
>>> +    if (ret)
>>> +        return ret;
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   /*
>>>    * Mode config
>>>    */
>>> @@ -1842,6 +1897,9 @@ int ast_mode_config_init(struct ast_device *ast)
>>>           if (ret)
>>>               return ret;
>>>       }
>>> +    ret = ast_bmc_output_init(ast);
>>> +    if (ret)
>>> +        return ret;
>>>       drm_mode_config_reset(dev);
>>>
>>> base-commit: b32d5a51f3c21843011d68a58e6ac0b897bce9f2
>>
>>
>> I'm missing a review on this patch. The VGA CRD0[7] register check 
>> doesn't work on my server, so I'm adding the BMC virtual connector for 
>> all aspeed hardware, but as discussed, it shouldn't have a negative 
>> impact.
> 
> Sorry. I simply missed this patch. With my little nitpick fixed, you can 
> add

Thanks a lot, I will push it on Friday, if there are no other comments.
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> Thanks for the fix.
> 
> Best regards
> Thomas
> 
>>
>> Thanks,
>>
> 

