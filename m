Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D279935C922
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 16:49:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 638BA6E5D4;
	Mon, 12 Apr 2021 14:49:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39D606E5D4
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 14:49:02 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id h4so4205021wrt.12
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 07:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=NXjkczVwqqVo+oLAIjlUmhwND9IFvolMb5ncjQTgSyM=;
 b=IHl/lmlqMvySdw6HAcWP7dFbFQYOAooDkY3tJFujHO7MUJ/fmvpAPX0HDUeTn3p5ko
 QTAwOoYeou0zOij+/5dJYW8Em6w9QPDQp/SXZgRZiP0N7LTIV2QhgbUA/n8ptChw4JZq
 SdVuelie+KLY4JkEZ5hV5lppGeaYZLh8Ej580=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NXjkczVwqqVo+oLAIjlUmhwND9IFvolMb5ncjQTgSyM=;
 b=mYoUqb3cOOQK6PNNODX5r32ziqXoy91ORMCP/xcsChNXU/Bu8BWBBfS7FemMZpuJO7
 FbJJ7o556meksE7tXKuke1HzAqzpi2QvwI9J5RzEQ3mNhwCFvL7Kx6lTEcgyxQpgDEmM
 hVfQ6UxwkFMwG62S1eA6n4LATCo+kyg2Dik18oZwcWPL/AzKxiYCAvNGnOTHCTvZ3W1A
 J3QgvTjZ3w75PPCr2A/NcR3vqAQ0lXLz0lcjZcUmp6efvtkbYqdcYAJ79eqemzd56p7V
 du0Q6JYrB9MzVscVXkE7sv2buM2qHKril8k6gih1zVBR7oyog9kenwreZompN0RsWOqO
 1BWw==
X-Gm-Message-State: AOAM532MMhg7muXMTmdbHgX7KWNQZBoNoqz3ep2aY30iiLavWT4DiQhP
 LJUxSADR1F1EBmdrscFShK1okg==
X-Google-Smtp-Source: ABdhPJzDyqzAK+4/itpwV8pVUSc+auwJEwTLR6SQAO3Apk5picgLlQ/bLy/cYThwNSsDK1PrI0/9Aw==
X-Received: by 2002:adf:9cc1:: with SMTP id h1mr31439649wre.135.1618238940979; 
 Mon, 12 Apr 2021 07:49:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r35sm15006621wmp.32.2021.04.12.07.49.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 07:49:00 -0700 (PDT)
Date: Mon, 12 Apr 2021 16:48:58 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [Intel-gfx] [PATCH 01/19] drm/i915/gt: Skip aperture remapping
 selftest where there is no aperture
Message-ID: <YHRd2g8yRH7Ya+Oy@phenom.ffwll.local>
References: <20210412090526.30547-1-matthew.auld@intel.com>
 <20210412090526.30547-2-matthew.auld@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210412090526.30547-2-matthew.auld@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 12, 2021 at 10:05:08AM +0100, Matthew Auld wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> If there is no mappable aperture, we cannot remap it for access, and the
> selftest is void.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> Reviewed-by: Imre Deak <imre.deak@intel.com>

I guess subject should have i915/selftest in it? Also if you resubmit
other people's code needs your sob. Otherwise looks reasonable.
-Daniel
> ---
>  drivers/gpu/drm/i915/selftests/i915_vma.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/selftests/i915_vma.c b/drivers/gpu/drm/i915/selftests/i915_vma.c
> index 5fe7b80ca0bd..dd0607254a95 100644
> --- a/drivers/gpu/drm/i915/selftests/i915_vma.c
> +++ b/drivers/gpu/drm/i915/selftests/i915_vma.c
> @@ -967,6 +967,9 @@ static int igt_vma_remapped_gtt(void *arg)
>  	intel_wakeref_t wakeref;
>  	int err = 0;
>  
> +	if (!i915_ggtt_has_aperture(&i915->ggtt))
> +		return 0;
> +
>  	obj = i915_gem_object_create_internal(i915, 10 * 10 * PAGE_SIZE);
>  	if (IS_ERR(obj))
>  		return PTR_ERR(obj);
> -- 
> 2.26.3
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
