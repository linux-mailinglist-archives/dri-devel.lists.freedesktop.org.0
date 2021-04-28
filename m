Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EDE36D2C1
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 09:03:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0B956EAA8;
	Wed, 28 Apr 2021 07:03:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72BD16EAA7;
 Wed, 28 Apr 2021 07:03:10 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id gx5so920874ejb.11;
 Wed, 28 Apr 2021 00:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=KG1nLMyF73Uu2La1XfcDKUiczoK0PzUlzNOdGLSVGwI=;
 b=hMSwBTPNBLkGLJU7R2NCX++K5Fxqgu1KvNxbbJkwWTfS8K2OYRxLTNswgPRm/8Pjjz
 hDLBhp9e5K83jDN9y3S43xOjDfGCrVFVIbogNjJX8rTvozYlWR7G2EYBCAHOFVfqBIOl
 ZqS92LNo2Cy8//S/scStEt3QjveiFzo1SzAjNBOMNrlrwuBDOtbRDdp6ee7/8FRGZghN
 16gsc25C1MhvWKSV5fcvDFU6zr/Gc9Np/5t+AzGKlxePK97CgndmpbY5zSZZJu8/xN9Y
 M3398f3zte1MpgHWI8gJ4fFmAnWVxyHRlIXwYqleTB/hXN1ljyx1ULif6PlgJgze5+Z3
 8M0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=KG1nLMyF73Uu2La1XfcDKUiczoK0PzUlzNOdGLSVGwI=;
 b=PgCupZa2g/gwhGRTX/yiv5Vbs6Vc1bppRiYW8B0iZ0OOt8t0F85KQJUeSG9PS6Sgo8
 O/WamApDnEPBCFj2y/ZjYHOjXV9y+w0zhVs8uJWSZThmXavQgB/39yIp/33rQ8gDho5H
 nCNB3Qkag38vTbZV5LhYPh4z4ftp700vLr/uLREh/4vEmsfl8Brn2BkCee+VX4D8gw6b
 saZOyDl5jUX6vprdkpcnK+mbPy6vMCYiaJmrHHF05n3qWP8yA5vbCBHIu6NUyl5LYsba
 DCYvh1rwvQyK3sYZXcSH0tCHhdkT7csS8qiBj3pr8Ns4M68ZuMeJvZqQuMnAKeTOLT78
 W2Og==
X-Gm-Message-State: AOAM533JCQiQw23Ta8wD5fRxzepsZuiFKHtEbsFE909Z2BKBqm/XXHRj
 IvgKRutITQLvjDkYVdfRc4n6jaJXmLQ=
X-Google-Smtp-Source: ABdhPJxSJmtx0vgcEjOyM78Gjr9iD3foRPFcjz8EZ2gC1/2Hfcb0AfISFAiZqnnbukUt114w31Y5ZQ==
X-Received: by 2002:a17:906:eda3:: with SMTP id
 sa3mr6535026ejb.415.1619593386130; 
 Wed, 28 Apr 2021 00:03:06 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:5565:6656:893b:2618?
 ([2a02:908:1252:fb60:5565:6656:893b:2618])
 by smtp.gmail.com with ESMTPSA id c12sm4320665edx.54.2021.04.28.00.03.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 00:03:05 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm/ttm: Fix swapout in ttm_tt_populate
To: Felix Kuehling <Felix.Kuehling@amd.com>, dri-devel@lists.freedesktop.org, 
 amd-gfx@lists.freedesktop.org
References: <20210428053338.11560-1-Felix.Kuehling@amd.com>
 <20210428053338.11560-2-Felix.Kuehling@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <bc974a9f-25a4-dff1-4ed0-12e1c99186ad@gmail.com>
Date: Wed, 28 Apr 2021 09:03:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210428053338.11560-2-Felix.Kuehling@amd.com>
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That is already fixed upstream.

Am 28.04.21 um 07:33 schrieb Felix Kuehling:
> ttm_bo_swapout returns a non-0 value on success. Don't treat that as an
> error in ttm_tt_populate.
>
> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_tt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 5d8820725b75..1858a7fb9169 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -326,7 +326,7 @@ int ttm_tt_populate(struct ttm_device *bdev,
>   	       ttm_dma32_pages_limit) {
>   
>   		ret = ttm_bo_swapout(ctx, GFP_KERNEL);
> -		if (ret)
> +		if (ret < 0)
>   			goto error;
>   	}
>   

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
