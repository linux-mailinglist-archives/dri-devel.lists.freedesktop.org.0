Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 434D42D5A4B
	for <lists+dri-devel@lfdr.de>; Thu, 10 Dec 2020 13:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 220B36E1A5;
	Thu, 10 Dec 2020 12:20:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 425FC6E1A5
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Dec 2020 12:20:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0614B96;
 Thu, 10 Dec 2020 13:19:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1607602800;
 bh=o1IfTzuQWBi4Lg6aRvcu8MSyMSn7kF0Cfohjw0AKcxk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=f/L78g2lh/rPVOElq8tddcx18s/bIOXTagNk0MolM2AACYv6ZrJtOKHbeGvlCjnQf
 IQmA92bO7Oa0+Fj9byFo5h2B2nE6icNSMnz1zuTzRhiRWrKW1xjVbXev40Te6So86z
 uNumjC14DuOJ2T/8b5XWF0iTwQPbiuefz35bzBRY=
Date: Thu, 10 Dec 2020 14:19:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v4 00/19] drm: managed encoder/plane/crtc allocation
Message-ID: <X9ISaoHf5Sk7TmSN@pendragon.ideasonboard.com>
References: <20201208155451.8421-1-p.zabel@pengutronix.de>
 <4dbb86ffa92f7e1ab0a628a5ab09b91a265e64fc.camel@pengutronix.de>
 <20201209211047.GA401619@phenom.ffwll.local>
 <20201209211354.GB401619@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201209211354.GB401619@phenom.ffwll.local>
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
Cc: kernel@pengutronix.de, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Wed, Dec 09, 2020 at 10:13:54PM +0100, Daniel Vetter wrote:
> On Wed, Dec 09, 2020 at 10:10:47PM +0100, Daniel Vetter wrote:
> > On Tue, Dec 08, 2020 at 04:59:16PM +0100, Philipp Zabel wrote:
> > > On Tue, 2020-12-08 at 16:54 +0100, Philipp Zabel wrote:
> > > > Hi,
> > > > 
> > > > this is an update of the drmm_(simple_)encoder_alloc(),
> > > > drmm_universal_plane_alloc(), and drmm_crtc_alloc_with_plane()
> > > > functions in v3 [1] together with the imx-drm managed allocation
> > > > conversion from [2] as an example usage.
> > > > a bit.
> > >   ^^^^^^
> > > this is a left-over of ", reordered an squashed a bit." before I decided
> > > to move it into the list of changes below.
> > > 
> > > > 
> > > > Changes since v3:
> > > [...]
> > > >  - Reorder and squash the imx-drm managed allocation conversion patches
> > > >    to use the new functions directly.
> > 
> > imx parts all look good. One thing I spotted is that you could use
> > devm_drm_dev_alloc instead of drm_dev_alloc, at least my tree here doesn't
> > have that one yet. Feel free to add a-b: me on top of the imx patches too,
> > but probably not worth much :-)
> 
> Oh also for merging, ack for merging through whatever tree you feel like.
> Since 5.11 merge window is done already if you go through imx please make
> sure to send a feature pull soon after -rc1 so it's not holding up
> Laurent. Or coordinate with Laurent (and maybe others).

I've sent my rcar-du fixes without depending on this series, to ease
backporting. I'll then submit additional cleanups using the new managed
allocators when these patches will hit the drm tree. There's thus no
need for a feature branch on my side.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
