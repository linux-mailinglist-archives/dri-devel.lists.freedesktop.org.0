Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E33AD1591A3
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 15:14:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CBEE6EE5E;
	Tue, 11 Feb 2020 14:14:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E80586EE5D
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 14:14:06 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id a5so3743315wmb.0
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 06:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=dgf5pFCnzDZxAPCNwY7IjY3xexjPfAYhdmAt1W8es8g=;
 b=R0xolU/mYNUp7v9EWSoKG89CJNd58m8p0WM/uQ88h+FVofBXr431yWn/q/si/tH1bN
 ME8KIyVPUSI8nmVDKTtspVkjg4hCK26fIN03mZ0n1mowhu1cnwqGwxCZgIcy0aqBMa1n
 nNC5fvMN0ZAh90r2N4UvUUJ/V/rIuUZoF1Euc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=dgf5pFCnzDZxAPCNwY7IjY3xexjPfAYhdmAt1W8es8g=;
 b=DrPnlYaNYjOOCfWCBE3Y1QaNKEbg+BNLDhVTNZFo+JdeAHcAKxd5A+O/Y+oG3oFHJ0
 sKt4+VzkYVoRBrLhmrVx/4xlmhG975UiaqmsOqLXUoJkGkwH3iT/HgTZa2TmlKMF4d3W
 go0ImSyyoRCX/6Pdmnt71dsLgxqS969qIQ/72koPGyB1kL0TL05taGMjkN90na5zOact
 Cf6UQ1b3xPVvvcdPwF1l8FYxxD3Ufq5TGWPQ9LvgY6VFJoeF5NovVkYIFgaYRn/sWMtb
 5Ntw8mqzfXr4Nv5mzDuS7zLGYHoXpt6V8z+Q/2VjSUeAUIyzGOcDTQdliO/tpQBGi1Se
 UWxg==
X-Gm-Message-State: APjAAAWjXmhxfP3BcoPvQbsggn2lZBh6MWs+SNrlmB7jciXQuHRLCQjv
 Bam4djUlrNNdTvUUwV3YbNhCoA==
X-Google-Smtp-Source: APXvYqxYwq65EsM9g/3z6GFZSUqMLTuE3G0X+MNJ8hdhbXEJyhZzu17hym72E70jG+Iz9ILO5toElA==
X-Received: by 2002:a05:600c:2190:: with SMTP id
 e16mr5894031wme.84.1581430445526; 
 Tue, 11 Feb 2020 06:14:05 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id i204sm4098566wma.44.2020.02.11.06.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 06:14:04 -0800 (PST)
Date: Tue, 11 Feb 2020 15:14:02 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 5/6] drm/ttm: replace dma_resv object on deleted BOs v2
Message-ID: <20200211141402.GB2363188@phenom.ffwll.local>
References: <20200210150907.20616-1-christian.koenig@amd.com>
 <20200210150907.20616-6-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200210150907.20616-6-christian.koenig@amd.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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
Cc: Xinhui.Pan@amd.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 10, 2020 at 04:09:06PM +0100, Christian K=F6nig wrote:
> When non-imported BOs are resurrected for delayed delete we replace
> the dma_resv object to allow for easy reclaiming of the resources.
> =

> v2: move that to ttm_bo_individualize_resv
> =

> Signed-off-by: Christian K=F6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> =

> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index d0624685f5d2..4d161038de98 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -393,6 +393,14 @@ static int ttm_bo_individualize_resv(struct ttm_buff=
er_object *bo)
>  =

>  	r =3D dma_resv_copy_fences(&bo->base._resv, bo->base.resv);
>  	dma_resv_unlock(&bo->base._resv);
> +	if (r)
> +		return r;
> +
> +	if (bo->type !=3D ttm_bo_type_sg) {
> +		spin_lock(&ttm_bo_glob.lru_lock);
> +		bo->base.resv =3D &bo->base._resv;

Having the dma_resv pointer be protected by the lru_lock for ttm internal
stuff, but invariant everywhere else is really confusing. Not sure that's
a great idea, I've just chased some ttm code around freaking out about
that.
-Daniel

> +		spin_unlock(&ttm_bo_glob.lru_lock);
> +	}
>  =

>  	return r;
>  }
> @@ -720,7 +728,7 @@ static bool ttm_bo_evict_swapout_allowable(struct ttm=
_buffer_object *bo,
>  =

>  	if (bo->base.resv =3D=3D ctx->resv) {
>  		dma_resv_assert_held(bo->base.resv);
> -		if (ctx->flags & TTM_OPT_FLAG_ALLOW_RES_EVICT || bo->deleted)
> +		if (ctx->flags & TTM_OPT_FLAG_ALLOW_RES_EVICT)
>  			ret =3D true;
>  		*locked =3D false;
>  		if (busy)
> -- =

> 2.17.1
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
