Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCA368C628
	for <lists+dri-devel@lfdr.de>; Mon,  6 Feb 2023 19:53:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5B2F10EA10;
	Mon,  6 Feb 2023 18:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-2.mailo.com (msg-2.mailo.com [213.182.54.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD73210EA10;
 Mon,  6 Feb 2023 18:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1675709602; bh=LL94QftrpebF5hQo1kJV15ayE2g5+ViggKSMsID+Xso=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To;
 b=XIxC8bFHOStgZNt3tRNRCRJz5goCJY/6C9VKgQ1qQI9FjvcHCrNr9xR4cIJ6PLoYV
 XYxn5OEMZCcfB3r3AukJjKw4TjFa4O9ClOJGS52t0sN7FuHVqfGq/wmdQsCtRyzT4c
 /Wu8oYcs/5AUTGHEKYGOtvZZNrsgoe3GzCpatDuk=
Received: by b-4.in.mailobj.net [192.168.90.14] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Mon,  6 Feb 2023 19:53:22 +0100 (CET)
X-EA-Auth: 7BcoLB2uw8kAqiclcp9bBXUawDPA9JTZN3vfAtxWvGMNGGJsgfzTPhy1XsSEGodM5h8G2oHzeYC6uJYvYqRsOXJB/AYji1fu
Date: Tue, 7 Feb 2023 00:23:17 +0530
From: Deepak R Varma <drv@mailo.com>
To: Matthew Auld <matthew.auld@intel.com>
Subject: Re: [PATCH] drm/i915/gt: Avoid redundant pointer validity check
Message-ID: <Y+FMnZ5r+aCNjl81@ubun2204.myguest.virtualbox.org>
References: <Y91g081OauhQNxMe@ubun2204.myguest.virtualbox.org>
 <d58fff32-edad-4a7f-7409-7e57593df3ed@linux.intel.com>
 <aa8af778-2a40-7fe0-eb14-234469c74523@intel.com>
 <Y+FKCth+0r/757Xu@ubun2204.myguest.virtualbox.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y+FKCth+0r/757Xu@ubun2204.myguest.virtualbox.org>
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
 Thomas Hellstrom <thomas.hellstrom@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 07, 2023 at 12:12:18AM +0530, Deepak R Varma wrote:
> On Mon, Feb 06, 2023 at 10:33:13AM +0000, Matthew Auld wrote:
> > On 06/02/2023 09:45, Tvrtko Ursulin wrote:
> > > 
> > > Hi,
> > > 
> > > Adding Matt & Thomas as potential candidates to review.
> > > 
> > > Regards,
> > > 
> > > Tvrtko
> > > 
> > > On 03/02/2023 19:30, Deepak R Varma wrote:
> > > > The macro definition of gen6_for_all_pdes() expands to a for loop such
> > > > that it breaks when the page table is null. Hence there is no need to
> > > > again test validity of the page table entry pointers in the pde list.
> > > > This change is identified using itnull.cocci semantic patch.
> > > > 
> > > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > > ---
> > > > Please note: Proposed change is compile tested only.
> > > > 
> > > >   drivers/gpu/drm/i915/gt/gen6_ppgtt.c | 5 ++---
> > > >   1 file changed, 2 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> > > > b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> > > > index 5aaacc53fa4c..787b9e6d9f59 100644
> > > > --- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> > > > +++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> > > > @@ -258,8 +258,7 @@ static void gen6_ppgtt_free_pd(struct gen6_ppgtt
> > > > *ppgtt)
> > > >       u32 pde;
> > > >       gen6_for_all_pdes(pt, pd, pde)
> > > > -        if (pt)
> > > > -            free_pt(&ppgtt->base.vm, pt);
> > > > +        free_pt(&ppgtt->base.vm, pt);
> > > >   }
> > > >   static void gen6_ppgtt_cleanup(struct i915_address_space *vm)
> > > > @@ -304,7 +303,7 @@ static void pd_vma_unbind(struct
> > > > i915_address_space *vm,
> > > >       /* Free all no longer used page tables */
> > > >       gen6_for_all_pdes(pt, ppgtt->base.pd, pde) {
> > > > -        if (!pt || atomic_read(&pt->used))
> > > > +        if (atomic_read(&pt->used))
> > 
> > Wow, I was really confused trying to remember how this all works.
> > 
> > The gen6_for_all_pdes() does:
> > 
> > (pt = i915_pt_entry(pd, iter), true)
> > 
> > So NULL pt is expected, and does not 'break' here, since 'true' is always
> > the value that decides whether to terminate the loop. So this patch would
> > lead to NULL ptr deref, AFAICT.
> 
> Hello Matt,
> I understand it now. I was misreading the true as part of the function argument.
> Could you please also comment if the implementation of gen6_ppgtt_free_pd() in
> the same file is safe? It doesn't appear to have an check on pt validity here.

Please ignore the question. I understand it now. My apologies for inconvenience.
The patch is invalid and can be dropped.

deepak.

> 
> Thank you,
> deepak.
> 
> > 
> > 
> > 
> > > >               continue;
> > > >           free_pt(&ppgtt->base.vm, pt);


