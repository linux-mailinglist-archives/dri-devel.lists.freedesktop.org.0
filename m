Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 060523B0048
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 11:32:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 363EB6E45E;
	Tue, 22 Jun 2021 09:32:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1206E45E;
 Tue, 22 Jun 2021 09:32:27 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id q14so1412651eds.5;
 Tue, 22 Jun 2021 02:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-transfer-encoding:content-language;
 bh=LOCSnm/N1pBHltn95vUZhkchMq85yLIfAmB1PF+x18Q=;
 b=vHJQJFFosItRBuGebqAt4dpZuWAr/kksQRVEcZ2dgDtfNn+2nJLtoK9+f2JTSEagL8
 Cg4d1QID27pq6WpV0QPJyDLOr+64WNsCiiYWQNjn8wvsWLg1h8L0S35gUe83H+DRw1Ji
 PYq4LpTCQmDTBTw4oa4UhzWVIOK0+pjf1Ld/M7NTjJqpCoMk5qm/pTQukl8L2lday6nQ
 WrOWZdGjM4x8NsBiXlL9eEt/22K05lWNFZWe5eCDaHftVhy8VSz1q8yPhF+EmrRll/7P
 dJ5XLv4JGGMjKeQZtrkbUXFoomJd6jspi90stYEwVkXVWcXdB5Fbf0PKERu6+zjcFrv+
 MvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=LOCSnm/N1pBHltn95vUZhkchMq85yLIfAmB1PF+x18Q=;
 b=AryhTvj7RlN02L2rtPVUST+W+hyNJqQKhV3DD7JZWcNXvaAp0mhupSu1RU7p4gkwe3
 GuFKpR2eEGtEWYn+4MdM/HUOoYdpEdnkbJ/dS1EF7e7RlATR3Ao/aKUY4n+zD4JFaheq
 taz/ZZEfc+CljrQq4cpiLfPrfBOne/LDSmfI6A4fYZjkfMsWgv2jak/Zz/5bGDOixqfx
 62WWHF+MIBZr5qf0iOlpCa4eR9Wc9t/lwbECB0bc4Eq42/l4W6SYnPsSRBJbnI+EKi2n
 vCdf5H5kTqup14uYRFxv79Vf2+oecv6w6qbb3ArzVm7+4vAp8tZ9K5QU3Fv+yzm7mwDO
 ujBw==
X-Gm-Message-State: AOAM531gulVdAkN0PyNYA/HbK62Z/hl+pOAw/Mor2uIfJ3hZFzuYwLxh
 C7tzeeAFMC/lFqTNN5w+lrq829cjqiU=
X-Google-Smtp-Source: ABdhPJyenvUxqy264W7BiaKIJZQl8UKV6nqPJ/WfPqvKTLZW8GJpOFS9FNmOoshAZAxHVR7HpaBv7A==
X-Received: by 2002:a50:9345:: with SMTP id n5mr3659396eda.289.1624354346093; 
 Tue, 22 Jun 2021 02:32:26 -0700 (PDT)
Received: from ?IPv6:2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4?
 ([2a02:908:1252:fb60:9dfd:8ca7:7f8d:67e4])
 by smtp.gmail.com with ESMTPSA id r6sm1955880eds.47.2021.06.22.02.32.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 02:32:25 -0700 (PDT)
Subject: Re: [PATCH] drm/nouveau: fix dma_address check for CPU/GPU sync
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
To: linux@zary.sk, bskeggs@redhat.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
References: <20210614110517.1624-1-christian.koenig@amd.com>
Message-ID: <8f2720e3-8a86-11bc-7988-b763a5f1525a@gmail.com>
Date: Tue, 22 Jun 2021 11:32:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210614110517.1624-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ping? Does anybody wants to give me an rb or acked-by?

AGP is basically broken on nouveu without this.

Christian.

Am 14.06.21 um 13:05 schrieb Christian König:
> AGP for example doesn't have a dma_address array.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/nouveau/nouveau_bo.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 3e09df0472ce..170aba99a110 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -546,7 +546,7 @@ nouveau_bo_sync_for_device(struct nouveau_bo *nvbo)
>   	struct ttm_tt *ttm_dma = (struct ttm_tt *)nvbo->bo.ttm;
>   	int i, j;
>   
> -	if (!ttm_dma)
> +	if (!ttm_dma || !ttm_dma->dma_address)
>   		return;
>   	if (!ttm_dma->pages) {
>   		NV_DEBUG(drm, "ttm_dma 0x%p: pages NULL\n", ttm_dma);
> @@ -582,7 +582,7 @@ nouveau_bo_sync_for_cpu(struct nouveau_bo *nvbo)
>   	struct ttm_tt *ttm_dma = (struct ttm_tt *)nvbo->bo.ttm;
>   	int i, j;
>   
> -	if (!ttm_dma)
> +	if (!ttm_dma || !ttm_dma->dma_address)
>   		return;
>   	if (!ttm_dma->pages) {
>   		NV_DEBUG(drm, "ttm_dma 0x%p: pages NULL\n", ttm_dma);

