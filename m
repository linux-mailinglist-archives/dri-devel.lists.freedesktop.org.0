Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2AC43E4C1
	for <lists+dri-devel@lfdr.de>; Thu, 28 Oct 2021 17:15:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6DE36E056;
	Thu, 28 Oct 2021 15:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE0C6E053
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 15:14:56 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d10so10888372wrb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Oct 2021 08:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=0rBv3gLltMIBQ7U6hPnNQRhn78uz/Pwsvkyd7M8egAA=;
 b=XrBSzbJxjv6maJ5X5pv3kMsroXp2p9SyJ541SdKDQMGqPuXilU+omiGeBBkXPC3li1
 71RIQ+hY5wRvhzeeaQCes9zvIofH0qHk7OxYomXM2stshIvBT8sp3yJlx0FVwhS9kWXH
 GhCkuUeatwwsMzHIDnihDUDoEmbPVA0tHIZjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=0rBv3gLltMIBQ7U6hPnNQRhn78uz/Pwsvkyd7M8egAA=;
 b=QyMfwz/O88psahCdzAocR9OIzvN01JnyiMMktLgYa5Tj5d939kX5stR/f9v1MdkB/D
 AoWvID+MjMU0z1fs8kNHVqhL7cXmR1tATXrqdstpG86qDF66G0hcIV65CWgbQF7pl7A/
 VS05iN153zUrCh6DNB+EbnOKG8ifa9d9l8LcEmwBpmwhS3TMi/eSdaYN1WdbWuO6sPuS
 eBU/jhnRXaSLSIGm++4or/oEoECQwlva7F4TpgLJCRJYp8yQJ0m8lj0TQ8OPhF5eck7j
 hvYqEVChjejz03G1g3rXzTS9qTlBqzPTALWHtwAD5CvO2chrwKjZUxcV2MeTQhlV1SrA
 pUDg==
X-Gm-Message-State: AOAM5302UKXICCO+foXK4H9KU2Xu8G4Aqro1n03QEpUBrTDKzRf13PA1
 vaMEikBz1FXXG7rGKVkLI1hbog==
X-Google-Smtp-Source: ABdhPJwgp2tebmKQBc35EaV+YNthU9hqMpcDkb+eto26VhD43IZqqUwbGq2+6fTdkzzI/X/tBu5gFg==
X-Received: by 2002:a5d:4949:: with SMTP id r9mr6366818wrs.439.1635434094806; 
 Thu, 28 Oct 2021 08:14:54 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id n17sm7000829wms.33.2021.10.28.08.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 08:14:54 -0700 (PDT)
Date: Thu, 28 Oct 2021 17:14:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Daniel Vetter <daniel@ffwll.ch>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, Dan Williams <dan.j.williams@intel.com>,
 Ralph Campbell <rcampbell@nvidia.com>,
 Roland Scheidegger <sroland@vmware.com>
Subject: Re: [PATCH v2] drm/ttm: Do not put non-struct page memory into
 PUD/PMDs
Message-ID: <YXq+bELDrDiB2VPm@phenom.ffwll.local>
References: <0-v2-a44694790652+4ac-ttm_pmd_jgg@nvidia.com>
 <47182e81-39f2-1143-7654-fb31d171e4f3@linux.intel.com>
 <e88f42a3-7f04-25d9-5274-24a700df689f@amd.com>
 <20211020193702.GJ2744544@nvidia.com>
 <YXFR85joqUODJyy/@phenom.ffwll.local>
 <20211022185742.GO2744544@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211022185742.GO2744544@nvidia.com>
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

On Fri, Oct 22, 2021 at 03:57:42PM -0300, Jason Gunthorpe wrote:
> On Thu, Oct 21, 2021 at 01:41:39PM +0200, Daniel Vetter wrote:
> > On Wed, Oct 20, 2021 at 04:37:02PM -0300, Jason Gunthorpe wrote:
> > > On Wed, Oct 20, 2021 at 08:41:24AM +0200, Christian König wrote:
> > > 
> > > > > I think the patch subject needs updating to reflect that we're disabling
> > > > > PUD/PMDs completely.
> > > > > With that fixed,
> > > 
> > > Everyone is OK with this?
> > > 
> > > drm/ttm: remove ttm_bo_vm_insert_huge()
> > > 
> > > The huge page functionality in TTM does not work safely because PUD and
> > > PMD entries do not have a special bit.
> > > 
> > > get_user_pages_fast() considers any page that passed pmd_huge() as
> > > usable:
> > > 
> > > 	if (unlikely(pmd_trans_huge(pmd) || pmd_huge(pmd) ||
> > > 		     pmd_devmap(pmd))) {
> > > 
> > > And vmf_insert_pfn_pmd_prot() unconditionally sets
> > > 
> > > 	entry = pmd_mkhuge(pfn_t_pmd(pfn, prot));
> > > 
> > > eg on x86 the page will be _PAGE_PRESENT | PAGE_PSE.
> > > 
> > > As such gup_huge_pmd() will try to deref a struct page:
> > > 
> > > 	head = try_grab_compound_head(pmd_page(orig), refs, flags);
> > > 
> > > and thus crash.
> > > 
> > > So, iomem cannot be installed using vmf_insert_pfn_pud/pmd_prot().
> > > 
> > > Thomas further notices that the drivers are not expecting the struct page
> > > to be used by anything - in particular the refcount incr above will cause
> > > them to malfunction. This means even the struct page memory cannot be
> > > used.
> > > 
> > > Therefore everything about this is not able to fully work correctly
> > > considering GUP_fast. Delete it entirely. It can return someday along with
> > > a proper PMD/PUD_SPECIAL bit in the page table itself to gate GUP_fast.
> > > 
> > > Fixes: 314b6580adc5 ("drm/ttm, drm/vmwgfx: Support huge TTM pagefaults")
> > > Reviewed-by: Christian König <christian.koenig@amd.com>
> > > Reviewed-by: Thomas Hellström <thomas.helllstrom@linux.intel.com>
> > > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > 
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > I think we also want cc: stable here.
> 
> Ok
>  
> > Do you plan to land this through some dedicated pull for -rc? I think that
> > makes sense to highlight it, but I can also smash this into some
> > drm-fixes.
> 
> I was hoping you'd take it? Do want a v3?

Hm totally lost this, I'm trying to not be too responsible for mm changes
since it scares me :-) Plus dropping this very late in the release feels a
bit risky.

Ok if I stuff this into drm-next instead?
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
