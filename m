Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE26608094
	for <lists+dri-devel@lfdr.de>; Fri, 21 Oct 2022 23:11:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C82A10E679;
	Fri, 21 Oct 2022 21:11:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D6F10E679
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 21:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666386700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tb5G8Q5vATxNip+KIvKKwBUveWJ2RwJYjzfJBGeAXxg=;
 b=I7U7ChXVZ5rQGHjDO0PTeQfX4wqvxq0eHNhwnqBT8PnH372y8VaRGjFINcwewpWt94YMd8
 /bToy9OEswhcurqTlPwHbitUQnVuY75WaN1bq7PebnirUBwKpc5oLJFazOWR3yu2bcW9uY
 Tip90L81kRtk7xHXZdXCUbuRSDsXIQs=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-132-o5tY5xDtPZORkxa0LhcpZg-1; Fri, 21 Oct 2022 17:11:40 -0400
X-MC-Unique: o5tY5xDtPZORkxa0LhcpZg-1
Received: by mail-qk1-f198.google.com with SMTP id
 bm16-20020a05620a199000b006ee95743ad2so4439872qkb.14
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Oct 2022 14:11:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:user-agent:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Tb5G8Q5vATxNip+KIvKKwBUveWJ2RwJYjzfJBGeAXxg=;
 b=EXMg9XWaoIHMWhnHnagRwQOBzRbiuoP5ofeajdN9NwYdLMjpiEgkSMsz7vd1SQwUGt
 seAmYGmY4+iKniSk89IM6uauxKTq4ryhDhMM4Z2XcYh3sIZzoDe8c+uHB2JIwZFQ4pL4
 l7iW15g9WQSj9QUial7CmrkV0wDQIL5CzuYa7HS4oy1deD0Szt0g8VFoUK9WDGEOXMBF
 qfLVRd6Qxjo3eZ2Ee0fEJnotlum1aqAkAe1nic7g4t4AgM4Snzk+fYnRdELOSHLeDf6G
 5iQ9h4erg62niF0bi0hRqx6S9Q4zFJgtp2YVKc2v7KqA3Wf1nqQjuTgq6UzqMHumhA+X
 qJbA==
X-Gm-Message-State: ACrzQf3euACzJ4N/wc6LucdWaxJDWpnS0tbOg9rUiQkQBWTu/AMFsmBh
 1KNPZ5kZ7gXieQRLbGD74YsGgK/zOeImXmNTXCtymYLincb7ualWXGfHFNFA3Xi7MRQZObW7eTu
 q7ofM/t3t58ZEbVlOxHgOxO/45Chm
X-Received: by 2002:a05:6214:2483:b0:4bb:59ec:c5a7 with SMTP id
 gi3-20020a056214248300b004bb59ecc5a7mr3071184qvb.94.1666386699533; 
 Fri, 21 Oct 2022 14:11:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7KgayDfa/OfgLiBOflAoe1rYw1XFXkm1/ap8s3joDTxP0ofbKbGObX5+tK8zXV+pqU3S2xcQ==
X-Received: by 2002:a05:6214:2483:b0:4bb:59ec:c5a7 with SMTP id
 gi3-20020a056214248300b004bb59ecc5a7mr3071157qvb.94.1666386699307; 
 Fri, 21 Oct 2022 14:11:39 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c68:4300::feb? ([2600:4040:5c68:4300::feb])
 by smtp.gmail.com with ESMTPSA id
 fw10-20020a05622a4a8a00b0039cba52974fsm8491618qtb.94.2022.10.21.14.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 14:11:38 -0700 (PDT)
Message-ID: <54135445ebea45857a95ac86db1c22804996af8c.camel@redhat.com>
Subject: Re: [PATCH -next] nouveau/dmem: Remove duplicated include in
 nouveau_dmem.c
From: Lyude Paul <lyude@redhat.com>
To: Yang Li <yang.lee@linux.alibaba.com>, bskeggs@redhat.com
Date: Fri, 21 Oct 2022 17:11:37 -0400
In-Reply-To: <20221017000723.113744-1-yang.lee@linux.alibaba.com>
References: <20221017000723.113744-1-yang.lee@linux.alibaba.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.42.4 (3.42.4-2.fc35)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: kherbst@redhat.com, nouveau@lists.freedesktop.org,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push in just a moment to drm-misc-next, thanks!

On Mon, 2022-10-17 at 08:07 +0800, Yang Li wrote:
> ./drivers/gpu/drm/nouveau/nouveau_dmem.c: nvif/if000c.h is included more
> than once.
> 
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=2404
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_dmem.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 5fe209107246..e2c500aac273 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -33,7 +33,6 @@
>  #include <nvif/if000c.h>
>  #include <nvif/if500b.h>
>  #include <nvif/if900b.h>
> -#include <nvif/if000c.h>
>  
>  #include <nvhw/class/cla0b5.h>
>  

-- 
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

