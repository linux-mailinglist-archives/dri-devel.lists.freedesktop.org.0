Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B4B77940F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Aug 2023 18:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017C310E6AE;
	Fri, 11 Aug 2023 16:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11FA910E6AE
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 16:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691770383;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AEd1N/WLJj8h1GEA2Rg2D+WQa3vhRXC+by3X7jYd08Y=;
 b=g4EBH6HLlcLoCxOVaUbktw3OX0AUo5h/pmVfOd48s81EVKMf+4MTDKlFKAVy3Rs/KIrwyw
 J34yBAWHZ7gUD6Bw5QouB30/eZEZVBY95zQy1rbZIsX4oCoT8z2xxlSnORK1rzpQ3bUAX9
 ojpJ5Vj0a+CcxGEITQ7gnv/Jays2E4Y=
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com
 [209.85.160.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427--Zebru3aPtG1CX-hiHq9Iw-1; Fri, 11 Aug 2023 12:13:02 -0400
X-MC-Unique: -Zebru3aPtG1CX-hiHq9Iw-1
Received: by mail-oa1-f71.google.com with SMTP id
 586e51a60fabf-1c4acf81562so487979fac.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Aug 2023 09:13:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691770381; x=1692375181;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AEd1N/WLJj8h1GEA2Rg2D+WQa3vhRXC+by3X7jYd08Y=;
 b=IAkIRQO+wtvJ8AGtHELhhSVs4d+S8pZWNA+a8l774V95+oeU7YR2/0/iwGPSCC/BEd
 aNQgSb42ko1sTszjbJFZMB7ohhpGkoFf7RiWlNRxqEa59YLFqExL+Z/746oBCLEe/eBU
 PdNckX8HmLWDnVnvi8hrJX1SspUcbN1+p33SQrU1p0flQkztOe1BSOdrrYwlRoZO+i1l
 B58yj9WmjDAcff3vRBieWXFInr3XRELzZAA9fDLOVK6Mam8AYbkSmYf+bLwC1y1r0Oh5
 eexoHTLXg9XyWXKAWeve1I494SGBnnWKeBIwulxMagIJeTPnjN1/KNqIyuORJ9v4c1t4
 95/Q==
X-Gm-Message-State: AOJu0YzJarq0B1VpyH2jbuTwLgNIlSYGyKkJjFGYPM/99QtcRCZsQN0z
 LFWoO+nf1FpggOP6uE+gzN9RHgT6Eis22k8SwyneA4cFSb5YqbX8p5ijxRtxdOutKqzky6Yi0a6
 5nDi/VPDZ/PoLhsk0cbQFUzz1VYvC1XWG9MMc
X-Received: by 2002:a05:6870:fb8a:b0:1c0:2e8f:17fd with SMTP id
 kv10-20020a056870fb8a00b001c02e8f17fdmr3130026oab.40.1691770381006; 
 Fri, 11 Aug 2023 09:13:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEg/cZlTCozT36kYR6fh9C7ePlIJvkwHbMuaka3VzDOcqH5y3L+zqHIf2GPRM56Z/yJsayy0Q==
X-Received: by 2002:a05:6870:fb8a:b0:1c0:2e8f:17fd with SMTP id
 kv10-20020a056870fb8a00b001c02e8f17fdmr3130010oab.40.1691770380791; 
 Fri, 11 Aug 2023 09:13:00 -0700 (PDT)
Received: from localhost ([181.120.144.238]) by smtp.gmail.com with ESMTPSA id
 t20-20020a4a8254000000b0056c91e89f6dsm1828960oog.37.2023.08.11.09.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Aug 2023 09:13:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Jocelyn Falempe <jfalempe@redhat.com>, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH 1/1] drm/fourcc: Add documentation about software color
 conversion.
In-Reply-To: <59344d6e-78f1-d691-7e38-0ffc33b6b078@redhat.com>
References: <20230807140317.26146-1-jfalempe@redhat.com>
 <20230807140317.26146-2-jfalempe@redhat.com>
 <iadbqczfvboqyxebbnjkjef3dttcaa76vu3e4ylve6cxaypbqf@oz5hhu3xrryr>
 <59344d6e-78f1-d691-7e38-0ffc33b6b078@redhat.com>
Date: Fri, 11 Aug 2023 18:12:57 +0200
Message-ID: <87h6p5fth2.fsf@minerva.mail-host-address-is-not-set>
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
Cc: tzimmermann@suse.de, dri-devel@lists.freedesktop.org, ppaalanen@gmail.com,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Jocelyn Falempe <jfalempe@redhat.com> writes:

Hello Jocelyn,

> On 10/08/2023 09:45, Maxime Ripard wrote:
>> Hi
>> 
>> On Mon, Aug 07, 2023 at 03:45:15PM +0200, Jocelyn Falempe wrote:
>>> After discussions on IRC, the consensus is that the DRM drivers should
>>> not do software color conversion, and only advertise the supported formats.
>>> Update the doc accordingly so that the rule and exceptions are clear for
>>> everyone.
>>>
>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>>> ---
>>>   include/uapi/drm/drm_fourcc.h | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
>>> index 8db7fd3f743e..00a29152da9f 100644
>>> --- a/include/uapi/drm/drm_fourcc.h
>>> +++ b/include/uapi/drm/drm_fourcc.h
>>> @@ -38,6 +38,13 @@ extern "C" {
>>>    * fourcc code, a Format Modifier may optionally be provided, in order to
>>>    * further describe the buffer's format - for example tiling or compression.
>>>    *
>>> + * DRM drivers should not do software color conversion, and only advertise the
>>> + * format they support in hardware. But there are two exceptions:
>> 
>> I would do a bullet list here:
>> https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#lists-and-quote-like-blocks
>> 
> ok, that would look better.
>
>>> + * The first is to support XRGB8888 if the hardware doesn't support it, because
>>> + * it's the de facto standard for userspace applications.
>> 
>> We can also provide a bit more context here, something like:
>> 
>> All drivers must support XRGB8888, even if the hardware cannot support
>> it. This has become the de-facto standard and a lot of user-space assume
>> it will be present.
>
> ok, I can add this before the first paragraph.
>>

Agreed with Maxime's suggestion but I would also mention that if XRGB8888
is not supported, the native formats should be the default and XRGB8888 be
only used as a fallback for user-space compatiblity. In other words, that
XRGB8888 must not be the default, e.g: mode_config.preferred_depth = 24 or
drm_fbdev_generic_setup(drm, 32) only if is a supported native format.

I agree with the general content of the patch, so if you post a v2 feel
free to add my

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

