Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4195AE636
	for <lists+dri-devel@lfdr.de>; Tue,  6 Sep 2022 13:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F1E4882D0;
	Tue,  6 Sep 2022 11:10:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643E510E617
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Sep 2022 11:10:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7A860614BC;
 Tue,  6 Sep 2022 11:10:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39C3FC433D6;
 Tue,  6 Sep 2022 11:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662462634;
 bh=5hwsIcCArrIqKc80JHIWB4BRQUJG6NcbLTvjwDcxMx4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AVxPYbBmI/qTTBOJlM25iIBqzc6HH97P0edz4WPoObhG9pypKaDcLvBky3UCGTnmR
 maBMExGCojfD1RcsVUleEfy3Trb+hBAmVyYdvi/EraQgmxPi4t+f9J01U3Y3KYqoqT
 ZtXual5z841N5206niujXKFq4h9qqLHrue5gTtF2IZ0B5A5g+PsmHJBAsfUk48kyf3
 HysgnmZwbtPzHZ3bQRh6K4GPOXpcxHhROKj1n1bZsTYD3+tWXVskXcps0rObj/8f8l
 b4VoHwhH7Y+mElVp0/5WBd2xNSpKd7DZlBsXRvpBmpFKiaF7B+qGIL/2GWrbrTvu2C
 NUf0Fw5sr+vyQ==
Date: Tue, 6 Sep 2022 13:10:30 +0200
From: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 1/3] media: vsp1: add premultiplied alpha support
Message-ID: <20220906131030.336aebcc@coco.lan>
In-Reply-To: <Yv73pNxr62j+hYd5@pendragon.ideasonboard.com>
References: <20220810083711.219642-1-taki@igel.co.jp>
 <20220810083711.219642-2-taki@igel.co.jp>
 <Yv7u5cFdXIeGm5PQ@pendragon.ideasonboard.com>
 <Yv73pNxr62j+hYd5@pendragon.ideasonboard.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Takanari Hayama <taki@igel.co.jp>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Em Fri, 19 Aug 2022 05:38:28 +0300
Laurent Pinchart <laurent.pinchart@ideasonboard.com> escreveu:

> Mauro, would you be fine with this patch going through the DRM tree for
> v6.1 ? I don't foresee any risk of conflict with other changes to the
> VSP driver scheduled for the next kernel version. If that's fine with
> you, could you give an Acked-by ? Otherwise I can send you a pull
> request to create an immutable branch and base the rest on it in my pull
> request for DRM, but given how small this change is, it seems a bit
> overkill.

Please, don't top-post.
> 
> On Fri, Aug 19, 2022 at 05:01:10AM +0300, Laurent Pinchart wrote:
> > Hi Hayama-san,
> > 
> > Thank you for the patch.
> > 
> > On Wed, Aug 10, 2022 at 05:37:09PM +0900, Takanari Hayama wrote:  
> > > To support DRM blend mode in R-Car DU driver, we must be able to pass
> > > a plane with the premultiplied alpha. Adding a new property to
> > > vsp1_du_atomic_config allows the R-Car DU driver to pass the
> > > premultiplied alpha plane.
> > > 
> > > Signed-off-by: Takanari Hayama <taki@igel.co.jp>

Sure, this can be merged via DRM tree.


> > > ---
> > >  drivers/media/platform/renesas/vsp1/vsp1_drm.c | 2 ++
> > >  include/media/vsp1.h                           | 2 ++
> > >  2 files changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > > index 0c2507dc03d6..019e18976bd8 100644
> > > --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > > +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > > @@ -856,6 +856,8 @@ int vsp1_du_atomic_update(struct device *dev, unsigned int pipe_index,
> > >  	rpf->mem.addr[1] = cfg->mem[1];
> > >  	rpf->mem.addr[2] = cfg->mem[2];
> > >  
> > > +	rpf->format.flags = (cfg->premult) ? V4L2_PIX_FMT_FLAG_PREMUL_ALPHA : 0;  
> > 
> > I'll drop the parentheses when applying.
> > 
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

With this change:

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Regards,
Mauro
