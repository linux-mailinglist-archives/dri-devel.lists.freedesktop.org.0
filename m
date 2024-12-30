Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F04EB9FE6DD
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 15:12:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7047910E4E2;
	Mon, 30 Dec 2024 14:11:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 40CDF10E4E2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 14:11:58 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E04FF143D;
 Mon, 30 Dec 2024 06:12:25 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C93193F59E;
 Mon, 30 Dec 2024 06:11:52 -0800 (PST)
Date: Mon, 30 Dec 2024 14:11:50 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Parthiban <parthiban@linumiz.com>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin
 Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Linus
 Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH RESEND 00/22] Add support for A100/A133 display
Message-ID: <20241230141150.3d0c3ae6@donnerap.manchester.arm.com>
In-Reply-To: <314b6bbe-613e-41a6-955e-50db6e11ef8e@linumiz.com>
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
 <314b6bbe-613e-41a6-955e-50db6e11ef8e@linumiz.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 27 Dec 2024 20:06:30 +0530
Parthiban <parthiban@linumiz.com> wrote:

> On 12/27/24 6:30 PM, Parthiban Nallathambi wrote:
> > This series depends on [1] for the eMMC/MMC controller to work and
> > [2] (lined up for 6.14) which adds support for the sram nodes and
> > display engine extends it's usage. Idea of this series to get initial
> > feedback and adjust, which will be rebased for 6.14 once [2] is merged.
> > 
> > This patch series adds support for A133 display pipeline based on
> > LVDS. dt-bindigs are organized in the start and later with code
> > changes.
> > 
> > PHY is shared between DSI and LVDS, so to control the PHY specific
> > to DSI/LVDS, phy_ops set_mode is introduced. To enable the DSI
> > using set_mode, analog control register MIPI Enable is used, which
> > may not be available for A31 (shares the same driver).
> > 
> > Otherwise, A133 also got hidden independent display engine i.e
> > mixer + tcon top to handle parallel display. But this patch series
> > adds only support for the 1 mixer which is documented.
> > 
> > [1]: https://lore.kernel.org/linux-sunxi/20241109003739.3440904-1-masterr3c0rd@epochal.quest/
> > [2]: https://lore.kernel.org/linux-sunxi/20241218-a100-syscon-v2-0-dae60b9ce192@epochal.quest/
> > 
> > Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>  
> Apologize for polluting with resend again. My internal mail server got blocked due to
> volume count, which resulted in incomplete series again.

I guess an incomplete send was the reason for the original resend? Please
note this at the top of the cover letter then, otherwise it's not easy
to see why you send something again. Something like:

*** Re-sent due to mail server not sending out the complete series. ***

It also helps to split up the recipients, so that everyone gets the cover
letter, but only the respective subsystem maintainers get the patches
touching their subsystem. I would CC: the DT maintainers on every patch,
though.
It's a bit more complicated to set up, but keeps the noise down for those
large-ish series, for instance for the IOMMU people, who presumably have
little interest in DT or graphics code.

Cheers,
Andre

> I will fix the mail server issue before resending the series. Sorry.
> 
> Thanks,
> Parthiban
> 
> 

