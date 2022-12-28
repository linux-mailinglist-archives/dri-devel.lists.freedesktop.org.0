Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A4A657731
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 14:35:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59B410E11A;
	Wed, 28 Dec 2022 13:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-1.mailo.com (msg-1.mailo.com [213.182.54.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135A310E11A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 13:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1672234480; bh=zj1G9XtSbgP2IMjlZt8bU1AeKLxPZy+7UvqegAcaz94=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=cCR/t/RaTbniXligKvrHSzXjL9kIhvPyMQI7lc2L35IQ5NmAYdPE7t17V1vh/VM4K
 DBRr9i1Uc9gZXfqgxhVPSuMqwXa3fYrXAtJKTsZSDRfGf+sixCg8dByXtowJTeVCgX
 dny2OiWKv/IdPV0WZ5P0G1KFDKrxoFEruTS3fH4g=
Received: by b-2.in.mailobj.net [192.168.90.12] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Wed, 28 Dec 2022 14:34:40 +0100 (CET)
X-EA-Auth: XxjeHADDpEMuIfv03pgE4TNnom85AUt6vgbt4CNewrTUbuAhZVPibKbWspQG/nuu/rN5mc2wVp5AhBOIX5OW9F5QQjSqiaIU
Date: Wed, 28 Dec 2022 19:04:34 +0530
From: Deepak R Varma <drv@mailo.com>
To: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH] drm/tegra: submit: No need for Null pointer check before
 kfree
Message-ID: <Y6xF6q6qj+ggEdgN@qemulion>
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
Cc: Praveen Kumar <kumarpraveen@linux.microsoft.com>,
 Saurabh Singh Sengar <ssengar@microsoft.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jonathan Hunter <jonathanh@nvidia.com>,
 Deepak R Varma <drv@mailo.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra@vger.kernel.org
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

Hello Mikko,
That really helps. Thank you for the detailed explanation. I do have an extended
question though. In this context, when we are ready to release the memory, how
is it useful to know if it is NULL or not this late in the flow when the scope
is about to end?

Thanks again!
./drv




>
> Mikko


