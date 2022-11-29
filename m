Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C62A163B6B5
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 01:44:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2764F10E03C;
	Tue, 29 Nov 2022 00:44:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E240B10E03C
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 00:44:13 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 65C0A4E6;
 Tue, 29 Nov 2022 01:44:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1669682651;
 bh=2/kznKGKxQuVVfBQNoZ1O/v668YdnQOZ+CaOEehmpXk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tr14jO9p/iNCEBfOYttn6Q8vanmABIEQJkOdGGpPQeawnXRQ+tfMjpuUcRKn9lZP3
 Z1vkRH/ohbfsy+mz4ToQg4+11CyrTczwk6Sb2aWC2uq+RTp0mwDpQm0Mo/4Y8Ofm3T
 0aeWp0zIPxL0cSxAEtpxeRO6Higj1M2AjW1FMFX4=
Date: Tue, 29 Nov 2022 02:43:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v1 7/8] drm: rcar-du: dsi: Add r8A779g0 support
Message-ID: <Y4VVy3WAim4x0Z/c@pendragon.ideasonboard.com>
References: <20221117122547.809644-1-tomi.valkeinen@ideasonboard.com>
 <20221117122547.809644-8-tomi.valkeinen@ideasonboard.com>
 <166869996543.50677.17182739414507530884@Monstersaurus>
 <4481a3fe-63a9-39d5-5394-a2f2639f1bcc@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4481a3fe-63a9-39d5-5394-a2f2639f1bcc@ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Jonas Karlman <jonas@kwiboo.se>, Rob Herring <robh+dt@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 22, 2022 at 10:50:30AM +0200, Tomi Valkeinen wrote:
