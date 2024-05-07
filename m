Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D7C88BE8E9
	for <lists+dri-devel@lfdr.de>; Tue,  7 May 2024 18:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D60F112509;
	Tue,  7 May 2024 16:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ijxKTfvR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A7FB112507
 for <dri-devel@lists.freedesktop.org>; Tue,  7 May 2024 16:29:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4DC8ECE1255;
 Tue,  7 May 2024 16:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46773C2BBFC;
 Tue,  7 May 2024 16:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715099347;
 bh=dPChBTgN3pNTkEs39qbzPGhdirgHNSrhYcFvG2Sfkig=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ijxKTfvRkApxZcFjD7YQUsrymcqd0uU5wkvTKh8iVf+V2joVZVCh4S0KkksoFOgQ/
 PdCi8mwlCTk3PVsr/DzOtfJ1w30aDzpnprrCH5qzuWkQZ92+ME4Was184IcA45XsRd
 IfcxdKKZ33G//bqXMIYFDZ2wkuK2DS6vIxqY5wpCFElnwl22ivwCVZTyZ476JvXm4J
 f21KYREQSE7s+GKnfG9ft5ENAQ7EVSW5hv4pNRzZEV/PeM9j5gxpXHeFsiutys4k31
 9i49qlIxn60d/Zg9Iw2rGgxEJpklq0KxaYUtsPUb6jUQztNFfp/lKTN0+axcqipD6w
 MhljztaFM37WA==
Date: Tue, 7 May 2024 11:29:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 devicetree@vger.kernel.org, matthias.bgg@gmail.com,
 wenst@chromium.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, conor+dt@kernel.org, p.zabel@pengutronix.de,
 jitao.shi@mediatek.com, ck.hu@mediatek.com, mripard@kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 shawn.sung@mediatek.com, krzysztof.kozlowski+dt@linaro.org,
 dri-devel@lists.freedesktop.org, chunkuang.hu@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, yu-chang.lee@mediatek.com
Subject: Re: [PATCH v3 2/3] dt-bindings: arm: mediatek: mmsys: Add OF graph
 support for board path
Message-ID: <171509934047.820109.12693254267558250910.robh@kernel.org>
References: <20240502115622.248456-1-angelogioacchino.delregno@collabora.com>
 <20240502115622.248456-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240502115622.248456-3-angelogioacchino.delregno@collabora.com>
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


On Thu, 02 May 2024 13:56:21 +0200, AngeloGioacchino Del Regno wrote:
> Document OF graph on MMSYS/VDOSYS: this supports up to three DDP paths
> per HW instance (so potentially up to six displays for multi-vdo SoCs).
> 
> The MMSYS or VDOSYS is always the first component in the DDP pipeline,
> so it only supports an output port with multiple endpoints - where each
> endpoint defines the starting point for one of the (currently three)
> possible hardware paths.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/arm/mediatek/mediatek,mmsys.yaml | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

