Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B920A358254
	for <lists+dri-devel@lfdr.de>; Thu,  8 Apr 2021 13:44:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC5476EAB8;
	Thu,  8 Apr 2021 11:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B8FD6EAB8
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Apr 2021 11:44:10 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id f6so1777071wrv.12
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Apr 2021 04:44:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=+bIMHjM8IkWGQ9w2UhAWL6nad3z/nsAAXwfEZIX9lWc=;
 b=HzLW9PAKd4D2FBBBl8PCr0y3Kw+mUxzAfMkhunUFy5g084vTc3tR3FgCZULEQo0aRJ
 70RJkyKfjoUXms2whB0E+fWJOI2bfvz4DeQho9AoZyPY+Fi8PJLOMkNvY/vNEMPUQWqq
 eGGIn6Fb7N4Gn6wTADCQI6woEj7GonRXHLLvE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=+bIMHjM8IkWGQ9w2UhAWL6nad3z/nsAAXwfEZIX9lWc=;
 b=gZB7vSUvY3O1eVidEQnzhBhXd7IPwOnPWBVQ8rZUt6VYPlz82C+NROeqXZu48Xs4Nf
 n1SsuaLCKokwamNEYsAXiRHxYynojY/1ik6QO4IW63YmzYKAN1r7JX/uXFrfv/YUyLCX
 YDaqeVVLbyGeoZUGF0yhhCYBGC+lWNVbiu1nfEMJw9I5D+EMYzP3qdV7ZGC/STuyrxC0
 /2vPTkWHRaz9+11qj3zj5i+o2bWtivTtrthThDaM7VOSDb0K38XxNemmegGbecjZsHD+
 QCRg4zplBa/p+rvzhNdTiGHD7prOFBb1LbR0hCZGU087jkRCcCCXWrtBVjJGxixp/cTv
 1oRQ==
X-Gm-Message-State: AOAM533ZVQJ0ZbdvKGSfk0V36FcVDnhQtqQd/GYkURo6pYxFzAyhcL+L
 DsZ0tZ/XQMMpFimSFhlO75mFsQ==
X-Google-Smtp-Source: ABdhPJx7T3RCQlE5ua8yXfZvWLP1S80e0mDHoUGS7ErWGxP0VUT/3ngstw02CFjw7tqjgD8X14d31A==
X-Received: by 2002:adf:e743:: with SMTP id c3mr7764889wrn.408.1617882248844; 
 Thu, 08 Apr 2021 04:44:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f7sm11692950wmq.11.2021.04.08.04.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 04:44:08 -0700 (PDT)
Date: Thu, 8 Apr 2021 13:44:06 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 3/3] mm: unexport follow_pfn
Message-ID: <YG7shmP1WdfguDQf@phenom.ffwll.local>
Mail-Followup-To: Paolo Bonzini <pbonzini@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, kvm@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-media@vger.kernel.org,
 3pvd@google.com, Jann Horn <jannh@google.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter Xu <peterx@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Daniel Vetter <daniel.vetter@intel.com>
References: <20210316153303.3216674-1-daniel.vetter@ffwll.ch>
 <20210316153303.3216674-4-daniel.vetter@ffwll.ch>
 <20210329133101.GA1168973@nvidia.com>
 <YG7VWWkvnv2IPEXt@phenom.ffwll.local>
 <5f956a46-da38-e72a-edaa-3b746a275f1e@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5f956a46-da38-e72a-edaa-3b746a275f1e@redhat.com>
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
Cc: linux-samsung-soc@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>, kvm@vger.kernel.org,
 Jann Horn <jannh@google.com>, Cornelia Huck <cohuck@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>, linux-mm@kvack.org,
 3pvd@google.com, Peter Xu <peterx@redhat.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Daniel Vetter <daniel.vetter@intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 08, 2021 at 01:40:59PM +0200, Paolo Bonzini wrote:
> On 08/04/21 12:05, Daniel Vetter wrote:
> > On Mon, Mar 29, 2021 at 10:31:01AM -0300, Jason Gunthorpe wrote:
> > > On Tue, Mar 16, 2021 at 04:33:03PM +0100, Daniel Vetter wrote:
> > > > Both kvm (in bd2fae8da794 ("KVM: do not assume PTE is writable after
> > > > follow_pfn")) and vfio (in 07956b6269d3 ("vfio/type1: Use
> > > > follow_pte()")) have lost their callsites of follow_pfn(). All the
> > > > other ones have been switched over to unsafe_follow_pfn because they
> > > > cannot be fixed without breaking userspace api.
> > > > 
> > > > Argueably the vfio code is still racy, but that's kinda a bigger
> > > 
> > > vfio and kvm
> > 
> > Hm I thought kvm is non-racy due to the mmu notifier catch races?
> 
> No, but the plan is indeed to have some struct for each page that uses
> follow_pfn and update it from the MMU notifiers.

Thanks for clarifying, I've fixed the commit message to mention both vfio
and kvm as Jason suggested. I didn't know that the follow_pte usage in kvm
still has some gaps wrt what's invalidated with mmu notifiers.

Thanks, Daniel

> 
> Paolo
> 
> > > 
> > > > picture. But since it does leak the pte beyond where it drops the pt
> > > > lock, without anything else like an mmu notifier guaranteeing
> > > > coherence, the problem is at least clearly visible in the vfio code.
> > > > So good enough with me.
> > > > 
> > > > I've decided to keep the explanation that after dropping the pt lock
> > > > you must have an mmu notifier if you keep using the pte somehow by
> > > > adjusting it and moving it into the kerneldoc for the new follow_pte()
> > > > function.
> > > > 
> > > > Cc: 3pvd@google.com
> > > > Cc: Jann Horn <jannh@google.com>
> > > > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > > > Cc: Jason Gunthorpe <jgg@nvidia.com>
> > > > Cc: Cornelia Huck <cohuck@redhat.com>
> > > > Cc: Peter Xu <peterx@redhat.com>
> > > > Cc: Alex Williamson <alex.williamson@redhat.com>
> > > > Cc: linux-mm@kvack.org
> > > > Cc: linux-arm-kernel@lists.infradead.org
> > > > Cc: linux-samsung-soc@vger.kernel.org
> > > > Cc: linux-media@vger.kernel.org
> > > > Cc: kvm@vger.kernel.org
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > ---
> > > >   include/linux/mm.h |  2 --
> > > >   mm/memory.c        | 26 +++++---------------------
> > > >   mm/nommu.c         | 13 +------------
> > > >   3 files changed, 6 insertions(+), 35 deletions(-)
> > > 
> > > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > 
> > Thanks for your r-b tags, I'll add them.
> > -Daniel
> > 
> > > 
> > > Jason
> > 
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
