Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0468F5BBA81
	for <lists+dri-devel@lfdr.de>; Sat, 17 Sep 2022 23:01:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAA1210E163;
	Sat, 17 Sep 2022 21:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF3E10E163
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 21:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663448458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sCqWHe2UpDFU59Hd60cDt54wnAp8GsIta/vC5NtbJ5g=;
 b=ObqUfrv6l4GZggyns+4C2rrp9FDZtgHadwRv+SB/14dSnxETE0vullm6OvhB1j4GuA6ivy
 BDVYw3SVnhXurzJQGHGGiX9Ba/Jo6E9rb5lhjdqP1HaZyLGENwxFivOOckTI1SjXtkO39f
 kOpD8nKc6fGop5ycNi/m9fs/0fQZgwE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-352-LjjrK00DNxCqdFI_9uzNEA-1; Sat, 17 Sep 2022 17:00:57 -0400
X-MC-Unique: LjjrK00DNxCqdFI_9uzNEA-1
Received: by mail-ej1-f69.google.com with SMTP id
 sa22-20020a1709076d1600b0077bab1f70a3so7777154ejc.12
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 14:00:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=sCqWHe2UpDFU59Hd60cDt54wnAp8GsIta/vC5NtbJ5g=;
 b=zIeIRuUQek+m+OYsnSdSfmJ9fmgWNFiT9ac8kQFF+RcWHF7Os5rY8lJT4/qJ4oN9s8
 xk8xa45+TqWG9RpScqnZt6AzAFNNF1aa7lqxyvyBruELzIHymKJ+31+BX2X5dDET7cjp
 ER9fM1u67TKynMbiBwVcxhZ5AvxnKszaspASQpD8mLyVCeLh5TiYEsGJoCwLvRP1KE2l
 4Ng6NfvSIWpHggoJEQMYFF+xr21N4x8MngCaF3KZ3T/LabZfpNz78/Ej1ggV3H/TInkh
 lR/0tBJlnoCJsaoKAws/8+wibk+ouYDWbqbQzuxtHhF/zzTk0drtmBvkGj9EQnnHFHEE
 MwTg==
X-Gm-Message-State: ACrzQf3Ca24NJHi/FMGGN2YzfxQszyDvfqtjp7KcLndFIsNXvijLQjiV
 L8kZRrlPAY7EJtD4bUHVop9ANw9ANSPIB9j0DVdYDxRip3XKqVdABgksqfgBlQ9HB8x3RE8NLmO
 QnQ/b9j0KrezsXX06fm1oH1AO+Je/
X-Received: by 2002:a17:907:746:b0:741:4a1b:cb1f with SMTP id
 xc6-20020a170907074600b007414a1bcb1fmr7525382ejb.370.1663448456483; 
 Sat, 17 Sep 2022 14:00:56 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5Ujq+gRezwFh4CnNhRVuz2TwAkMK2z+s4MShfToeWryB9KfrEiujoSUDkRKn+At/ivoKJ3ig==
X-Received: by 2002:a17:907:746:b0:741:4a1b:cb1f with SMTP id
 xc6-20020a170907074600b007414a1bcb1fmr7525369ejb.370.1663448456296; 
 Sat, 17 Sep 2022 14:00:56 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 k22-20020aa7d8d6000000b00445f9faf13csm16517302eds.72.2022.09.17.14.00.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Sep 2022 14:00:55 -0700 (PDT)
Message-ID: <a3ab15e8-b4a1-171d-a5cd-0ae1ed06998e@redhat.com>
Date: Sat, 17 Sep 2022 23:00:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 3/5] drm/gma500: Use backlight_get_brightness() to get
 the brightness
To: Sam Ravnborg <sam@ravnborg.org>
References: <20220917140352.526507-1-hdegoede@redhat.com>
 <20220917140352.526507-4-hdegoede@redhat.com> <YyYyGivJbsnp+T4D@ravnborg.org>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YyYyGivJbsnp+T4D@ravnborg.org>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/17/22 22:46, Sam Ravnborg wrote:
> On Sat, Sep 17, 2022 at 04:03:50PM +0200, Hans de Goede wrote:
>> Use backlight_get_brightness() instead of directly referencing
>> bd->props.brightness. This will take backlight_is_blank() into account,
>> properly setting brightness to 0 when screen-blanking has been requested
>> through the backlight sysfs interface.
>>
>> Suggested-by: Sam Ravnborg <sam@ravnborg.org>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Thank you.

I have just send out a v3 with your ack added and fixing the
2 unused variables when CONFIG_BACKLIGHT is not set spotted
by the lkp test robot.

I was sort of hoping that you could review / ack the entire
series ?

Regards,

Hans


>> ---
>> Changes in v2 of the patch-set:
>> - New patch in v2 of the patch-set
>> ---
>>  drivers/gpu/drm/gma500/backlight.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/gma500/backlight.c b/drivers/gpu/drm/gma500/backlight.c
>> index d113c5810ca5..9be28dc0bdd1 100644
>> --- a/drivers/gpu/drm/gma500/backlight.c
>> +++ b/drivers/gpu/drm/gma500/backlight.c
>> @@ -52,7 +52,7 @@ static int gma_backlight_get_brightness(struct backlight_device *bd)
>>  static int gma_backlight_update_status(struct backlight_device *bd)
>>  {
>>  	struct drm_device *dev = bl_get_data(bd);
>> -	int level = bd->props.brightness;
>> +	int level = backlight_get_brightness(bd);
>>  
>>  	/* Percentage 1-100% being valid */
>>  	if (level < 1)
>> -- 
>> 2.37.3
> 

