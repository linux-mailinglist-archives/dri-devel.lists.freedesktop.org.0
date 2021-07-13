Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CA233C7153
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 15:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D168689DA6;
	Tue, 13 Jul 2021 13:38:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995E289DED
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 13:38:20 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 b14-20020a1c1b0e0000b02901fc3a62af78so1660140wmb.3
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 06:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JXgLaEMV9AycbR+aBsr1GEHEZTKsPIe+O8bYHgn0+8A=;
 b=No9W2eV0gFGsdgaro083xZsih7wNstPq317G3RZvMpcFHmxf+pyZR97e3sdDZPr5wQ
 f6MnmfXpXs3IPPIkrYmd/nJSHVq2Hh1s8VHYZ2RiBZM+J1MscUgt3ntRRPyWX3coys6A
 55WmXn1nAjqEbJEy0iBM+f3mK82hSB2zmQxCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JXgLaEMV9AycbR+aBsr1GEHEZTKsPIe+O8bYHgn0+8A=;
 b=iByOiXaG+V83bvkOBFlspFih2Yz/COnm94pXCEaQZZ5fVu73HiUjkiafKdPNtd2gA7
 YknNpcTeNZtWdttf7QK5TgKtXYmpAsWAUgxg5BxRs4FqGctmGMnLSUeN9szJyvQyIbUS
 mYN5ots9ByRZBPitXjNGq6ANROYBADN6s/odNHtnaHfAXaUAy+THLGuVW+3PZ2XeLIcm
 yTgLjUVFrdDIsorvZcJwD6txTonKDNSqRG4uRGccls6LTruWoL/84zTd7KiHKsHci31T
 Li361p7B6+OZ2u+FNZokJ9qgnDjWWUf4p4dirdbYCcj3HJitrSPFJPMOHN9UGiZoot2h
 dydQ==
X-Gm-Message-State: AOAM530+N7QMKwC09lc9XhBZUZWJG5YpcRlrG0Y2G34/bTxQh3N4G915
 jgGVAKNeeIEpKWCQeUJOLmkC/g==
X-Google-Smtp-Source: ABdhPJwKGByb0HrM4b/cEyIP5bovAUjTfz49C8V5J0SWHVircUw7X9KjQ7WgW7xM6dnU5pGOBEJrdw==
X-Received: by 2002:a1c:9d8f:: with SMTP id g137mr72380wme.13.1626183499233;
 Tue, 13 Jul 2021 06:38:19 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id d24sm2408801wmb.42.2021.07.13.06.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jul 2021 06:38:18 -0700 (PDT)
Date: Tue, 13 Jul 2021 15:38:16 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/i915/gtt: drop the page table optimisation
Message-ID: <YO2XSKyCe5FIBwYS@phenom.ffwll.local>
References: <20210713130431.2392740-1-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210713130431.2392740-1-matthew.auld@intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 stable@vger.kernel.org, Jon Bloomfield <jon.bloomfield@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 13, 2021 at 02:04:31PM +0100, Matthew Auld wrote:
> We skip filling out the pt with scratch entries if the va range covers
> the entire pt, since we later have to fill it with the PTEs for the
> object pages anyway. However this might leave open a small window where
> the PTEs don't point to anything valid for the HW to consume.
> 
> When for example using 2M GTT pages this fill_px() showed up as being
> quite significant in perf measurements, and ends up being completely
> wasted since we ignore the pt and just use the pde directly.
> 
> Anyway, currently we have our PTE construction split between alloc and
> insert, which is probably slightly iffy nowadays, since the alloc
> doesn't actually allocate anything anymore, instead it just sets up the
> page directories and points the PTEs at the scratch page. Later when we
> do the insert step we re-program the PTEs again. Better might be to
> squash the alloc and insert into a single step, then bringing back this
> optimisation(along with some others) should be possible.
> 
> Fixes: 14826673247e ("drm/i915: Only initialize partially filled pagetables")
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Jon Bloomfield <jon.bloomfield@intel.com>
> Cc: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: <stable@vger.kernel.org> # v4.15+

This is some impressively convoluted code, and I'm scared.

But as far as I managed to convince myself, your story here checks out.
Problem will be a bit that this code moved around a _lot_ so we'll need a
lot of dedicated backports :-(

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/i915/gt/gen8_ppgtt.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> index 3d02c726c746..6e0e52eeb87a 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> @@ -303,10 +303,7 @@ static void __gen8_ppgtt_alloc(struct i915_address_space * const vm,
>  			__i915_gem_object_pin_pages(pt->base);
>  			i915_gem_object_make_unshrinkable(pt->base);
>  
> -			if (lvl ||
> -			    gen8_pt_count(*start, end) < I915_PDES ||
> -			    intel_vgpu_active(vm->i915))
> -				fill_px(pt, vm->scratch[lvl]->encode);
> +			fill_px(pt, vm->scratch[lvl]->encode);
>  
>  			spin_lock(&pd->lock);
>  			if (likely(!pd->entry[idx])) {
> -- 
> 2.26.3
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