> On 17/11/2022 17:46, Kieran Bingham wrote:
> > Quoting Tomi Valkeinen (2022-11-17 12:25:46)
> >> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >>
> >> Add DSI support for r8a779g0. The main differences to r8a779a0 are in
> >> the PLL and PHTW setups.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >> ---
> >>   drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c      | 484 +++++++++++++++----
> >>   drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h |   6 +-
> >>   2 files changed, 384 insertions(+), 106 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> >> index a7f2b7f66a17..723c35726c38 100644
> >> --- a/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> >> +++ b/drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
> >> @@ -9,6 +9,7 @@
> >>   #include <linux/delay.h>
> >>   #include <linux/io.h>
> >>   #include <linux/iopoll.h>
> >> +#include <linux/math64.h>
> >>   #include <linux/module.h>
> >>   #include <linux/of.h>
> >>   #include <linux/of_device.h>
> >> @@ -28,6 +29,20 @@
> >>   #include "rcar_mipi_dsi.h"
> >>   #include "rcar_mipi_dsi_regs.h"
> >>   
> >> +#define MHZ(v) ((v) * 1000000u)
> >> +
> >> +enum rcar_mipi_dsi_hw_model {
> >> +       RCAR_DSI_R8A779A0,
> >> +       RCAR_DSI_R8A779G0,
> >> +};
> >> +
> >> +struct rcar_mipi_dsi_device_info {
> >> +       enum rcar_mipi_dsi_hw_model model;
> >> +       const struct dsi_clk_config *clk_cfg;
> >> +       u8 clockset2_m_offset;
> >> +       u8 clockset2_n_offset;
> >> +};
> >> +
> >>   struct rcar_mipi_dsi {
> >>          struct device *dev;
> >>          const struct rcar_mipi_dsi_device_info *info;
> >> @@ -50,6 +65,17 @@ struct rcar_mipi_dsi {
> >>          unsigned int lanes;
> >>   };
> >>   
> >> +struct dsi_setup_info {
> >> +       unsigned long hsfreq;
> >> +       u16 hsfreqrange;
> >> +
> >> +       unsigned long fout;
> >> +       u16 m;
> >> +       u16 n;
> >> +       u16 vclk_divider;
> >> +       const struct dsi_clk_config *clkset;
> >> +};
> >> +
> >>   static inline struct rcar_mipi_dsi *
> >>   bridge_to_rcar_mipi_dsi(struct drm_bridge *bridge)
> >>   {
> >> @@ -62,22 +88,6 @@ host_to_rcar_mipi_dsi(struct mipi_dsi_host *host)
> >>          return container_of(host, struct rcar_mipi_dsi, host);
> >>   }
> >>   
> >> -static const u32 phtw[] = {
> >> -       0x01020114, 0x01600115, /* General testing */
> >> -       0x01030116, 0x0102011d, /* General testing */
> >> -       0x011101a4, 0x018601a4, /* 1Gbps testing */
> >> -       0x014201a0, 0x010001a3, /* 1Gbps testing */
> >> -       0x0101011f,             /* 1Gbps testing */
> >> -};
> >> -
> >> -static const u32 phtw2[] = {
> >> -       0x010c0130, 0x010c0140, /* General testing */
> >> -       0x010c0150, 0x010c0180, /* General testing */
> >> -       0x010c0190,
> >> -       0x010a0160, 0x010a0170,
> >> -       0x01800164, 0x01800174, /* 1Gbps testing */
> >> -};
> >> -
> >>   static const u32 hsfreqrange_table[][2] = {
> >>          { 80000000U,   0x00 }, { 90000000U,   0x10 }, { 100000000U,  0x20 },
> >>          { 110000000U,  0x30 }, { 120000000U,  0x01 }, { 130000000U,  0x11 },
> >> @@ -103,24 +113,53 @@ static const u32 hsfreqrange_table[][2] = {
> >>          { /* sentinel */ },
> >>   };
> >>   
> >> -struct vco_cntrl_value {
> >> +struct dsi_clk_config {
> >>          u32 min_freq;
> >>          u32 max_freq;
> >> -       u16 value;
> >> +       u8 vco_cntrl;
> >> +       u8 cpbias_cntrl;
> >> +       u8 gmp_cntrl;
> >> +       u8 int_cntrl;
> >> +       u8 prop_cntrl;
> >>   };
> >>   
> >> -static const struct vco_cntrl_value vco_cntrl_table[] = {
> >> -       { .min_freq = 40000000U,   .max_freq = 55000000U,   .value = 0x3f },
> >> -       { .min_freq = 52500000U,   .max_freq = 80000000U,   .value = 0x39 },
> >> -       { .min_freq = 80000000U,   .max_freq = 110000000U,  .value = 0x2f },
> >> -       { .min_freq = 105000000U,  .max_freq = 160000000U,  .value = 0x29 },
> >> -       { .min_freq = 160000000U,  .max_freq = 220000000U,  .value = 0x1f },
> >> -       { .min_freq = 210000000U,  .max_freq = 320000000U,  .value = 0x19 },
> >> -       { .min_freq = 320000000U,  .max_freq = 440000000U,  .value = 0x0f },
> >> -       { .min_freq = 420000000U,  .max_freq = 660000000U,  .value = 0x09 },
> >> -       { .min_freq = 630000000U,  .max_freq = 1149000000U, .value = 0x03 },
> >> -       { .min_freq = 1100000000U, .max_freq = 1152000000U, .value = 0x01 },
> >> -       { .min_freq = 1150000000U, .max_freq = 1250000000U, .value = 0x01 },
> >> +static const struct dsi_clk_config dsi_clk_cfg_r8a779a0[] = {
> >> +       {   40000000u,   55000000u, 0x3f, 0x10, 0x01, 0x00, 0x0b },
> >> +       {   52500000u,   80000000u, 0x39, 0x10, 0x01, 0x00, 0x0b },
> >> +       {   80000000u,  110000000u, 0x2f, 0x10, 0x01, 0x00, 0x0b },
> >> +       {  105000000u,  160000000u, 0x29, 0x10, 0x01, 0x00, 0x0b },
> >> +       {  160000000u,  220000000u, 0x1f, 0x10, 0x01, 0x00, 0x0b },
> >> +       {  210000000u,  320000000u, 0x19, 0x10, 0x01, 0x00, 0x0b },
> >> +       {  320000000u,  440000000u, 0x0f, 0x10, 0x01, 0x00, 0x0b },
> >> +       {  420000000u,  660000000u, 0x09, 0x10, 0x01, 0x00, 0x0b },
> >> +       {  630000000u, 1149000000u, 0x03, 0x10, 0x01, 0x00, 0x0b },
> >> +       { 1100000000u, 1152000000u, 0x01, 0x10, 0x01, 0x00, 0x0b },
> >> +       { 1150000000u, 1250000000u, 0x01, 0x10, 0x01, 0x00, 0x0c },
> > 
> > Sigh ... is it this one 0x0c value that means we need to keep all these
> > entries repeated ? :-S
> > 
> > If it weren't for that, it seems we could keep just two sets of
> >> +       u8 cpbias_cntrl;
> >> +       u8 gmp_cntrl;
> >> +       u8 int_cntrl;
> >> +       u8 prop_cntrl;
> > 
> > One for each of the 9a0, and the 9g0...
> > 
> > But this is fine, and I guess the implication is there may be other
> > future differences to come in other platforms.
> > 
> > It could be refactored then when we have more visibility.
> 
> Yes, it's not so nice. And afaiu some of these values should really be 
> solved dynamically in the code. But the docs list these tables and don't 
> explain how to come up with those values, so... I think having these 
> tables is the safest way.

We could drop the cpbias_cntrl, gmp_cntrl and int_cntrl fields and set
them based on the IP version.

> >> @@ -427,8 +671,21 @@ static int rcar_mipi_dsi_startup(struct rcar_mipi_dsi *dsi,
> >>                  dev_warn(dsi->dev, "unsupported format");
> >>                  return -EINVAL;
> >>          }
> >> -       vclkset |= VCLKSET_COLOR_RGB | VCLKSET_DIV(setup_info.div)
> >> -               |  VCLKSET_LANE(dsi->lanes - 1);
> >> +
> >> +       vclkset |= VCLKSET_COLOR_RGB | VCLKSET_LANE(dsi->lanes - 1);
> >> +
> >> +       switch (dsi->info->model) {
> >> +       case RCAR_DSI_R8A779A0:
> >> +               vclkset |= VCLKSET_DIV_R8A779A0(__ffs(setup_info.vclk_divider));
> >> +               break;
> >> +
> >> +       case RCAR_DSI_R8A779G0:
> >> +               vclkset |= VCLKSET_DIV_R8A779G0(__ffs(setup_info.vclk_divider) - 1);
> > 
> > Why is this a -1 here ? Seems an odd difference compared to the A0.
> 
> You need to ask the HW designers =). That's how the register is on G0. 
> Field value of 0 means divided by 2.

-- 
Regards,

Laurent Pinchart
