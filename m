Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE1C667349B
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 10:40:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB96B10E24E;
	Thu, 19 Jan 2023 09:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAD4010E24E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 09:40:31 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1A377EC;
 Thu, 19 Jan 2023 10:40:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1674121230;
 bh=92eCuCSjn7zjDfOF85iM5SEAiDMY7cLnVXubjwC+39A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UUAt6pK65NsbArGC6465bUqLlihXo80CaVjFeFslVuMNyfMflcn/yqc3War5zkUnE
 IYFnJB5XHmDhk0p3VdHEUfcJjkza0Myjt4GoZGZdzmv92C7NhS3JCLgA8k6THVGDsE
 /FuQ6jrInDUCeRvHTeuAK4gGzZWCvzWycgQ7o5do=
Date: Thu, 19 Jan 2023 11:40:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: Re: [PATCH 5/6] drm: rcar-du: Fix setting a reserved bit in DPLLCR
Message-ID: <Y8kQCmdyEwOWna5A@pendragon.ideasonboard.com>
References: <20230117135154.387208-1-tomi.valkeinen+renesas@ideasonboard.com>
 <20230117135154.387208-6-tomi.valkeinen+renesas@ideasonboard.com>
 <Y8hm54mvZEcBaBo8@pendragon.ideasonboard.com>
 <9b2a6b63-3712-3acb-aa17-6d223237c07d@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9b2a6b63-3712-3acb-aa17-6d223237c07d@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

On Thu, Jan 19, 2023 at 11:17:58AM +0200, Tomi Valkeinen wrote:
> On 18/01/2023 23:38, Laurent Pinchart wrote:
> > On Tue, Jan 17, 2023 at 03:51:53PM +0200, Tomi Valkeinen wrote:
> >> On H3 ES1 two bits in DPLLCR are used to select the DU input dot clock
> > 
> > s/ES1/ES1.x/
> > 
> > Same below.
> 
> Ok. But I do wonder, is there a difference? What's the case when ES1 
> could be mistaken to mean something else?

It's just for consistency I suppose. No big deal.

