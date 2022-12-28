Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 348336576C4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Dec 2022 14:09:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54EC010E187;
	Wed, 28 Dec 2022 13:09:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from msg-4.mailo.com (msg-4.mailo.com [213.182.54.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A8D10E187
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Dec 2022 13:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=mailo.com; s=mailo;
 t=1672232933; bh=XIsYijePFlvpwKLkAOrbvIzaHaw9+yquPSONaYDi1y4=;
 h=X-EA-Auth:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:In-Reply-To;
 b=k0p8P+fHJO/H/fobVSM9fo+LUmcVj4iuTvGn7MW/Mcck1I/Qrta04H+qRxUklHSIC
 wZM3jyhPAXlDgncIwdzkvpqkTAsROMFdzsAXcH00DgXoX4fDEs7X7oAdDR3blS98Ns
 NTV+M4gxxp36+lW3t0Pi/qm896okUQmH/YXnI+Ao=
Received: by b-4.in.mailobj.net [192.168.90.14] with ESMTP
 via ip-206.mailobj.net [213.182.55.206]
 Wed, 28 Dec 2022 14:08:53 +0100 (CET)
X-EA-Auth: 51UmvQ9LL2ezogCcIPWdXZ5LqsEIzoMomGNKNMt1jBrzVDuAnIeVo85BDVyiHpfbe7DnVzrd88G7zCcex3Aj4j9XiPLbLFN6
Date: Wed, 28 Dec 2022 18:38:48 +0530
From: Deepak R Varma <drv@mailo.com>
To: Mikko Perttunen <cyndis@kapsi.fi>
Subject: Re: [PATCH] drm/tegra: submit: No need for Null pointer check before
 kfree
Message-ID: <Y6w/4IzoMFsVnCmu@qemulion>
References: <Y6sn7XptKyk5cbrA@qemulion>
 <864f2fdd-4289-a178-bbf1-c2a6a579c58c@kapsi.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <864f2fdd-4289-a178-bbf1-c2a6a579c58c@kapsi.fi>
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

On Wed, Dec 28, 2022 at 02:28:54PM +0200, Mikko Perttunen wrote:
> On 12/27/22 19:14, Deepak R Varma wrote:
> > kfree() & vfree() internally perform NULL check on the pointer handed
> > to it and take no action if it indeed is NULL. Hence there is no need
> > for a pre-check of the memory pointer before handing it to
> > kfree()/vfree().
> >
> > Issue reported by ifnullfree.cocci Coccinelle semantic patch script.
> >
> > Signed-off-by: Deepak R Varma <drv@mailo.com>
> > ---
> >   drivers/gpu/drm/tegra/submit.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/tegra/submit.c b/drivers/gpu/drm/tegra/submit.c
> > index 066f88564169..06f836db99d0 100644
> > --- a/drivers/gpu/drm/tegra/submit.c
> > +++ b/drivers/gpu/drm/tegra/submit.c
> > @@ -680,8 +680,8 @@ int tegra_drm_ioctl_channel_submit(struct drm_device *drm, void *data,
> >   		kfree(job_data->used_mappings);
> >   	}
> >
> > -	if (job_data)
> > -		kfree(job_data);
> > +	kfree(job_data);
> > +
> >   put_bo:
> >   	gather_bo_put(&bo->base);
> >   unlock:
> > --
> > 2.34.1
> >
> >
> >
>
> It continues to be the case that I think this transform is bad. Same applies
> to the host1x patch.

Hello Mikko,
Thank you for responding to the patch proposal. Could you please explain why is
this bad?

Regards,
./drv

>
> Mikko


