Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FFF51478A
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 12:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1FCE10FC8C;
	Fri, 29 Apr 2022 10:50:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E8CE10FC8E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 10:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651229424;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UJJtQxv1WQFSKERn7SwPf179LKVZ2H2eHmmNQIPl4mc=;
 b=HhzrN00caam06dOaN9UJTUpg2niHPpyKOef7u3yh0MrjtNqN4aGgNoBNdPIP01ET24h9sw
 PHwXI+2+7sRE1VO/mlrH30m51L59VKJsbBG8rh3ljacSglfkR38Gts1Xsaz9uw+/42PwsM
 izAFKdwfYtgmVZk0eblPuVyrYy1epPA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-BPdn6A7xMNGMw4bjbKQyew-1; Fri, 29 Apr 2022 06:50:23 -0400
X-MC-Unique: BPdn6A7xMNGMw4bjbKQyew-1
Received: by mail-wm1-f70.google.com with SMTP id
 i131-20020a1c3b89000000b00393fbb0718bso4580730wma.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 03:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UJJtQxv1WQFSKERn7SwPf179LKVZ2H2eHmmNQIPl4mc=;
 b=xh8mbDUgLhjVj6uMVVKoRvmBDGz7tSWnh0cq/cKHupWMrN/KGDE9CXJtFwj7zd6lnF
 Hkm2/HdJCqumyYqkjEwi4nJ+nOSQC6BgdCzqFA4mgE7h8jJsBNTovcdMrEFwhvTRedrW
 GRhkhSoy6wdFw8Qu4ejmK4Voe5L5akL6FGfKoPw++n6l7p3H2VHesTEXeCdwtLFTvohC
 1C0F6/2iGuSXQj3V/f47+3S2qEB3ifw79fsNt5WSa0J1V/d77aiqnUIOeURNqhQ9G3qU
 A9CdW7AsSxjfHfQD8R4UJhrHyOXoq0nd1muPU1DTi4a/RIT2nIGIOMFQzgkK8BzuEqrd
 Khzw==
X-Gm-Message-State: AOAM531zlyqN0CXLgdMeyFNW6HmKG72ZK4UBSASJPEAz5wZPlCT1JnJE
 Ii99cQHncaRiCx01Al8xF8QsrmaoF5FTAMG7CRv7gcP879DwOhnDFfKkihD2YNKoAhxSZHPDZKM
 kG3wIX3M0sr+QKSoDJQCl2ThRUjOs
X-Received: by 2002:a05:6000:108e:b0:20a:d9a9:ad31 with SMTP id
 y14-20020a056000108e00b0020ad9a9ad31mr20866792wrw.331.1651229421998; 
 Fri, 29 Apr 2022 03:50:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkqNVsWWkg3kncGIxxxi5dpKG8+ouBhLBj9X3lIkscb9aTewE6sU4DUEzKMvU1g4f9U0sb6w==
X-Received: by 2002:a05:6000:108e:b0:20a:d9a9:ad31 with SMTP id
 y14-20020a056000108e00b0020ad9a9ad31mr20866760wrw.331.1651229421574; 
 Fri, 29 Apr 2022 03:50:21 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
 by smtp.gmail.com with ESMTPSA id
 p125-20020a1c2983000000b0038e6c62f527sm2703007wmp.14.2022.04.29.03.50.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 03:50:21 -0700 (PDT)
Message-ID: <8671b156-af04-c728-d7bb-1019badbd13a@redhat.com>
Date: Fri, 29 Apr 2022 12:50:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [RFC PATCH v4 02/11] drm/fb-helper: Set FBINFO_MISC_FIRMWARE flag
 for DRIVER_FIRMWARE fb
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220429084253.1085911-1-javierm@redhat.com>
 <20220429084253.1085911-3-javierm@redhat.com>
 <7ce2f8e1-9cf2-4d89-99c2-b4280e4758ba@suse.de>
 <476d57e5-69dd-94b5-779f-230e091ae62f@redhat.com>
 <82dc11b4-d8da-e9e9-8181-5695fbd806de@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <82dc11b4-d8da-e9e9-8181-5695fbd806de@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/29/22 12:20, Thomas Zimmermann wrote:
> Hi Javier

[snip]

>>   
>>> We can do this with DRIVER_FIRMWARE. Alternatively, I'd suggest to we
>>> could also used the existing final parameter of
>>> drm_fbdev_generic_setup() to pass a flag that designates a firmware device.
>>>
>>
>> By existing final parameter you mean @preferred_bpp ? That doesn't seem
>> correct. I also like that by using DRIVER_FIRMWARE it is completely data
>> driven and transparent to the DRM driver.
> 
> DRIVER_FIRMWARE is an indirection and only used here. (Just like 
> FBINFO_MISC_FIRMWARE is a bad interface for marking framebuffers that 
> can be unplugged.) If a driver supports hot-unplugging, it should simply 
> register itself with aperture helpers, regardless of whether it's a 
> firmware framebuffer or not.
>

That's fair, and if in practice will only be used by one driver (simpledrm)
then that would also allow us to drop patches 1 and 2 from this series.

IOW, we wouldn't really need a DRIVER_FIRMWARE capability flag.
 
> Of preferred_bpp, we really only use the lowest byte. All other bits are 
> up for grabbing.  The argument is a workaround for handling 
> mode_config.prefered_depth correctly.
>

Yeah, but I didn't want to abuse that argument or package data in an int.

 
> Eventually, preferred_depth should be replaced by something like 
> 'preferred_format', which will hold the driver's preferred format in 
> 4CC.  We won't need preferred_bpp then. So we could turn preferred_bpp 
> into a flags argument.
>

That's a good point, maybe we could start from there and do this cleanup
as a preparatory change of this series ? Then the patches would only be
1) renaming preferred_bpp (that would be unused at this point) to flags
and 2) make simpledrm to set FBDEV_FIRMWARE flag or something like that.

Another option is to add a third flags param to drm_fbdev_generic_setup()
and make all drivers to set 0 besides simpledrm. That way marking the fb
as FBINFO_MISC_FIRMWARE won't be blocked by the preferred_depth cleanup.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