> >> source. These are bits 20 and 21 for DU2, and bits 22 and 23 for DU1. On
> >> non-ES1, only the higher bits are used (bits 21 and 23), and the lower
> >> bits are reserved and should be set to 0 (or not set at all).
> > 
> > How do you not set a bit ? :-)
> 
> By leaving it to the value the register already has. But as we don't 
> read the register as a base value here, I guess that comment is a bit 
> misleading.
> 
> >> The current code always sets the lower bits, even on non-ES1.
> > 
> > I think that's harmless, and not worth making the driver more complex,
> > but I'll stop fighting.
> > 
> >> For both DU1 and DU2, on all SoC versions, when writing zeroes to those
> >> bits the input clock is DCLKIN, and thus there's no difference between
> >> ES1 and non-ES1.
> >>
> >> For DU1, writing 0b10 to the bits (or only writing the higher bit)
> >> results in using PLL0 as the input clock, so in this case there's also
> >> no difference between ES1 and non-ES1.
> >>
> >> However, for DU2, writing 0b10 to the bits results in using PLL0 as the
> >> input clock on ES1, whereas on non-ES1 it results in using PLL1. On ES1
> >> you need to write 0b11 to select PLL1.
> >>
> >> The current code always writes 0b11 to PLCS0 field to select PLL1 on all
> >> SoC versions, which works but causes an illegal (in the sense of not
> >> allowed by the documentation) write to a reserved bit field.
> >>
> >> To remove the illegal bit write on PLSC0 we need to handle the input dot
> >> clock selection differently for ES1 and non-ES1.
> >>
> >> Add a new quirk, RCAR_DU_QUIRK_H3_ES1_PLL, for this, and a new
> >> rcar_du_device_info entry for the ES1 SoC. Using these, we can always
> > 
> > The new entry was added in the previous patch already.
> 
> Indeed.
> 
> >> set the bit 21 on PLSC0 when choosing the PLL as the source clock, and
> >> additionally set the bit 20 when on ES1.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >> ---
> >>   drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 12 ++++++++++--
> >>   drivers/gpu/drm/rcar-du/rcar_du_drv.c  |  3 ++-
> >>   drivers/gpu/drm/rcar-du/rcar_du_drv.h  |  1 +
> >>   drivers/gpu/drm/rcar-du/rcar_du_regs.h |  3 ++-
> >>   4 files changed, 15 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> >> index f2d3266509cc..8d660a6141bf 100644
> >> --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> >> @@ -245,12 +245,20 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
> >>   		       | DPLLCR_N(dpll.n) | DPLLCR_M(dpll.m)
> >>   		       | DPLLCR_STBY;
> >>   
> >> -		if (rcrtc->index == 1)
> >> +		if (rcrtc->index == 1) {
> >>   			dpllcr |= DPLLCR_PLCS1
> >>   			       |  DPLLCR_INCS_DOTCLKIN1;
> >> -		else
> >> +		} else {
> >>   			dpllcr |= DPLLCR_PLCS0
> >>   			       |  DPLLCR_INCS_DOTCLKIN0;
> >> +			/*
> >> +			 * On H3 ES1.x, in addition to setting bit 21 (PLCS0),
> >> +			 * also bit 20 has to be set to select PLL1 as the
> >> +			 * clock source.
> > 
> > I'd add "On ES2 and newer, PLL1 is selected unconditionally.".
> 
> It's not selected unconditionally, we need to set bit 21. And possibly 
> we need to set bit 20 to 0, although it's not documented what bit 20 
> would do when set to 1.

We currently set bit 20 to 1 and it works, so I concluded that bit 20 is
ignored. That's what I meant by PLL1 being selected automatically,
between PLL0 and PLL1. We still need to select PLL instead of DCLKIN
with bit 21.

> And is that "ES2.x"? =)

Good point :-)

> How about:
> 
>   * On ES2.x and newer, PLL1 is selected by setting bit
>   * 21 (PLCS0) to 1 and keeping the (reserved) bit 20 as
>   * 0. On H3 ES1.x, in addition to setting bit 21, also
>   * bit 20 has to be set to select PLL1 as the clock source.

What I'd like to capture in the comment is that the clock topology is

        bit 20
          |     bit 21
          v       |
         |\       v
PLL0 --> |0|     |\
PLL1 --> |1| --> |1| -->
         |/  /-> |0|
             |   |/
DCLKIN ------/

on H3 ES1.x, while on newer revisions, bit 20 is ignored and the first
mux is hardcoded to PLL1.

> >> +			 */
> >> +			if (rcdu->info->quirks & RCAR_DU_QUIRK_H3_ES1_PLL)
> >> +				dpllcr |= DPLLCR_PLCS0_H3ES1X_PLL1_SEL;
> >> +		}
> >>   
> >>   		rcar_du_group_write(rcrtc->group, DPLLCR, dpllcr);
> >>   
> >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> >> index ba2e069fc0f7..d689f2510081 100644
> >> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
> >> @@ -394,7 +394,8 @@ static const struct rcar_du_device_info rcar_du_r8a7795_es1_info = {
> >>   		  | RCAR_DU_FEATURE_VSP1_SOURCE
> >>   		  | RCAR_DU_FEATURE_INTERLACED
> >>   		  | RCAR_DU_FEATURE_TVM_SYNC,
> >> -	.quirks = RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY,
> >> +	.quirks = RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY
> >> +		| RCAR_DU_QUIRK_H3_ES1_PLL,
> >>   	.channels_mask = BIT(3) | BIT(2) | BIT(1) | BIT(0),
> >>   	.routes = {
> >>   		/*
> >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> >> index df87ccab146f..acc3673fefe1 100644
> >> --- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
> >> @@ -35,6 +35,7 @@ struct rcar_du_device;
> >>   
> >>   #define RCAR_DU_QUIRK_ALIGN_128B	BIT(0)	/* Align pitches to 128 bytes */
> >>   #define RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY BIT(1)	/* H3 ES1 has pclk stability issue */
> >> +#define RCAR_DU_QUIRK_H3_ES1_PLL	BIT(2)	/* H3 ES1 PLL setup differs from non-ES1 */
> >>   
> >>   enum rcar_du_output {
> >>   	RCAR_DU_OUTPUT_DPAD0,
> >> diff --git a/drivers/gpu/drm/rcar-du/rcar_du_regs.h b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> >> index c1bcb0e8b5b4..94d913f66c8f 100644
> >> --- a/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> >> +++ b/drivers/gpu/drm/rcar-du/rcar_du_regs.h
> >> @@ -288,7 +288,8 @@
> >>    * isn't implemented by other SoC in the Gen3 family it can safely be set
> >>    * unconditionally.
> >>    */
> > 
> > This comment should be dropped.
> 
> Ah, true.
> 
> >> -#define DPLLCR_PLCS0		(3 << 20)
> >> +#define DPLLCR_PLCS0		(1 << 21)
> >> +#define DPLLCR_PLCS0_H3ES1X_PLL1_SEL	(1 << 20)
> > 
> > Bit 21 selects between DCLKIN (when 0) and PLL (when 1). On ES1.x, bit
> > 20 selects between PLL0 (when 0) and PLL1 (when 1), while on ES2 and
> > newer, PLL1 is selected unconditionally. Could we name the two bits
> > accodingly ? Maybe
> > 
> > #define DPLLCR_PLCS0_PLL	(1 << 21)
> > #define DPLLCR_PLCS0_PLL1	(1 << 20)
> 
> I'm fine with DPLLCR_PLCS0_PLL, but I do like to make it a bit more 
> obvious that a bit is only for a particular ES/SoC version if it's 
> simple to do. Especially here, as "DPLLCR_PLCS0_PLL1" sounds like you 
> need to set it to use PLL1.
> 
> Would you be ok with "DPLLCR_PLCS0_H3ES1X_PLL1"?

A bit long but I suppose I can live with that.

-- 
Regards,

Laurent Pinchart
