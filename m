Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30C248BE8D2
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 18:26:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F7EF1124FE;
	Tue,  7 May 2024 16:26:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JpoiKtsC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 460101124FE
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 16:26:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 381EB6177E;
 Tue,  7 May 2024 16:26:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98957C2BBFC;
 Tue,  7 May 2024 16:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715099178;
 bh=/5I1D7aRR2QRwr2mUkZwUa89+yp2b+yvvGuDrXWWovQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JpoiKtsCDRWS9H1oYa/F6JwX9mrEjG8l7IWfcqtNn8AuxO8/CG1gIbh+CBbJ+550C
 WAlUqrQJbhClxSfpmosuhoTg6boD5NTMroeZI9Fd8abpXOQEC8Qfb61cMnMWTcqHGJ
 qc19+ywvq3bGZfGibwZ9QJ4MV75vqbdvXJoiTpNqc8OSCaY5cI20S51TOvsiyXl93Y
 WXEaFYRfmR3uzX2eY9TGF9k1Vmkq5xuO8R7wXsQ5ZIef9QFo0svLZwoTEIgMskSn5t
 fH+QFguKVRjj0sdmB5nqvzlmr5EutpSOO6F74VMLulMZCWuqpPJLvVVXw/9HQauPP4
 YN1cqa1a8rv2g==
Date: Tue, 7 May 2024 11:26:16 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com,
 krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, conor+dt@kernel.org, ck.hu@mediatek.com,
 airlied@gmail.com, linux-mediatek@lists.infradead.org,
 wenst@chromium.org, chunkuang.hu@kernel.org, daniel@ffwll.ch,
 tzimmermann@suse.de, matthias.bgg@gmail.com, jitao.shi@mediatek.com,
 shawn.sung@mediatek.com, linux-arm-kernel@lists.infradead.org,
 p.zabel@pengutronix.de, dri-devel@lists.freedesktop.org,
 kernel@collabora.com, yu-chang.lee@mediatek.com
Subject: Re: [PATCH v3 1/3] dt-bindings: display: mediatek: Add OF graph
 support for board path
Message-ID: <171509917467.817282.9286531892598521217.robh@kernel.org>
References: <20240502115622.248456-1-angelogioacchino.delregno@collabora.com>
 <20240502115622.248456-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240502115622.248456-2-angelogioacchino.delregno@collabora.com>
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


On Thu, 02 May 2024 13:56:20 +0200, AngeloGioacchino Del Regno wrote:
> The display IPs in MediaTek SoCs support being interconnected with
> different instances of DDP IPs (for example, merge0 or merge1) and/or
> with different DDP IPs (for example, rdma can be connected with either
> color, dpi, dsi, merge, etc), forming a full Display Data Path that
> ends with an actual display.
> 
> The final display pipeline is effectively board specific, as it does
> depend on the display that is attached to it, and eventually on the
> sensors supported by the board (for example, Adaptive Ambient Light
> would need an Ambient Light Sensor, otherwise it's pointless!), other
> than the output type.
> 
> Add support for OF graphs to most of the MediaTek DDP (display) bindings
> to add flexibility to build custom hardware paths, hence enabling board
> specific configuration of the display pipeline and allowing to finally
> migrate away from using hardcoded paths.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../display/mediatek/mediatek,aal.yaml        | 40 +++++++++++++++++++
>  .../display/mediatek/mediatek,ccorr.yaml      | 21 ++++++++++
>  .../display/mediatek/mediatek,color.yaml      | 22 ++++++++++
>  .../display/mediatek/mediatek,dither.yaml     | 22 ++++++++++
>  .../display/mediatek/mediatek,dpi.yaml        | 25 +++++++++++-
>  .../display/mediatek/mediatek,dsc.yaml        | 24 +++++++++++
>  .../display/mediatek/mediatek,dsi.yaml        | 27 ++++++++++++-
>  .../display/mediatek/mediatek,ethdr.yaml      | 22 ++++++++++
>  .../display/mediatek/mediatek,gamma.yaml      | 19 +++++++++
>  .../display/mediatek/mediatek,merge.yaml      | 23 +++++++++++
>  .../display/mediatek/mediatek,od.yaml         | 22 ++++++++++
>  .../display/mediatek/mediatek,ovl-2l.yaml     | 22 ++++++++++
>  .../display/mediatek/mediatek,ovl.yaml        | 22 ++++++++++
>  .../display/mediatek/mediatek,postmask.yaml   | 21 ++++++++++
>  .../display/mediatek/mediatek,rdma.yaml       | 22 ++++++++++
>  .../display/mediatek/mediatek,ufoe.yaml       | 21 ++++++++++
>  16 files changed, 372 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

