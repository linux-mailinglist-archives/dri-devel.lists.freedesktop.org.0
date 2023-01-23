Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4D7677774
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 10:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C66110E238;
	Mon, 23 Jan 2023 09:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3E0710E238
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 09:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674466399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=040KxTs2ePdANSvvw1yof3NNnbhFNmWMhiFuux+g674=;
 b=g25zDl+RStgvhPYZqcSGLBSPwVZ+k+dOky0LrKa7LjrbMh4tKcrXiHs2W/wB0oQxPZrK1O
 T1EedMlQY79YU/j4086argApsgpiTjLztMSrf5usl3ZyjXt3e+bcIHB+ZrYc6+Kvj5GBXZ
 WyEocA2h+nMuDMBrhVCJizXXUgk+fGM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-264-upwN3rkdM-yVbZG1_n8ezA-1; Mon, 23 Jan 2023 04:33:18 -0500
X-MC-Unique: upwN3rkdM-yVbZG1_n8ezA-1
Received: by mail-wr1-f69.google.com with SMTP id
 r1-20020adfa141000000b002be28fd4a7bso1824025wrr.12
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 01:33:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=040KxTs2ePdANSvvw1yof3NNnbhFNmWMhiFuux+g674=;
 b=3vPnT1m7oTR6bNIY6zEgwLC9Rn57jZVC01O5wgNP4If27je4/JBjpDyVdL8rngAC7S
 +LUiHs5bDNk2klaI76KES4X6/EqfugiOxza+ooSYhgxiOElu6eYhk1/OC5+E1BXqCLH6
 hoy1wcO8zdvXIz5f/T4tuSqpgZtNSjZ9OnJbrqgyJUiKsUd22UGzRdJG4Hve/jQS0OUo
 zqZ95Ln3ImsSr7ZJFesnESO09kxQpINqBDV8w0rLTmMrvvAsY9IsElmDoXCvcM0th6dQ
 /YLD2ePsx9OPpwj8YiYU4s5le2DN4tfQfcgCf5vABmRwnSL8DCN+4LxEjJZ62/rEg3/2
 Trig==
X-Gm-Message-State: AFqh2kooPGsZH2KTg1XHeeXHBGx4kBEuK6bzgiGQgGPP8dPsvuSWIWkK
 JVtlDhTOk+zdc2JiFj4/kr1RpMoPrkZ5MI3QmIzjtNCe0QXdfGFjYVYGEtdxVOcMB/N6OwzfQ7g
 CsTDijlAb2XaGue6yDzx0qiglnaFE
X-Received: by 2002:adf:f606:0:b0:24b:b74d:8012 with SMTP id
 t6-20020adff606000000b0024bb74d8012mr19726907wrp.18.1674466396956; 
 Mon, 23 Jan 2023 01:33:16 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtQpTzU7cfyCuVx0tTBCPbzhfOp0nkTV+MwfSNgRDFPKbLiOPd39w/YPxOVRaorNKJwI43Zkw==
X-Received: by 2002:adf:f606:0:b0:24b:b74d:8012 with SMTP id
 t6-20020adff606000000b0024bb74d8012mr19726896wrp.18.1674466396741; 
 Mon, 23 Jan 2023 01:33:16 -0800 (PST)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 w8-20020adf8bc8000000b002bdc39849d1sm30257956wra.44.2023.01.23.01.33.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Jan 2023 01:33:16 -0800 (PST)
Message-ID: <c7a21f75-35c8-486b-1f10-7c536573cd2a@redhat.com>
Date: Mon, 23 Jan 2023 10:33:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] drm/ssd130x: Silence a `dubious: x & !y` warning
To: David Laight <David.Laight@ACULAB.COM>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230121190930.2804224-1-javierm@redhat.com>
 <e5279ea9dfab400c8e6cd9346fb41a1d@AcuMS.aculab.com>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <e5279ea9dfab400c8e6cd9346fb41a1d@AcuMS.aculab.com>
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello David,

Thanks for your feedback.

On 1/23/23 10:26, David Laight wrote:
> From: Javier Martinez Canillas
>> Sent: 21 January 2023 19:10
>>
>> The sparse tool complains with the following warning:
>>
>> $ make M=drivers/gpu/drm/solomon/ C=2
>>   CC [M]  drivers/gpu/drm/solomon/ssd130x.o
>>   CHECK   drivers/gpu/drm/solomon/ssd130x.c
>> drivers/gpu/drm/solomon/ssd130x.c:363:21: warning: dubious: x & !y
>>
>> This seems to be a false positive in my opinion but still we can silence
>> the tool while making the code easier to read. Let's also add a comment,
>> to explain why the "com_seq" logical not is used rather than its value.
>>
>> Reported-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>
>>  drivers/gpu/drm/solomon/ssd130x.c | 11 +++++++++--
>>  1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
>> index c3bf3a18302e..b16330a8b624 100644
>> --- a/drivers/gpu/drm/solomon/ssd130x.c
>> +++ b/drivers/gpu/drm/solomon/ssd130x.c
>> @@ -81,7 +81,7 @@
>>  #define SSD130X_SET_PRECHARGE_PERIOD2_MASK	GENMASK(7, 4)
>>  #define SSD130X_SET_PRECHARGE_PERIOD2_SET(val)	FIELD_PREP(SSD130X_SET_PRECHARGE_PERIOD2_MASK, (val))
>>  #define SSD130X_SET_COM_PINS_CONFIG1_MASK	GENMASK(4, 4)
>> -#define SSD130X_SET_COM_PINS_CONFIG1_SET(val)	FIELD_PREP(SSD130X_SET_COM_PINS_CONFIG1_MASK, !(val))
>> +#define SSD130X_SET_COM_PINS_CONFIG1_SET(val)	FIELD_PREP(SSD130X_SET_COM_PINS_CONFIG1_MASK, (val))
> 
> How about just changing !(val) to (val) ? 0 : 1
> It should shut the compiler up and is probably more descriptive.
> 

I'm not sure if is more descriptive than what I have with this patch. As
mentioned, I believe this really is a sparse false positive but given that
need to change, I preferred to make it quite explicit with a new variable
and a comment.

This is only executed once at driver probe time anyways.

> 	David

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

