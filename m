Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE94E42C190
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 15:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F5886E0DC;
	Wed, 13 Oct 2021 13:38:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2344C6E0A8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 13:38:46 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id t2so8520046wrb.8
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Oct 2021 06:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6GA6XIU0Xc2Wra2poMYk2tEHx2fm42OJDzFKvGTc0pU=;
 b=Yc7WssjwCNmsEOWTT6PIXgw7MItSD2h8qIJP99dM+/t3mp/obwPqejVb5aukMz9wpI
 qW57wx9iu3PY3KMX8OQbgaFPphDMrx2hmKGKaMwkPDMc/GH+2ms5Nu/9VJyUVEo0fT9h
 GwvyhFe8OyvlFr2EkO0uQqdL3Rx4jHlimCaIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6GA6XIU0Xc2Wra2poMYk2tEHx2fm42OJDzFKvGTc0pU=;
 b=4Rxv8QSN3vHjgceLFGxvwvWqTZY5diY/5TZL+kY+RQZansBLlZCkFHE0LNxW6BhcBh
 AOi6Be5db+3duDwrRPBuN4AyLdeb/u5pXvHJaWTYO/lwVlcUePhaXzSKVmmqw0pTFcRt
 k5sl62BDrJHCVJkQzlWIOkeM8v3U6Ss6pkWx461px6twmpqbd4ymRk6Fc6hM/9fW7eX9
 laSIipwoQpm2K2taKr5M2ESVirI2gnL4h1Ae7dzu5YJYXbvEVCew9tI/SBS4HK1Wm18H
 mWToI0kJgeYbC7M9JnD5c3ADiRgSNP28PeieorrwQfk3JgoealYTMxaSh0X9vxImwNAn
 bg8w==
X-Gm-Message-State: AOAM531CLM3P6oHxWUf2rCU1N7zH43y5cKG6PLHQI52w1I9zkeyBAozG
 DFj5ygNIlxg+BxRoTFm9WDwgLYtxPHHOHg==
X-Google-Smtp-Source: ABdhPJysl3A9cB6JSDcHzq/6aFm5BowWZ+fJEhou3zKe2RRq7dui+MyPiJ+MIU324cJiQTdjK7l16g==
X-Received: by 2002:a05:6000:2a4:: with SMTP id
 l4mr41301610wry.221.1634132324696; 
 Wed, 13 Oct 2021 06:38:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id c185sm5419043wma.8.2021.10.13.06.38.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 06:38:44 -0700 (PDT)
Date: Wed, 13 Oct 2021 15:38:42 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ramalingam C <ramalingam.c@intel.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Matthew Auld <matthew.auld@intel.com>, CQ Tang <cq.tang@intel.com>,
 Hellstrom Thomas <thomas.hellstrom@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 03/14] drm/i915/xehpsdv: enforce min GTT alignment
Message-ID: <YWbhYrNaT0TS1D3a@phenom.ffwll.local>
References: <20211011161155.6397-1-ramalingam.c@intel.com>
 <20211011161155.6397-4-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211011161155.6397-4-ramalingam.c@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 11, 2021 at 09:41:44PM +0530, Ramalingam C wrote:
> From: Matthew Auld <matthew.auld@intel.com>
> 
> For local-memory objects we need to align the GTT addresses to 64K, both
> for the ppgtt and ggtt.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Do we still need this with relocations removed? Userspace is picking all
the addresses for us, so all we have to check is whether userspace got it
right.
-Daniel


> ---
>  drivers/gpu/drm/i915/i915_vma.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_vma.c b/drivers/gpu/drm/i915/i915_vma.c
> index 4b7fc4647e46..1ea1fa08efdf 100644
> --- a/drivers/gpu/drm/i915/i915_vma.c
> +++ b/drivers/gpu/drm/i915/i915_vma.c
> @@ -670,8 +670,13 @@ i915_vma_insert(struct i915_vma *vma, u64 size, u64 alignment, u64 flags)
>  	}
>  
>  	color = 0;
> -	if (vma->obj && i915_vm_has_cache_coloring(vma->vm))
> -		color = vma->obj->cache_level;
> +	if (vma->obj) {
> +		if (HAS_64K_PAGES(vma->vm->i915) && i915_gem_object_is_lmem(vma->obj))
> +			alignment = max(alignment, I915_GTT_PAGE_SIZE_64K);
> +
> +		if (i915_vm_has_cache_coloring(vma->vm))
> +			color = vma->obj->cache_level;
> +	}
>  
>  	if (flags & PIN_OFFSET_FIXED) {
>  		u64 offset = flags & PIN_OFFSET_MASK;
> -- 
> 2.20.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
