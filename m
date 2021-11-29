Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB37B461577
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 13:47:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60F86E98C;
	Mon, 29 Nov 2021 12:47:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C71D6E98C;
 Mon, 29 Nov 2021 12:46:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10182"; a="223184657"
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; d="scan'208";a="223184657"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 04:46:57 -0800
X-IronPort-AV: E=Sophos;i="5.87,273,1631602800"; d="scan'208";a="608691477"
Received: from vanderss-mobl.ger.corp.intel.com (HELO [10.249.254.176])
 ([10.249.254.176])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Nov 2021 04:46:56 -0800
Message-ID: <ee128e237dbc2b6b2341b49ab07661c1f1b65e0b.camel@linux.intel.com>
Subject: Re: [PATCH] dma_fence_array: Fix PENDING_ERROR leak in
 dma_fence_array_signaled()
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Joonas
 Lahtinen <joonas.lahtinen@intel.com>
Date: Mon, 29 Nov 2021 13:46:53 +0100
In-Reply-To: <e4d8e272-8175-4298-f227-240febc0bda0@gmail.com>
References: <20211129073533.414008-1-thomas.hellstrom@linux.intel.com>
 <4fd0eee6-342f-fb31-717c-901440f38c35@gmail.com>
 <58ca11648ab29d96b84640760d2acc3ac2d39d19.camel@linux.intel.com>
 <e4d8e272-8175-4298-f227-240febc0bda0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linaro-mm-sig@lists.linaro.org, Chris Wilson <chris@chris-wilson.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2021-11-29 at 13:33 +0100, Christian König wrote:
> Am 29.11.21 um 13:23 schrieb Thomas Hellström:
> > Hi, Christian,
> > 
> > On Mon, 2021-11-29 at 09:21 +0100, Christian König wrote:
> > > Am 29.11.21 um 08:35 schrieb Thomas Hellström:
> > > > If a dma_fence_array is reported signaled by a call to
> > > > dma_fence_is_signaled(), it may leak the PENDING_ERROR status.
> > > > 
> > > > Fix this by clearing the PENDING_ERROR status if we return true
> > > > in
> > > > dma_fence_array_signaled().
> > > > 
> > > > Fixes: 1f70b8b812f3 ("dma-fence: Propagate errors to dma-fence-
> > > > array container")
> > > > Cc: linaro-mm-sig@lists.linaro.org
> > > > Cc: Christian König <ckoenig.leichtzumerken@gmail.com>
> > > > Cc: Chris Wilson <chris@chris-wilson.co.uk>
> > > > Signed-off-by: Thomas Hellström
> > > > <thomas.hellstrom@linux.intel.com>
> > > Reviewed-by: Christian König <christian.koenig@amd.com>
> > How are the dma-buf / dma-fence patches typically merged? If i915
> > is
> > the only fence->error user, could we take this through drm-intel to
> > avoid a backmerge for upcoming i915 work?
> 
> Well that one here looks like a bugfix to me, so either through 
> drm-misc-fixes ore some i915 -fixes branch sounds fine to me.
> 
> If you have any new development based on that a backmerge of the -
> fixes 
> into your -next branch is unavoidable anyway.

Ok, I'll check with Joonas if I can take it through
drm-intel-gt-next, since fixes are cherry-picked from that one. Patch
will then appear in both the -fixes and the -next branch.

Thanks,
/Thomas


> 
> Regards,
> Christian.
> 
> > 
> > /Thomas
> > 
> > 
> > > > ---
> > > >    drivers/dma-buf/dma-fence-array.c | 6 +++++-
> > > >    1 file changed, 5 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/dma-buf/dma-fence-array.c b/drivers/dma-
> > > > buf/dma-fence-array.c
> > > > index d3fbd950be94..3e07f961e2f3 100644
> > > > --- a/drivers/dma-buf/dma-fence-array.c
> > > > +++ b/drivers/dma-buf/dma-fence-array.c
> > > > @@ -104,7 +104,11 @@ static bool
> > > > dma_fence_array_signaled(struct
> > > > dma_fence *fence)
> > > >    {
> > > >          struct dma_fence_array *array =
> > > > to_dma_fence_array(fence);
> > > >    
> > > > -       return atomic_read(&array->num_pending) <= 0;
> > > > +       if (atomic_read(&array->num_pending) > 0)
> > > > +               return false;
> > > > +
> > > > +       dma_fence_array_clear_pending_error(array);
> > > > +       return true;
> > > >    }
> > > >    
> > > >    static void dma_fence_array_release(struct dma_fence *fence)
> > 
> 


