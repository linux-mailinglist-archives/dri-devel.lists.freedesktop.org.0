Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7399443606C
	for <lists+dri-devel@lfdr.de>; Thu, 21 Oct 2021 13:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823626E435;
	Thu, 21 Oct 2021 11:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DF4E6E435
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 11:40:34 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id o24so395245wms.0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 04:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=U8aHlYh1humbuFemofS0FbxzBU9FbbLVU8hrceGBEGE=;
 b=QHWYz0P00VoQ86f66VgY84vuNOzYObJBzuikCYbSoENJaP2fb/ZW+FSfQ2ZTk5bcbv
 u66jYr5X7curua5SAyV311K7hEE3q6mn1B9d+kj7MbLJLattDQe4/hziSBfRZpMlnbc6
 Qad/Mz1xHIy8v6K3yhDjx2Gjturfet7EcF6rY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=U8aHlYh1humbuFemofS0FbxzBU9FbbLVU8hrceGBEGE=;
 b=Br3hY/t9ACQlk2ukLYRBsMGxTOkufEtMU9rHpzik4W5aPBuMR1Ni9Oa2OKCrZ0PRgP
 vjiZvQ3AfCf15TybL321zhzCgJQFoesIDcv6sIBSPzKkOeVvpHQ14U8lfhwmfr87nZaF
 oFiuGhFT9UzuBWboISoPTBmFL1xe1pJJPWMFECE49vT26bFsfLGKXHmdmjy3p0pvSyRY
 1uTOp+ARoSnrLl0APb/nAvuX0m9kCCry1DRv+3dsNO0EbJeiyLcIsG1MLuug/T9PMT16
 /lfLaAyJ+7fcZAYR1XahulCALVFZWLsakL23rRG3vFY/Zcw85wo0ie9GNWiaSr5NTxAL
 h9ug==
X-Gm-Message-State: AOAM532l/SN3EEc8/EpNfFL6GEEeXt2SVmuuFInningRKydJ0m3aVa54
 KKPhjkCn83N6R0iz4e5IXuHZYQ==
X-Google-Smtp-Source: ABdhPJzFsXteMzLUIERRuAIkjho60eyxOM0OetTQAHx+idUCqpR+2qEnIgCEFsW6/RDKQ9lQ0oNmZw==
X-Received: by 2002:a05:600c:4f16:: with SMTP id
 l22mr20696889wmq.152.1634816432910; 
 Thu, 21 Oct 2021 04:40:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l20sm8633593wmq.42.2021.10.21.04.40.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 04:40:32 -0700 (PDT)
Date: Thu, 21 Oct 2021 13:40:30 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>,
 Christian Koenig <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, Dan Williams <dan.j.williams@intel.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Roland Scheidegger <sroland@vmware.com>
Subject: Re: [PATCH v2] drm/ttm: Do not put non-struct page memory into
 PUD/PMDs
Message-ID: <YXFRrvQCho36OTHE@phenom.ffwll.local>
References: <0-v2-a44694790652+4ac-ttm_pmd_jgg@nvidia.com>
 <47182e81-39f2-1143-7654-fb31d171e4f3@linux.intel.com>
 <20211020140958.GE2744544@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211020140958.GE2744544@nvidia.com>
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

On Wed, Oct 20, 2021 at 11:09:58AM -0300, Jason Gunthorpe wrote:
> On Wed, Oct 20, 2021 at 08:34:33AM +0200, Thomas Hellström wrote:
> 
> > Follow up question: If we resurrect this in the proper way (and in that case
> > only for x86_64) is there something we need to pay particular attention to
> > WRT the ZONE_DEVICE refcounting fixing you mention above?
> 
> Similar to PTE it should be completely separated from ZONE_DEVICE.
> 
> Seeing the special bit set at any level should trigger all page table
> walkers to never try to get a struct page.
> 
> Today some of the page table walkers are trying to do this with
> vma_is_special(), all of those should end up being the Pxx_SPECIAL
> test instead.

My understanding is that vma_is_special is for platforms which don't have
pte_special, and hence can't do gup_fast. At least I was assuming this is
why vma_is_special is a thing, and why some architectures cannot do
gup_fast.

I think for pmd and higher that approach isn't feasible and so we'll
probably have to disable VM_PFNMAP hugepages if the arch doesn't support
that.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
