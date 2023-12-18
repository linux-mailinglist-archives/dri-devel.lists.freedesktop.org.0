Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3779881799A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Dec 2023 19:25:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E704B10E2A5;
	Mon, 18 Dec 2023 18:25:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14CD210E2A5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 18:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1702923921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D4BR8c8goPXlqieZxmccl7pcjPueJY1A6406IGvIqgM=;
 b=Xq9P8j70WEj33Q5XvEN1onOyQN+7791Hpd6Kdo4Vkjo1Ff1CuG2RhJT0UhF9BYfBS7bNrc
 +/d72R7WY9ckwagsSGxH17tM2X17PvW9u/vMAu0T1zGJB3heDvidork4k7DcznHUT3zeuN
 es5nQXSD+sIk/tMKltDSEScaaPd/3AM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-MQ365F6lOaW3X6QRAc9CJA-1; Mon, 18 Dec 2023 08:03:14 -0500
X-MC-Unique: MQ365F6lOaW3X6QRAc9CJA-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-40c464a1e5cso24504585e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Dec 2023 05:03:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702904593; x=1703509393;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=D4BR8c8goPXlqieZxmccl7pcjPueJY1A6406IGvIqgM=;
 b=t45spnhcbHfGZbfcTAOxMcbtmQFKgKxlAnlgVjJf0MHDBkG+FG1U/5oH6PdD05biBf
 lUnjJHvb+oV26xvWV9NL9ftOZi1dOTC0x+YHpxQ9Ydx+RT6HZ10eV9lxRrvXMlaPIG9X
 30O+0R4BCGAa+PvHOYxbL5iA9ooAiUiiWRv36bHw9UrP57zoNR4aePY/JfrkC5nVpCGJ
 qImidrjIZpA6AaMRijU4bOGy97CqkcqsC8Mny4tTFtHq2dKwrBrh4WcEzgeMQ+TH2hhS
 Q161tj9CrC6ye8LOL/AzUXnWuiheAeHdQ+ekytdqswaRUMGveCFPsXoggvuMjlLG6J0U
 aCcA==
X-Gm-Message-State: AOJu0YwYAOarGIfEbIU43MtSLQ8qH6g/YQHYh+rL0KKBPJ1fIwKTt3wS
 Az1QShJenOQiPh5s53QYynqOC9W8wFBLr3Sqlic89y4ei3BoksELbSXK43y6GceHaFHW2DRvvNY
 hXE0LN5/m0elKtTXaWw4Jesbrzb30
X-Received: by 2002:a05:600c:829:b0:40b:5e21:c5aa with SMTP id
 k41-20020a05600c082900b0040b5e21c5aamr5328107wmp.120.1702904593432; 
 Mon, 18 Dec 2023 05:03:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGw6Lconji7VbC6NL33uohkatwRsNiFsQCnToxefrUdxxqBn5nrq+SfFSjMJ7N/ZyfjKhGuuQ==
X-Received: by 2002:a05:600c:829:b0:40b:5e21:c5aa with SMTP id
 k41-20020a05600c082900b0040b5e21c5aamr5328097wmp.120.1702904593084; 
 Mon, 18 Dec 2023 05:03:13 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 p32-20020a05600c1da000b0040b360cc65csm42399843wms.0.2023.12.18.05.03.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Dec 2023 05:03:12 -0800 (PST)
Message-ID: <beec3b5d-689a-4b25-be4b-9ff7532bb2e6@redhat.com>
Date: Mon, 18 Dec 2023 14:03:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mgag200: Fix gamma lut not initialized for G200ER,
 G200EV, G200SE
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@redhat.com, daniel@ffwll.ch, javierm@redhat.com
References: <20231214163849.359691-1-jfalempe@redhat.com>
 <641bc7e1-5c13-4af1-ae2e-8cdc58ee92a9@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <641bc7e1-5c13-4af1-ae2e-8cdc58ee92a9@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Cc: Roger Sewell <roger.sewell@cantab.net>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 18/12/2023 12:31, Thomas Zimmermann wrote:
