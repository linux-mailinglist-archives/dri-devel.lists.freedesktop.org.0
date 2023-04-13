Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 208BF6E13DC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 20:04:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D72A10E046;
	Thu, 13 Apr 2023 18:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A913110E046
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 18:04:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681409082;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+dsa8AT9LrvaH3MnL8WKmBRioCu+s9PYiLJBxZ5H788=;
 b=HC3ZBRwr6K0Kq1cB1nnAoB0Vf4V+V4B1CfCoeojwHRiOduP5/izVpCkzL9X5ehoKsfh13M
 OWP8i8JGg+BqpuE57qVYbYSfLPIIQ/YSyiL1tdrZ7CNEF6RHFcWyC5gQmGQNu4jBWgWFC6
 go6YgZi1URW+FOPZKmFRN0MUwvG+iPM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-478-wsxY8kopO9iaroNz1Ol3LQ-1; Thu, 13 Apr 2023 14:04:41 -0400
X-MC-Unique: wsxY8kopO9iaroNz1Ol3LQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 j16-20020a05600c1c1000b003f0a7c48403so1620369wms.8
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Apr 2023 11:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681409080; x=1684001080;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+dsa8AT9LrvaH3MnL8WKmBRioCu+s9PYiLJBxZ5H788=;
 b=LCsrJXxTu7EdmxTTNgnzOC2+VcZ71iEjuZb/yHxV1I7dHIS9PEp3SqZJChfvB+c9cq
 1OL9ytqozzQwlKw0siRZ/O+HeYaiOpE718/eVE+ed6a3IbOtETm3vUOLmzlR/GpOT0nL
 ZmNZUmOIITZvDc5toNJxrYab2XvnlsHYraYKBbnj0J10gn1twiG/6P62pn2b7IpzbxRV
 VZ9Evczm4FVR9ySIm81lNWDxWbN8ytAER7SCqF5i9S/AoNpVFgOGjXxpJbovMzE9ErHs
 LDSD94KBHvlJMX0Icwo9vZGDoZznYW4drUef+JqAM5LENbTfS9nEvgyK1pJIdocFYL5C
 BlBA==
X-Gm-Message-State: AAQBX9dQpMDgO2kk+UNHZHLmPapvcUP5hVxs8TOYheEyHYYqjzivtbDP
 apM6DZKZVVXeXGUi1yGHziMaf6PLUxOS9AO8VKrWVU/PPszp9lwZ8gNLbNGLK0oSJiTMmiEBOS2
 0SUIORGMJjgYhnYn82tALLcH8+3IE
X-Received: by 2002:a05:600c:2943:b0:3f0:7ddf:d8e1 with SMTP id
 n3-20020a05600c294300b003f07ddfd8e1mr2593796wmd.14.1681409080134; 
 Thu, 13 Apr 2023 11:04:40 -0700 (PDT)
X-Google-Smtp-Source: AKy350a3ljC8OBfSdasM597Vx3IM790lSUv258Si+HcKeU4d67V+XpRuhf1VUC5il7UahvwGB+r8kQ==
X-Received: by 2002:a05:600c:2943:b0:3f0:7ddf:d8e1 with SMTP id
 n3-20020a05600c294300b003f07ddfd8e1mr2593781wmd.14.1681409079785; 
 Thu, 13 Apr 2023 11:04:39 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 g5-20020a7bc4c5000000b003ee10fb56ebsm2444844wmk.9.2023.04.13.11.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 11:04:39 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Pierre Asselin <pa@panix.com>
Subject: Re: [PATCH] firmware/sysfb: Fix wrong stride when bits-per-pixel is
 calculated
In-Reply-To: <84b1b88aabf7e70951d7680f05694249.squirrel@mail.panix.com>
References: <20230412150225.3757223-1-javierm@redhat.com>
 <2e07f818ccdff7023a060e732d7c4ef6.squirrel@mail.panix.com>
 <87jzyhror0.fsf@minerva.mail-host-address-is-not-set>
 <beeff0335ab4cc244d214a7baadba371.squirrel@mail.panix.com>
 <CAFOAJEdKBUg91pDmNYYw5xigUxjifBgOLz2YgD+xQ+WyEy=V2w@mail.gmail.com>
 <1afd3044c2aca9322ecf304941c7df66.squirrel@mail.panix.com>
 <87fs94stgw.fsf@minerva.mail-host-address-is-not-set>
 <87cz48srs4.fsf@minerva.mail-host-address-is-not-set>
 <40edb0fdb0eaff434f4872dd677923a6.squirrel@mail.panix.com>
 <87a5zcsqg8.fsf@minerva.mail-host-address-is-not-set>
 <9e6fff69b09b36cbdd96499cd0015154.squirrel@mail.panix.com>
 <4PxhQn3zK1zcbc@panix1.panix.com>
 <87o7nsuumt.fsf@minerva.mail-host-address-is-not-set>
 <84b1b88aabf7e70951d7680f05694249.squirrel@mail.panix.com>
Date: Thu, 13 Apr 2023 20:04:38 +0200
Message-ID: <87edonr749.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: jfalempe@redhat.com, Pierre Asselin <pa@panix.com>, daniel.vetter@ffwll.ch,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 hdegoede@redhat.com, tzimmermann@suse.de, ardb@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

"Pierre Asselin" <pa@panix.com> writes:

>> diff --git a/drivers/firmware/sysfb_simplefb.c
>> b/drivers/firmware/sysfb_simplefb.c
>> index 82c64cb9f531..0ab8c542b1f5 100644
>> --- a/drivers/firmware/sysfb_simplefb.c
>> +++ b/drivers/firmware/sysfb_simplefb.c
>> @@ -55,14 +55,10 @@ __init bool sysfb_parse_mode(const struct screen_info
>> *si,
>>  	 * ignore simplefb formats with alpha bits, as EFI and VESA
>>  	 * don't specify alpha channels.
>>  	 */
>> -	if (si->lfb_depth > 8) {
>> -		bits_per_pixel = max(max3(si->red_size + si->red_pos,
>> -					  si->green_size + si->green_pos,
>> -					  si->blue_size + si->blue_pos),
>> -				     si->rsvd_size + si->rsvd_pos);
>> -	} else {
>> +	if (si->lfb_depth > 8)
>> +		bits_per_pixel = si->lfb_linelength * 8 / si->lfb_width;
>> +	else
>>  		bits_per_pixel = si->lfb_depth;
>> -	}
>>
>>  	for (i = 0; i < ARRAY_SIZE(formats); ++i) {
>>  		const struct simplefb_format *f = &formats[i];
>>
>> base-commit: e62252bc55b6d4eddc6c2bdbf95a448180d6a08d
>> --
>> 2.40.0
>
> Patch is good on both boxes.
>

Thanks for testing it! I'll wait for Thomas though before posting as a
proper patch. I'm sure whether we can rely on lfb_linelength or not...

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

