Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A06EAD7E28
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 00:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2594610E29B;
	Thu, 12 Jun 2025 22:01:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pyPMHD+j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 213E210E29B
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 22:01:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2D614A52192;
 Thu, 12 Jun 2025 22:01:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E14DC4CEEA;
 Thu, 12 Jun 2025 22:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749765693;
 bh=4c23EVlBRbC0Sh2HVGAeTrWF8ckuRzyb3wIApq3EJ0Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pyPMHD+jhG+UTqABmIsWKlZaWpYwYT8yRbeTaj6af6mv0CScs81OZC14hEgpOQpqo
 RxUjx7u0c04zWdOWA3HP8r3YCxfTUGgt7/6IXy+olWrZBlDDPCnHfJ2v85tlNdrCRD
 UXqXIBSfdaqN7b2Zw9ekGq/d+2TWFahI8NypgSV/iEUgbik9cuIv4+7KQ4X2/YGiui
 ToRHQcO0nLaHP41ty5z3+YlPdDtFsHUjqfXoXCbBt0r8dFq6GTqY/uU3iMpROb1OVO
 RPp4P9+AYRiUOFuciFsilpSUhTCO/Q80c3PWR/d5rsYLxFbYNnCdfYj4zHkbScfKyp
 +9szYBH1OtjOA==
Date: Thu, 12 Jun 2025 15:01:30 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Yury Norov <yury.norov@gmail.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Rasmus Villemoes
 <linux@rasmusvillemoes.dk>, Jaehoon Chung <jh80.chung@samsung.com>, Ulf
 Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>, Shreeya
 Patel <shreeya.patel@collabora.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Sandy Huang <hjc@rock-chips.com>, Andy Yan
 <andy.yan@rock-chips.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, Kishon
 Vijay Abraham I <kishon@kernel.org>, Nicolas Frattaroli
 <frattaroli.nicolas@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark
 Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai
 <tiwai@suse.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Shawn Lin
 <shawn.lin@rock-chips.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?= <kwilczynski@kernel.org>, Manivannan
 Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham
 <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Qin
 Jian <qinjian@cqplus1.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 01/20] bitfield: introduce HWORD_UPDATE bitfield macros
Message-ID: <20250612150130.36b01844@kernel.org>
In-Reply-To: <aEs0PVkwFN9uRgU0@yury>
References: <20250612-byeword-update-v1-0-f4afb8f6313f@collabora.com>
 <20250612-byeword-update-v1-1-f4afb8f6313f@collabora.com>
 <20250612124415.3399e26b@kernel.org>
 <22744779.EfDdHjke4D@workhorse> <aEs0PVkwFN9uRgU0@yury>
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

On Thu, 12 Jun 2025 16:10:37 -0400 Yury Norov wrote:
> I don't think that that having HWORD_UPDATE() in bitfield.h is a wrong
> thing. Jakub, if you do, we can just create a new header for it.

Yes, I'd prefer to contain it. This looks very much like a CSR tooling
convention of Rockchip's ASIC developers. IOW this is really about how
CSRs are access for a specific vendor, not a generic bitfield operator.
