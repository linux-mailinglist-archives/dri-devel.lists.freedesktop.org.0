Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 122904AD8FC
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 14:16:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB7FC10E13E;
	Tue,  8 Feb 2022 13:16:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985B510E13E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 13:16:33 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id f17so20288218edd.2
 for <dri-devel@lists.freedesktop.org>; Tue, 08 Feb 2022 05:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=f64ILGGTSPvkUq4wQOkLsCvrb4ZuGkYGc811scBzO5Y=;
 b=T8Wb7BXXP67fgoD4bmk/761gugvMGuHrlOqeOKgdXGRRGA8Hpr66Q0K4mgEPRIcWyJ
 99SM06lNY8yUsYRqseBBtnr/2Sg3IAK1wn9WLmX2y16UBqAGvFB1+36HyV8gEJWjEYQo
 IE4rPfrQyH9DC0prS1LerHepjG3lHs/N7aLXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=f64ILGGTSPvkUq4wQOkLsCvrb4ZuGkYGc811scBzO5Y=;
 b=SpeqpZDjwaUyKEw6JGbyLCkm/7L9v1Wsct+6QLln0rvQf9qR0Ic7GE2dsYE/xGVsoB
 r4ds8DbKh4goxOSFoBz4/gjFjEw8P0CQlqVPUf0Gu8Nt4e3mXND7XMRUfDao2GrXW053
 XphmbhR2vjnCmWRFFf82j9/Z+4iYX1t3CF5VuT7cotaSjBVutXKUENdJlx3hBpEG+QYi
 pORg8+XB1SCHFzJa2ePdiETdEQFHaO+uJSPKEoCnSjhHp4pcmMz7+fEwsUC6VVDNY0LM
 lv5agFQst2eg3z0n2t4lpmL9GkKtCIsUUQp1tOmyTAdFUNue8a6Bx/jyXtuM3lVXSDud
 wtrw==
X-Gm-Message-State: AOAM530SEtNNRXojBFhtmpWz50e4MR2yxYYdQFByowEyXsmOMWGUx7X8
 WQAF4MRAQB1SPndQ8CPaRfN/Wg==
X-Google-Smtp-Source: ABdhPJx2wnD0IuUx8PbRWWTEInm+5xp2l/xeHn+P1ddjGej4NDlto9txCIoI1cAmzs93eMDRYNOmEA==
X-Received: by 2002:a05:6402:5110:: with SMTP id
 m16mr4441191edd.325.1644326191998; 
 Tue, 08 Feb 2022 05:16:31 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id g19sm2001960ejd.62.2022.02.08.05.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Feb 2022 05:16:31 -0800 (PST)
Date: Tue, 8 Feb 2022 14:16:29 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/buddy: fixup potential uaf
Message-ID: <YgJtLSUr61S1Dxvr@phenom.ffwll.local>
References: <20220208113815.314048-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220208113815.314048-1-matthew.auld@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 08, 2022 at 11:38:15AM +0000, Matthew Auld wrote:
> If we are unlucky and somehow can't allocate enough memory when
> splitting blocks, where we temporarily end up with the given block and
> its buddy on the respective free list, then we need to ensure we delete
> both blocks, and not just the buddy, before potentially freeing them.
> 
> v2: rebase on i915_buddy removal
> 
> Fixes: 14d1b9a6247c ("drm/i915: buddy allocator")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> Cc: Christian König <christian.koenig@amd.com>

btw wrt fixups, can you pls include the drm_buddy.c kerneldoc into
Documentation/gpu/drm-mm.rst? That seems to be missing. Also probably some
kerneldoc to polish to make it warning free and complete.
-Daniel

> ---
>  drivers/gpu/drm/drm_buddy.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index d60878bc9c20..2bf75e8abfaa 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -333,8 +333,10 @@ drm_buddy_alloc_blocks(struct drm_buddy *mm, unsigned int order)
>  	return block;
>  
>  out_free:
> -	if (i != order)
> +	if (i != order) {
> +		list_del(&block->link);
>  		__drm_buddy_free(mm, block);
> +	}
>  	return ERR_PTR(err);
>  }
>  EXPORT_SYMBOL(drm_buddy_alloc_blocks);
> @@ -452,8 +454,10 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
>  	buddy = get_buddy(block);
>  	if (buddy &&
>  	    (drm_buddy_block_is_free(block) &&
> -	     drm_buddy_block_is_free(buddy)))
> +	     drm_buddy_block_is_free(buddy))) {
> +		list_del(&block->link);
>  		__drm_buddy_free(mm, block);
> +	}
>  
>  err_free:
>  	drm_buddy_free_list(mm, &allocated);
> -- 
> 2.34.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
