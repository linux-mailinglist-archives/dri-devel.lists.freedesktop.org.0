Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE645436072
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 13:41:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 924576EA9F;
	Thu, 21 Oct 2021 11:41:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362906EA9F
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 11:41:43 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so469270wmz.2
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 04:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=0N/5Ym+L/jGBCNaRvRPaUjI5YyBzZRyAjwwMqL0Jwbw=;
 b=i2AAdmsMreK7Adwl5ZevKNaBOnF2zq7qIYQugQpFsq9BJM6HaNdsjtROZwZpLK3Hkc
 DxfQryVkDMpqpl8O5ph2Izc2lGIeMgDnCKKfH6duRbd4Xw1XrxN2DIW3mcx3cgd+gHD8
 Qw03zx0polvTscsGhPZKwvmCEhe1ddTOoqFyc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0N/5Ym+L/jGBCNaRvRPaUjI5YyBzZRyAjwwMqL0Jwbw=;
 b=AzpAJrmAvieMdqX4LkLncDqflh3IvFLD9qFYQUfvSdWHgz/E2VgrKTReQVnN9yceb+
 n4qmbEtWXYApAEhQouModOptXXNAl4Yr+DzRxxRy/EfLRP7PQ7R6riiirLdKcEefScqq
 FXh/eOYKfJebJwefPydwW3+RTPfNIJK2H9Fhlb8n5KFfMgqMsBBEJxKvPw+tBomeya3i
 TUbFP3/l29Fxkk4a8uj+vI352PyAzgNfoSm+RnSRojIs0/3w8uJTr6dA49LLOmfCva+O
 k7cAHk7WKISB4D2ckJ1izliiKa8/QTgkJFjoZq3FxAo0Ay5Fy32TsXWSk5rkf4gGHrj5
 LFmw==
X-Gm-Message-State: AOAM53306kxaBUb7cSHDh33R8lMZYawXt/kHbhQNZeT9L+1L/wJIHE6v
 nsUKBVQAV/uXcYO3i3d6ufPAew==
X-Google-Smtp-Source: ABdhPJw/0zncBT0Yl01qSvvZGwhWXZ2GZcpzr/IzYn4IO795jk0NXviU7b7vN1RbuvV6USfgX+q7jg==
X-Received: by 2002:a7b:c742:: with SMTP id w2mr6146078wmk.61.1634816501681;
 Thu, 21 Oct 2021 04:41:41 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id e9sm4716754wrn.2.2021.10.21.04.41.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 04:41:41 -0700 (PDT)
Date: Thu, 21 Oct 2021 13:41:39 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Huang Rui <ray.huang@amd.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Roland Scheidegger <sroland@vmware.com>
Subject: Re: [PATCH v2] drm/ttm: Do not put non-struct page memory into
 PUD/PMDs
Message-ID: <YXFR85joqUODJyy/@phenom.ffwll.local>
References: <0-v2-a44694790652+4ac-ttm_pmd_jgg@nvidia.com>
 <47182e81-39f2-1143-7654-fb31d171e4f3@linux.intel.com>
 <e88f42a3-7f04-25d9-5274-24a700df689f@amd.com>
 <20211020193702.GJ2744544@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211020193702.GJ2744544@nvidia.com>
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

On Wed, Oct 20, 2021 at 04:37:02PM -0300, Jason Gunthorpe wrote:
> On Wed, Oct 20, 2021 at 08:41:24AM +0200, Christian König wrote:
> 
> > > I think the patch subject needs updating to reflect that we're disabling
> > > PUD/PMDs completely.
> > > With that fixed,
> 
> Everyone is OK with this?
> 
> drm/ttm: remove ttm_bo_vm_insert_huge()
> 
> The huge page functionality in TTM does not work safely because PUD and
> PMD entries do not have a special bit.
> 
> get_user_pages_fast() considers any page that passed pmd_huge() as
> usable:
> 
> 	if (unlikely(pmd_trans_huge(pmd) || pmd_huge(pmd) ||
> 		     pmd_devmap(pmd))) {
> 
> And vmf_insert_pfn_pmd_prot() unconditionally sets
> 
> 	entry = pmd_mkhuge(pfn_t_pmd(pfn, prot));
> 
> eg on x86 the page will be _PAGE_PRESENT | PAGE_PSE.
> 
> As such gup_huge_pmd() will try to deref a struct page:
> 
> 	head = try_grab_compound_head(pmd_page(orig), refs, flags);
> 
> and thus crash.
> 
> So, iomem cannot be installed using vmf_insert_pfn_pud/pmd_prot().
> 
> Thomas further notices that the drivers are not expecting the struct page
> to be used by anything - in particular the refcount incr above will cause
> them to malfunction. This means even the struct page memory cannot be
> used.
> 
> Therefore everything about this is not able to fully work correctly
> considering GUP_fast. Delete it entirely. It can return someday along with
> a proper PMD/PUD_SPECIAL bit in the page table itself to gate GUP_fast.
> 
> Fixes: 314b6580adc5 ("drm/ttm, drm/vmwgfx: Support huge TTM pagefaults")
> Reviewed-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Thomas Hellström <thomas.helllstrom@linux.intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I think we also want cc: stable here.

Do you plan to land this through some dedicated pull for -rc? I think that
makes sense to highlight it, but I can also smash this into some
drm-fixes.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
