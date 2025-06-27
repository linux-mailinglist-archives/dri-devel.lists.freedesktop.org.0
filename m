Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AF7AEB08B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 09:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 798AD10E09D;
	Fri, 27 Jun 2025 07:51:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PeJ/n1qq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A766310E09D
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 07:51:00 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D86BA613B1;
 Fri, 27 Jun 2025 07:50:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD34FC4CEEB;
 Fri, 27 Jun 2025 07:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751010656;
 bh=JbS8tm4sqaGviJ8DSlzmMGTIfieonXmx71aSWeZoU2Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PeJ/n1qq3ZXWmrji1Fxkf4lxd7vQMVfta7pftk2AhMp0U/5OPSsmOlI/rtbbTfOEw
 Dol/fq67fZUX0i2v3/q7nFlOTOLqSvaAPSWGA5SjPTqjVETnHyv/qs3KEUdnGfnsvh
 skZkDQjlO4JD80YWV332VoFwQ13PB20Eu8WASTxpZI6L4VaPC0WKxhbLtA9WsYZ1Y3
 PAwN1EERW1oBTFy9AXcpR+jcmUpCaa6vmyIAS+qpyGKDJ8chmUj596vFhVM0MNJ7jC
 c/akt9A4lsLu1cwYJDTlrV/jwXz1KsWABx3G5YG8wKJQaUmmH3Dyj+2clEL95Mw0s8
 kQw0PlxoHltFQ==
Date: Fri, 27 Jun 2025 09:50:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kaustabh Chakraborty <kauschluss@disroot.org>
Cc: Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Alim Akhtar <alim.akhtar@samsung.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Ajay Kumar <ajaykumar.rs@samsung.com>, Akshu Agrawal <akshua@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: display: samsung,exynos7-decon: add
 properties for iommus and ports
Message-ID: <20250627-literate-talented-panda-cbac89@krzk-bin>
References: <20250627-exynosdrm-decon-v3-0-5b456f88cfea@disroot.org>
 <20250627-exynosdrm-decon-v3-1-5b456f88cfea@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250627-exynosdrm-decon-v3-1-5b456f88cfea@disroot.org>
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

On Fri, Jun 27, 2025 at 12:50:28AM +0530, Kaustabh Chakraborty wrote:
> Similar to FIMD and Exynos5433's DECON, the Exynos7 DECON hardware:
> - May optionally require an IOMMU to initialize a display region.
> - May require a port connection to another block, say an MIC or a DSI
>   master.
> 
> Document these bindings in the devicetree schema.
> 
> Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> ---
>  .../bindings/display/samsung/samsung,exynos7-decon.yaml           | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
> index 53916e4c95d8c0369138941a556c23f5d42fbd39..1e9500c86590d555cfa6f04790e2b64da291b78b 100644
> --- a/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
> +++ b/Documentation/devicetree/bindings/display/samsung/samsung,exynos7-decon.yaml
> @@ -80,6 +80,14 @@ properties:
>        - const: vsync
>        - const: lcd_sys
>  
> +  iommus:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description:
> +      Contains a port which is connected to mic or dsim node.

You need to list and describe the ports.

Best regards,
Krzysztof

