Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAF05199B0
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74BCF10F06B;
	Wed,  4 May 2022 08:26:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCD9F10F06B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651652793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+C/4yoNKEEGV6PoJ/pGUW0PpRiFTb33UcshUyLm1xTM=;
 b=NYNiuX+708ux8Agt0sPSz8cPs+dlUEFaL+IGHilRvg8ll9dLAjd+fGza0VL09SpYsMOHND
 X+H0wojh+Np/pULZcMv9tbENS0Xr5GlAnXTWINWKVPsAQpwesMy0LhRq4Lh2BywHRjnuwU
 Xw7XW1iSqpooXZBWtJHZRjwnPLgoC5k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-fBPKSZsiMiubMSLNTJJPFw-1; Wed, 04 May 2022 04:26:32 -0400
X-MC-Unique: fBPKSZsiMiubMSLNTJJPFw-1
Received: by mail-wm1-f69.google.com with SMTP id
 j5-20020a05600c1c0500b0039419a269a1so402275wms.3
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 01:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+C/4yoNKEEGV6PoJ/pGUW0PpRiFTb33UcshUyLm1xTM=;
 b=mQ3CW6tacA8dKiBiTL9/ScPEshClsFkhFalphiIhk9vUu+BtWaQzQjVWRvhQBZoXwg
 85O73zOkQX3pQOqEnCOTJTgzmlx11q+P2f7b54mMT2puYh3n6HvzgbF7pyen5iH5qKW0
 mJiwzYXXU/mkuvuxn+iQFXWTlp5l8lyMpPf+GF4m93K2dCmfW+AkGhKwjTrZT4NAj6lh
 ZXEi6lL1XA+ODydBHj90CPD+f7c88J4i9MvXXSTldkhPZ5xCgfLaRn3SBso84U4ZruJv
 gN2NFxBvwO4qE0gwhMYnPvcy1vqMh/LP7VipG+ccuur0FDbf8R0K6b5nnu0bblEPsba+
 pYjQ==
X-Gm-Message-State: AOAM530RrJv6XrbjH+BYkknXlqa9XwzgeWtO9I33RAscoaBj3p0yZGOW
 WbQUpl0da1lFuuy6/7mGcwWRr6wzEmWSKQZZD7Mt43kLpp2h/S8RUDCX5MpC1OMBFkM8E9McxMN
 SFR9dT00bxdLIoKWMS+0/9ud4aUGl
X-Received: by 2002:a1c:2942:0:b0:392:3aff:4fcd with SMTP id
 p63-20020a1c2942000000b003923aff4fcdmr6702213wmp.0.1651652791571; 
 Wed, 04 May 2022 01:26:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwwf5liG5UOSbg9cbpMtmv/D9VHVe+DIqeuq8o0WbDy3DvVW1qvmg350Q24IdSh6Jmk4iyNgg==
X-Received: by 2002:a1c:2942:0:b0:392:3aff:4fcd with SMTP id
 p63-20020a1c2942000000b003923aff4fcdmr6702197wmp.0.1651652791294; 
 Wed, 04 May 2022 01:26:31 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 be13-20020a05600c1e8d00b003942a244ee6sm3856611wmb.43.2022.05.04.01.26.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 May 2022 01:26:30 -0700 (PDT)
Message-ID: <3f8f697f-7b85-cb8c-445a-8d7c40a062f8@redhat.com>
Date: Wed, 4 May 2022 10:26:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2] fbdev: Use helper to get fb_info in all file operations
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
References: <20220503201934.681276-1-javierm@redhat.com>
 <d0555181-6e36-044c-b747-c08dbeb3a89e@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <d0555181-6e36-044c-b747-c08dbeb3a89e@suse.de>
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
Cc: Junxiao Chang <junxiao.chang@intel.com>, linux-fbdev@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Thomas,

On 5/4/22 10:15, Thomas Zimmermann wrote:
> Hi
> 
> Am 03.05.22 um 22:19 schrieb Javier Martinez Canillas:
>> A reference to the framebuffer device struct fb_info is stored in the file
>> private data, but this reference could no longer be valid and must not be
>> accessed directly. Instead, the file_fb_info() accessor function must be
>> used since it does sanity checking to make sure that the fb_info is valid.
>>
>> This can happen for example if the registered framebuffer device is for a
>> driver that just uses a framebuffer provided by the system firmware. In
>> that case, the fbdev core would unregister the framebuffer device when a
>> real video driver is probed and ask to remove conflicting framebuffers.
>>
>> Most fbdev file operations already use the helper to get the fb_info but
>> get_fb_unmapped_area() and fb_deferred_io_fsync() don't. Fix those two.
>>
>> Since fb_deferred_io_fsync() is not in fbmem.o, the helper has to be
>> exported. Rename it and add a fb_ prefix to denote that is public now.
>>
>> Reported-by: Junxiao Chang <junxiao.chang@intel.com>
>> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> 
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
>

Thanks.
 
> Please see my comment below.

[snip]

>>   
>> +	if (!info)
>> +		return -ENODEV;
>> +
> 
> This is consistent with other functions, but it's probably not the 
> correct errno code. It means that a device is not available for opening.
> 
> But the situation here is rather as with close() on a 
> disconnected-network file. The call to close() returns EIO in this case. 
> Maybe we should consider changing this in a separate patch.
>

Indeed. Agree that -EIO makes more sense here.
 
> Best regards
> Thomas
> 
-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

