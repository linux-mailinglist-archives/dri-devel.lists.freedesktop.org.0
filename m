Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCFC0462F29
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 10:02:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CB9F6EB67;
	Tue, 30 Nov 2021 09:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2DC86EB67
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 09:02:10 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id c4so42729109wrd.9
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 01:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=SyhOY1PWVHdj7OGLzuhI+3QnabA2X3t1wGqtY/Cum7o=;
 b=WwH7MvELKyxjjGwc9yiPsyAAIBuF06DvxGYA/WES6IfpRL3NVHrVKKnvpMKaQ6PJA5
 mykiDsNEKYKjPzfhIkzfa0dgIhrUaySGoMtOSwTMMWbcn7bxmVTQzeVIecytjaKeRWCJ
 EzTT47ZYbGku37TfsYG3lYHRrnKE8aD5dYSik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=SyhOY1PWVHdj7OGLzuhI+3QnabA2X3t1wGqtY/Cum7o=;
 b=rok6aCW0gM40Pf1RPryw2BdmzktPYwo0JaSuZ0HlGwfA7yeEXfUBvhQFx4brausWv6
 HX/CxMRJaABAP0c2loej8C+2BE1lKRAp1AmhIqu3Ja0huAuQTJZimuSbnThBCeDNpttA
 h9U6s7S6/RAAOU9qrlmNNgbBdYGzQ9RPeu/6/Td5Sm2hWBF0RBS4ElX81Y8xsIdrB8Dq
 zvbhNVnxwyrrsbYsSt1rPV8+ziuuRTxfkElaiwtfFdTE7sK7z3A6gB7yFYOGQWy1mMn9
 nMGY7IK67IliecQOL6V5G5qW5mi76r7wPD7zH15aT6vvQpBX1e7F3rAvoyX6vcvdyy1j
 quSQ==
X-Gm-Message-State: AOAM530ngHJOjeHXCPbeEv3whBQpLyci34POb7G+OUjBUNYjJeOgAdtv
 WBDshKmSfE0Ol0MobUK+VXGu7w==
X-Google-Smtp-Source: ABdhPJzIghKd5RuGlVbrc+DKuTzdkXkSPPV5i18aTKE6MdkrhHBQB8No2j9Zb80BZ0xtQuH7QekziQ==
X-Received: by 2002:a05:6000:12d2:: with SMTP id
 l18mr39532679wrx.289.1638262929322; 
 Tue, 30 Nov 2021 01:02:09 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id h204sm1797534wmh.33.2021.11.30.01.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 01:02:08 -0800 (PST)
Date: Tue, 30 Nov 2021 10:02:07 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 02/28] drm/ttm: stop pruning fences after wait
Message-ID: <YaXoj3fzu0cfhd6j@phenom.ffwll.local>
References: <20211129120659.1815-1-christian.koenig@amd.com>
 <20211129120659.1815-3-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211129120659.1815-3-christian.koenig@amd.com>
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

On Mon, Nov 29, 2021 at 01:06:33PM +0100, Christian König wrote:
> This is just abusing internals of the dma_resv object.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Yeah I think if we want this back we could do a _locked version of the
wait, which prunes internally.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

Btw I wonder, should we put the ttm_bo_wait wrapper on the chopping block
in gpu/todo.rst? It's really just complications I think in most cases. And
it would be nice if ttm has the same errno semantics for these as everyone
else, I always get very confused about this stuff ...

Cheers, Daniel

> ---
>  drivers/gpu/drm/ttm/ttm_bo.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index e4a20a3a5d16..fc124457ba2f 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1086,7 +1086,6 @@ int ttm_bo_wait(struct ttm_buffer_object *bo,
>  	if (timeout == 0)
>  		return -EBUSY;
>  
> -	dma_resv_add_excl_fence(bo->base.resv, NULL);
>  	return 0;
>  }
>  EXPORT_SYMBOL(ttm_bo_wait);
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
