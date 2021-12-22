Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F2C47D8E0
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 22:37:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA64610E2D8;
	Wed, 22 Dec 2021 21:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B78B910E2E7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 21:37:43 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id bm14so13672984edb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 13:37:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=5Qo+nFcnWhfkRsrQeCzbvYusBRH/F2n7RikRiuAf8/g=;
 b=IvYzvI3/k4LalWnS2750Udv5OE/ko7GcCzuzKNVNfHKcMqA0T2D9NinPZtbsC4iUM+
 I1s4AjJqIdn/6n/cjhy81gKOkV82UZZfGsvDFUZUeYeuXxkrfuJ7dGETUdBYvnWlY/pG
 1yq/bHJmHiL2riWajRm0Z4ZyGTf8mvrODxyto=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=5Qo+nFcnWhfkRsrQeCzbvYusBRH/F2n7RikRiuAf8/g=;
 b=HG0Y12LeXsbSyxqnDVI3WtNI46kuZ7CGRpe/JA7eJFODl0i83B8yy9x6STfaEsODf9
 Gprdtpy5N+BknGFwvH2fk53F4Hb5qWoUIKu4TBxM/JpTLk7ocDKJWiCm7DEwHmjlBLbR
 AIfSGK6SIl+D7b5zSb5ncZQbHzgICdQSzqaOhVCRWUtABX7UHW1saniUBRPi2iIUXsLj
 WaSlyvx6LXHShO0hHApG45cYbbdY2IcSAK36GmwpEq0rm8W59DUMhQyI9HvrNg/jFfe8
 eFNyktCxpLAh/qIWZaNdrTwinbAHV0lTThTrxrTZDJFiGpbyPYtNbZ+9XmjBFwLJ0NIw
 BAjg==
X-Gm-Message-State: AOAM532WsMiM0LUkSYARyJPqmgE5hU+FH7rFCU8khR36XsOr4yY+eNbz
 GM2U0QBf/0k3IGunpAKfDb+Q5A==
X-Google-Smtp-Source: ABdhPJzOaQ3/3QMM/0PJ7nP8MwY7OPDou96jhbXDS81aDHtiLwn7DX6gpwyf9ktdSVJ4Sh++XjoWCQ==
X-Received: by 2002:a05:6402:51cd:: with SMTP id
 r13mr4458688edd.184.1640209062287; 
 Wed, 22 Dec 2021 13:37:42 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id s26sm1071922eja.152.2021.12.22.13.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 13:37:41 -0800 (PST)
Date: Wed, 22 Dec 2021 22:37:40 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 11/24] drm/amdgpu: use dma_resv_for_each_fence for CS
 workaround
Message-ID: <YcOapBWDYQj5hKRn@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-12-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-12-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 07, 2021 at 01:33:58PM +0100, Christian König wrote:
> Get the write fence using dma_resv_for_each_fence instead of accessing
> it manually.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 53e407ea4c89..7facd614e50a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1268,6 +1268,8 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>  	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
>  		struct dma_resv *resv = e->tv.bo->base.resv;
>  		struct dma_fence_chain *chain = e->chain;
> +		struct dma_resv_iter cursor;
> +		struct dma_fence *fence;
>  
>  		if (!chain)
>  			continue;
> @@ -1277,9 +1279,10 @@ static int amdgpu_cs_submit(struct amdgpu_cs_parser *p,
>  		 * submission in a dma_fence_chain and add it as exclusive
>  		 * fence.
>  		 */
> -		dma_fence_chain_init(chain, dma_resv_excl_fence(resv),
> -				     dma_fence_get(p->fence), 1);
> -
> +		dma_resv_for_each_fence(&cursor, resv, false, fence) {
> +			break;
> +		}
> +		dma_fence_chain_init(chain, fence, dma_fence_get(p->fence), 1);

Uh this needs a TODO. I'm assuming you'll fix this up later on when
there's more than write fence, but in case of bisect or whatever this is a
bit too clever. Like you just replace one "dig around in dma-resv
implementation details" with one that's not even a documented interface
:-)

With an adequately loud comment added interim:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

>  		rcu_assign_pointer(resv->fence_excl, &chain->base);
>  		e->chain = NULL;
>  	}
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
