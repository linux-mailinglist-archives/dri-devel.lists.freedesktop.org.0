Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EED88651F26
	for <lists+dri-devel@lfdr.de>; Tue, 20 Dec 2022 11:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9ED210E39D;
	Tue, 20 Dec 2022 10:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36E5F10E39D
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Dec 2022 10:42:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 85373706;
 Tue, 20 Dec 2022 11:42:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1671532976;
 bh=bK4txdnHUggupo5Doz/7+NZW7J4vreP6k+bN7etEXCg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FNt0pxC36qdgX77AE0cCoE8XbeEi5UynpACkHxQl9dKEl8ChmxuutYLTprMzrmxBP
 T2PpysNdQVR42GdEJ586Ya5TT5IEXAj0UCYzQF5gcybCRSqNGlvAwrNPa/VaFYErH7
 U3WfzZG5xnnIk2P4dQMUML1KfnwAs5Exox44gKmc=
Date: Tue, 20 Dec 2022 12:42:52 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v2 7/7] drm: rcar-du: Add new formats (2-10-10-10 ARGB,
 Y210)
Message-ID: <Y6GRrN1Tesadku6S@pendragon.ideasonboard.com>
References: <20221219140139.294245-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20221219140139.294245-8-tomi.valkeinen+renesas@ideasonboard.com>
 <Y6Db2C+JehUPYSQp@pendragon.ideasonboard.com>
 <Y6GCI3PV3/WhyZBR@valkosipuli.retiisi.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Y6GCI3PV3/WhyZBR@valkosipuli.retiisi.eu>
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Nicolas Dufresne <nicolas@ndufresne.ca>,
 linux-renesas-soc@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sakari,

On Tue, Dec 20, 2022 at 11:36:35AM +0200, Sakari Ailus wrote:
> On Mon, Dec 19, 2022 at 11:47:04PM +0200, Laurent Pinchart wrote:
> > On Mon, Dec 19, 2022 at 04:01:39PM +0200, Tomi Valkeinen wrote:
> > > Add new pixel formats: RGBX1010102, RGBA1010102, ARGB2101010 and Y210.
> > > 
> > > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > > ---
> > >  drivers/gpu/drm/rcar-du/rcar_du_kms.c | 24 +++++++++++++
> > >  drivers/gpu/drm/rcar-du/rcar_du_vsp.c | 49 +++++++++++++++++++++++++--
> > >  2 files changed, 71 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > > index 8c2719efda2a..8ccabf5a30c4 100644
> > > --- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > > +++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
> > > @@ -259,6 +259,24 @@ static const struct rcar_du_format_info rcar_du_format_infos[] = {
> > >  		.bpp = 32,
> > >  		.planes = 1,
> > >  		.hsub = 1,
> > > +	}, {
> > > +		.fourcc = DRM_FORMAT_RGBX1010102,
> > 
> > Ah, here the format makes sense.
> > 
> > > +		.v4l2 = V4L2_PIX_FMT_XBGR2101010,
> > 
> > But this is horrible :-( Could we use the same names as DRM for new
> > formats, when there is no conflict with existing V4L2 formats ?
> > 
> > Sakari, Hans, what do you think ? Please see patch 1/7 in the series for
> > the format definitions.
> 
> I think it'd be good to have only one set of definitions.
> 
> Can we can sort the endianness question in a reasonable way?

It's really a matter of macro names only in this case, so it's "just" up
to us to decide what we want to do. Hans' argument is that we would then
depart from the general V4L2 rule, and thus create confusion, but I
don't think there's such a clear cut rule in the first place and
confusion is there already. Having common definitions for new formats
would, I think, reduce confusion.

> Also new Bayer formats will probably be still needed on V4L2 side but will
> they be relevant for DRM? I suppose that would mean new DRM format for
> each pixel order, too? Or can we think of something smarter that would
> still work reasonably with existing formats?

We use DRM 4CCs in the libcamera public API, and the DRM maintainers
have agreed to add DRM 4CCs for formats that are used by cameras only,
such as MJPEG for instance, that's hardly useful for displays. The same
holds true for Bayer formats, and we use DRM modifiers to specify the
packing instead of defining different 4CCs. I'd like to do something
similar for the Bayer pattern, although specifying it out-of-band may be
even better.

-- 
Regards,

Laurent Pinchart
