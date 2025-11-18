Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B55C691C9
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 12:34:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACA3B10E34D;
	Tue, 18 Nov 2025 11:34:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IW81UfnC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F84510E34D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 11:34:54 +0000 (UTC)
Received: from pendragon.ideasonboard.com (82-203-165-222.bb.dnainternet.fi
 [82.203.165.222])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id A06411E33;
 Tue, 18 Nov 2025 12:32:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1763465568;
 bh=+2p9uMj81sZ4SNJ0Savmil44h/Mgting5RoOZ1EjUqc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IW81UfnC+d2P/PJJVptKnQzn0GSdB/U/FJrpoT3HfmFeIN8Oo2P7T1nQUXjQZ/LSh
 cVE+Yp+ZiH3F0NjrtaiU6WxE7rWPmwnIGBujP2pdbd5nMpgCsd2cTygX5A5f/BtAcv
 QRhmRBUnIFaelKIQTyjkiXte8N2mS4luhfCd7iK8=
Date: Tue, 18 Nov 2025 13:34:34 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v11 0/7] Add support for DU/DSI clocks and DSI driver
 support for the Renesas RZ/V2H(P) SoC
Message-ID: <20251118113434.GA22495@pendragon.ideasonboard.com>
References: <20251015192611.241920-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdW1B7Yk1hUU9MSJsiL8wSmjAUGN7Qd_wgBHv8Ct=-wi4Q@mail.gmail.com>
 <CA+V-a8uY11uWoQ_en5QC=W4HPHRwT6rKQQJ-knT8Gi-+czm05w@mail.gmail.com>
 <20251021184502.GD19043@pendragon.ideasonboard.com>
 <CAMuHMdVrfVP1XZbQVNwEEP8L69mVzNN2yLSjNyHO7o2zqBuY0w@mail.gmail.com>
 <CA+V-a8vLXg-whqwpE3pLF5JP3kK9on9Hu3iyLXEvrWbR9XmF5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8vLXg-whqwpE3pLF5JP3kK9on9Hu3iyLXEvrWbR9XmF5w@mail.gmail.com>
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

Hi Prabhakar,

On Tue, Nov 18, 2025 at 11:21:12AM +0000, Lad, Prabhakar wrote:
> On Mon, Oct 27, 2025 at 11:23 AM Geert Uytterhoeven wrote:
> > On Tue, 21 Oct 2025 at 20:45, Laurent Pinchart wrote:
> > > On Tue, Oct 21, 2025 at 07:26:49PM +0100, Lad, Prabhakar wrote:
> > > > On Tue, Oct 21, 2025 at 11:26 AM Geert Uytterhoeven wrote:
> > > > > On Wed, 15 Oct 2025 at 21:26, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> > > > > > This patch series adds DU/DSI clocks and provides support for the
> > > > > > MIPI DSI interface on the RZ/V2H(P) SoC.
> > > > > >
> > > > > > v10->v11:
> > > > > > - Split CPG_PLL_CLK1_K/M/PDIV macro change into separate patch
> > > > > > - Updated rzv2h_cpg_plldsi_div_determine_rate()
> > > > > >   while iterating over the divider table
> > > > > > - Added Acked-by tag from Tomi for patch 2/7 and 3/7
> > > > > > - Added Reviewed-by tag from Geert for patch 2/7 and 3/7
> > > > >
> > > > > I think this series is ready for merging.
> > > >
> > > > \o/
> > > >
> > > > > > Lad Prabhakar (7):
> > > > > >   clk: renesas: rzv2h-cpg: Add instance field to struct pll
> > > > > >   clk: renesas: rzv2h-cpg: Use GENMASK for PLL fields
> > > > > >   clk: renesas: rzv2h-cpg: Add support for DSI clocks
> > > > > >   clk: renesas: r9a09g057: Add clock and reset entries for DSI and LCDC
> > > > > >   dt-bindings: display: bridge: renesas,dsi: Document RZ/V2H(P) and
> > > > > >     RZ/V2N
> > > > > >   drm: renesas: rz-du: mipi_dsi: Add LPCLK clock support
> > > > > >   drm: renesas: rz-du: mipi_dsi: Add support for RZ/V2H(P) SoC
> > > > >
> > > > > As this touches both clk and drm, let's discuss the merge strategy.
> > > > > My proposal:
> > > > >   1. I queue patches 1-3 in an immutable branch with a signed tag,
> > > > >      to be used as a base for the remaining patches,
> >
> > Done:
> >
> > The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:
> >
> >   Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git
> > tags/clk-renesas-rzv2h-plldsi-tag
> >
> > for you to fetch changes up to f864e4b721e386be132cc973eadefe5d52cdfd94:
> >
> >   clk: renesas: rzv2h: Add support for DSI clocks (2025-10-27 11:58:03 +0100)
> >
> > ----------------------------------------------------------------
> > clk: renesas: rzv2h: Add support for DSI clocks
> >
> > RZ/V2H Clock Pulse Generator PLLDSI API, shared by clock and MIPI DSI
> > driver source files.
> >
> > ----------------------------------------------------------------
> > Lad Prabhakar (3):
> >       clk: renesas: rzv2h: Add instance field to struct pll
> >       clk: renesas: rzv2h: Use GENMASK for PLL fields
> >       clk: renesas: rzv2h: Add support for DSI clocks
> >
> >  drivers/clk/renesas/rzv2h-cpg.c | 512 +++++++++++++++++++++++++++++++++++++++-
> >  drivers/clk/renesas/rzv2h-cpg.h |  26 +-
> >  include/linux/clk/renesas.h     | 145 ++++++++++++
> >  3 files changed, 672 insertions(+), 11 deletions(-)
> >
> > > > >   2. I queue patch 4 on top of 1 in renesas-clk for v6.19,
> >
> > Done.
> 
> Can you please pick up the DSI patches.

We can't, this has to be done by a drm-misc maintainer as it involves
merging a non-fast forward branch instead of pushing commit directly on
top of drm-misc-next.

-- 
Regards,

Laurent Pinchart
