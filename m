Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 907546362E2
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 16:09:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7630610E20E;
	Wed, 23 Nov 2022 15:09:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf2e.google.com (mail-qv1-xf2e.google.com
 [IPv6:2607:f8b0:4864:20::f2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC04510E20E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 15:09:01 +0000 (UTC)
Received: by mail-qv1-xf2e.google.com with SMTP id e15so12302319qvo.4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Nov 2022 07:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=yl5EWh2LPGXKg4ZX+0uMGR+SP4+5g4wansDQ2racGIw=;
 b=UZ90yvpYHpAD2wJFcceeqxHp5n/1J/IMdboyjPLp9xSvgX7lhd9bIH3J7mYPJrCrgH
 tIUHI5mfCyqHqL/FPnEKA2O3D4UL7ejl7s4SZWtCiLkQMQ0C9Vp59OLuPUd9l9rtsP/H
 5KMfSJskvLx0jvavXd2BcujWMJkK2mF1Y/bBE2Auf5ZuOkr+OEzP+TYvNGzpLDMh1E/b
 /tk+XGOAsg1BHi8GoUKfhHIo0iTmbkce9zo9I7xuGjeffWnbCQMDz+hFZmGT49zCWuvX
 8So0XmT6Euoi53OroYVLDNKa4yZxbJs5xlXojPLsNHKLC7aadu52zmFmfAidIVRVxdfh
 /nVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yl5EWh2LPGXKg4ZX+0uMGR+SP4+5g4wansDQ2racGIw=;
 b=SY8q5IJv1VVefGBeCNOtJzI6ozCJqRiP1ogoMZOc/3nhaITCuatR9YvssKGUTke62C
 WknU4v+8aX42pOVw3sdlgSGgi5Zet9vJ08xjZf9Ybrg1IuYZtYLnhgZGV2yHUOau9RnV
 VayqSLME+nGEZ7+Zfnd1kqj+KHxufaSm/zlOODBbXP6CDOA3Ykh6KiDlOLbqWWsUaJDx
 vHE0HMC/40AvgrA65wPCsMMHpQjjUSz9xRJZt85BGBwN8ef+h2iRI8/bXrAHvixgfdrb
 WsotVSg+EgP0p9/naJCrvcAwi3Up7NF3hzVbL00RjIgKUpwF29WqQJCaqDmmUuaUbcR0
 cLfQ==
X-Gm-Message-State: ANoB5pkWLm6fH9a6VguikBNEmTBOrs1BuDl62Z+F74Q1tmEDhaLyew79
 pQi2Min3i/lVmcCkcTrfnOmOmw==
X-Google-Smtp-Source: AA0mqf7e8Ogh/ZJOSZP+2cSLpyEbwDySY9r7p8UtFKlyBZNWj/XPJyjVbU2TWKfbCouXJyhbUXJI9w==
X-Received: by 2002:a0c:b405:0:b0:4bb:666c:384d with SMTP id
 u5-20020a0cb405000000b004bb666c384dmr27071486qve.91.1669216140695; 
 Wed, 23 Nov 2022 07:09:00 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-47-55-122-23.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [47.55.122.23]) by smtp.gmail.com with ESMTPSA id
 ca9-20020a05622a1f0900b00398a7c860c2sm10023130qtb.4.2022.11.23.07.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 07:08:59 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.95)
 (envelope-from <jgg@ziepe.ca>) id 1oxrMw-00AMdR-Vh;
 Wed, 23 Nov 2022 11:08:58 -0400
Date: Wed, 23 Nov 2022 11:08:58 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [Linaro-mm-sig] Re: [PATCH] dma-buf: Require VM_PFNMAP vma for
 mmap
Message-ID: <Y343ijGoqyf73d+I@ziepe.ca>
References: <3d8607b4-973d-945d-c184-260157ade7c3@amd.com>
 <CAKMK7uHVGgGHTiXYOfseXXda2Ug992nYvhPsL+4z18ssqeHXHQ@mail.gmail.com>
 <b05e6091-4e07-1e32-773d-f603ac9ac98b@gmail.com>
 <CAKMK7uFjmzewqv3r4hL9hvLADwV536n2n6xbAWaUvmAcStr5KQ@mail.gmail.com>
 <Y34WI9SZdiH/p1tA@ziepe.ca>
 <f8f844a5-0910-d19a-5aea-df7a1d83b1d3@gmail.com>
 <Y34XvmtHfb4ZwopN@ziepe.ca>
 <dc2a9d7f-192b-e9d8-b1d1-3b868cb1fd44@gmail.com>
 <Y34gBUl0m+j1JdFk@ziepe.ca>
 <CAKMK7uEzaUjroODbWe4DtxHQ+gmr7_DVK+fUJjAgMsgP61uGSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKMK7uEzaUjroODbWe4DtxHQ+gmr7_DVK+fUJjAgMsgP61uGSQ@mail.gmail.com>
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
Cc: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 John Stultz <john.stultz@linaro.org>, Matthew Wilcox <willy@infradead.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Suren Baghdasaryan <surenb@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 23, 2022 at 03:34:54PM +0100, Daniel Vetter wrote:
> > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > index 1376a47fedeedb..4161241fc3228c 100644
> > --- a/virt/kvm/kvm_main.c
> > +++ b/virt/kvm/kvm_main.c
> > @@ -2598,6 +2598,19 @@ static int hva_to_pfn_remapped(struct vm_area_struct *vma,
> >                         return r;
> >         }
> >
> > +       /*
> > +        * Special PTEs are never convertible into a struct page, even if the
> > +        * driver that owns them might have put a PFN with a struct page into
> > +        * the PFNMAP. If the arch doesn't support special then we cannot
> > +        * safely process these pages.
> > +        */
> > +#ifdef CONFIG_ARCH_HAS_PTE_SPECIAL
> > +       if (pte_special(*ptep))
> > +               return -EINVAL;
> 
> On second thought this wont work, because it completely defeats the
> point of why this code here exists. remap_pfn_range() (which is what
> the various dma_mmap functions and the ioremap functions are built on
> top of too) sets VM_PFNMAP too, so this check would even catch the
> static mappings.

The problem with the way this code is designed is how it allows
returning the pfn without taking any reference based on things like
!pfn_valid or page_reserved. This allows it to then conditionally put
back the reference based on the same reasoning. It is impossible to
thread pte special into that since it is a PTE flag, not a property of
the PFN.

I don't entirely understand why it needs the page reference at all,
even if it is available - so I can't guess why it is OK to ignore the
page reference in other cases, or why it is OK to be racy..

Eg hmm_range_fault() does not obtain page references and implements a
very similar algorithm to kvm.

> Plus these static mappings aren't all that static either, e.g. pci
> access also can revoke bar mappings nowadays.

And there are already mmu notifiers to handle that, AFAIK.

Jason
