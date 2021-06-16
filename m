Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BDAC3A92FD
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 08:46:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0A06E4F1;
	Wed, 16 Jun 2021 06:46:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E296E4F1
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 06:46:36 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id my49so1972652ejc.7
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 23:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=9Q/YFKuXl5/2dB28pxnkzMjC2oeRT4Jr7tP5hNtsvlY=;
 b=PBPKC4ue4+w8gUL2t8AwuX8yYxE8BTj9GkFcbDhiY29kyYe/WcHbTCqxe8VPq/alxs
 mQE4i+7i5B7hpz5rVBvj2Y3wbSabpo029LIvRHAADAKOFQdufckP2EJFt9iUTMSpkYcV
 MMxdu509/ZAHMJ6aDucl958Gfy16etNyJa0PikU885w+j/mom6RH94BXBsHk9kyH8yeD
 qBxtfGB3ozibl41DLtfIb7/JYgL2ZMZjlOrM6tp2ZvIu1Uu2zJbJcJEz4ChFQJaq9ip8
 BhsNwDHZ1xwN8SGQ7DYmq457gF3iB31LoUDsehne3mSp3+ZZgrMWgPXn76eKcPslIB2h
 IsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=9Q/YFKuXl5/2dB28pxnkzMjC2oeRT4Jr7tP5hNtsvlY=;
 b=I8aWOt6P2CARvMRG48JLP6/jgolUGPojjamQ5qr7DJ3Z/BzYSBqU5nPNK2E53qxywP
 0IpBVTJDDCkTVbebESTblRhkLyb3X9TuIBysUK+pZ34GQ8bWGtB4WciBp9f8QhfzM6/6
 OWhzmfBZ0cHhsIx1G01b1dPYvcksQhZhZs/bO2n/mn0grgiFLU720KHuAglAH8VGbF4R
 to8ydLjdofLVp8g6Zgfqrjxu3yOSJyFwYVVn6P5tn+jF9f448kGOLeECuJNULrSb0NAr
 R0dkDUC42SEdDfgyvhm9YONQ5dd2+VTx/+aE3inthJuCGYGComwUqcHGAEN9mM7OwNpb
 oJqg==
X-Gm-Message-State: AOAM532rPkmlAR2tg3hbz/yhZSVkLPS2Ezbh7rfLe/oSnohJrJT5LOED
 WK39b6dboWH0bD3B8XyMxtg=
X-Google-Smtp-Source: ABdhPJy4HOjufj2hu3d7FiqkBuZHFvPEOBZW8vkDcy3HkSqF0avHjFe2ZAbsxp+ZU2rLTyADiwXEew==
X-Received: by 2002:a17:906:f9d1:: with SMTP id
 lj17mr3705563ejb.345.1623825995191; 
 Tue, 15 Jun 2021 23:46:35 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:8a3d:472:da0b:d908?
 ([2a02:908:1252:fb60:8a3d:472:da0b:d908])
 by smtp.gmail.com with ESMTPSA id by23sm464004ejc.85.2021.06.15.23.46.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 23:46:34 -0700 (PDT)
Subject: Re: [PATCH] drm/ttm: fix error handling in ttm_bo_handle_move_mem()
To: Dan Carpenter <dan.carpenter@oracle.com>, Thomas Hellstr <C3@mwanda>,
 B6@mwanda, m <thomas.hellstrom@linux.intel.com>
References: <YMmadPwv8C+Ut1+o@mwanda>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <03d0b798-d1ab-5b6f-2c27-8140d923d445@gmail.com>
Date: Wed, 16 Jun 2021 08:46:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YMmadPwv8C+Ut1+o@mwanda>
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
Cc: David Airlie <airlied@linux.ie>, Huang Rui <ray.huang@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Sending the first message didn't worked, so let's try again.

Am 16.06.21 um 08:30 schrieb Dan Carpenter:
> There are three bugs here:
> 1) We need to call unpopulate() if ttm_tt_populate() succeeds.
> 2) The "new_man = ttm_manager_type(bdev, bo->mem.mem_type);" assignment
>     was wrong and it was really assigning "new_mem = old_mem;".  There
>     is no need for this assignment anyway as we already have the value
>     for "new_mem".
> 3) The (!new_man->use_tt) condition is reversed.
>
> Fixes: ba4e7d973dd0 ("drm: Add the TTM GPU memory manager subsystem.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
> This is from reading the code and I can't swear that I have understood
> it correctly.  My nouveau driver is currently unusable and this patch
> has not helped.  But hopefully if I fix enough bugs eventually it will
> start to work.

Well NAK, the code previously looked quite well and you are breaking it now.

What's the problem with nouveau?

>   drivers/gpu/drm/ttm/ttm_bo.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index ebcffe794adb..72dde093f754 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -180,12 +180,12 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
>   		 */
>   		ret = ttm_tt_create(bo, old_man->use_tt);
>   		if (ret)
> -			goto out_err;
> +			return ret;
>   
>   		if (mem->mem_type != TTM_PL_SYSTEM) {
>   			ret = ttm_tt_populate(bo->bdev, bo->ttm, ctx);
>   			if (ret)
> -				goto out_err;
> +				goto err_destroy;
>   		}
>   	}
>   
> @@ -193,15 +193,17 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
>   	if (ret) {
>   		if (ret == -EMULTIHOP)
>   			return ret;
> -		goto out_err;
> +		goto err_unpopulate;
>   	}
>   
>   	ctx->bytes_moved += bo->base.size;
>   	return 0;
>   
> -out_err:
> -	new_man = ttm_manager_type(bdev, bo->mem.mem_type);

This here switches new and old manager. E.g. the new_man is now pointing 
to the existing resource manager.

> -	if (!new_man->use_tt)

So we should destroy the TT object only if the old manager is not using one.

> +err_unpopulate:
> +	if (new_man->use_tt)
> +		ttm_tt_unpopulate(bo->bdev, bo->ttm);

Unpopulate is not necessary, destroying is sufficient.

Christian.

> +err_destroy:
> +	if (new_man->use_tt)
>   		ttm_bo_tt_destroy(bo);
>   
>   	return ret;

