Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE9B48BF8EB
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2024 10:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06F001134CA;
	Wed,  8 May 2024 08:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="Eg6cDDEM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E571134CA
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2024 08:41:43 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a59d5b112ecso25625266b.3
 for <dri-devel@lists.freedesktop.org>; Wed, 08 May 2024 01:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1715157701; x=1715762501; darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=vj3PIc4hFA9/gXdFfuPOe4yWwg2VXd43faHw15CH2oA=;
 b=Eg6cDDEM1arBPjKZm85lGtmatjMBbgClEmfLWcPbzHDQQka8fX2RQoie3OgQ8DPuhK
 tzYDgVxmWRn6/Gf0OS28Fj7me6Iq3701mUUYGrS4uOCJ1dEb/ZvQzhdkKMaFsGDfJry0
 +rB4YmBsEy4H6YOCKKq+lDsyGiwnqiVfuqBjw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715157701; x=1715762501;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vj3PIc4hFA9/gXdFfuPOe4yWwg2VXd43faHw15CH2oA=;
 b=ZObSc+UwUUCMuIVrn3ECjn7Rv5hGv4BkA84pw4eu3wLWERSp2HAC7F/MNU3JqLCZXo
 AE+93kyu0LsvSCXq09Z+mCzeR2CyZQfEZb2JUHNV4GKEW5LbHz6Fk925sobpIPxYR4xK
 Syz+wuXbNT1HoLw44BdJcUH8EPdKwOhY2OBqgIYbZ0PaV4V6C3oZv32yfI8m9IiYWVQA
 V/V02wdA2zxPiOad7Ls1kNeLNQk2+XWXqBFs+IMcIlgvLMCSqagi8qIjI9ytTWmCk5/n
 Et/c2uTwyB6FsDXEBfj5Uxzxda12A0Zjn9XYf85OUe7nDN1k1tjMFDNvvbVJBxc0Baj9
 LIbQ==
X-Gm-Message-State: AOJu0YyWvTiUOZaxQt0xnlXYTnnM1PQp11rPmdc17MXEXHQMi1pejYax
 3j0UPujedFlHFqdt9C7Jlkut9lNunYwlzgLErt02fhR45w3de1dyDH042UF7qHI=
X-Google-Smtp-Source: AGHT+IH14cLBvOGAxNNOD0NGpNszsABs3zuyVXh3n6kNBMTLyF0vRRZioU2iVIuWiSighaj0aLtPcg==
X-Received: by 2002:a17:906:df14:b0:a59:bce9:8454 with SMTP id
 a640c23a62f3a-a59fb94f6d3mr121582766b.1.1715157700922; 
 Wed, 08 May 2024 01:41:40 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 g23-20020a1709067c5700b00a5a0b34110dsm97882ejp.1.2024.05.08.01.41.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 01:41:40 -0700 (PDT)
Date: Wed, 8 May 2024 10:41:37 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, christian.koenig@amd.com, alexander.deucher@amd.com
Subject: Re: [PATCH] drm/buddy: Fix the range bias clear memory allocation
 issue
Message-ID: <Zjs6wVITtRuXoRDz@phenom.ffwll.local>
References: <20240508065720.125846-1-Arunpravin.PaneerSelvam@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240508065720.125846-1-Arunpravin.PaneerSelvam@amd.com>
X-Operating-System: Linux phenom 6.6.15-amd64 
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

On Wed, May 08, 2024 at 12:27:20PM +0530, Arunpravin Paneer Selvam wrote:
> Problem statement: During the system boot time, an application request
> for the bulk volume of cleared range bias memory when the clear_avail
> is zero, we dont fallback into normal allocation method as we had an
> unnecessary clear_avail check which prevents the fallback method leads
> to fb allocation failure following system goes into unresponsive state.
> 
> Solution: Remove the unnecessary clear_avail check in the range bias
> allocation function.
> 
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Fixes: 96950929eb23 ("drm/buddy: Implement tracking clear page feature")
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> ---
>  drivers/gpu/drm/drm_buddy.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Can you please also add a kunit test case to exercise this corner case and
make sure it stays fixed?

Thanks, Sima
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 284ebae71cc4..831929ac95eb 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -574,7 +574,7 @@ __drm_buddy_alloc_range_bias(struct drm_buddy *mm,
>  
>  	block = __alloc_range_bias(mm, start, end, order,
>  				   flags, fallback);
> -	if (IS_ERR(block) && mm->clear_avail)
> +	if (IS_ERR(block))
>  		return __alloc_range_bias(mm, start, end, order,
>  					  flags, !fallback);
>  
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