> Hi
> 
> Am 14.12.23 um 17:38 schrieb Jocelyn Falempe:
>> When mgag200 switched from simple KMS to regular atomic helpers,
>> the initialization of the gamma settings was lost.
>> This leads to a black screen, if the bios/uefi doesn't use the same
>> pixel color depth.
>> This has been fixed with commit ad81e23426a6 ("drm/mgag200: Fix gamma
>> lut not initialized.") for most G200, but G200ER, G200EV, G200SE use
>> their own version of crtc_helper_atomic_enable() and need to be fixed
>> too.
>>
>> Fixes: 1baf9127c482 ("drm/mgag200: Replace simple-KMS with regular 
>> atomic helpers")
>> Cc: <stable@vger.kernel.org> #v6.1+
>> Reported-by: Roger Sewell <roger.sewell@cantab.net>
>> Suggested-by: Roger Sewell <roger.sewell@cantab.net>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>   drivers/gpu/drm/mgag200/mgag200_drv.h    |  4 ++++
>>   drivers/gpu/drm/mgag200/mgag200_g200er.c |  2 ++
>>   drivers/gpu/drm/mgag200/mgag200_g200ev.c |  2 ++
>>   drivers/gpu/drm/mgag200/mgag200_g200se.c |  2 ++
>>   drivers/gpu/drm/mgag200/mgag200_mode.c   | 26 ++++++++++++++----------
>>   5 files changed, 25 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h 
>> b/drivers/gpu/drm/mgag200/mgag200_drv.h
>> index 57c7edcab602..ed90a92b5fcd 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_drv.h
>> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
>> @@ -392,6 +392,10 @@ void 
>> mgag200_primary_plane_helper_atomic_disable(struct drm_plane *plane,
>>       .destroy = drm_plane_cleanup, \
>>       DRM_GEM_SHADOW_PLANE_FUNCS
>> +void mgag200_crtc_set_gamma(struct mga_device *mdev,
>> +                const struct drm_format_info *format,
>> +                struct drm_property_blob *gamma_lut);
>> +
>>   enum drm_mode_status mgag200_crtc_helper_mode_valid(struct drm_crtc 
>> *crtc,
>>                               const struct drm_display_mode *mode);
>>   int mgag200_crtc_helper_atomic_check(struct drm_crtc *crtc, struct 
>> drm_atomic_state *new_state);
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200er.c 
>> b/drivers/gpu/drm/mgag200/mgag200_g200er.c
>> index bce267e0f7de..38815cb94c61 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_g200er.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_g200er.c
>> @@ -202,6 +202,8 @@ static void 
>> mgag200_g200er_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>>       mgag200_g200er_reset_tagfifo(mdev);
>> +    mgag200_crtc_set_gamma(mdev, format, crtc_state->gamma_lut);
>> +
>>       mgag200_enable_display(mdev);
>>       if (funcs->enable_vidrst)
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200ev.c 
>> b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
>> index ac957f42abe1..e698a3a499bf 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_g200ev.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_g200ev.c
>> @@ -203,6 +203,8 @@ static void 
>> mgag200_g200ev_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>>       mgag200_g200ev_set_hiprilvl(mdev);
>> +    mgag200_crtc_set_gamma(mdev, format, crtc_state->gamma_lut);
>> +
>>       mgag200_enable_display(mdev);
>>       if (funcs->enable_vidrst)
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_g200se.c 
>> b/drivers/gpu/drm/mgag200/mgag200_g200se.c
>> index bd6e573c9a1a..7e4ea0046a6b 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_g200se.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_g200se.c
>> @@ -334,6 +334,8 @@ static void 
>> mgag200_g200se_crtc_helper_atomic_enable(struct drm_crtc *crtc,
>>       mgag200_g200se_set_hiprilvl(mdev, adjusted_mode, format);
>> +    mgag200_crtc_set_gamma(mdev, format, crtc_state->gamma_lut);
>> +
>>       mgag200_enable_display(mdev);
>>       if (funcs->enable_vidrst)
>> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c 
>> b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> index af3ce5a6a636..d2a04b317232 100644
>> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
>> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
>> @@ -65,9 +65,9 @@ static void mgag200_crtc_set_gamma_linear(struct 
>> mga_device *mdev,
>>       }
>>   }
>> -static void mgag200_crtc_set_gamma(struct mga_device *mdev,
>> -                   const struct drm_format_info *format,
>> -                   struct drm_color_lut *lut)
>> +static void mgag200_crtc_set_gamma_table(struct mga_device *mdev,
>> +                     const struct drm_format_info *format,
>> +                     struct drm_color_lut *lut)
>>   {
>>       int i;
>> @@ -103,6 +103,16 @@ static void mgag200_crtc_set_gamma(struct 
>> mga_device *mdev,
>>       }
>>   }
>> +void mgag200_crtc_set_gamma(struct mga_device *mdev,
>> +                const struct drm_format_info *format,
>> +                struct drm_property_blob *gamma_lut)
>> +{
>> +    if (gamma_lut)
>> +        mgag200_crtc_set_gamma_table(mdev, format, gamma_lut->data);
>> +    else
>> +        mgag200_crtc_set_gamma_linear(mdev, format);
>> +}
> 
> Please keep this open-coded its callers. With that changed
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Thanks for the review, yes I will change that.
If no other comments, I will push it to drm-misc-fixes tomorrow.

-- 

Jocelyn
> 
>> +
>>   static inline void mga_wait_vsync(struct mga_device *mdev)
>>   {
>>       unsigned long timeout = jiffies + HZ/10;
>> @@ -616,10 +626,7 @@ void mgag200_crtc_helper_atomic_flush(struct 
>> drm_crtc *crtc, struct drm_atomic_s
>>       if (crtc_state->enable && crtc_state->color_mgmt_changed) {
>>           const struct drm_format_info *format = 
>> mgag200_crtc_state->format;
>> -        if (crtc_state->gamma_lut)
>> -            mgag200_crtc_set_gamma(mdev, format, 
>> crtc_state->gamma_lut->data);
>> -        else
>> -            mgag200_crtc_set_gamma_linear(mdev, format);
>> +        mgag200_crtc_set_gamma(mdev, format, crtc_state->gamma_lut);
>>       }
>>   }
>> @@ -642,10 +649,7 @@ void mgag200_crtc_helper_atomic_enable(struct 
>> drm_crtc *crtc, struct drm_atomic_
>>       if (funcs->pixpllc_atomic_update)
>>           funcs->pixpllc_atomic_update(crtc, old_state);
>> -    if (crtc_state->gamma_lut)
>> -        mgag200_crtc_set_gamma(mdev, format, 
>> crtc_state->gamma_lut->data);
>> -    else
>> -        mgag200_crtc_set_gamma_linear(mdev, format);
>> +    mgag200_crtc_set_gamma(mdev, format, crtc_state->gamma_lut);
>>       mgag200_enable_display(mdev);
>>
>> base-commit: 6c9dbee84cd005bed5f9d07b3a2797ae6414b435
> 

