Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89F0E68C602
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 19:42:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A65C510E9F7;
	Mon,  6 Feb 2023 18:42:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067E910EA00;
 Mon,  6 Feb 2023 18:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1675708944; bh=EwXs/jy7qgWsP5jG0wksqu1PcOs1hmaF0jlonE09KTw=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To;
 b=DYwKNXU8lW7Itk1KxIupSb4I+CMGUb8JTh1JhRCwYj1sIiCX8Bq4AyLQ9XRPxHVSR
 pvYBuZk26K7PQBK9urljRuOBDeM+cVyEynZsS+rcl+pM9T444gc6nQvYuq0TiEDvUN
 qtAQcs24N8WyjFCdioeQmmUCUhxp8RGHOpyhebY4=
Received: by b-3.in.mailobj.net [192.168.90.13] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Mon,  6 Feb 2023 19:42:24 +0100 (CET)
X-EA-Auth: X5Xltbtqqf5tc8FJUeUZhlekEgROBmK6blXxKp89tuOlOy1hPJvnaRvqLlK7d2EJr4VQLYGQCgwYcanwqLbMfuuss9wGjl1Q
Date: Tue, 7 Feb 2023 00:12:18 +0530
From: Deepak R Varma <drv@mailo.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/i915/gt: Avoid redundant pointer validity check
Message-ID: <Y+FKCth+0r/757Xu@ubun2204.myguest.virtualbox.org>
References: <Y91g081OauhQNxMe@ubun2204.myguest.virtualbox.org>
 <d58fff32-edad-4a7f-7409-7e57593df3ed@linux.intel.com>
 <aa8af778-2a40-7fe0-eb14-234469c74523@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa8af778-2a40-7fe0-eb14-234469c74523@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Deepak R Varma <drv@mailo.com>, Thomas Hellstrom <thomas.hellstrom@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 06, 2023 at 10:33:13AM +0000, Matthew Auld wrote:
> On 06/02/2023 09:45, Tvrtko Ursulin wrote:
> > 
> > Hi,
> > 
> > Adding Matt & Thomas as potential candidates to review.
> > 
> > Regards,
> > 
> > Tvrtko
> > 
> > On 03/02/2023 19:30, Deepak R Varma wrote:
> > > The macro definition of gen6_for_all_pdes() expands to a for loop such
> > > that it breaks when the page table is null. Hence there is no need to
> > > again test validity of the page table entry pointers in the pde list.
> > > This change is identified using itnull.cocci semantic patch.
> > > 
> > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > ---
> > > Please note: Proposed change is compile tested only.
> > > 
> > >   drivers/gpu/drm/i915/gt/gen6_ppgtt.c | 5 ++---
> > >   1 file changed, 2 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> > > b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> > > index 5aaacc53fa4c..787b9e6d9f59 100644
> > > --- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> > > +++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> > > @@ -258,8 +258,7 @@ static void gen6_ppgtt_free_pd(struct gen6_ppgtt
> > > *ppgtt)
> > >       u32 pde;
> > >       gen6_for_all_pdes(pt, pd, pde)
> > > -        if (pt)
> > > -            free_pt(&ppgtt->base.vm, pt);
> > > +        free_pt(&ppgtt->base.vm, pt);
> > >   }
> > >   static void gen6_ppgtt_cleanup(struct i915_address_space *vm)
> > > @@ -304,7 +303,7 @@ static void pd_vma_unbind(struct
> > > i915_address_space *vm,
> > >       /* Free all no longer used page tables */
> > >       gen6_for_all_pdes(pt, ppgtt->base.pd, pde) {
> > > -        if (!pt || atomic_read(&pt->used))
> > > +        if (atomic_read(&pt->used))
> 
> Wow, I was really confused trying to remember how this all works.
> 
> The gen6_for_all_pdes() does:
> 
> (pt = i915_pt_entry(pd, iter), true)
> 
> So NULL pt is expected, and does not 'break' here, since 'true' is always
> the value that decides whether to terminate the loop. So this patch would
> lead to NULL ptr deref, AFAICT.

Hello Matt,
I understand it now. I was misreading the true as part of the function argument.
Could you please also comment if the implementation of gen6_ppgtt_free_pd() in
the same file is safe? It doesn't appear to have an check on pt validity here.

Thank you,
deepak.

> 
> 
> 
> > >               continue;
> > >           free_pt(&ppgtt->base.vm, pt);


