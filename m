Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5E3BB37514
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 00:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF48210E2F7;
	Tue, 26 Aug 2025 22:52:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nrCrDouQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83EB710E2F7
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Aug 2025 22:52:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7A10360228;
 Tue, 26 Aug 2025 22:52:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 142D1C4CEF1;
 Tue, 26 Aug 2025 22:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756248745;
 bh=UCUr8OIeqwKQ6JXL0ui3NgRUlTa2WSOoL5P1WHpO7Y0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nrCrDouQ3BoLbyAbNa79IzIiNd0FybLkY069TZ6rHUrtALlmDAd5r4nGSUBjkta10
 sOS5Gxqyi9SekHkp1lpq9kauzSBslGiEvAvG2A97culHlxe0oSEyAq1Av8VB6VUHLS
 t2Rpq5dHbHi9C+Vrow2s0Lauaok9Im8pBWzTOOAKiCXzl1delJRUP/4rqUZf/w7iVN
 WR+NHYreVnAlBwcYqk6WLRlkWnqDwYkJCoxLHwqC+nVWkIZp2s/o/H6qt13xB0zx3l
 dA8/Ano1P4+TK+pRGrUEImxp+OCh4uTRgEJuHMxYkgmiSySMT4a/V9wigJlA8XZMYw
 fTQRGzbD9Wc1A==
Date: Tue, 26 Aug 2025 17:52:23 -0500
From: Rob Herring <robh@kernel.org>
To: Harikrishna Shenoy <h-shenoy@ti.com>
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 krzk+dt@kernel.org, conor+dt@kernel.org, linus.walleij@linaro.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: display: dsi-controller: add bridge to
 patternProperties
Message-ID: <20250826225223.GA612738-robh@kernel.org>
References: <20250822182352.2006834-1-h-shenoy@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822182352.2006834-1-h-shenoy@ti.com>
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

On Fri, Aug 22, 2025 at 11:53:52PM +0530, Harikrishna Shenoy wrote:
> This patch extends the binding schema by adding a new `bridge@[0-3]` to

Use imperative mood. See submitting-patches.rst.

> represent any bridge devices attached as DSI peripheral.
> 
> Signed-off-by: Harikrishna Shenoy <h-shenoy@ti.com>
> ---
>  .../bindings/display/dsi-controller.yaml       | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/dsi-controller.yaml b/Documentation/devicetree/bindings/display/dsi-controller.yaml
> index 67ce10307ee0..d7ca700070a9 100644
> --- a/Documentation/devicetree/bindings/display/dsi-controller.yaml
> +++ b/Documentation/devicetree/bindings/display/dsi-controller.yaml
> @@ -73,6 +73,24 @@ patternProperties:
>      required:
>        - reg
>  
> +  "^bridge@[0-3]$":

Rather than duplicating all this, just change 
the above entry to: '^(panel|bridge)@[0-3]$'

> +    description: Bridge connected to the DSI link
> +    type: object
> +
> +    properties:
> +      reg:
> +        minimum: 0
> +        maximum: 3
> +        description:
> +          The virtual channel number of a DSI peripheral. Must be in the range
> +          from 0 to 3, as DSI uses a 2-bit addressing scheme. Some DSI
> +          peripherals respond to more than a single virtual channel. In that
> +          case the reg property can take multiple entries, one for each virtual
> +          channel that the peripheral responds to.
> +
> +    required:
> +      - reg
> +
>  additionalProperties: true
>  
>  examples:
> -- 
> 2.34.1
> 
