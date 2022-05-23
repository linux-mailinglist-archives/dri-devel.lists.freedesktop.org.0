Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C70EA5309D6
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 09:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED1EC10E0F5;
	Mon, 23 May 2022 07:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4069D10E0F5
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 07:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653289790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eNQlb8LFJ8a/pJQTESrmXgS1PNI+qnTKQtwhk4g/Ixk=;
 b=BNqxrY0/sCVac6XjLB0oJF0fJGxpRbo7xh34FQnAep/5dxSdDVijum5r86lRe096QX2L8q
 EdUXCUeecKXaXxixsdFYIVSCJzk9Ro25A1jfuA1VwUmMk0dT0Ki5CN0LznShK5suWRNlDV
 gFkVjWoJexBqbfu1wD4Zzt3PCVc65vQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-160-d2SXEzT9NrmLWF71AgV20Q-1; Mon, 23 May 2022 03:09:46 -0400
X-MC-Unique: d2SXEzT9NrmLWF71AgV20Q-1
Received: by mail-wm1-f71.google.com with SMTP id
 l15-20020a05600c1d0f00b003973901d3b4so2367156wms.2
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 00:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eNQlb8LFJ8a/pJQTESrmXgS1PNI+qnTKQtwhk4g/Ixk=;
 b=s/f8AEseRtpX6nMpyWfMjQG2E0j4LgQToelJVHrBnWYU4y7uZzbLrEUyAeNEmlGYrG
 DT14QQ8UCd2YCHjd66ToKdhNTWVvw6r/7yeTvML70N3ExhkXyp7TIZa0OO44/OCp+7ZX
 5dLv6jy/KzIftTuRpDJssQ85m3LYWHBWhXDT1ZFbecP8ZFaG8qpmpWMJzRIRT5QXMQLx
 hFiawcio3c8VnqmMKRbhfCOsCEXJeAx7XroCFG+ZFvmmYcC+7BAuwec6yVKmmzOJKkCM
 MutgvJGiSysNKvZ7Q7/vB8itAH2ODkz72lz+x3HORDU+C+1ATZaPSo7blPZOKtiExbn4
 A0HQ==
X-Gm-Message-State: AOAM531uOiinc3zn/iqlvww+kzeOvI76W9RYmdaS5PEo32KxdWFtFeev
 NQFF4qY0V+q3i1yb7Uq9cAZ3pNmVRu1eYx2odo33itC+BZa3b47hgTb5gqxB9gbVcd0X6r1jIa5
 kehZFiNWc7mqWW9wChikBTTtS85+Q
X-Received: by 2002:a05:600c:4f15:b0:394:8ea0:bb45 with SMTP id
 l21-20020a05600c4f1500b003948ea0bb45mr18505415wmq.206.1653289784873; 
 Mon, 23 May 2022 00:09:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwt0KqW3DOu7yDCKKvMVOhfz5hwWAURISAJ/EMcQil88CN1EMPYrdompd8/fFwt1SDIoFFRjQ==
X-Received: by 2002:a05:600c:4f15:b0:394:8ea0:bb45 with SMTP id
 l21-20020a05600c4f1500b003948ea0bb45mr18505401wmq.206.1653289784638; 
 Mon, 23 May 2022 00:09:44 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 h124-20020a1c2182000000b0039744bd664esm3253454wmh.13.2022.05.23.00.09.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 May 2022 00:09:44 -0700 (PDT)
Message-ID: <396d6eb3-723b-6c74-d83d-40f15ef01893@redhat.com>
Date: Mon, 23 May 2022 09:09:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] drivers/firmware: Move sysfb_init() from device_initcall
 to subsys_initcall_sync
To: Huacai Chen <chenhuacai@kernel.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20220521134110.2330908-1-chenhuacai@loongson.cn>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220521134110.2330908-1-chenhuacai@loongson.cn>
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
Cc: dri-devel@lists.freedesktop.org, Huacai Chen <chenhuacai@loongson.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Huacai,

Thanks for the patch.

On 5/21/22 15:41, Huacai Chen wrote:
> Consider a configuration like this:
> 1, efifb (or simpledrm) is built-in;
> 2, a native display driver (such as radeon) is also built-in.
>

As mentioned in the other thread, this is not a common configuration.

Usually the native display drivers are built as a module and only the
generic drivers that use a firmware-provided firmware for scanout are
built-in the kernel image.
 
> Because efifb, radeon and sysfb are all in device_initcall() level, the
> order in practise is like this:
> 
> efifb registered at first, but no "efi-framebuffer" device yet. radeon
> registered later, and /dev/fb0 created. sysfb_init() comes at last, it
> registers "efi-framebuffer" and then causes an error message "efifb: a
> framebuffer is already registered". Make sysfb_init() to be subsys_
> initcall_sync() can avoid this. But Javier Martinez Canillas has a more
> general solution.
>

You are talking about "[PATCH v5 0/7] Fix some races between sysfb device
registration and drivers probe", but unfortunately that approach was not
as general as needed, see:

https://lore.kernel.org/all/026b1c6d-c258-fa88-ed08-d1b5784c95b0@suse.de/

I need to go back to that series but I'm not sure when will have the time.
 
> However, this patch still makes sense because it can make the screen
> display as early as possible (We cannot move to subsys_initcall, since
> sysfb_init() should be executed after PCI enumeration).
>

Indeed. I agree that makes sense to move the platform device registration
early. As you mentioned this only solve some of the issues since we don't
know when the _driver_ is going to be registered. But at least we ensure
that by the time built-in drivers are registered, the platform device is
already there to match. Bringing the display output as early as possible.
 
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
>  drivers/firmware/sysfb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
> index 2bfbb05f7d89..aecf91517e54 100644
> --- a/drivers/firmware/sysfb.c
> +++ b/drivers/firmware/sysfb.c
> @@ -80,4 +80,4 @@ static __init int sysfb_init(void)
>  }
>  
>  /* must execute after PCI subsystem for EFI quirks */
> -device_initcall(sysfb_init);
> +subsys_initcall_sync(sysfb_init);

I would make the comment here more verbose. Mentioning that PCI enumeration
happens in the subsys_initcall() init call level and so is safe to register
this at subsys_initcall_sync(), which happens after or something like that.

Probably would be good to also mention the same in the patch description.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

