Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C219FE6D5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 15:09:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2ACF10E4DF;
	Mon, 30 Dec 2024 14:09:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2EB7110E4DF
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 14:09:50 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0317E143D;
 Mon, 30 Dec 2024 06:10:18 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DAE383F59E;
 Mon, 30 Dec 2024 06:09:44 -0800 (PST)
Date: Mon, 30 Dec 2024 14:09:41 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Parthiban Nallathambi <parthiban@linumiz.com>
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
Subject: Re: [PATCH RESEND 16/22] clk: sunxi-ng: sun8i-de2: Add support for
 a100/a133
Message-ID: <20241230140941.00aaed1f@donnerap.manchester.arm.com>
In-Reply-To: <20241227-a133-display-support-v1-16-abad35b3579c@linumiz.com>
References: <20241227-a133-display-support-v1-0-abad35b3579c@linumiz.com>
 <20241227-a133-display-support-v1-16-abad35b3579c@linumiz.com>
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

On Fri, 27 Dec 2024 18:31:05 +0530
Parthiban Nallathambi <parthiban@linumiz.com> wrote:

Hi,

> Display clock uses 1 mixer without rotation support is same
> as v3s. There is also a hidden independent display engine
> with independent tcon_top available in A100/A133 bin (based
> on vendor BSP).
> 
> Add new compatible for A100/A133 to accommodate the future changes
> for the independent DE.
> 
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> ---
>  drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> index 3e28c32050e0..067820ab704d 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
> @@ -342,6 +342,10 @@ static const struct of_device_id sunxi_de2_clk_ids[] = {
>  		.compatible = "allwinner,sun50i-a64-de2-clk",
>  		.data = &sun50i_a64_de2_clk_desc,
>  	},
> +	{
> +		.compatible = "allwinner,sun50i-a100-de2-clk",
> +		.data = &sun8i_v3s_de2_clk_desc,

That wouldn't be needed then. *If* we find some incompatibility, we can
add this line later, pointing to a different _desc block, but for now you
can rely on the fallback compatible to match.

Cheers,
Andre

> +	},
>  	{
>  		.compatible = "allwinner,sun50i-h5-de2-clk",
>  		.data = &sun50i_h5_de2_clk_desc,
> 

