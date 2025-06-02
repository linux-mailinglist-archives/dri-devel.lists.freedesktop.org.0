Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA91DACACFF
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 13:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AB7A10E4F0;
	Mon,  2 Jun 2025 11:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="VaO4V9TW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 322F210E4F0
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jun 2025 11:10:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6B8641E3;
 Mon,  2 Jun 2025 13:10:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1748862632;
 bh=CQKUaOOite+qUWmny4TmnVks+BQOhBBhK//gMqtcIDk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VaO4V9TWTS+wveFBXlkRhngVEbUmsQC6nRYKHHm9kxttA0tUZQJT7PUJTYowY4HQp
 BxJUbOcE7brxqC3+sFbtRElIWkUmM7qmdPx1zFOUxfRcAqohfPqBzoHqqftDGiNc4R
 Xqi2D+/j9p0t026H+zjnSJ2P2dYHtmbjspxA7HpM=
Date: Mon, 2 Jun 2025 14:10:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v6 05/12] drm: renesas: rz-du: mipi_dsi: Use VCLK for
 HSFREQ calculation
Message-ID: <20250602111025.GA23515@pendragon.ideasonboard.com>
References: <20250530165906.411144-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250530165906.411144-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250602094230.GA3645@pendragon.ideasonboard.com>
 <CA+V-a8t__xkMRDrum+DYzg6584y9MmOTuOypC5qzyuW1THigNA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8t__xkMRDrum+DYzg6584y9MmOTuOypC5qzyuW1THigNA@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jun 02, 2025 at 11:09:51AM +0100, Lad, Prabhakar wrote:
> On Mon, Jun 2, 2025 at 10:42 AM Laurent Pinchart wrote:
> > On Fri, May 30, 2025 at 05:58:59PM +0100, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > >
> > > Update the RZ/G2L MIPI DSI driver to calculate HSFREQ using the actual
> > > VCLK rate instead of the mode clock. The relationship between HSCLK and
> > > VCLK is:
> > >
> > >     vclk * bpp <= hsclk * 8 * lanes
> > >
> > > Retrieve the VCLK rate using `clk_get_rate(dsi->vclk)`, ensuring that
> > > HSFREQ accurately reflects the clock rate set in hardware, leading to
> > > better precision in data transmission.
> > >
> > > Additionally, use `DIV_ROUND_CLOSEST_ULL` for a more precise division
> > > when computing `hsfreq`. Also, update unit conversions to use correct
> > > scaling factors for better clarity and correctness.
> > >
> > > Since `clk_get_rate()` returns the clock rate in Hz, update the HSFREQ
> > > threshold comparisons to use Hz instead of kHz to ensure correct behavior.
> > >
> > > Co-developed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > ---
> > > v5->v6:
> > > - Dropped parentheses around the calculation of `hsfreq_max`.
> > > - Changed dev_info() to dev_dbg
> > >
> > > v4->v5:
> > > - Added dev_info() to print the VCLK rate if it doesn't match the
> > >   requested rate.
> > > - Added Reviewed-by tag from Biju
> > >
> > > v3->v4:
> > > - Used MILLI instead of KILO
> > >
> > > v2->v3:
> > > - No changes
> > >
> > > v1->v2:
> > > - No changes
> > > ---
> > >  .../gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c    | 30 +++++++++++--------
> > >  1 file changed, 18 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > index e8ca6a521e0f..4d4521a231cb 100644
> > > --- a/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > +++ b/drivers/gpu/drm/renesas/rz-du/rzg2l_mipi_dsi.c
> > > @@ -8,6 +8,7 @@
> > >  #include <linux/delay.h>
> > >  #include <linux/io.h>
> > >  #include <linux/iopoll.h>
> > > +#include <linux/math.h>
> > >  #include <linux/module.h>
> > >  #include <linux/of.h>
> > >  #include <linux/of_graph.h>
> > > @@ -15,6 +16,7 @@
> > >  #include <linux/pm_runtime.h>
> > >  #include <linux/reset.h>
> > >  #include <linux/slab.h>
> > > +#include <linux/units.h>
> > >
> > >  #include <drm/drm_atomic.h>
> > >  #include <drm/drm_atomic_helper.h>
> > > @@ -199,7 +201,7 @@ static int rzg2l_mipi_dsi_dphy_init(struct rzg2l_mipi_dsi *dsi,
> > >       /* All DSI global operation timings are set with recommended setting */
> > >       for (i = 0; i < ARRAY_SIZE(rzg2l_mipi_dsi_global_timings); ++i) {
> > >               dphy_timings = &rzg2l_mipi_dsi_global_timings[i];
> > > -             if (hsfreq <= dphy_timings->hsfreq_max)
> > > +             if (hsfreq <= dphy_timings->hsfreq_max * KILO)
> >
> > Why don't you modify hsfreq_max to also store the frequency in Hz ? That
> > would bring more consistency across the driver.
>
> Agreed, I will add a separate patch for this.

It's small and related, you can do it in the same patch.

> 
> > >                       break;
> > >       }
> > >
> > > @@ -258,7 +260,7 @@ static void rzg2l_mipi_dsi_dphy_exit(struct rzg2l_mipi_dsi *dsi)
> > >  static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
> > >                                 const struct drm_display_mode *mode)
> > >  {
> > > -     unsigned long hsfreq;
> > > +     unsigned long hsfreq, vclk_rate;
> > >       unsigned int bpp;
> > >       u32 txsetr;
> > >       u32 clstptsetr;
> > > @@ -269,6 +271,12 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
> > >       u32 golpbkt;
> > >       int ret;
> > >
> > > +     ret = pm_runtime_resume_and_get(dsi->dev);
> > > +     if (ret < 0)
> > > +             return ret;
> > > +
> > > +     clk_set_rate(dsi->vclk, mode->clock * KILO);
> > > +
> > >       /*
> > >        * Relationship between hsclk and vclk must follow
> > >        * vclk * bpp = hsclk * 8 * lanes
> > > @@ -280,13 +288,11 @@ static int rzg2l_mipi_dsi_startup(struct rzg2l_mipi_dsi *dsi,
> > >        * hsclk(bit) = hsclk(byte) * 8 = hsfreq
> > >        */
> > >       bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
> > > -     hsfreq = mode->clock * bpp / dsi->lanes;
> > > -
> > > -     ret = pm_runtime_resume_and_get(dsi->dev);
> > > -     if (ret < 0)
> > > -             return ret;
> > > -
> > > -     clk_set_rate(dsi->vclk, mode->clock * 1000);
> > > +     vclk_rate = clk_get_rate(dsi->vclk);
> > > +     if (vclk_rate != mode->clock * KILO)
> > > +             dev_dbg(dsi->dev, "Requested vclk rate %lu, actual %lu mismatch\n",
> > > +                     mode->clock * KILO, vclk_rate);
> >
> > I would move those 4 lines just below clk_set_rate().
> 
> Agreed, I will move them in the next version.

-- 
Regards,

Laurent Pinchart
