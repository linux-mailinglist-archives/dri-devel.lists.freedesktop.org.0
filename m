Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D90563F89
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jul 2022 13:05:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F47A2B934;
	Sat,  2 Jul 2022 11:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9D6A2B936
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Jul 2022 11:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656759935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WaoQ51mtOmX/GBphikCOpGnHXjeSZ8zdwj/pn80DE6o=;
 b=V+DP5krMYpfg5fa2ZlMyp5UWp9g/8G9xUd5EEa1xv2dlmKD3Wy/Ry+awJv3P58VAZBa40d
 TqmEp6DRR1qwfy4K1fuO7IF+WEWdLz6H2Ake+SF6QGVXZf5CcRw1ouusKKO33Od9Rbqm7J
 f34NQ92e0iLB9gzOMNtafefI4YvROLA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-403-mW12-S-XNS2MMmT3I1AX0g-1; Sat, 02 Jul 2022 07:05:30 -0400
X-MC-Unique: mW12-S-XNS2MMmT3I1AX0g-1
Received: by mail-wm1-f69.google.com with SMTP id
 p22-20020a05600c359600b0039c7b23a1c7so4363503wmq.2
 for <dri-devel@lists.freedesktop.org>; Sat, 02 Jul 2022 04:05:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=WaoQ51mtOmX/GBphikCOpGnHXjeSZ8zdwj/pn80DE6o=;
 b=OJe9RFFo5ZdKVMN5Aa/pRqzTgFMINvVBIKeAF6s/7cLH0CNERzPv//Y3jt0PW1RcYI
 JfsfWPJSl4mWKrw2JG8XEFpjQ2J9g18k+yc34NBcaNMT8Ji5J9lrcXaQ33WC011f/SKv
 UU69nmA8Tx6ibs1Fo+4DjKT5sBvsLMLnK5KRR1UBkQtyTw146oWMxjsxh27eOTNXnJDq
 O6szFdtR+sR41iL9YQrnHZVug+TF9IKJ1hBeDuNzTM5tS/od4MyjxVLH+vvU8KP272SR
 8E12GJOl518Rqkza5Ca35dcJNQQGxqosVXRJG+PVTrPSWrKmJB9c3txb7M2LmTCLtS4i
 m6Ww==
X-Gm-Message-State: AJIora8dLeWhYV+KA23OD9A3BjdlB+X2EpumXTwUaAifXm54ie+QVClA
 vgVS0v3JeXOinHNQeKxWwNcAdkzn/GtijwqOerHc4hRCA0t2B7/gfgnbbrdOJWdskdFO9iz9hE5
 nStSHtiKFJmroXPb7BMohAhiwZWp4
X-Received: by 2002:a5d:6e88:0:b0:21a:3403:9aa0 with SMTP id
 k8-20020a5d6e88000000b0021a34039aa0mr19081338wrz.379.1656759929052; 
 Sat, 02 Jul 2022 04:05:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vr/P4pIKfrUbkRaJeF19cQVzw/WlF9gZB9UxnFIBKNVdwKFcp72vtxkOy8PBlBIPVex9UxtQ==
X-Received: by 2002:a5d:6e88:0:b0:21a:3403:9aa0 with SMTP id
 k8-20020a5d6e88000000b0021a34039aa0mr19081321wrz.379.1656759928760; 
 Sat, 02 Jul 2022 04:05:28 -0700 (PDT)
Received: from [192.168.1.129] (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 r185-20020a1c2bc2000000b003a0484c069bsm15099637wmr.41.2022.07.02.04.05.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jul 2022 04:05:28 -0700 (PDT)
Message-ID: <ecbfdc21-c9a7-1453-dd86-da8180585179@redhat.com>
Date: Sat, 2 Jul 2022 13:05:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH V2] drivers/firmware: Move sysfb_init() from
 device_initcall to subsys_initcall_sync
To: Huacai Chen <chenhuacai@loongson.cn>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
References: <20220702090416.1217209-1-chenhuacai@loongson.cn>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20220702090416.1217209-1-chenhuacai@loongson.cn>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Huacai,

Thanks a lot for your patch.

On 7/2/22 11:04, Huacai Chen wrote:
> Consider a configuration like this:
> 1, efifb (or simpledrm) is built-in;
> 2, a native display driver (such as radeon) is also built-in.
> 
> As Javier said, this is not a common configuration (the native display
> driver is usually built as a module), but it can happen and cause some
> trouble.
> 
> In this case, since efifb, radeon and sysfb are all in device_initcall()
> level, the order in practise is like this:
> 
> efifb registered at first, but no "efi-framebuffer" device yet. radeon
> registered later, and /dev/fb0 created. sysfb_init() comes at last, it
> registers "efi-framebuffer" and then causes an error message "efifb: a
> framebuffer is already registered". Make sysfb_init() to be subsys_
> initcall_sync() can avoid this. And Javier Martinez Canillas is trying
> to make a more general solution [1].
> 
> However, this patch still makes sense because it can make the screen
> display as early as possible (We cannot move to subsys_initcall, since
> sysfb_init() should be executed after PCI enumeration).
> 
> [1] https://lore.kernel.org/all/20220607182338.344270-1-javierm@redhat.com/
>

Note that this series already landed, so you might want to refer the
relevant commit sha-1 instead, i.e:

commit 873eb3b11860 ("fbdev: Disable sysfb device registration when
removing conflicting FBs").
 
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>
> ---
> V2: Update commit messages.
> 
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

I agree with the change and makes sense to me.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

