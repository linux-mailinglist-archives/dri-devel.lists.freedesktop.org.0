Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87806582370
	for <lists+dri-devel@lfdr.de>; Wed, 27 Jul 2022 11:45:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D1C3C4256;
	Wed, 27 Jul 2022 09:45:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76C28C4264
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 09:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658915107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d7wwuGLjAZB3K+Voj80d4Ozo5qLQ+l1QsRMGTb08BDM=;
 b=T8DxwKuuUlLCH6aJXT+leOrZNdfF+qWprRCtL/yXDR+xC9+yGQAlMSrMCcluyT9GaqrX6y
 fccuJYFyf4flcqUuFFymfTC0shPBTINB8+VQx0sqKl7QlTduR6oLJc1pz+EAKck4AVxG8W
 M6/VIGr7U8IMmNVlYf+agcgniws4tI8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-381-LA0Q8T0sOJSsYhGeFb2i-Q-1; Wed, 27 Jul 2022 05:45:06 -0400
X-MC-Unique: LA0Q8T0sOJSsYhGeFb2i-Q-1
Received: by mail-wr1-f69.google.com with SMTP id
 n7-20020adfc607000000b0021a37d8f93aso2711695wrg.21
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Jul 2022 02:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=d7wwuGLjAZB3K+Voj80d4Ozo5qLQ+l1QsRMGTb08BDM=;
 b=Saws4iXZvkUcfQpVmS/HfUktpM7yv9Lcug30yXizA0lCpha1OTwmmF7j2YmyQ5fsh1
 xfeGbU7HIkbisBs0CsSKZLBl/Hu+2mm+w7+5tS6r3QvaSGMZM2EioX6y9lsKE64MZfZ9
 ihFxbw5PwlnG+xZ0FyM2RhMQXlF2RS3vOasOvxUxXdYNCV3wTZFGHAx92nd67t91fL4W
 OFmCZeVdPSJvcJkpQSBkDCl/3do6KeIiwTRDMcGe33QlGudiW0374ilbgeP9LrKNpEbU
 RNrSt8SgXVOBxy/MiSqvpKMVWdqVj6DQi7YDdghQOTVXkHZneISllOTeDRzJrFDnaBiM
 uioA==
X-Gm-Message-State: AJIora+MVTCgbD32Zjn5g5aO0ypShkbR5iDWzQJPAQwFBOTgW5roYWWk
 FDJd9n9jfCLhJxpaVLmjSsehKK2gaHS9Jy5pzwFmy7eBNdQi/VkfSxdBgsTYnlof1Q0sU6fdlBI
 pXmsj0Ut0xt5GS78eOIbQDtHDF4h4
X-Received: by 2002:a05:600c:3caa:b0:3a0:18e4:781b with SMTP id
 bg42-20020a05600c3caa00b003a018e4781bmr2469506wmb.199.1658915105266; 
 Wed, 27 Jul 2022 02:45:05 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tY1NapkC+jkHigs52/MIzuEN8IcNKNYICxfk8KUt9jGlsGLWmG7Fj2fsNnrteJALcuFgDk/A==
X-Received: by 2002:a05:600c:3caa:b0:3a0:18e4:781b with SMTP id
 bg42-20020a05600c3caa00b003a018e4781bmr2469489wmb.199.1658915105054; 
 Wed, 27 Jul 2022 02:45:05 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 t6-20020a05600c198600b003a326ba4e99sm1915497wmq.34.2022.07.27.02.45.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 02:45:03 -0700 (PDT)
Message-ID: <6b7bdf72-5ed3-f075-ecb8-639e569c5cb9@redhat.com>
Date: Wed, 27 Jul 2022 11:45:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 10/10] drm/ofdrm: Support color management
To: Thomas Zimmermann <tzimmermann@suse.de>, airlied@linux.ie,
 daniel@ffwll.ch, deller@gmx.de, maxime@cerno.tech, sam@ravnborg.org,
 msuchanek@suse.de, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, geert@linux-m68k.org, mark.cave-ayland@ilande.co.uk
References: <20220720142732.32041-1-tzimmermann@suse.de>
 <20220720142732.32041-11-tzimmermann@suse.de>
 <abe3fa95-942b-6d2f-7167-83d0cea59444@redhat.com>
 <05511c35-da46-aefd-3e03-364b7311284c@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <05511c35-da46-aefd-3e03-364b7311284c@suse.de>
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
Cc: linux-fbdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 7/27/22 10:41, Thomas Zimmermann wrote:

[...]

>>
>>> +static void __iomem *ofdrm_mach64_cmap_ioremap(struct ofdrm_device *odev,
>>> +					       struct device_node *of_node,
>>> +					       u64 fb_base)
>>> +{
>>> +	struct drm_device *dev = &odev->dev;
>>> +	u64 address;
>>> +	void __iomem *cmap_base;
>>> +
>>> +	address = fb_base & 0xff000000ul;
>>> +	address += 0x7ff000;
>>> +
>>
>> It would be good to know where these addresses are coming from. Maybe some
>> constant macros or a comment ? Same for the other places where addresses
>> and offsets are used.
> 
> I have no idea where these values come from. I took them from offb. And 
> I suspect that some of these CMAP helpers could be further merged if 
> only it was clear where the numbers come from.  But as i don't have the 
> equipment for testing, I took most of this literally as-is from offb.
>

I see. As Michal mentioned maybe someone more familiar with this platform
could shed some light about these but in any case that could be done later.

[...]

>>> +
>>> +	new_crtc_state = drm_atomic_get_new_crtc_state(new_state, new_plane_state->crtc);
>>> +
>>> +	new_ofdrm_crtc_state = to_ofdrm_crtc_state(new_crtc_state);
>>> +	new_ofdrm_crtc_state->format = new_fb->format;
>>> +
>>
>> Ah, I understand now why you didn't factor out the .atomic_check callbacks
>> for the two drivers in a fwfb helper. Maybe you can also add a comment to
>> mention that this updates the format so the CRTC palette can be applied in
>> the .atomic_flush callback ?
> 
> Yeah, this code is one reason for not sharing atomic_check in fwfb.  The 
> other reason is that the fwfb code is only a wrapper around the atomic 
> helpers with little extra value.  I did have such fwfb helpers a some 
> point, but removed them.
>

Got it.

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

