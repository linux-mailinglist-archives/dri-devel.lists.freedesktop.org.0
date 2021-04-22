Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8927367E2A
	for <lists+dri-devel@lfdr.de>; Thu, 22 Apr 2021 11:52:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE466EA65;
	Thu, 22 Apr 2021 09:52:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DABAD6EA65
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 09:52:07 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id j5so43161152wrn.4
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Apr 2021 02:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3UnvFiyNmZGE7pVwURDEycGYvp3fonkGX/HYHN4YNwE=;
 b=JGntBhD/RiKNxA/WmU87zLUxlQ0WMuYVVnLm/IyFLFju1zv7m0Vy1CHy565Fo05xs5
 H7PqZU9iL7JsMQSPZbI9o6/93JFaEL93oLCpZKvxzmO6SUXRiFHAKzhUZ8kPes/r4VsP
 JPCnvYyyqIAIlkIjSBUlITXkajhImQOe8uiRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3UnvFiyNmZGE7pVwURDEycGYvp3fonkGX/HYHN4YNwE=;
 b=Sp+VP7+XdRiO6/lJHiqs8FItDcruu5rDAtEUwC/PnEhToKE10ENi8YhSNAj9jExZkz
 ZBkiw9S/bs4M8YjNTC5dXNhYlnqoKYRIAp6UiaIvR73S5J91lCapgcZYmYF4ToGrh74e
 Ab3Y7rIz9DsRWO6cQw1l5HFQ/1DhO70GSMlzU+mrgByBfWCC2qCxaKvWPa+1t7gd1C4a
 bsnVxKuUZUrltgY6QUjYbOMeSf5g/glb2fKIQ2edSF7leuTM0mkRdMHxgXcioFeEw4Z4
 I1jmv9Jb3qRHEoFz5IcGyHYjDK9Ug4+8BLt9Mi5+OIYvGaRD8U/HdQvJynK1fza8zB59
 EQgg==
X-Gm-Message-State: AOAM533fJS2F1S/neb3gqR74QhYoIhcBsZ5vgqmYpE9O688RuNid2TnE
 HdW6iKyRCepoELR+YJVcZ/zmAA==
X-Google-Smtp-Source: ABdhPJyMdEeDFs46ksAuhBJU+v0BT/6F+CLX3CNceVFCisL4gGl1pQ5FRDP9kuvG9A3Mce12qVlDWw==
X-Received: by 2002:adf:e583:: with SMTP id l3mr3136009wrm.63.1619085126562;
 Thu, 22 Apr 2021 02:52:06 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m2sm4918446wmq.15.2021.04.22.02.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Apr 2021 02:52:05 -0700 (PDT)
Date: Thu, 22 Apr 2021 11:52:04 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Shiwu Zhang <shiwu.zhang@amd.com>
Subject: Re: [PATCH v2] drm/ttm: fix error handling if no BO can be swapped out
Message-ID: <YIFHRJvFwe3flG6D@phenom.ffwll.local>
References: <20210422083749.11686-1-shiwu.zhang@amd.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210422083749.11686-1-shiwu.zhang@amd.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
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
Cc: christian.koenig@amd.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 22, 2021 at 04:37:49PM +0800, Shiwu Zhang wrote:
> Signed-off-by: Shiwu Zhang <shiwu.zhang@amd.com>

Cc: stable@vger.kernel.org or at least Fixes: tag?

Zero length commit message for something that claims to be a bugfix is
probably too short :-)
-Daniel

> ---
>  drivers/gpu/drm/ttm/ttm_device.c | 2 +-
>  drivers/gpu/drm/ttm/ttm_tt.c     | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 1f2024164d72..5dc92b056f0a 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -112,7 +112,7 @@ int ttm_global_swapout(struct ttm_operation_ctx *ctx, gfp_t gfp_flags)
>  {
>  	struct ttm_global *glob = &ttm_glob;
>  	struct ttm_device *bdev;
> -	int ret = -EBUSY;
> +	int ret = 0;
>  
>  	mutex_lock(&ttm_global_mutex);
>  	list_for_each_entry(bdev, &glob->device_list, device_list) {
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 48c407cff112..539e0232cb3b 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -329,6 +329,8 @@ int ttm_tt_populate(struct ttm_device *bdev,
>  	       ttm_dma32_pages_limit) {
>  
>  		ret = ttm_global_swapout(ctx, GFP_KERNEL);
> +		if (ret == 0)
> +			break;
>  		if (ret < 0)
>  			goto error;
>  	}
> -- 
> 2.17.1
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
