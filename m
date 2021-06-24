Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9258F3B2FDC
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 15:14:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39DEE6EB7F;
	Thu, 24 Jun 2021 13:14:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD2F6EB7F;
 Thu, 24 Jun 2021 13:14:14 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id i5so8509356eds.1;
 Thu, 24 Jun 2021 06:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=jUpvJfClAkxaposL4wig5DpTTSGxzLyBZMJv9+3xraw=;
 b=FQOdUTnLrPgpw7RqaOdFwVkdK6V0R+CffRxI8pExGZ5EP7FPdfPrCM/lq5Kk9xN/Ax
 OOsEPWED13scD59Iy/xG0WEv2/gahupuaK0kdSkQ52JG0Uo8av+1aQ0EDUGNWPCXMe+b
 BTdFInlQtzg86zhedzR3z1aBlUe4Q580pEOW4PqDIDt+3M3mWy7rW98dWyZcDeqW6wDU
 fPYpykJZxP8M45korUPmkOtavSe/rNHnBa1V/EgE6iE1oL6MZzPzQkRwUBCobWVKzvuv
 Eyqri3V8ouKKIksJqYtzkrIi5cdpvTsfGfk4PrJPsw4ZSWStPvG1U7xLKfrqQeGIpREG
 3V9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=jUpvJfClAkxaposL4wig5DpTTSGxzLyBZMJv9+3xraw=;
 b=kIW5Hej+77uR4IEngWc72wQRDJZYbKLMtq9Nnr563TaezNI6ckDa+vgIX9n/EV5vJw
 ET+5bu1uqZHZgE9m72A4SC3eHVNqEmWKup285m58wdrLZQX2pf+BB9stbEo2H1cmzTHC
 kMi1X2PxfCFU41TbsteyLEC2YxjfhOSMgJaNC2UL093b3HXwebsrOO8Gq1QWuyX/GRN0
 OyO6iVN2m0XKCeL3/YpmkYPd5+6tRbep1FXkRPJank7p9q6wQLct3mqgVpRQl9hCxTGP
 1iAwL4k0odVIXIj8B+fEtpwQeI8zsLi85Sqsu07lfH/JsfFWN5DTxxdSFr1SwAk6hDg7
 HHoQ==
X-Gm-Message-State: AOAM533I8yBeC4Zf07ze7dW3T7u4ZMqgkhX5im2Jw1cGG7d4AarfVvDD
 Kf7zk3QpbOAkpK1bzDQ/vCg=
X-Google-Smtp-Source: ABdhPJwDiSksAJEUv018050vDI8BTEvoX64fF/WRVHk+OAidWOjSXro8cnrGuTG9AWCDHo/y24qnqg==
X-Received: by 2002:a05:6402:336:: with SMTP id
 q22mr7118192edw.3.1624540453432; 
 Thu, 24 Jun 2021 06:14:13 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:8a1c:e700:29c4:44b6?
 ([2a02:908:1252:fb60:8a1c:e700:29c4:44b6])
 by smtp.gmail.com with ESMTPSA id o14sm1967910edw.36.2021.06.24.06.14.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jun 2021 06:14:13 -0700 (PDT)
Subject: Re: [PATCH] drm/amdgpu:use kvcalloc instead of kvmalloc_array
To: huqiqiao <huqiqiao@uniontech.com>, airlied@linux.ie, daniel@ffwll.ch
References: <20210623091242.12861-1-huqiqiao@uniontech.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <e18c2147-cc19-7493-5feb-de28e3102d3f@gmail.com>
Date: Thu, 24 Jun 2021 15:14:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210623091242.12861-1-huqiqiao@uniontech.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 23.06.21 um 11:12 schrieb huqiqiao:
> kvmalloc_array + __GFP_ZERO is the same with kvcalloc.
>
> Signed-off-by: huqiqiao <huqiqiao@uniontech.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 9acee4a5b2ba..50edc73525b0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -908,9 +908,8 @@ static int amdgpu_vm_alloc_pts(struct amdgpu_device *adev,
>   		unsigned num_entries;
>   
>   		num_entries = amdgpu_vm_num_entries(adev, cursor->level);
> -		entry->entries = kvmalloc_array(num_entries,
> -						sizeof(*entry->entries),
> -						GFP_KERNEL | __GFP_ZERO);
> +		entry->entries = kvcalloc(num_entries,
> +						sizeof(*entry->entries), GFP_KERNEL);

Sounds like a good idea in general, but the indentation on the second 
line seems to be of.

Christian.

>   		if (!entry->entries)
>   			return -ENOMEM;
>   	}

