Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0B78CA05C
	for <lists+dri-devel@lfdr.de>; Mon, 20 May 2024 17:57:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A03610E04B;
	Mon, 20 May 2024 15:57:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NSCuewc6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A1E710E04B
 for <dri-devel@lists.freedesktop.org>; Mon, 20 May 2024 15:57:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E6F3C61D92;
 Mon, 20 May 2024 15:57:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B15EC2BD10;
 Mon, 20 May 2024 15:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716220666;
 bh=dgi6/+GHc+2bDbv40ImoR2hfMHO0yKR3AM+UeaGAIVs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NSCuewc6ybxi/KY4sHRJnx4zOXUWf8WNft00cf6zgJ8RdUqhMXalqvGVcMySGWzG5
 zlavp9or63s5Ub98qY4S/Xs/JvBVeVYaApH+4ju5y9xKNP6XtcE6fe4BzEpOvgA9tV
 ITKAzV02QjLJir2h6IYB2fbFcRCDLMQ/GpF2j4rZRz4Ej/WOfMYEd63LfQl9fujdbm
 x+C55OMbar6VkCb/zdwLj/rHiKOtXsOsTrqzCwMPbYMNwHybtwWV1gzGmLwuMH+8j/
 tyUBfxFwOcNvki0mM/yyXDpI58iQWhUv0mU7wS7IkCcRw8jPmgF5GgSqoSQjuG0Wke
 Aj9k1t5nelv+w==
Date: Mon, 20 May 2024 10:57:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: panel: mipi-dbi-spi: Add a
 pixel format property
Message-ID: <171622065959.617153.198991768265226176.robh@kernel.org>
References: <20240512-panel-mipi-dbi-rgb666-v2-0-49dd266328a0@tronnes.org>
 <20240512-panel-mipi-dbi-rgb666-v2-1-49dd266328a0@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240512-panel-mipi-dbi-rgb666-v2-1-49dd266328a0@tronnes.org>
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


On Sun, 12 May 2024 17:25:38 +0200, Noralf Trønnes wrote:
> The MIPI DBI 2.0 specification (2005) lists only two pixel formats for
> the Type C Interface (SPI) and that is 3-bits/pixel RGB111 with
> 2 options for bit layout.
> 
> For Type A and B (parallel) the following formats are listed: RGB332,
> RGB444, RGB565, RGB666 and RGB888 (some have 2 options for the bit layout).
> 
> Many MIPI DBI compatible controllers support all interface types on the
> same chip and often the manufacturers have chosen to provide support for
> the Type A/B interface pixel formats also on the Type C interface.
> 
> Some chips provide many pixel formats with optional bit layouts over SPI,
> but the most common by far are RGB565 and RGB666. So even if the
> specification doesn't list these formats for the Type C interface, the
> industry has chosen to include them.
> 
> The MIPI DCS specification lists the standard commands that can be sent
> over the MIPI DBI interface. The set_address_mode (36h) command has one
> bit in the parameter that controls RGB/BGR order:
>     This bit controls the RGB data latching order transferred from the
>     peripheral’s frame memory to the display device.
> This means that each supported RGB format also has a BGR variant.
> 
> Based on this rationale document the following pixel formats describing
> the bit layout going over the wire:
> - RGB111 (option 1): x2r1g1b1r1g1b1 (2 pixels per byte)
> - BGR111 (option 1): x2b1g1r1b1g1r1 (2 pixels per byte)
> - RGB111 (option 2): x1r1g1b1x1r1g1b1 (2 pixels per byte)
> - BGR111 (option 2): x1b1g1r1x1b1g1r1 (2 pixels per byte)
> - RGB565: r5g6b5 (2 bytes)
> - BGR565: b5g6r5 (2 bytes)
> - RGB666: r6x2g6x2b6x2 (3 bytes)
> - BGR666: b6x2g6x2r6x2 (3 bytes)
> (x: don't care)
> 
> v2:
> - Use 'default: r5g6b5' (Rob)
> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---
>  .../bindings/display/panel/panel-mipi-dbi-spi.yaml | 30 ++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

