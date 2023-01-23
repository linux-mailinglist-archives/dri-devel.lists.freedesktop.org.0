Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EFE678AD5
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 23:37:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B668910E5AD;
	Mon, 23 Jan 2023 22:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31BD910E5AD
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 22:36:55 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E96362D9;
 Mon, 23 Jan 2023 23:36:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1674513413;
 bh=8BDJk+F8kQpd7sXh8OapTD8OljXi5zdntHPhm75z/6w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qvVKZ56JzhxYm5JqP9tlBEn+vA7IJQt8hfqRCrZUzy4MC34OPNSXgo7EjvAOieSPE
 5RQUwb/hA9tMX6yo5IUq6m+zmSnSl/62her1/qEE6rYG1pfpM1cz6f0yaGtMbpLP+d
 rrbXXW0PiHFI9ZjOIbiVFjLKx3WRKUYDpKZWn1iA=
Date: Tue, 24 Jan 2023 00:36:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 4/7] drm: rcar-du: lvds: Fix stop sequence
Message-ID: <Y88MAeONs5GNTNHX@pendragon.ideasonboard.com>
References: <20230123104742.227460-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230123104742.227460-5-tomi.valkeinen+renesas@ideasonboard.com>
 <CAMuHMdVkenq=2PH-mjodFzAtEa5ss_Lx11B26x6tE2Da3DbmKg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMuHMdVkenq=2PH-mjodFzAtEa5ss_Lx11B26x6tE2Da3DbmKg@mail.gmail.com>
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
Cc: Koji Matsuoka <koji.matsuoka.xm@renesas.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 LUU HOAI <hoai.luu.ub@renesas.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Geert,

On Mon, Jan 23, 2023 at 03:28:08PM +0100, Geert Uytterhoeven wrote:
> On Mon, Jan 23, 2023 at 11:48 AM Tomi Valkeinen wrote:
> > From: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> >
> > According to hardware manual, LVDCR0 register must be cleared bit by bit
> > when disabling LVDS.
> >
> > Signed-off-by: Koji Matsuoka <koji.matsuoka.xm@renesas.com>
> > Signed-off-by: LUU HOAI <hoai.luu.ub@renesas.com>
> > [tomi.valkeinen: simplified the code a bit]
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> 
> Thanks for your patch!
> 
> > @@ -544,6 +549,27 @@ static void rcar_lvds_atomic_disable(struct drm_bridge *bridge,
> >                                      struct drm_bridge_state *old_bridge_state)
> >  {
> >         struct rcar_lvds *lvds = bridge_to_rcar_lvds(bridge);
> > +       u32 lvdcr0;
> > +
> > +       lvdcr0 = rcar_lvds_read(lvds, LVDCR0);
> > +
> > +       lvdcr0 &= ~LVDCR0_LVRES;
> > +       rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> > +
> > +       if (lvds->info->quirks & RCAR_LVDS_QUIRK_GEN3_LVEN) {
> > +               lvdcr0 &= ~LVDCR0_LVEN;
> > +               rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> > +       }
> > +
> > +       if (lvds->info->quirks & RCAR_LVDS_QUIRK_PWD) {
> > +               lvdcr0 &= ~LVDCR0_PWD;
> > +               rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> > +       }
> > +
> > +       if (!(lvds->info->quirks & RCAR_LVDS_QUIRK_EXT_PLL)) {
> > +               lvdcr0 &= ~LVDCR0_PLLON;
> > +               rcar_lvds_write(lvds, LVDCR0, lvdcr0);
> > +       }
> 
> Please add a comment explaining why there are multiple register writes,
> to avoid an over-zealous janitor "optimizing" the code later.

I'll add this comment at the top of the function:

        /*
         * Clear the LVDCR0 bits in the order specified by the hardware
         * documentation, ending with a write of 0 to the full register to
         * clear all remaining bits.
         */

> >
> >         rcar_lvds_write(lvds, LVDCR0, 0);
> >         rcar_lvds_write(lvds, LVDCR1, 0);

-- 
Regards,

Laurent Pinchart
