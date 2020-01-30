Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D7E14DF3A
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jan 2020 17:34:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD3B26E88F;
	Thu, 30 Jan 2020 16:34:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 971 seconds by postgrey-1.36 at gabe;
 Thu, 30 Jan 2020 16:34:14 UTC
Received: from fireflyinternet.com (unknown [77.68.26.236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAE986E88F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Jan 2020 16:34:14 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 20062184-1500050 for multiple; Thu, 30 Jan 2020 16:18:00 +0000
MIME-Version: 1.0
To: Dave Airlie <airlied@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
From: Chris Wilson <chris@chris-wilson.co.uk>
In-Reply-To: <CAHk-=wi31OH0Rjv5=0ELTz3ZFUVaARmvq+w-oy+pRpGENd-iEA@mail.gmail.com>
References: <CAPM=9twBvYvUoijdzAi2=FGLys0pfaK+PZw-uq2kyxqZipeujA@mail.gmail.com>
 <CAHk-=wi31OH0Rjv5=0ELTz3ZFUVaARmvq+w-oy+pRpGENd-iEA@mail.gmail.com>
Message-ID: <158040107875.18112.5093555261012183633@skylake-alporthouse-com>
User-Agent: alot/0.6
Subject: Re: [git pull] drm for 5.6-rc1
Date: Thu, 30 Jan 2020 16:17:58 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Linus Torvalds (2020-01-30 16:13:24)
> On Wed, Jan 29, 2020 at 9:58 PM Dave Airlie <airlied@gmail.com> wrote:
> >
> > It has two known conflicts, one in i915_gem_gtt, where you should juat
> > take what's in the pull (it looks messier than it is),
> 
> That doesn't seem right. If I do that, I lose the added GEM_BUG_ON()'s.
> 
> I think the proper merge resolution does this:
> 
> diff --git a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> index f10b2c41571c..f4fec7eb4064 100644
> --- a/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen6_ppgtt.c
> @@ -131,6 +131,7 @@ static void gen6_ppgtt_insert_entries(struct
> i915_address_space *vm,
> 
>         vaddr = kmap_atomic_px(i915_pt_entry(pd, act_pt));
>         do {
> +               GEM_BUG_ON(iter.sg->length < I915_GTT_PAGE_SIZE);
>                 vaddr[act_pte] = pte_encode | GEN6_PTE_ADDR_ENCODE(iter.dma);
> 
>                 iter.dma += I915_GTT_PAGE_SIZE;
> diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> index 077b8f7cf6cb..4d1de2d97d5c 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
> @@ -379,6 +379,7 @@ gen8_ppgtt_insert_pte(struct i915_ppgtt *ppgtt,
>         pd = i915_pd_entry(pdp, gen8_pd_index(idx, 2));
>         vaddr = kmap_atomic_px(i915_pt_entry(pd, gen8_pd_index(idx, 1)));
>         do {
> +               GEM_BUG_ON(iter->sg->length < I915_GTT_PAGE_SIZE);
>                 vaddr[gen8_pd_index(idx, 0)] = pte_encode | iter->dma;
> 
>                 iter->dma += I915_GTT_PAGE_SIZE;

Yes, that matches the code in drm-intel-next-queued.
-Chris
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
