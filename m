Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 217E447D8F3
	for <lists+dri-devel@lfdr.de>; Wed, 22 Dec 2021 22:51:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0621710E2F6;
	Wed, 22 Dec 2021 21:51:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2E2F10E2F6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 21:51:23 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id bm14so13775308edb.5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Dec 2021 13:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=tvMuyvqKENJPxfYNvPBdLBk/Q0Wu/qzhmc/BjawCPSo=;
 b=CPeuFuALlPY2M7TTTvs430ZAgWX3z4eHsR15vVCComngcPfMN/3b1I9hB3sP72T1of
 FgPUZ0qOV8PVMFUFczgp7jCLSsuNRFMuRVeInQh0X+Flyi84Qe3jWG6CUlOsw2yNDA63
 VFAZ7oJ9+m8l/c51UW7wiAGZ6Kb0zO+HE1PgI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=tvMuyvqKENJPxfYNvPBdLBk/Q0Wu/qzhmc/BjawCPSo=;
 b=HAQYMaKwpGx4crG+QJDyAq+HukUaAOzVM23zc4irrpe5blLmEopvpZBf1iUQu3/drQ
 KBy/zSdz8GyjajrwD4Lq//Bow3RTfHVHdp/AlHpgaC1tHFJ/YVHJ80HjetKDJz5Dh+Wu
 fNRMrMEeRlCQg1Wpj0mH3HO39zM54R6BpLyWpZLbaZd7TZVQyBKUy3HlUknIqW6XnClA
 5Eqwzla0yXK+2Nc2/aesbn5qqLeMiTjbO/WXVUZe7meTAqanjizO+A4yNFvMLChloPTw
 uGybMTnyFDDeWan5MRAMFBWcC2LVMvMjiWnUsWywu5AUKp5hj5uKQVWyFnUmeifDk9X3
 +lfA==
X-Gm-Message-State: AOAM533gaOM+md+clmTsjyKUM9SafxJJLpiB7mhb2Fdzt1gyuyRYw4Zt
 UJVEiwb5yYduAV1sr6UP0jytKQ==
X-Google-Smtp-Source: ABdhPJwVGe0nyH+ZbABYq6LPipkNqDcq5EgwVrsId62oST/trYTfKTAhQzsjzEcYTc9rYFgRDXORgQ==
X-Received: by 2002:a17:906:249a:: with SMTP id
 e26mr3866884ejb.492.1640209882226; 
 Wed, 22 Dec 2021 13:51:22 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id hr36sm1123687ejc.28.2021.12.22.13.51.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Dec 2021 13:51:21 -0800 (PST)
Date: Wed, 22 Dec 2021 22:51:20 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 15/24] drm: support more than one write fence in
 drm_gem_plane_helper_prepare_fb
Message-ID: <YcOd2DpbI0QTPhPh@phenom.ffwll.local>
References: <20211207123411.167006-1-christian.koenig@amd.com>
 <20211207123411.167006-16-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211207123411.167006-16-christian.koenig@amd.com>
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

On Tue, Dec 07, 2021 at 01:34:02PM +0100, Christian König wrote:
> Use dma_resv_get_singleton() here to eventually get more than one write
> fence as single fence.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Patch title should be drm/atomic-helper: prefix, not just drm:

With that nit:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/drm_gem_atomic_helper.c | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
> index c3189afe10cb..9338ddb7edff 100644
> --- a/drivers/gpu/drm/drm_gem_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
> @@ -143,25 +143,21 @@
>   */
>  int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
>  {
> -	struct dma_resv_iter cursor;
>  	struct drm_gem_object *obj;
>  	struct dma_fence *fence;
> +	int ret;
>  
>  	if (!state->fb)
>  		return 0;
>  
>  	obj = drm_gem_fb_get_obj(state->fb, 0);
> -	dma_resv_iter_begin(&cursor, obj->resv, false);
> -	dma_resv_for_each_fence_unlocked(&cursor, fence) {
> -		/* TODO: Currently there should be only one write fence, so this
> -		 * here works fine. But drm_atomic_set_fence_for_plane() should
> -		 * be changed to be able to handle more fences in general for
> -		 * multiple BOs per fb anyway. */
> -		dma_fence_get(fence);
> -		break;
> -	}
> -	dma_resv_iter_end(&cursor);
> +	ret = dma_resv_get_singleton(obj->resv, false, &fence);
> +	if (ret)
> +		return ret;
>  
> +	/* TODO: drm_atomic_set_fence_for_plane() should be changed to be able
> +	 * to handle more fences in general for multiple BOs per fb.
> +	 */
>  	drm_atomic_set_fence_for_plane(state, fence);
>  	return 0;
>  }
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
