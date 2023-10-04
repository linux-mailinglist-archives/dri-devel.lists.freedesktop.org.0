Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 729C97B78BE
	for <lists+dri-devel@lfdr.de>; Wed,  4 Oct 2023 09:30:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CB5310E0D9;
	Wed,  4 Oct 2023 07:30:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA19210E0D9
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Oct 2023 07:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696404625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DuW+lv88yfI73df4xngNIpmGwVkH0246sqFu53t3vwA=;
 b=IGHHo4lQHOjfe54nZK7bvv0Y7ZW18GsU1QDch1aE3EuCNWQpQAMu23ihl4EyYmAk/CWQNT
 m6efiyOKh8w56sJDNCs/QxW0CJSOIqOPvSn26+cFvQDqmEE7gMeRGjWqly63zSY+xxc+Eu
 9MtGWyZ2rsMMS5jd0ev9S11h4tYMgII=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-110-n-kyp4vEOv2e8HLi9HUDbQ-1; Wed, 04 Oct 2023 03:30:22 -0400
X-MC-Unique: n-kyp4vEOv2e8HLi9HUDbQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3247f646affso260377f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Oct 2023 00:30:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696404621; x=1697009421;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DuW+lv88yfI73df4xngNIpmGwVkH0246sqFu53t3vwA=;
 b=NdyB5XkpySnGg85N8ff4/PefacCLd3oSwcIEzlIa++DPxOP4DTTg3URAoXMfqtE3sa
 Z3aZCRLsTbys34ygLwKNMCXzJwybXHDHWCE73WGcZ+qucKgShqfnIGHfC+zZJ6p6c624
 WwozelTjhB6te1oXz/Q+BtFKEK58XCQgiqQJVMYk3bqYZy/KI0dsKiAlkP3C5kaEQqqy
 /sc1alY5idpL1LImI2NVX/+c4MzwY+4/EmcbP4g5eTsHvX0s4D5Nwmwid95v2aSUqEK8
 hL1+2rn83WL8D50GR5+UNZt8ExOZ8cLiQpw6FeeWs8Hx8SLWUBZA9yiSYKXRfNSv029A
 EnmQ==
X-Gm-Message-State: AOJu0YxAPw5zH+83GHaChjtITESB1Gsu0KSE6U85jlJIi7r6DNCg9wLq
 BPGj7SNW+heLJmstM2wWOtgJvG+6fRdbDLCYi7xs2qj+y1IT5SY3TqQUhJmv+WUqAv3sa4p/Ul0
 6T7Sz+ba8OW3WBBcbUryWyeZNyKHH
X-Received: by 2002:adf:f209:0:b0:31f:e02b:18ae with SMTP id
 p9-20020adff209000000b0031fe02b18aemr1059895wro.24.1696404621380; 
 Wed, 04 Oct 2023 00:30:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMyOYkT9fIP9wtG1bzdeXJgHMiOSdCdSr8qJKoCo0Ux46Cqe9/guApS4a+zA6tv6egULA5jA==
X-Received: by 2002:adf:f209:0:b0:31f:e02b:18ae with SMTP id
 p9-20020adff209000000b0031fe02b18aemr1059870wro.24.1696404620955; 
 Wed, 04 Oct 2023 00:30:20 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 q15-20020adfcd8f000000b00327297abe31sm3305892wrj.68.2023.10.04.00.30.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Oct 2023 00:30:20 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, jfalempe@redhat.com,
 jose.exposito89@gmail.com, arthurgrillo@riseup.net, mairacanal@riseup.net,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 daniel@ffwll.ch, noralf@tronnes.org
Subject: Re: [PATCH v2 1/5] drm/format-helper: Add struct drm_xfrm_buf to
 cache format conversion
In-Reply-To: <779d4fea-fb56-4e8d-8b01-34e13c027d30@suse.de>
References: <20230920142535.19321-1-tzimmermann@suse.de>
 <20230920142535.19321-2-tzimmermann@suse.de>
 <87jzs94c64.fsf@minerva.mail-host-address-is-not-set>
 <779d4fea-fb56-4e8d-8b01-34e13c027d30@suse.de>
Date: Wed, 04 Oct 2023 09:30:19 +0200
Message-ID: <87bkdex2t0.fsf@minerva.mail-host-address-is-not-set>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Hi Javier
>
> Am 29.09.23 um 10:27 schrieb Javier Martinez Canillas:

[...]

>>> +/**
>>> + * struct drm_xfrm_buf - Stores transformation and conversion state
>>> + *
>>> + * DRM helpers for format conversion store temporary state in
>>> + * struct drm_xfrm_buf. The buffer's resources can be reused
>> 
>> And same here. Maybe struct drm_fmt_conversion_buf ?
>
> I find this name to be unpleasant to read. Can we use 
> drm_format_conv_state or drm_fmtcnv_state?
>

Sure, it was just a suggestion. Anything than xfrm_buf works for me :)

From your options I prefer the former, which is easier to understand.

> In the discussion about the panic handler, I mentioned that the struct 
> can be used to store more inforamtion, such as palette entries or fg/bg 
> colors. That would enable support for converting indexed formats, hence 
> the _state postfix.
>

Got it. Makes sense.

> In the longer term, I'd also like to replace the drm_framebuffer from 
> the API and then rename the functions to something like 
> drm_fmtcnv_<x>_to_<y>(). The framebuffer really doesn't make much sense 
> any longer.
>

Agreed.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

