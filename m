Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CD4977F41
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 14:08:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE01F10ED04;
	Fri, 13 Sep 2024 12:08:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="EsUJLtBm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9214A10ED04
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 12:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726229288;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Gt2K4SpnjvNK2RNfN5QlvVm+/InFTkHwPX02Iy2nOWY=;
 b=EsUJLtBm2dkeq8poLhk9IT/3kDTfg1fMwwohyTpfwMh8wpQFCAyU6saqQxkVCLoXLgR1Bt
 kIwb3gHSGKBagTrvE0LOnlvOzFNLk+q30wPRcOTG2gqyCZrHBSR/n8IRAnf1CkC7rSbhha
 1BUBt3u4SPrz8qwiFAxLu0XzHxg93ag=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-wqzX17T_N5CgetTPx4aqlA-1; Fri, 13 Sep 2024 08:08:07 -0400
X-MC-Unique: wqzX17T_N5CgetTPx4aqlA-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-53654fd283bso541710e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Sep 2024 05:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726229286; x=1726834086;
 h=mime-version:message-id:date:references:in-reply-to:subject:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Gt2K4SpnjvNK2RNfN5QlvVm+/InFTkHwPX02Iy2nOWY=;
 b=CZ1/QAzC0sbrqxRhnNOk/RPaHkiCu60B7o3LrbkXezWKB2cz8yJzLCMpvqPfQW+lcX
 KlJH5GwUybiNatojlmRBCUGsHIepHZPtS4Df8ce3xxTp1A2poQ0bU18WEWIKMvUebb9S
 WWASmxw2VRI56rVLAeSQAufWVyPcTBJ25Jz5yg6LJZBBDWTsx4XdG7soHgMhCjndObm+
 7k7wi86bZyqFaPaC3PPjYFBurqbJ3T/JnV0QOwvGyTzozjLdqKq8ghXLeRCgnm0eLzgC
 6FxSgaE6/Wa14xt3incOQ+jDOQxg4dPqvUD0VuxQNmKQOxwQpmoJrLe3th391MzbfNBu
 WZnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4h94JILSA78r8y3+mNQLLdn3uARNFfWZPr1kPQ11Z2LABPWYgyD4MlHYq7tFGhq5XYyYXR0/T724=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7Q0/pbKH+ppL0ikxwtY0l/11t624lz9hIf0t9Vyu/iIfTWg7k
 1SZyO/6nK1pGrHEZThbaumZ6qT8L01tFh1uCusAjNc4cd5kRwSWwxeSjE9Ka3V4JMMaCIeXBVWt
 Ddf4FYDbnGaJNwO2/ABn0kmIbhumCA1cbPA6gLox2b61XXSAg55mJkumAaPmuOr5fCA==
X-Received: by 2002:a05:6512:10d0:b0:536:5515:e9b5 with SMTP id
 2adb3069b0e04-5367ff3230fmr1587034e87.52.1726229285570; 
 Fri, 13 Sep 2024 05:08:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGla7q5cNgYR21HLWSQMiw4+4Hf61aEwlK/E6xC07i5HWwpkVKw4V8vM9Gds6M7ClHhBHI/w==
X-Received: by 2002:a05:6512:10d0:b0:536:5515:e9b5 with SMTP id
 2adb3069b0e04-5367ff3230fmr1586995e87.52.1726229284977; 
 Fri, 13 Sep 2024 05:08:04 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42d9b159d99sm22588765e9.11.2024.09.13.05.08.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Sep 2024 05:08:04 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Ilia Mirkin
 <imirkin@alum.mit.edu>, James Jones <jajones@nvidia.com>, Karol Herbst
 <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>, Danilo Krummrich
 <dakr@redhat.com>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Subject: Re: [PATCH v3 1/2] drm/panic: Add ABGR2101010 support
In-Reply-To: <a58be9b0-d766-401f-8666-8e693b1b38da@redhat.com>
References: <20240913071036.574782-1-jfalempe@redhat.com>
 <20240913071036.574782-2-jfalempe@redhat.com>
 <87h6akyq49.fsf@minerva.mail-host-address-is-not-set>
 <a58be9b0-d766-401f-8666-8e693b1b38da@redhat.com>
Date: Fri, 13 Sep 2024 14:08:03 +0200
Message-ID: <87bk0rzrh8.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jocelyn Falempe <jfalempe@redhat.com> writes:

> On 13/09/2024 09:22, Javier Martinez Canillas wrote:
>> Jocelyn Falempe <jfalempe@redhat.com> writes:
>> 
>> Hello Jocelyn,
>> 
>>> Add support for ABGR2101010, used by the nouveau driver.
>>>
>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>> ---
>>>   drivers/gpu/drm/drm_panic.c | 10 ++++++++++
>>>   1 file changed, 10 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
>>> index 74412b7bf936..0a9ecc1380d2 100644
>>> --- a/drivers/gpu/drm/drm_panic.c
>>> +++ b/drivers/gpu/drm/drm_panic.c
>>> @@ -209,6 +209,14 @@ static u32 convert_xrgb8888_to_argb2101010(u32 pix)
>>>   	return GENMASK(31, 30) /* set alpha bits */ | pix | ((pix >> 8) & 0x00300C03);
>>>   }
>>>   
>>> +static u32 convert_xrgb8888_to_abgr2101010(u32 pix)
>>> +{
>>> +	pix = ((pix & 0x00FF0000) >> 14) |
>>> +	      ((pix & 0x0000FF00) << 4) |
>>> +	      ((pix & 0x000000FF) << 22);
>>> +	return GENMASK(31, 30) /* set alpha bits */ | pix | ((pix >> 8) & 0x00300C03);
>>> +}
>> 
>> Maybe we can move this format conversion helper and the others in the
>> driver to drivers/gpu/drm/drm_format_helper.c ?
>
> I think there are still a few issues with that. First is that 
> drm_format_helper.c is in a separate module, so you can't call its 
> functions from the main drm module, where drm_panic is.
>

I see.

> In my drm_log series, https://patchwork.freedesktop.org/series/136789/ I 
> moved this to drm_draw.c, and maybe drm_format_helper could re-use that ?
>

That makes sense to me as well. Thomas, what do you think ?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

