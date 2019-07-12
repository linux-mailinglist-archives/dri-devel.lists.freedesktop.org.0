Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDDD15C890
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2020 17:49:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 378606E372;
	Thu, 13 Feb 2020 16:49:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49C656E372
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2020 16:49:30 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: bbrezillon) with ESMTPSA id 1F89A284D59
Date: Fri, 12 Jul 2019 18:27:39 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] drm/atmel-hlcdc: set layer REP bit to enable
 replication logic
Message-ID: <20190712182739.4bab0366@linux.home>
In-Reply-To: <20190712162117.GB18990@ravnborg.org>
References: <1562686509-8747-1-git-send-email-joshua.henderson@microchip.com>
 <13aa50e4-a726-3f82-b186-79b452199a02@microchip.com>
 <20190712162117.GB18990@ravnborg.org>
Organization: Collabora
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
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
Cc: alexandre.belloni@bootlin.com, bbrezillon@kernel.org, airlied@linux.ie,
 Joshua Henderson <joshua.henderson@microchip.com>, Nicolas.Ferre@microchip.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 12 Jul 2019 18:21:17 +0200
Sam Ravnborg <sam@ravnborg.org> wrote:

> Hi Joshua.
> 
> On Tue, Jul 09, 2019 at 04:24:49PM +0000, Nicolas.Ferre@microchip.com wrote:
> > On 09/07/2019 at 17:35, Joshua Henderson wrote:  
> > > This bit enables replication logic to expand an RGB color less than 24
> > > bits, to 24 bits, which is used internally for all formats.  Otherwise,
> > > the least significant bits are always set to zero and the color may not
> > > be what is expected.
> > > 
> > > Signed-off-by: Joshua Henderson <joshua.henderson@microchip.com>  
> > 
> > Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> > 
> > Here is patchwork entry:
> > https://patchwork.kernel.org/patch/11037167/
> > 
> > Thanks, best regards,
> >    Nicolas
> >   
> > > ---
> > >   drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> > > index eb7c4cf..6f6cf61 100644
> > > --- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> > > +++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
> > > @@ -389,7 +389,7 @@ atmel_hlcdc_plane_update_general_settings(struct atmel_hlcdc_plane *plane,
> > >   	atmel_hlcdc_layer_write_cfg(&plane->layer, ATMEL_HLCDC_LAYER_DMA_CFG,
> > >   				    cfg);
> > >   
> > > -	cfg = ATMEL_HLCDC_LAYER_DMA;
> > > +	cfg = ATMEL_HLCDC_LAYER_DMA | ATMEL_HLCDC_LAYER_REP;
> > >   
> > >   	if (plane->base.type != DRM_PLANE_TYPE_PRIMARY) {
> > >   		cfg |= ATMEL_HLCDC_LAYER_OVR | ATMEL_HLCDC_LAYER_ITER2BL |  
> 
> Thanks - this gave me an opportunity to read a bit more in the datasheet
> of the controller.
> Applied to drm-misc-next with Ack from Nicolas.

I was about to add my R-b and ask you to apply the patch :-). I'm glad
you didn't wait for my feedback to apply the fix, that means I'll be
able to remove my name from the Atmel HLCDC entry soon ;-).

> 
> 	Sam

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
