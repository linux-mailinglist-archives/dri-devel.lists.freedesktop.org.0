Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE4A659698
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 10:15:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56D4B10E093;
	Fri, 30 Dec 2022 09:15:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1998D10E093
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 09:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672391706; x=1703927706;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=b92LBjMTMS+znGkFff7B1W97g2wA+n9hRk1ugdqBn5s=;
 b=WTA4XhR1O3/YMueX+GW3GqbQLHOPg0whDWajMFigiihZV5ylezSXkqnW
 nKjEDCAKxcQz/NXJ8N/49GR5VHAKWASSXUPsNGVlroJjee0OyBGPjxg8Z
 Z6QcT/R/bvqJ6eR97wb+GhH42TPUZyV09i+hJiMAgjU91bh7qW+kpXPck
 EIvVSIG+XIxfy9AjqOWsxS1rdcSoBgADwlACMrmuWDH0bn3cvSW6D37Da
 lVDmvV4HZPsfnWyWseHrxNF5iExdZH0x0sV51/+KmBjQsktXcgpxG44Ht
 op/1mPnMtu/XCyLg+iwBpOiCDvdw/srI5XjGZFDN8Q+M1IhHPkRVGW3RP g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10575"; a="308943795"
X-IronPort-AV: E=Sophos;i="5.96,286,1665471600"; d="scan'208";a="308943795"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2022 01:15:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10575"; a="631489114"
X-IronPort-AV: E=Sophos;i="5.96,287,1665471600"; d="scan'208";a="631489114"
Received: from joe-255.igk.intel.com (HELO localhost) ([172.22.229.67])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2022 01:15:03 -0800
Date: Fri, 30 Dec 2022 10:15:01 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH] drm/tegra: submit: No need for Null pointer check before
 kfree
Message-ID: <20221230091501.GA1285371@linux.intel.com>
References: <Y6sn7XptKyk5cbrA@qemulion>
 <864f2fdd-4289-a178-bbf1-c2a6a579c58c@kapsi.fi>
 <Y6w/4IzoMFsVnCmu@qemulion>
 <280170a7-de12-f362-cda3-11208ead0a88@kapsi.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <280170a7-de12-f362-cda3-11208ead0a88@kapsi.fi>
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
Cc: Deepak R Varma <drv@mailo.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 28, 2022 at 03:17:59PM +0200, Mikko Perttunen wrote:
> On 12/28/22 15:08, Deepak R Varma wrote:
> > On Wed, Dec 28, 2022 at 02:28:54PM +0200, Mikko Perttunen wrote:
> > > On 12/27/22 19:14, Deepak R Varma wrote:
> > > > kfree() & vfree() internally perform NULL check on the pointer handed
> > > > to it and take no action if it indeed is NULL. Hence there is no need
> > > > for a pre-check of the memory pointer before handing it to
> > > > kfree()/vfree().
> > > > 
> > > > Issue reported by ifnullfree.cocci Coccinelle semantic patch script.
> > > > 
> > > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > > ---
> > > >    drivers/gpu/drm/tegra/submit.c | 4 ++--
> > > >    1 file changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
> > > > index 066f88564169..06f836db99d0 100644
> > > > --- a/drivers/gpu/drm/tegra/submit.c
> > > > +++ b/drivers/gpu/drm/tegra/submit.c
> > > > @@ -680,8 +680,8 @@ int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
> > > >    		kfree(job_data->used_mappings);
> > > >    	}
> > > > 
> > > > -	if (job_data)
> > > > -		kfree(job_data);
> > > > +	kfree(job_data);
> > > > +
> > > >    put_bo:
> > > >    	gather_bo_put(&bo->base);
> > > >    unlock:
> > > > --
> > > > 2.34.1
> > > > 
> > > > 
> > > > 
> > > 
> > > It continues to be the case that I think this transform is bad. Same applies
> > > to the host1x patch.
> > 
> > Hello Mikko,
> > Thank you for responding to the patch proposal. Could you please explain why is
> > this bad?
> > 
> > Regards,
> > ./drv
> > 
> > > 
> > > Mikko
> > 
> > 
> 
> Hi,
> 
> it gets rid of visual hints on code paths indicating the possible liveness
> of pointer variables. I.e., after the change, whether the pointer can be
> NULL or not is more difficult to reason about locally, instead requiring
> more global reasoning which is mentally more taxing.
> 
> Since C's type system doesn't help with tracking these kinds of things, I
> believe it is important to have these kinds of local contextual cues to help
> the programmer.

I agree with your point of view. But regarding this particular patch,
at least on code base I can see, after free_job_data label job_done
can not be NULL. So patch seems to be ok, but maybe changelog need to
be different

Regards
Stanislaw
