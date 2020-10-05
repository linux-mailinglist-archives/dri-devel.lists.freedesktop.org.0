Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E792283E14
	for <lists+dri-devel@lfdr.de>; Mon,  5 Oct 2020 20:16:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4537389C59;
	Mon,  5 Oct 2020 18:16:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E77B589C2C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Oct 2020 18:16:24 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id o8so9550937otl.4
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Oct 2020 11:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o2+egbzisCjaq6nT3TbPZNwblZFYsu8ELcSxPmHmJLs=;
 b=J0+Lgox+Zl9MR/XcCJjFK6iKg91x1iw1K/lYf26aRsAWa8kYykCWy7QLhvJYCZo/rI
 85l/kYnB3V0HE1AMuIcpmFW5+WsQgw3xUFa+j7WIrU1oW0leAypRqp05SrgmM9EUXOaD
 hCEkIII06FI//qIehI2esTVFpziKPwVbJXmP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o2+egbzisCjaq6nT3TbPZNwblZFYsu8ELcSxPmHmJLs=;
 b=lQDkY74352mc4JukpR91Fhqq50NLCTs4Lru5Yy/XpPu2fhhzGZA6fN+fxoZdD/f4er
 7ijIIk0lvUlDHoUyBnEGIdVuHwK20e5V8sIOV+WWS8CluAUU9nxMBpOFJUetfe45/ccj
 21tR1gZCxhS3EoPKchh3cC74ocv+KHT8MX1GVkfMVQ86t5HcMl6GYjXVA2UE9MQ3uqUo
 8/yhpC+p2eTiixX+StHqwn6eLz040FNFmMo6NfQ+Ws0OU7Ym3D62w/Oe9WU7tlMxY9oz
 F3XMlmN1xww89xM9l0gsfA/koVd4yo+RvOEm26J8iaAailr6M22GCwyzqC9nVBqson4S
 uLnw==
X-Gm-Message-State: AOAM530lms3N2vz1XnrSBXRTiQNnYt456kbwwzp6JCpXBg6W44f+wdKA
 vhSAv7SZru25RaKLxfvd+oUTHJwghvLqpHVR/073Qw==
X-Google-Smtp-Source: ABdhPJw1WdHFszqHjMyHkkFFS0NFpEwjo9cLd/GAkbhzhWZSM2RoYOtYwo36XdXuPtVVYQY/y+MJINm3GzBdV6PWwoE=
X-Received: by 2002:a05:6830:1647:: with SMTP id
 h7mr392769otr.281.1601921784105; 
 Mon, 05 Oct 2020 11:16:24 -0700 (PDT)
MIME-Version: 1.0
References: <0-v1-447bb60c11dd+174-frame_vec_fix_jgg@nvidia.com>
 <20201005175308.GI4225@quack2.suse.cz> <20201005175746.GA4734@nvidia.com>
In-Reply-To: <20201005175746.GA4734@nvidia.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Mon, 5 Oct 2020 20:16:12 +0200
Message-ID: <CAKMK7uHom6FGgsarnYRaW25Ta4cfrap+GMKgz27Y7bRYFUnmUw@mail.gmail.com>
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

Afaik these mmio maps should all be VM_DONTEXPAND (or at least the
ones in drivers/gpu are all), so not sure why we need the loop here.
But maybe there's some drivers that don't set that, or have other
funny things going on with userspace piecing the mmap together, and
I'm not going to audit them all :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
