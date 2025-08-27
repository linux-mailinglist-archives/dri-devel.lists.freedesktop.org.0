Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D7EB37C94
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 09:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D12810E753;
	Wed, 27 Aug 2025 07:58:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="wx3V3gZx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED23A10E753
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Aug 2025 07:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=uJQ6mSMA7ygeA5oFmyppBb4E1ANB4bt0CH+tDHmNVhk=; b=wx3V3gZxVatzbagZOgxagDXMFS
 DbqD+upnRWY4VW0FHtPO/Ndv+DXLpODD94PrK/9DLjH8vLBGEQ3OLMT/aUxW6ZqLmjqOwg1fxqwox
 vjq06D2iO4V/KKRRgEVqhUMfuZMhlWKgZwrvAL+8D9VC6XyhW3OxzYtz5kMWvK3+YkiKP17ZKoAN1
 PsU3gG2oT3sat8dFVC5XO7K7upNYFqUzfRPGrWQ5yhelFaccH7Bvp49FQAWHq3CHwUYVgTZkUjkGG
 +Plafk3ayemfPfDEvLfUCRGu5WAwmPASOTC1Yn6OUQirf5YAacGQsQfmRs3mo0NXYTjXfS98Lf962
 +1H2LB/g==;
Received: from [213.244.170.152] (helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1urB2j-0003FB-Nv; Wed, 27 Aug 2025 09:58:05 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
 Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?UTF-8?B?V2lsY3p5xYRza2k=?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Qin Jian <qinjian@cqplus1.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, llvm@lists.linux.dev,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH v3 17/20] PCI: dw-rockchip: Switch to FIELD_PREP_WM16 macro
Date: Wed, 27 Aug 2025 09:58:04 +0200
Message-ID: <5730130.X9hSmTKtgW@phil>
In-Reply-To: <20250825-byeword-update-v3-17-947b841cdb29@collabora.com>
References: <20250825-byeword-update-v3-0-947b841cdb29@collabora.com>
 <20250825-byeword-update-v3-17-947b841cdb29@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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

Am Montag, 25. August 2025, 10:28:37 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Nicolas Frattaroli:
> The era of hand-rolled HIWORD_UPDATE macros is over.
>=20
> Like many other Rockchip drivers, pcie-dw-rockchip brings with it its
> very own flavour of HIWORD_UPDATE. It's occasionally used without a
> constant mask, which complicates matters. HIWORD_UPDATE_BIT is a
> confusingly named addition, as it doesn't update the bit, it actually
> sets all bits in the value to 1. HIWORD_DISABLE_BIT is similarly
> confusing; it disables several bits at once by using the value as a mask
> and the inverse of value as the value, and the "disabling only these"
> effect comes from the hardware actually using the mask. The more obvious
> approach would've been HIWORD_UPDATE(val, 0) in my opinion.
>=20
> This is part of the motivation why this patch uses hw_bitfield.h's
> FIELD_PREP_WM16 instead, where possible. FIELD_PREP_WM16 requires a
> constant bit mask, which isn't possible where the irq number is used to
> generate a bit mask. For that purpose, we replace it with a more robust
> macro than what was there but that should also bring close to zero
> runtime overhead: we actually mask the IRQ number to make sure we're not
> writing garbage.
>=20
> For the remaining bits, there also are some caveats. For starters, the
> PCIE_CLIENT_ENABLE_LTSSM and PCIE_CLIENT_DISABLE_LTSSM were named in a
> manner that isn't quite truthful to what they do. Their modification
> actually spans not just the LTSSM bit but also another bit, flipping
> only the LTSSM one, but keeping the other (which according to the TRM
> has a reset value of 0) always enabled. This other bit is reserved as of
> the IP version RK3588 uses at least, and I have my doubts as to whether
> it was meant to be set, and whether it was meant to be set in that code
> path. Either way, it's confusing.
>=20
> Replace it with just writing either 1 or 0 to the LTSSM bit, using the
> new FIELD_PREP_WM16 macro from hw_bitfield.h, which grants us the
> benefit of better compile-time error checking.
>=20
> The change of no longer setting the reserved bit doesn't appear to
> change the behaviour on RK3568 in RC mode, where it's not marked as
> reserved.
>=20
> PCIE_CLIENT_RC_MODE/PCIE_CLIENT_EP_MODE was another field that wasn't
> super clear on what the bit field modification actually is. As far as I
> can tell, switching to RC mode doesn't actually write the correct value
> to the field if any of its bits have been set previously, as it only
> updates one bit of a 4 bit field.
>=20
> Replace it by actually writing the full values to the field, using the
> new FIELD_PREP_WM16 macro, which grants us the benefit of better
> compile-time error checking.
>=20
> This patch was tested on RK3588 (PCIe3 x4 controller), RK3576 (PCIe2 x1
> controller) and RK3568 (PCIe x2 controller), all in RC mode.
>=20
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


