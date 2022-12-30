Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FCE7659727
	for <lists+dri-devel@lfdr.de>; Fri, 30 Dec 2022 11:15:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC92C10E109;
	Fri, 30 Dec 2022 10:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A791910E109
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Dec 2022 10:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672395336; x=1703931336;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=17bh9E50tNvTOl4ArawPNxCifke+G6sVd6QTrXMUd+4=;
 b=U5d5j9owXJ2cWp0gwikF8Cn4xxLuanOhTcOBkbj+t7rBlUASn7QsRb3R
 2X65D9hbqyZPnm7YmqNJXmTYz0W5xyfkP5qWaAsxf0X3ZC1YasXfgHpX3
 WsZDcJc6FCYiAETXFpxSYO+v0bE0fY5CDKMerqKiSTK+Wvh0c+DZFWQAC
 poVBIQOpEWF8uWjgonZ9xlJX71BsDZx3AzUdMrZgCi8GrnHKnSI+QQXiZ
 CEdJ1gWyFVtEHXWrtwWNt1mCmaZPEWlfG2GkIjMqW4EDx8jN3azsYYnFi
 mqUZbFSsfjKoiKveUc7AnZMGETLe8LrtIv4kfuEviYGxEJQiK97NFQ6wt w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10575"; a="321258648"
X-IronPort-AV: E=Sophos;i="5.96,287,1665471600"; d="scan'208";a="321258648"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2022 02:15:35 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10575"; a="655826180"
X-IronPort-AV: E=Sophos;i="5.96,287,1665471600"; d="scan'208";a="655826180"
Received: from joe-255.igk.intel.com (HELO localhost) ([172.22.229.67])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2022 02:15:33 -0800
Date: Fri, 30 Dec 2022 11:15:32 +0100
From: Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>
To: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH] drm/tegra: submit: No need for Null pointer check before
 kfree
Message-ID: <20221230101532.GA1290969@linux.intel.com>
References: <Y6sn7XptKyk5cbrA@qemulion>
 <864f2fdd-4289-a178-bbf1-c2a6a579c58c@kapsi.fi>
 <Y6w/4IzoMFsVnCmu@qemulion>
 <280170a7-de12-f362-cda3-11208ead0a88@kapsi.fi>
 <20221230091501.GA1285371@linux.intel.com>
 <65468c84-fc40-e4e1-0adb-ddfc23ec4fb9@kapsi.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <65468c84-fc40-e4e1-0adb-ddfc23ec4fb9@kapsi.fi>
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

On Fri, Dec 30, 2022 at 12:01:23PM +0200, Mikko Perttunen wrote:
> On 12/30/22 11:15, Stanislaw Gruszka wrote:
> > On Wed, Dec 28, 2022 at 03:17:59PM +0200, Mikko Perttunen wrote:
> > > On 12/28/22 15:08, Deepak R Varma wrote:
> > > > On Wed, Dec 28, 2022 at 02:28:54PM +0200, Mikko Perttunen wrote:
> > > > > On 12/27/22 19:14, Deepak R Varma wrote:
> > > > > > kfree() & vfree() internally perform NULL check on the pointer handed
> > > > > > to it and take no action if it indeed is NULL. Hence there is no need
> > > > > > for a pre-check of the memory pointer before handing it to
> > > > > > kfree()/vfree().
> > > > > > 
> > > > > > Issue reported by ifnullfree.cocci Coccinelle semantic patch script.
> > > > > > 
> > > > > > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > > > > > ---
> > > > > >     drivers/gpu/drm/tegra/submit.c | 4 ++--
> > > > > >     1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
> > > > > > index 066f88564169..06f836db99d0 100644
> > > > > > --- a/drivers/gpu/drm/tegra/submit.c
> > > > > > +++ b/drivers/gpu/drm/tegra/submit.c
> > > > > > @@ -680,8 +680,8 @@ int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
> > > > > >     		kfree(job_data->used_mappings);
> > > > > >     	}
> > > > > > 
> > > > > > -	if (job_data)
> > > > > > -		kfree(job_data);
> > > > > > +	kfree(job_data);
> > > > > > +
> > > > > >     put_bo:
> > > > > >     	gather_bo_put(&bo->base);
> > > > > >     unlock:
> > > > > > --
> > > > > > 2.34.1
> > > > > > 
> > > > > > 
> > > > > > 
> > > > > 
> > > > > It continues to be the case that I think this transform is bad. Same applies
> > > > > to the host1x patch.
> > > > 
> > > > Hello Mikko,
> > > > Thank you for responding to the patch proposal. Could you please explain why is
> > > > this bad?
> > > > 
> > > > Regards,
> > > > ./drv
> > > > 
> > > > > 
> > > > > Mikko
> > > > 
> > > > 
> > > 
> > > Hi,
> > > 
> > > it gets rid of visual hints on code paths indicating the possible liveness
> > > of pointer variables. I.e., after the change, whether the pointer can be
> > > NULL or not is more difficult to reason about locally, instead requiring
> > > more global reasoning which is mentally more taxing.
> > > 
> > > Since C's type system doesn't help with tracking these kinds of things, I
> > > believe it is important to have these kinds of local contextual cues to help
> > > the programmer.
> > 
> > I agree with your point of view. But regarding this particular patch,
> > at least on code base I can see, after free_job_data label job_done
> > can not be NULL. So patch seems to be ok, but maybe changelog need to
> > be different
> > 
> > Regards
> > Stanislaw
> 
> It can be NULL; see:
> 
>         job->user_data = job_data;
>         job->release = release_job;
>         job->timeout = 10000;
> 
>         /*
>          * job_data is now part of job reference counting, so don't release
>          * it from here.
>          */
>         job_data = NULL;
> 
> If we go into free_job_data after this code (which happens if there is no
> error, or if host1x_job_submit fails), job_data will be NULL.
> 
> The memory is instead released in the 'put_job' label; host1x_job_put ends
> up calling release_job, which does the kfree.
> 
> (Yes, it is rather complicated..)

Ok, then better to keep the check.

Regards
Stanislaw
