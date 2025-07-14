Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96489B03B48
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 11:47:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1913310E1FB;
	Mon, 14 Jul 2025 09:47:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JnmtU2rF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9789F10E1FB
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 09:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752486461;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Tg6OrG2lClZinE0UYtX6042I+em3JNwfWFCrJiRfTNs=;
 b=JnmtU2rFp8t6YbpBjb+PYQkj62p1TI39VLR0O090W2FkKamm2WnnrhBhgKyZzDwr8EYtv4
 WBJK5HdJK9H6bAHt1HhsAJnIEjKcezLx4GJ7a6yq6Xw6l5nhBaEBxh4AI5CiH5lIS0ZlyC
 O4PN0I4XAl0MPpmZXxQgZu0nwJqWRqI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-i9rnLhT0O_Ks50fJEpK-XA-1; Mon, 14 Jul 2025 05:47:38 -0400
X-MC-Unique: i9rnLhT0O_Ks50fJEpK-XA-1
X-Mimecast-MFC-AGG-ID: i9rnLhT0O_Ks50fJEpK-XA_1752486458
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-454dee17a91so30905135e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 02:47:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752486457; x=1753091257;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tg6OrG2lClZinE0UYtX6042I+em3JNwfWFCrJiRfTNs=;
 b=ZdJkyzSlSwKJ1Br0JN+BveJE0Ci2dnOFmLwIKwVr1LDKZqoh5+b63+OVI231rKVNl/
 PnrZaoAPcViTKeXQhiXCx0JtTMHvgUZVUamAqeL8ZprF/5iBy3XfDpvtZWBMrXTDlFPG
 Bf/l1+K/L2xUyrVw+/W4cgJIRNSqzrsziUkaHcJUuPlLe8NIlp61UFzy5yUN0rVrWrpX
 VPC3sytcuKVtqoNSHXMdBBKLrWMW/OO3xgKhC+KHeGm1vQDNEBG9oXkVVppXBG4lvCDM
 lskZrMALAb56tYlfQIaWKP468mZn0sILTQm0mSbxKckKYKVrpE0j6+vHYEOHt2Y9JWyS
 LGeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCViHjFK4yXu0nJqll17CMqXMo7yqBOt/jvq8a4DKKRcA0bwrLEu22MRg/6UbWc+CDVpm3nkiApwk7o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuRHuKHcsk4rhZNJu1n6h1Iz50IiRqjkdMU6Zvy3r6dYUTZ7aP
 A1PiQKALKtDVlAETkICBwiTdVo/oftG8sr90MFQLW8tfuajLtG2o92t1gpzG+dXiX/M2bcoEXTB
 JGx3Pr3GCLcWTeQpAAx0thDVCm0Gh9w0lgg2AHoq0TXV8FgtSIYOEtYKFr/qnzTt0yVmXZA==
X-Gm-Gg: ASbGncuulgP9UUWVIGxlz4z2vtLRg+k2vGvqKT/hV9ZUzlz/O8pKZAImQJmimdGXY2K
 7HbKmKlqgjF/ZNJhfaPt4KojgPneFKzXapmI2kjPxpcdHX0dT5hXGotThO+h+hyAMVFsmSEwfOC
 gabPoo/B7MlC3LbkxSvi5R2jIlaq2tBriYhprrK1HwC7DHpzwCx160C8B62fbDtkFHFW5KyIWM6
 8uB/TdDxmFAOQ3eMYGrdDjWlE7eh8+LV9Y0csLf2fhbcEAtAFT8SXiUgEl1R3VudLyKLC92kJRV
 HlE1pliB2Uoa0vAZjnhD1dOlCHFFQ+eu6sd+cHBqE1O3DrZl0y5cBODgfXTL6nOBBQ==
X-Received: by 2002:a05:600c:3512:b0:441:d437:e3b8 with SMTP id
 5b1f17b1804b1-454f425e54bmr104132915e9.23.1752486457487; 
 Mon, 14 Jul 2025 02:47:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6GLJ/UoOdy4fat1894JkNggjKUy6Oe0jdCke5tLCOwZhy64jd93MzBjwuQH2IlasuWTc/rw==
X-Received: by 2002:a05:600c:3512:b0:441:d437:e3b8 with SMTP id
 5b1f17b1804b1-454f425e54bmr104132715e9.23.1752486456999; 
 Mon, 14 Jul 2025 02:47:36 -0700 (PDT)
Received: from localhost ([89.128.88.54]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-456111574adsm49430775e9.11.2025.07.14.02.47.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jul 2025 02:47:36 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Cc: ipedrosa@redhat.com, David Airlie <airlied@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Marcus Folkesson
 <marcus.folkesson@gmail.com>, Maxime Ripard <mripard@kernel.org>, Simona
 Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 2/3] drm/sitronix/st7571-i2c: Make the reset GPIO to be
 optional
In-Reply-To: <a5cb70b2-f724-4d5e-910c-0b92dd759ebf@suse.de>
References: <20250710102453.101078-1-javierm@redhat.com>
 <20250710102453.101078-3-javierm@redhat.com>
 <a5cb70b2-f724-4d5e-910c-0b92dd759ebf@suse.de>
Date: Mon, 14 Jul 2025 11:47:35 +0200
Message-ID: <87tt3fksso.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8SITTB6h1VkOFvc8Phl6MbdgYPVi-OUFAn375i2-Tpg_1752486458
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi
>
> Am 10.07.25 um 12:24 schrieb Javier Martinez Canillas:
>> Some Sitronix LCD controllers (such as the ST7567) don't have a reset pin,
>> so lets relax this in the driver and make the reset GPIO to be optional.
>>
>> The devm_gpiod_get_optional() helper is similar to devm_gpiod_get(), but
>> returns NULL when there isn't a reset-gpios property defined in a DT node.
>>
>> The DT binding schema for "sitronix,st7571" that require a reset GPIO will
>> enforce the "reset-gpios" to be present, due being a required DT property.
>> But in the driver itself the property can be made optional if not defined.
>>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
>> ---
>>
>>   drivers/gpu/drm/sitronix/st7571-i2c.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/sitronix/st7571-i2c.c b/drivers/gpu/drm/sitronix/st7571-i2c.c
>> index eec846892962..73e8db25f895 100644
>> --- a/drivers/gpu/drm/sitronix/st7571-i2c.c
>> +++ b/drivers/gpu/drm/sitronix/st7571-i2c.c
>> @@ -802,15 +802,19 @@ static int st7571_parse_dt(struct st7571_device *st7571)
>>   	st7571->nlines = dt.vactive.typ;
>>   	st7571->ncols = dt.hactive.typ;
>>   
>> -	st7571->reset = devm_gpiod_get(dev, "reset", GPIOD_OUT_HIGH);
>> +	st7571->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_HIGH);
>>   	if (IS_ERR(st7571->reset))
>> -		return PTR_ERR(st7571->reset);
>> +		return dev_err_probe(dev, PTR_ERR(st7571->reset),
>> +				     "Failed to get reset gpio\n");
>
> There's struct st7571_panel_data. It could store a flag signalling the 
> expected behavior.
>

Indeed.

> With more effort the panel_data could store a dedicated parse_dt pointer 
> for each panel type. ASAICT the st7567 features a subset of the other 
> type. So there might not be much code duplication.
>

This is a good idea too. I think that will do that for v2.

Thanks a lot for your feedback!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

