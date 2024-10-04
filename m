Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C0C798FD64
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 08:35:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B9810E69B;
	Fri,  4 Oct 2024 06:35:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Gw2MCGp4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AC9210E798
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 06:35:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 334EE5C1060;
 Fri,  4 Oct 2024 06:35:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04550C4CEC6;
 Fri,  4 Oct 2024 06:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728023713;
 bh=jl7T+5WwqtroqvfChKzcUHISh4+13GhKzPmF41T9kb4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Gw2MCGp4xo+Jr9zBJnBd23K/f47mAe6echPEvacE0G3+nEMudx1iKOP9pWMUxsKkn
 tp6GB+nSIfbQOr3BUn/wLowrU3ypk5dTbDd0NPFCF0uzwUnkYkZuoVcWyPkUJo5tTn
 2YVYY0WwClMxyzmBlqQBsH9c+f1viVw7YXP/swCc30oKXm9ajBlE0gwK4JZrxIvLyI
 DMb2rsII3cDJYqvAm8oo4kg8s2zh9DsubrnASD6Dbs9YqERGoj+SeSRU3mQS5eDLhK
 A8i4wpwRlAQpdyNG8HQVYPMXJT2pAD0UjQqH6Nd48iRDqE6vhqJ5XBiapPjgzabRnD
 zqd5krKAy4zFg==
Date: Fri, 4 Oct 2024 08:35:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Moudy Ho <moudy.ho@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4] dt-bindings: display: mediatek: split: add subschema
 property constraints
Message-ID: <ajydpbq4ygrfr3ahs5nuh72pdmbttus2kgjb6csxc3p4tcq5l2@dlmucrzchvgl>
References: <20241004031245.27514-1-moudy.ho@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241004031245.27514-1-moudy.ho@mediatek.com>
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

On Fri, Oct 04, 2024 at 11:12:45AM +0800, Moudy Ho wrote:
> The display node in mt8195.dtsi was triggering a CHECK_DTBS error due
> to an excessively long 'clocks' property:
>   display@14f06000: clocks: [[31, 14], [31, 43], [31, 44]] is too long
> 
> To resolve this issue, the constraints for 'clocks' and
> other properties within the subschema will be reinforced.
> 
> Fixes: 739058a9c5c3 ("dt-bindings: display: mediatek: split: add compatible for MT8195")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> 
> --
> This is based on [v2] dt-bindings: display: mediatek: split: add clocks count constraint for MT8195
> 
> Changes since v3:
>   - Correct the compatible name for the mt8173 split in the subschema.
> 
> Changes since v2:
>   - Revise the commit message.
>   - Enhance the descriptions of 'clocks'.
>   - Strengthen the conditions within the subschema.
> 
> Changes since v1:
>   - Adding functional descriptions and quantity restrictions.
> ---
>  .../display/mediatek/mediatek,split.yaml      | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> index e4affc854f3d..87f8477a7be8 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,split.yaml
> @@ -57,6 +57,9 @@ properties:
>    clocks:
>      items:
>        - description: SPLIT Clock
> +      - description: Used for interfacing with the HDMI RX signal source.
> +      - description: Paired with receiving HDMI RX metadata.
> +    minItems: 1
>  
>  required:
>    - compatible
> @@ -72,9 +75,30 @@ allOf:
>              const: mediatek,mt8195-mdp3-split
>  
>      then:
> +      properties:
> +        clocks:

minItems, nothing in your commit msg says that clocks are optional

> +          maxItems: 3
> +
> +        power-domains:
> +          maxItems: 1

This should be in top-level, not here.

Best regards,
Krzysztof

