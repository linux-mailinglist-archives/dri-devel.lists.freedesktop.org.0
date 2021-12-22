Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFB447D8F8
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 22:52:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD1D410E305;
	Wed, 22 Dec 2021 21:52:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3FE10E305
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 21:52:37 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id x15so13883805edv.1
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 13:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=c7jtBamXWY7Ec9ROV3OjQL0fvP/qcLqLqrMSbN3AvqY=;
 b=ecRC2EllFpOPXFx3eUOJpN9EMHM+yrA3y4nYhQ3Q6cDMpUV9ZUtLIpsPG3IylvPhXx
 7NEFPhUsS32xRVSG+1lBEqWdpWTzcPcuxqFCGFNlPm/Mm6NTnAcTH6ywcnaRQtIDiPyG
 z62vXQMBt4BBad622pJR62wXhSNKyBMmpO+Ew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=c7jtBamXWY7Ec9ROV3OjQL0fvP/qcLqLqrMSbN3AvqY=;
 b=1gC30ulcnQly2OIN+xht/s4hWhEGq2oqo8qQwS9rDJp+t62xgxrQVDYmHaoyEqYrh3
 dgcinjyqixAZ5WP11KyQs9kIQUOHRQ6Rl9a8l2A+EnbzTSsuk6ApnnjkNwQ/PP7ex0sX
 82+bi5Jqp0v9y8FiIECNi0swEFgiKChfrM8CpC+bdzD3p9yk525lQ/+n0C7mGCGOnA6x
 Fyw5vro9nIqDTHSCIS2qBqh80y0NpaqtRWAH4gyqZVkvwNgXrB5ljSPlBZpzBZL8OIaf
 47pT4voZ9+f2ch+kERgU5YjCDw1iygvoQyz6F/1BImb17FOPfNCovccFopNUPcFSnGou
 Reqg==
X-Gm-Message-State: AOAM533BrbNouT324hsZc25yuKR6Yj+BNWfYeHWOlyhcDazHkSYwlmtS
 sEj1WHJ9PSDBru+b7S+exM0EfA==
X-Google-Smtp-Source: ABdhPJya0W2q658d/hOLrgWA6I3WAs9SdToJcK6EKM3kejv0OPyZOAA4uQllKuDPAmH5Y2h6ddZrKQ==
X-Received: by 2002:a17:907:2d28:: with SMTP id
 gs40mr3760932ejc.765.1640209955690; 
 Wed, 22 Dec 2021 13:52:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id ne31sm1112670ejc.48.2021.12.22.13.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 13:52:35 -0800 (PST)
Date: Wed, 22 Dec 2021 22:52:33 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 16/24] drm/nouveau: support more than one write fence in
 fenv50_wndw_prepare_fb
Message-ID: <YcOeIfLwB6srBtQu@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-17-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-17-christian.koenig@amd.com>
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

On Tue, Dec 07, 2021 at 01:34:03PM +0100, Christian König wrote:
> Use dma_resv_get_singleton() here to eventually get more than one write
> fence as single fence.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/wndw.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> index 133c8736426a..b55a8a723581 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
> @@ -536,8 +536,6 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
>  	struct nouveau_bo *nvbo;
>  	struct nv50_head_atom *asyh;
>  	struct nv50_wndw_ctxdma *ctxdma;
> -	struct dma_resv_iter cursor;
> -	struct dma_fence *fence;
>  	int ret;
>  
>  	NV_ATOMIC(drm, "%s prepare: %p\n", plane->name, fb);
> @@ -560,13 +558,11 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
>  			asyw->image.handle[0] = ctxdma->object.handle;
>  	}
>  
> -	dma_resv_iter_begin(&cursor, nvbo->bo.base.resv, false);
> -	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> -		/* TODO: We only use the first writer here */
> -		asyw->state.fence = dma_fence_get(fence);
> -		break;
> -	}
> -	dma_resv_iter_end(&cursor);
> +	ret = dma_resv_get_singleton(nvbo->bo.base.resv, false,
> +				     &asyw->state.fence);

Needs nouveau-ack, but otherwise lgtm.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> +	if (ret)
> +		return ret;
> +
>  	asyw->image.offset[0] = nvbo->offset;
>  
>  	if (wndw->func->prepare) {
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
