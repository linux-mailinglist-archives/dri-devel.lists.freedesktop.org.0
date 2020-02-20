Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE46B165CD6
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2020 12:35:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9726E1FB;
	Thu, 20 Feb 2020 11:35:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7ED6E1FB
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Feb 2020 11:35:45 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id E040828D667;
 Thu, 20 Feb 2020 11:35:43 +0000 (GMT)
Date: Thu, 20 Feb 2020 12:35:40 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Subject: Re: [PATCHv5 29/34] drm/arm/malidp: Make verify funcitons
 invocations independent
Message-ID: <20200220123540.7e320fef@collabora.com>
In-Reply-To: <20200220122913.5cd80425@collabora.com>
References: <20191213173350.GJ624164@phenom.ffwll.local>
 <20191217145020.14645-1-andrzej.p@collabora.com>
 <20191217145020.14645-30-andrzej.p@collabora.com>
 <20200220122601.1e2212a4@collabora.com>
 <20200220122913.5cd80425@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
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
Cc: Mihail Atanassov <mihail.atanassov@arm.com>, kernel@collabora.com,
 David Airlie <airlied@linux.ie>, Liviu Dudau <liviu.dudau@arm.com>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 James Wang <james.qian.wang@arm.com>, Ayan Halder <Ayan.Halder@arm.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Feb 2020 12:29:13 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Thu, 20 Feb 2020 12:26:01 +0100
> Boris Brezillon <boris.brezillon@collabora.com> wrote:
> 
> > In the subject: s/funcitons/functions/
> > 
> > On Tue, 17 Dec 2019 15:50:15 +0100
> > Andrzej Pietrasiewicz <andrzej.p@collabora.com> wrote:
> >   
> > > This will make it easier to transition to generic afbc-aware helpers.
> > > 
> > > Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>    
> > 
> > Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>  
> 
> Wait, patch 30 is this patch completely irrelevant, so I take R-b back

s/patch 30 is this patch completely irrelevant/this patch is completely
irrelevant if patch 30 is applied/

> :-). You can just squash that one in patch 30.
> 
> >   
> > > ---
> > >  drivers/gpu/drm/arm/malidp_drv.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
> > > index 37d92a06318e..961e5a3f5b08 100644
> > > --- a/drivers/gpu/drm/arm/malidp_drv.c
> > > +++ b/drivers/gpu/drm/arm/malidp_drv.c
> > > @@ -362,10 +362,10 @@ static bool
> > >  malidp_verify_afbc_framebuffer(struct drm_device *dev, struct drm_file *file,
> > >  			       const struct drm_mode_fb_cmd2 *mode_cmd)
> > >  {
> > > -	if (malidp_verify_afbc_framebuffer_caps(dev, mode_cmd))
> > > -		return malidp_verify_afbc_framebuffer_size(dev, file, mode_cmd);
> > > +	if (!malidp_verify_afbc_framebuffer_caps(dev, mode_cmd))
> > > +		return false;
> > >  
> > > -	return false;
> > > +	return malidp_verify_afbc_framebuffer_size(dev, file, mode_cmd);
> > >  }
> > >  
> > >  static struct drm_framebuffer *    
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel  
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
