Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93074AD7B30
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 21:42:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F08710E16B;
	Thu, 12 Jun 2025 19:42:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=lunn.ch header.i=@lunn.ch header.b="2DdGMCY/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1976 seconds by postgrey-1.36 at gabe;
 Thu, 12 Jun 2025 19:41:57 UTC
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8996B10E16B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 19:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
 Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
 bh=U0UHRZVFR/9o1BtZeDpkFOYGrW0/3kxtp0aIw6uYvBY=; b=2DdGMCY/Cmy+VC5+/1czoZCXwX
 OlxZReGzj+bxOuaZXkgBDZrb3ccbqYemF5q+lgf/TFl+gC5MGNjNPxSKZWBSsh1u6tXQFprca/pM2
 qq32uiR7T4l57K4w7SEePztfoxdtwPDhIAasxSLOe0zhxNJHyCzvSg9HCEmjYin5vlIE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1uPnHg-00FaEs-Pw; Thu, 12 Jun 2025 21:08:20 +0200
Date: Thu, 12 Jun 2025 21:08:20 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Qin Jian <qinjian@cqplus1.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 15/20] net: stmmac: dwmac-rk: switch to HWORD_UPDATE macro
Message-ID: <5947475f-ef38-44cb-857e-0c7378023ccd@lunn.ch>
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
 <20250612-byeword-update-v1-15-f4afb8f6313f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-byeword-update-v1-15-f4afb8f6313f@collabora.com>
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

On Thu, Jun 12, 2025 at 08:56:17PM +0200, Nicolas Frattaroli wrote:
> The era of hand-rolled HIWORD_UPDATE macros is over, at least for those
> drivers that use constant masks.
> 
> Like many other Rockchip drivers, dwmac-rk has its own HIWORD_UPDATE
> macro. Its semantics allow us to redefine it as a wrapper to the shared
> bitfield.h HWORD_UPDATE macros though.
> 
> Replace the implementation of this driver's very own HIWORD_UPDATE macro
> with an instance of HWORD_UPDATE from bitfield.h. This keeps the diff
> easily reviewable, while giving us more compile-time error checking.
> 
> The related GRF_BIT macro is left alone for now; any attempt to rework
> the code to not use its own solution here would likely end up harder to
> review and less pretty for the time being.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Please split this out into a patch for net-next. Also, Russell King
has just posted a number of patches for this driver, so you will
probably want to wait for them to be merged, so you post something
which will merged without any fuzz.

	Andrew
