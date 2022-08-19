Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12485599312
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 04:38:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C154610E05D;
	Fri, 19 Aug 2022 02:38:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1CAE10E10C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Aug 2022 02:38:32 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 483CA3F1;
 Fri, 19 Aug 2022 04:38:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1660876711;
 bh=bI/FyPcyEjkwd94dRpjq01q1V8C/fYllucggGtxNMr0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zsj8VC1/gI1lrIi2R7DBgOswIa2JuaK8oaY368lngjW7bg9qnXqwijZiwjzBfHOSE
 OoJ9Cz4EoylRcFgEzvt+6dI+o+oE82l/bYP5WkbPniYKzvJYYyCHrd2oKdmY+e8VRY
 1a8Z9lpug/d2H2MpnpIprBidDdPDygiAKM3RF1vg=
Date: Fri, 19 Aug 2022 05:38:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: mchehab@kernel.org
Subject: Re: [PATCH v2 1/3] media: vsp1: add premultiplied alpha support
Message-ID: <Yv73pNxr62j+hYd5@pendragon.ideasonboard.com>
References: <20220810083711.219642-1-taki@igel.co.jp>
 <20220810083711.219642-2-taki@igel.co.jp>
 <Yv7u5cFdXIeGm5PQ@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yv7u5cFdXIeGm5PQ@pendragon.ideasonboard.com>
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

Mauro, would you be fine with this patch going through the DRM tree for
v6.1 ? I don't foresee any risk of conflict with other changes to the
VSP driver scheduled for the next kernel version. If that's fine with
you, could you give an Acked-by ? Otherwise I can send you a pull
request to create an immutable branch and base the rest on it in my pull
request for DRM, but given how small this change is, it seems a bit
overkill.

On Fri, Aug 19, 2022 at 05:01:10AM +0300, Laurent Pinchart wrote:
> Hi Hayama-san,
> 
> Thank you for the patch.
> 
> On Wed, Aug 10, 2022 at 05:37:09PM +0900, Takanari Hayama wrote:
> > To support DRM blend mode in R-Car DU driver, we must be able to pass
> > a plane with the premultiplied alpha. Adding a new property to
> > vsp1_du_atomic_config allows the R-Car DU driver to pass the
> > premultiplied alpha plane.
> > 
> > Signed-off-by: Takanari Hayama <taki@igel.co.jp>
> > ---
> >  drivers/media/platform/renesas/vsp1/vsp1_drm.c | 2 ++
> >  include/media/vsp1.h                           | 2 ++
> >  2 files changed, 4 insertions(+)
> > 
> > diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drm.c b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > index 0c2507dc03d6..019e18976bd8 100644
> > --- a/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > +++ b/drivers/media/platform/renesas/vsp1/vsp1_drm.c
> > @@ -856,6 +856,8 @@ int vsp1_du_atomic_update(struct device *dev, unsigned int pipe_index,
> >  	rpf->mem.addr[1] = cfg->mem[1];
> >  	rpf->mem.addr[2] = cfg->mem[2];
> >  
> > +	rpf->format.flags = (cfg->premult) ? V4L2_PIX_FMT_FLAG_PREMUL_ALPHA : 0;
> 
> I'll drop the parentheses when applying.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> > +
> >  	vsp1->drm->inputs[rpf_index].crop = cfg->src;
> >  	vsp1->drm->inputs[rpf_index].compose = cfg->dst;
> >  	vsp1->drm->inputs[rpf_index].zpos = cfg->zpos;
> > diff --git a/include/media/vsp1.h b/include/media/vsp1.h
> > index cc1b0d42ce95..48f4a5023d81 100644
> > --- a/include/media/vsp1.h
> > +++ b/include/media/vsp1.h
> > @@ -51,6 +51,7 @@ int vsp1_du_setup_lif(struct device *dev, unsigned int pipe_index,
> >   * @dst: destination rectangle on the display (integer coordinates)
> >   * @alpha: alpha value (0: fully transparent, 255: fully opaque)
> >   * @zpos: Z position of the plane (from 0 to number of planes minus 1)
> > + * @premult: true for premultiplied alpha
> >   */
> >  struct vsp1_du_atomic_config {
> >  	u32 pixelformat;
> > @@ -60,6 +61,7 @@ struct vsp1_du_atomic_config {
> >  	struct v4l2_rect dst;
> >  	unsigned int alpha;
> >  	unsigned int zpos;
> > +	bool premult;
> >  };
> >  
> >  /**

-- 
Regards,

Laurent Pinchart
