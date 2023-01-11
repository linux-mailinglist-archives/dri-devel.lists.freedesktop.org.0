Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B00D66653F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 22:04:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 608B510E0C6;
	Wed, 11 Jan 2023 21:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B229A10E0C6
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 21:04:19 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id w1so16290246wrt.8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 13:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=N3x4aERt10BVU5APt1qIBv0E4l0cqbueL5nouLobqj4=;
 b=am42hH/806WgnalRpwcbTQfmD4ABOOzWFrVq0MPlR5EhNYXcUygX+ltGlWn9EWL/E4
 diBK2SWuHCC3oVlmk3nr08gDtjxOfZbtHPTqO163Nknp2RonX/rp49ESRjwjXYEwZm4i
 xd3j3J83Uk0j1s491ud6re64pgQtEr+QklxqMb0Ee8szJ3Jl/ZAuTrHTCR9mcMYR65S3
 UEtsg+L5/AyOSloa+SUGzyKyTWcAxcgYMJcSWl+f5MaQnDqr8s1w31Y8jw6XUhA1m23R
 2CNqX3hift4UhUeDvOnlnjbGZV6eXxrFd0xXDaqi5WPcEqrDh/iaG165GIpDBuiIjKpd
 BzVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N3x4aERt10BVU5APt1qIBv0E4l0cqbueL5nouLobqj4=;
 b=HO4ZmPC1t4me5N/8jiGHUKmGRQl7BsxG1c6UZFoV7lhy9JPPlcAg7kDGGWXi/EJ1rR
 1h1hmCIlHEBoO6Uw881I59M/4XAiPt3UCBKZH6BjByMrlznzY5NJeYkBGAhW2nfmebEg
 jDYAy1p42zX3zBKbW5T+s697O2TRUQkY+iLnyv8QJ9X3rfufeaEADBAsssxKZM7OEr+v
 9rGSHdAaFMMoE63oUWGINDRsmoBJ3Hs6SYOf+/Doz5hv/VNRsKuen9XXMSUz3pPk3m3D
 JPZEnwHQOetHya45XHWD0dBcydv/nKe3JNODdhwqYe98BRmLq6Ai8Dm8iNaKzr5Fj1g+
 rk0A==
X-Gm-Message-State: AFqh2koLTXyJdbjkkS9csXrhLMdvcsG7qjpy7mwye7YxtbrnAxTJBNlR
 qy9s+eY/jHOo0G7xMczwDx0=
X-Google-Smtp-Source: AMrXdXuL22Sj2wBNkukkn5CEfxWj6Ec+RUgYQy/B+E8Q+jmk0xivHfV3j7ghoVC+TfcCPBhkwA9OeA==
X-Received: by 2002:adf:e810:0:b0:276:4089:81c2 with SMTP id
 o16-20020adfe810000000b00276408981c2mr37373215wrm.41.1673471058119; 
 Wed, 11 Jan 2023 13:04:18 -0800 (PST)
Received: from [192.168.2.181] (46-10-148-2.ip.btc-net.bg. [46.10.148.2])
 by smtp.gmail.com with ESMTPSA id
 u5-20020adfdb85000000b002ba2646fd30sm17275293wri.36.2023.01.11.13.04.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Jan 2023 13:04:17 -0800 (PST)
Message-ID: <4126cf64-1e6c-5859-0893-47b06147c347@gmail.com>
Date: Wed, 11 Jan 2023 23:04:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/ttm: Fix a regression causing kernel oops'es
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20230111175015.1134923-1-zack@kde.org>
Content-Language: en-US
From: "Martin Krastev (VMware)" <martinkrastev768@gmail.com>
In-Reply-To: <20230111175015.1134923-1-zack@kde.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: krastevm@vmware.com, mombasawalam@vmware.com,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 banackm@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Martin Krastev <krastevm@vmware.com>


LGTM!
Reviewed-by: Martin Krastev <krastevm@vmware.com>


Regards,
Martin


On 11.01.23 г. 19:50 ч., Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
>
> The branch is explicitly taken if ttm == NULL which means that to avoid
> a null pointer reference the ttm object can not be used inside. Switch
> back to dst_mem to avoid kernel oops'es.
>
> This fixes kernel oops'es with any buffer objects which don't have ttm_tt,
> e.g. with vram based screen objects on vmwgfx.
>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Fixes: e3c92eb4a84f ("drm/ttm: rework on ttm_resource to use size_t type")
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo_util.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index fee7c20775c0..12017ec24d9f 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -183,7 +183,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>   
>   	clear = src_iter->ops->maps_tt && (!ttm || !ttm_tt_is_populated(ttm));
>   	if (!(clear && ttm && !(ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC)))
> -		ttm_move_memcpy(clear, ttm->num_pages, dst_iter, src_iter);
> +		ttm_move_memcpy(clear, PFN_UP(dst_mem->size), dst_iter, src_iter);
>   
>   	if (!src_iter->ops->maps_tt)
>   		ttm_kmap_iter_linear_io_fini(&_src_iter.io, bdev, src_mem);
