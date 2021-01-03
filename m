Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B102E8CF7
	for <lists+dri-devel@lfdr.de>; Sun,  3 Jan 2021 16:43:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62DF9898EE;
	Sun,  3 Jan 2021 15:43:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70476898EE;
 Sun,  3 Jan 2021 15:43:40 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id ce23so33605357ejb.8;
 Sun, 03 Jan 2021 07:43:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=reply-to:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=WBr3xy3JFcyq+KPd1Dg4Sad4+o+v8EZrN0zzE8wdvO0=;
 b=khXHpoGVd4/5ApLcYgPzOx4ApF3AtugRDy6/oU8wyLtsjKp1UmChbelCwjiqekU5l1
 tlZIwKUpHXL9b8ccRQD9JXU6yBK85qag7zA4aZlNp9O0yZU4iasX7ZxbRmxC3RnU9PIJ
 4cFNdENLgfgzwLDV1581qfJF+QahkmcHA/QOeTvqIcJoa2h5OG9RnY/1hGO/gm8wcSPq
 Xq+9nmfbWPakcRKuOCxqVwHu9aH+tjTABGPq2m+zynONSbYr67BGhOzUg7Q6mFNkq7nX
 nJbRDCCrJl0v15cGWCAU7FbPL7ojccBkuz/A230Nkgk2l7TYskko7WJP5+lQjGWoDoJ6
 x2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:reply-to:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=WBr3xy3JFcyq+KPd1Dg4Sad4+o+v8EZrN0zzE8wdvO0=;
 b=sv/2BrfkENU1EIF6H8e9iwiONV6NoDpD3hRt47KQM5J9kkK3RCbZ769WQYANxWMslr
 SamgBLDmgEg3Vr4ojkVHG8Krb4tAqKxQ5DSAvv0kpWEAQCV5dGIbTb9zX6ZyYl2o7UWI
 pAGwxsLbmh+th1kOaeRWYNlO4zG9nTOeLDIvks6/lBERG7tpfxFdGy8mlEY8q/CKnSkI
 TOGxRK7PsuxOPI+HsWnm/Ey40Q9PRguqTWDq1nyaKo5Ke+C4pSRYqsqB2d/QRjBT93zP
 Zf1sdYmuLK32lqv4ELXy0Oj9WRz8oHshH/LZ4qNiw7DBUPaJ4ah2tnDgFPSzaIVIKiUG
 OJGw==
X-Gm-Message-State: AOAM533Ga/aoD3pOR3UMbGYH78VyD13ePIuCSgRLdPMmQQnxVH9o7WBE
 LLd3K5LRX59oPLImdP+S3kQ=
X-Google-Smtp-Source: ABdhPJxzM3JrmfBpHdYyT/dUzO/GPDO3JQTQnukfgZyN0taTdCJKuK1jJyU+1lTr9AQN/fXabenoCg==
X-Received: by 2002:a17:906:7f10:: with SMTP id
 d16mr63661396ejr.104.1609688618923; 
 Sun, 03 Jan 2021 07:43:38 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7?
 ([2a02:908:1252:fb60:be8a:bd56:1f94:86e7])
 by smtp.gmail.com with ESMTPSA id dx7sm22717124ejb.120.2021.01.03.07.43.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 03 Jan 2021 07:43:38 -0800 (PST)
Subject: Re: [PATCH v2] drm/amdgpu: Do not change amdgpu framebuffer format
 during page flip
To: Zhan Liu <zhan.liu@amd.com>, amd-gfx@lists.freedesktop.org,
 Nikola.Cornij@amd.com, Stylon.Wang@amd.com, Chao-kai.Wang@amd.com,
 dri-devel@lists.freedesktop.org, Nicholas.Kazlauskas@amd.com,
 bas@basnieuwenhuizen.nl
References: <20201229211044.109020-1-zhan.liu@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <81e9467f-3498-2d6a-3822-902f2afb74c9@gmail.com>
Date: Sun, 3 Jan 2021 16:43:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201229211044.109020-1-zhan.liu@amd.com>
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
Reply-To: christian.koenig@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 29.12.20 um 22:10 schrieb Zhan Liu:
> [Why]
> Driver cannot change amdgpu framebuffer (afb) format while doing
> page flip. Force system doing so will cause ioctl error, and result in
> breaking several functionalities including FreeSync.
>
> If afb format is forced to change during page flip, following message
> will appear in dmesg.log:
>
> "[drm:drm_mode_page_flip_ioctl [drm]]
> Page flip is not allowed to change frame buffer format."
>
> [How]
> Do not change afb format while doing page flip. It is okay to check
> whether afb format is valid here, however, forcing afb format change
> shouldn't happen here.

I don't think this we can do this.

It is perfectly valid for a page flip to switch between linear and tiled 
formats on an I+A or A+A laptop.

Christian.

>
> Signed-off-by: Zhan Liu <zhan.liu@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> Thanks Nick and Bas. Here is my second patch for review.
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> index a638709e9c92..8a12e27ff4ec 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
> @@ -832,7 +832,8 @@ static int convert_tiling_flags_to_modifier(struct amdgpu_framebuffer *afb)
>   			if (!format_info)
>   				return -EINVAL;
>   
> -			afb->base.format = format_info;
> +			if (!afb->base.format)
> +				afb->base.format = format_info;
>   		}
>   	}
>   

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
