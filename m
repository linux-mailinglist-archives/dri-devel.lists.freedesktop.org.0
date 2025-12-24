Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07357CDB979
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 08:32:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F47C8912D;
	Wed, 24 Dec 2025 07:32:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hf1E8ILl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B49C8912D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 07:32:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 97B9860151;
 Wed, 24 Dec 2025 07:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE239C4CEFB;
 Wed, 24 Dec 2025 07:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766561569;
 bh=w5e9TnrVP5ABegEPA7dNb4tZYj1u9bTP/vBnZ/hS2tY=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=hf1E8ILlRZDpG0ZPukbun9DVqpea0FkRG2ChgsNG6vJJBC/qZAY3i5nFfeheALSMK
 IDNhzn7UIoC5XgGSVEH7yG0Atxm8YwHRK/yI0HFaOKxrbe3JLB5p34lUm9hVaBOi3O
 ZBy0HMOjSekxO45JZlZRDyYMFDB3rkLlbLShcQJzeGOiTWtgUdgkz60UsKhnRLq0Gp
 dkcloG7u9WNzoPep08Fg9yyLTwED9YFtErdQcV1H/6QiTCsN2EbJ9rCEezAAS6xlpf
 l0ttNUllE7L4749pz57ZD8GkevkZPlkZEu/Tmo4OnwYFZ17FF3P/9PxIg+RY+rp4ba
 YaTgX2NXFfA3w==
From: Vinod Koul <vkoul@kernel.org>
To: Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
References: <20251212-phy-clk-round-rate-v3-0-beae3962f767@redhat.com>
Subject: Re: [PATCH v3 0/9] phy: convert from clk round_rate() to
 determine_rate()
Message-Id: <176656156358.817806.16966474957670370356.b4-ty@kernel.org>
Date: Wed, 24 Dec 2025 13:02:43 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Fri, 12 Dec 2025 08:16:18 +0900, Brian Masney wrote:
> The round_rate() clk ops is deprecated in the clk framework in favor
> of the determine_rate() clk ops, so let's go ahead and convert the
> drivers in the phy subsystem using the Coccinelle semantic patch
> posted below. I did a few minor cosmetic cleanups of the code in a
> few cases.
> 
> Changes since v2:
> - Patch 8 (phy-rockchip-samsung-hdptx): fixed merge conflict so this now
>   applies against next-20251211. Cristian / Heiko: I kept your
>   Reviewed-by since structurally the code is still the same as before.
> - Link to v2: https://lore.kernel.org/r/20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com
> 
> [...]

Applied, thanks!

[1/9] phy: freescale: phy-fsl-samsung-hdmi: convert from round_rate() to determine_rate()
      commit: efc389fa00d1b93df8f95974c4f8c11da63671da
[2/9] phy: mediatek: phy-mtk-hdmi-mt2701: convert from round_rate() to determine_rate()
      commit: ebed08490d667141085ed873309aec5806dbb3a9
[3/9] phy: mediatek: phy-mtk-hdmi-mt8173: convert from round_rate() to determine_rate()
      commit: be4267241c196745e1f649afb7d232fe4440073a
[4/9] phy: mediatek: phy-mtk-hdmi-mt8195: convert from round_rate() to determine_rate()
      commit: 7a4ce5a9b674654ab04961a9ea03d15d71edb2a9
[5/9] phy: mediatek: phy-mtk-mipi-dsi-mt8173: convert from round_rate() to determine_rate()
      commit: 8e6bb53203d5c0a0cbc4f5cd90d8b2c6f20818ba
[6/9] phy: mediatek: phy-mtk-mipi-dsi-mt8183: convert from round_rate() to determine_rate()
      commit: 0484168a352f0f75a82d9917df4b23f5466726b7
[7/9] phy: rockchip: phy-rockchip-inno-hdmi: convert from round_rate() to determine_rate()
      commit: 2f7870297ae073b0fd6e1f875a9b84c5de0dea00
[8/9] phy: rockchip: phy-rockchip-samsung-hdptx: convert from round_rate() to determine_rate()
      commit: 3d4ffdfcf108e73b7c5bf07e0358d0fe8fac28d4
[9/9] phy: ti: phy-j721e-wiz: convert from round_rate() to determine_rate()
      commit: 27287e3b52b5954b73203d32ee76ffd5f53f5074

Best regards,
-- 
~Vinod


