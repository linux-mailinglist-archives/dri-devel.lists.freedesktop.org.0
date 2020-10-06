Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C07284B2E
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 13:57:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD0989C03;
	Tue,  6 Oct 2020 11:57:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4708789C9C
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 11:57:05 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id a2so11984491otr.11
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Oct 2020 04:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0/v0p3FvFQy6vefIiWkN5sABT9yaRl0KmB4aTLtFJ80=;
 b=lLhpfE52DsBTlXOZaNcfYtajrRM/cDqIwevRSBDcVW4qoPVbzEi7+sihe6YcHp2QOU
 hnAD2eoXIOk84DvIqJ2RTZpXb49sc13g/2RKsA0kTklQEV+Sykz8QqnvTSECPTErHsRx
 qsTQaNy+j6UOMtosFQSSws5ErF7y9aC00H4zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0/v0p3FvFQy6vefIiWkN5sABT9yaRl0KmB4aTLtFJ80=;
 b=jCAVTDjXHxfp/LY8wle6fEl8W670UUig1S+XHRrHJ1LNj+BUxZJIM+TfvCOzHUvxJ3
 0k8dgaQ5wv4DfRmXJ8N9zdDgHX4UBCz2pR1Ee+3f4aESnQpW9tFT20UXuRzHChut8xTC
 /WVw7beoltJF/5XJRiX0N9wtnM3L9OGxReVPsPOQT8dyODh+sHjCYsFfKaIf8moNIhTE
 +rh/GXpx5qgUeb48dw4o+TOxXLn0iE4q8hJ2OO9cTJfegM+qlu/OP76j4QGiWbETQI+5
 d0vMlSKyQnK4CX8dYVwvGFp9JFGu5JMEdlqm8iNEbf9ac4QBTVPNcoh0cFeKqGOhIOcK
 e9cw==
X-Gm-Message-State: AOAM530e62Iosf9cVXDc1kCEOiuiEHX5YVtkN3ERBEDl4++qL6+W6rZE
 GzJHhR56+x9K/mPEfQPQPM/awk4ubAQ77CADIaFWHA==
X-Google-Smtp-Source: ABdhPJyMG6+nB6zVd1RDfgIGK4/zu55vJ18yPOXo0KPUU4RdObE/Y3T3eJQEZZwVcpMDmw5VSMtR9OkGz5YHDq9+Jw8=
X-Received: by 2002:a05:6830:1c3c:: with SMTP id
 f28mr2857746ote.188.1601985424516; 
 Tue, 06 Oct 2020 04:57:04 -0700 (PDT)
MIME-Version: 1.0
References: <0-v1-447bb60c11dd+174-frame_vec_fix_jgg@nvidia.com>
 <20201005175308.GI4225@quack2.suse.cz> <20201005175746.GA4734@nvidia.com>
In-Reply-To: <20201005175746.GA4734@nvidia.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 6 Oct 2020 13:56:53 +0200
Message-ID: <CAKMK7uGrQq6tb2hMUSC-=JkTNMC2DvdQkcZncmVBKZ-0x6S61Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] mm/frame-vec: use FOLL_LONGTERM
To: Jason Gunthorpe <jgg@nvidia.com>
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 Mauro Carvalho Chehab <mchehab@osg.samsung.com>,
 John Hubbard <jhubbard@nvidia.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, Hans Verkuil <hans.verkuil@cisco.com>,
 Mel Gorman <mgorman@suse.de>, andrew Morton <akpm@linux-foundation.org>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 5, 2020 at 7:58 PM Jason Gunthorpe <jgg@nvidia.com> wrote:
>
> On Mon, Oct 05, 2020 at 07:53:08PM +0200, Jan Kara wrote:
> > On Mon 05-10-20 14:38:54, Jason Gunthorpe wrote:
> > > When get_vaddr_frames() does its hacky follow_pfn() loop it should never
> > > be allowed to extract a struct page from a normal VMA. This could allow a
> > > serious use-after-free problem on any kernel memory.
> > >
> > > Restrict this to only work on VMA's with one of VM_IO | VM_PFNMAP
> > > set. This limits the use-after-free problem to only IO memory, which while
> > > still serious, is an improvement.
> > >
> > > Cc: stable@vger.kernel.org
> > > Fixes: 8025e5ddf9c1 ("[media] mm: Provide new get_vaddr_frames() helper")
> > > Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> > >  mm/frame_vector.c | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/mm/frame_vector.c b/mm/frame_vector.c
> > > index 10f82d5643b6de..26cb20544b6c37 100644
> > > +++ b/mm/frame_vector.c
> > > @@ -99,6 +99,10 @@ int get_vaddr_frames(unsigned long start, unsigned int nr_frames,
> > >             if (ret >= nr_frames || start < vma->vm_end)
> > >                     break;
> > >             vma = find_vma_intersection(mm, start, start + 1);
> > > +           if (!(vma->vm_flags & (VM_IO | VM_PFNMAP))) {
> > > +                   ret = -EINVAL;
> > > +                   goto out;
> > > +           }
> > >     } while (vma && vma->vm_flags & (VM_IO | VM_PFNMAP));
> >
> > Hum, I fail to see how this helps. If vma has no VM_IO or VM_PFNMAP flag,
> > we'd exit the loop (to out: label) anyway due to the loop termination
> > condition and why not return the frames we already have? Furthermore
> > find_vma_intersection() can return NULL which would oops in your check
> > then. What am I missing?
>
> Oh, nothing, you are right. It just didn't read naturally because
> hitting the wrong kind of VMA should be an error condition :\

Also follow_pfn checks for this same conditionat already too, so this
isn't really stopping anything bad from happening.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
