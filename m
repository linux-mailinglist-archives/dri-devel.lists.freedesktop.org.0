Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED4EC77824C
	for <lists+dri-devel@lfdr.de>; Thu, 10 Aug 2023 22:46:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E26D210E603;
	Thu, 10 Aug 2023 20:46:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4427E10E5FF
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 20:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691700401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=peMTe0/5+mkSedrYiGrzKaaCxKfi8eF8di3SVpG6oGg=;
 b=cdiEAFVacTWDKQcveO7PKeVm8Ck5UjHfgU6ubCTQohEnu8kxk3jLczipeAlxL6T7k6W020
 60C8s4tfawiPtET4pTK44OGIS2oVyJ6UirrxzcyDz0cjF63tpVVRWshWQrJOFvl+OzOjBv
 BsHiV4S4218nHi9NgCBEj46nJc/eoUg=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-zz5-5dT0NW2s_QkKz_fsRg-1; Thu, 10 Aug 2023 16:46:37 -0400
X-MC-Unique: zz5-5dT0NW2s_QkKz_fsRg-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-99cc32f2ec5so94928266b.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Aug 2023 13:46:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691700396; x=1692305196;
 h=content-transfer-encoding:in-reply-to:organization:from:references
 :cc:to:content-language:subject:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=peMTe0/5+mkSedrYiGrzKaaCxKfi8eF8di3SVpG6oGg=;
 b=MSYlHhe8ljk5yheYvtdkS73qjrcpmVzNApai+i/NqyYzhJzda9p0byM79Jyuq1zjB6
 DmRYqGSh8gnusYYg7fyFRBc/nO5jAihBgrPb1CeMdawxvTddybEc04d7x7InmY4K7tYi
 8hpbKgty3xU1k+AKIbo85Oh/0jP4FLN8audQzjiUEWfoNYeOcdLlpWG6flJfUsHdA1+p
 PF5/JGbOHGNCNvhHIhPbcE6fUnugCD9x+mfmSabOCuGUz/fYLZHO5UTISm0UG1MynTNw
 SvO5S3VvP6kheRWpCbyoMEPnjDuyOimdw7ZPC8KdD4vcLv6HuIquzgrhWamPuCoko2Fa
 LO3w==
X-Gm-Message-State: AOJu0Yw4LGRfXO1OG7S7OVoDsuu2OtSp3l9AzyhuqoNBD6x8t31Vvu4A
 UDtkOgwb7TqqpmzZS5GOWRZPJiwImYH+vxtN8DqUNHGKwla9Iat6/c7nWY4B9lBdJwBrk9zBB+2
 9AoA1T6DtbWSgMj+HIWZPwxK9J3UG
X-Received: by 2002:a17:906:21c:b0:99d:101a:adad with SMTP id
 28-20020a170906021c00b0099d101aadadmr2926389ejd.71.1691700395848; 
 Thu, 10 Aug 2023 13:46:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHW26xxTNJPFQ3smOHWGxyKlX0mnvuZtjaAEGkjD93ZtdsWhyKIS2aZ+xETefj0ZEOQl3flLg==
X-Received: by 2002:a17:906:21c:b0:99d:101a:adad with SMTP id
 28-20020a170906021c00b0099d101aadadmr2926376ejd.71.1691700395512; 
 Thu, 10 Aug 2023 13:46:35 -0700 (PDT)
Received: from ?IPV6:2a02:810d:4b3f:de9c:642:1aff:fe31:a15c?
 ([2a02:810d:4b3f:de9c:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a1709064c8100b00991faf3810esm1406863eju.146.2023.08.10.13.46.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Aug 2023 13:46:34 -0700 (PDT)
Message-ID: <0cad9f8b-7ff7-dfed-cf53-6953c5ff644d@redhat.com>
Date: Thu, 10 Aug 2023 22:46:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] nouveau/u_memcpya: use vmemdup_user
To: Dave Airlie <airlied@gmail.com>
References: <20230810185020.231135-1-airlied@gmail.com>
From: Danilo Krummrich <dakr@redhat.com>
Organization: RedHat
In-Reply-To: <20230810185020.231135-1-airlied@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, skeggsb@gmail.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/10/23 20:50, Dave Airlie wrote:
> From: Dave Airlie <airlied@redhat.com>
> 
> I think there are limit checks in places for most things but the
> new api wants to not have them.
> 
> Add a limit check and use the vmemdup_user helper instead.

Reviewed-by: Danilo Krummrich <dakr@redhat.com>

> 
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   drivers/gpu/drm/nouveau/nouveau_drv.h | 19 +++++--------------
>   1 file changed, 5 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
> index 54063b094a69..8a7357688aff 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -189,21 +189,12 @@ u_free(void *addr)
>   static inline void *
>   u_memcpya(uint64_t user, unsigned nmemb, unsigned size)
>   {
> -	void *mem;
> -	void __user *userptr = (void __force __user *)(uintptr_t)user;
> +	void __user *userptr = u64_to_user_ptr(user);
> +	size_t bytes;
>   
> -	size *= nmemb;
> -
> -	mem = kvmalloc(size, GFP_KERNEL);
> -	if (!mem)
> -		return ERR_PTR(-ENOMEM);
> -
> -	if (copy_from_user(mem, userptr, size)) {
> -		u_free(mem);
> -		return ERR_PTR(-EFAULT);
> -	}
> -
> -	return mem;
> +	if (unlikely(check_mul_overflow(nmemb, size, &bytes)))
> +		return NULL;
> +	return vmemdup_user(userptr, bytes);
>   }
>   
>   #include <nvif/object.h>

