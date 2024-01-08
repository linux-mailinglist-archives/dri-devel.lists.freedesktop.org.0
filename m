Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B23982763C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jan 2024 18:23:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2827D10E164;
	Mon,  8 Jan 2024 17:23:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F60710E164
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Jan 2024 17:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1704734601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nOy7rPmBJeQA7S2Ya6yzPxUkyXWk0XWROf8BC/z6Uqc=;
 b=EHbiHrjvyxoYCSGGBv3Lfynf8bQOXe248vDnOTDS+zsgqqDLDVLxmr6Am7Aj7QO5I1wJQC
 kaR+k2fa98k3IYlakPb+CaOEqX6IRGcCD2T61oPDinl/oqD3yklJZbHqMnRE9Sfa7P0ceP
 yMRo1Zdr2pXP3H2vnmMmEKbEfcEGWKk=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-386-rER4Nk9QPnK6_xRMcJMn0w-1; Mon, 08 Jan 2024 12:23:20 -0500
X-MC-Unique: rER4Nk9QPnK6_xRMcJMn0w-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-680b2c9b0ccso42896376d6.1
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Jan 2024 09:23:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704734599; x=1705339399;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nOy7rPmBJeQA7S2Ya6yzPxUkyXWk0XWROf8BC/z6Uqc=;
 b=RKlaBxtMwpN1A+6IVCUWFuTMx0RLblASRNTf76P8N+d6ObAQSP3fN8AYaLb8bS3Efg
 5jOLr86qZOW5bVYLguEazTJbUCTR3lZWYPaDCXgxLgjcLlyBST6LQHAreje9B0zJpX8T
 F5Y6n6wVl/9YgHbIQeaVYEr9M7iRov1BdiLSdLWXk/GTj41jK27J3aIdO4TWrl251/2P
 j2X0jOSwscBBx3FyRON0JfIz2/5Ub1KlluxyhxvFl9/aSLl3kKm1uiQgj6LWawQfFkVa
 K9z/xqbjALIBHBRWTgUBYxSXgJCI5UcCaqeXtw+rdGUR16NDZ4uXVshZ2VFwnSNOR3Rm
 0L9g==
X-Gm-Message-State: AOJu0Yw9W2w1ve7uVKwJLkR7jz9mYWcWNzOahwXKs3LKJfJ9vwCrgVO1
 C9njeXGv3wq3gfPll1S75DWxDTSHjl+10kounBjYpWtQh2+H+GkdDDJxKbiTv64qTFBWi9/HN6T
 bmBRhBaXqamRjPnhIHqxdHd6xC+o+LuVWfgJ+
X-Received: by 2002:a0c:eb8b:0:b0:680:f8a6:bcf9 with SMTP id
 x11-20020a0ceb8b000000b00680f8a6bcf9mr3295221qvo.13.1704734599748; 
 Mon, 08 Jan 2024 09:23:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEUqoB7J6lI/Dv2EV3jEiEvSKUSF711d35mvJLCRr099kSHpmF+L6Jmb7nH/7EYRnhpbK2MHQ==
X-Received: by 2002:a0c:eb8b:0:b0:680:f8a6:bcf9 with SMTP id
 x11-20020a0ceb8b000000b00680f8a6bcf9mr3295212qvo.13.1704734599460; 
 Mon, 08 Jan 2024 09:23:19 -0800 (PST)
Received: from ?IPV6:2a02:810d:4b3f:ee94:abf:b8ff:feee:998b?
 ([2a02:810d:4b3f:ee94:abf:b8ff:feee:998b])
 by smtp.gmail.com with ESMTPSA id
 t7-20020ad45bc7000000b0067f789a59c8sm127305qvt.113.2024.01.08.09.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Jan 2024 09:23:19 -0800 (PST)
Message-ID: <3b3a1c92-8c1f-4812-95ce-b5431114e154@redhat.com>
Date: Mon, 8 Jan 2024 18:23:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/fifo: remove duplicated including
To: Wang Jinchao <wangjinchao@xfusion.com>
References: <202312151802+0800-wangjinchao@xfusion.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <202312151802+0800-wangjinchao@xfusion.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 stone.xulei@xfusion.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Wang,

there is another patch [1] to fix this, which already made it upstream.

- Danilo

[1] https://patchwork.freedesktop.org/patch/msgid/20231122004926.84933-1-yang.lee@linux.alibaba.com

On 12/15/23 11:02, Wang Jinchao wrote:
> rm second including of chid.h
> 
> Signed-off-by: Wang Jinchao <wangjinchao@xfusion.com>
> ---
>   drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
> index 87a62d4ff4bd..7d4716dcd512 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
> @@ -24,7 +24,6 @@
>   #include "chan.h"
>   #include "chid.h"
>   #include "cgrp.h"
> -#include "chid.h"
>   #include "runl.h"
>   #include "priv.h"
>   

