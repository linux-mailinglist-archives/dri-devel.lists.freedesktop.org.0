Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC71DB8E49D
	for <lists+dri-devel@lfdr.de>; Sun, 21 Sep 2025 22:04:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B94F310E160;
	Sun, 21 Sep 2025 20:04:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iCTBvx1y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3555A10E160
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Sep 2025 20:04:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D4FE5600AE;
 Sun, 21 Sep 2025 20:04:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A835C4CEE7;
 Sun, 21 Sep 2025 20:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758485061;
 bh=oK6PNMhjBQuguBf6ZyCDvGmGsPBZFWxojb6mTU595d4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=iCTBvx1ycWtFaxbFJjKnE8lmTRV6YKBljeoNPWr3O0f9KOI2wK+gY/chvSLppb2iw
 nKDM1jLs/kX3EvgUACM5BKR1e32v5rVmusbFg6REu8gh8nHtL4KnpR4cztPIEWYsyn
 85sV5ZWf8I2axh1P00A55pSPIoljTkKeShL0Yo6iD75KN1B4tcxd0MZkgqGmYUT1mQ
 IpOfY2l2pbjRNsgwxsBcIB9YfzgZxcgmX2t0tM84PDIkYUJsgjzu0i/zQZHS16n4gv
 WrApdIyoKSa91FOKnNUjwHaVFh7bF8WfL1saxL8xffSMJav7UkpqNUB9WhDh8//gHr
 V8yFvFNiMSeTQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250623-byeword-update-v2-19-cf1fc08a2e1f@collabora.com>
References: <20250623-byeword-update-v2-0-cf1fc08a2e1f@collabora.com>
 <20250623-byeword-update-v2-19-cf1fc08a2e1f@collabora.com>
Subject: Re: [PATCH v2 19/20] clk: sp7021: switch to FIELD_PREP_WM16 macro
From: Stephen Boyd <sboyd@kernel.org>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, llvm@lists.linux.dev,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Andy Yan <andy.yan@rock-chips.com>,
 Bill Wendling <morbo@google.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, David Airlie <airlied@gmail.com>,
 David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Heiko Stuebner <heiko@sntech.de>, Jaehoon Chung <jh80.chung@samsung.com>,
 Jakub Kicinski <kuba@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Justin Stitt <justinstitt@google.com>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof =?utf-8?q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Kyungmin Park <kyungmin.park@samsung.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Maxime Ripard <mripard@k
 ernel.org>, Michael Turquette <mturquette@baylibre.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Paolo Abeni <pabeni@redhat.com>, Qin Jian <qinjian@cqplus1.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, Rob Herring <robh@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>, Shawn Lin <shawn.lin@rock-chips.com>,
 Shreeya Patel <shreeya.patel@collabora.com>, Simona Vetter <simona@ffwll.ch>,
 Takashi Iwai <tiwai@suse.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Ulf Hansson <ulf.hansson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Yury Norov <yury.norov@gmail.com>
Date: Sun, 21 Sep 2025 13:04:19 -0700
Message-ID: <175848505982.4354.2243738737036950081@lazor>
User-Agent: alot/0.11
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

Quoting Nicolas Frattaroli (2025-06-23 09:05:47)
> The sp7021 clock driver has its own shifted high word mask macro,
> similar to the ones many Rockchip drivers have.
>=20
> Remove it, and replace instances of it with hw_bitfield.h's
> FIELD_PREP_WM16 macro, which does the same thing except in a common
> macro that also does compile-time error checking.
>=20
> This was compile-tested with 32-bit ARM with Clang, no runtime tests
> were performed as I lack the hardware. However, I verified that fix
> commit 5c667d5a5a3e ("clk: sp7021: Adjust width of _m in HWM_FIELD_PREP()=
")
> is not regressed. No warning is produced.
>=20
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
