Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DE3B16980
	for <lists+dri-devel@lfdr.de>; Thu, 31 Jul 2025 01:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C6310E461;
	Wed, 30 Jul 2025 23:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t2kOSmy8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25BB710E461
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jul 2025 23:56:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 43467601DC;
 Wed, 30 Jul 2025 23:56:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C36B9C4CEE3;
 Wed, 30 Jul 2025 23:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753919814;
 bh=QZsdIcHWxpI9QDh/Acp10J22Rwmw8P/g++NrOm4SvtA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=t2kOSmy8UhjztMdU71mBZlIUrHgHNdE1WicfZDCRKVDj7r5Gr0Fa+cFH+0t7sYjqe
 0ri4igYvUEyFp35/tO5cNqpvtl8w5CF6GVDv+z9SJSCunjeJl8DqDtURRKLv7c0kbM
 xTGc/JyWp3gbJBMQm6WNO55NVYvPVqWbtyM19f2cNwjs0b5kztu3DeMOHa6xA4f6nN
 2grq5qZ4F37/qft/lbiVpO5apcljhUiSdFYbQrFI+yNc4GoMAKMGMx2CDQpB/IHa8W
 5BIpdQxmGi6JJTwUda2/osXLUwaPh1nlkpYRSvjUFbzJJZZ9mXoKFxMcsuOgrnNmF8
 hY9yZIOO+xKwg==
Date: Wed, 30 Jul 2025 18:56:53 -0500
From: Rob Herring <robh@kernel.org>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: Jyri Sarha <jyri.sarha@iki.fi>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sam Ravnborg <sam@ravnborg.org>,
 Benoit Parrot <bparrot@ti.com>, Lee Jones <lee@kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, thomas.petazzoni@bootlin.com,
 Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 stable@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: display: ti, am65x-dss: Add clk property
 for data edge synchronization
Message-ID: <20250730235653.GA1914482-robh@kernel.org>
References: <20250730-fix-edge-handling-v1-0-1bdfb3fe7922@bootlin.com>
 <20250730-fix-edge-handling-v1-1-1bdfb3fe7922@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730-fix-edge-handling-v1-1-1bdfb3fe7922@bootlin.com>
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

On Wed, Jul 30, 2025 at 07:02:44PM +0200, Louis Chauvet wrote:
> The dt-bindings for the display, specifically ti,am65x-dss, need to
> include a clock property for data edge synchronization. The current
> implementation does not correctly apply the data edge sampling property.
> 
> To address this, synchronization of writes to two different registers is
> required: one in the TIDSS IP (which is already described in the tidss
> node) and one is in the Memory Mapped Control Register Modules (added by
> the previous commit).
> 
> As the Memory Mapped Control Register Modules is located in a different
> IP, we need to use a phandle to write values in its registers.

You can always just lookup the target node by compatible. Then you don't 
need a DT update to solve your problem.

> 
> Fixes: 32a1795f57ee ("drm/tidss: New driver for TI Keystone platform Display SubSystem")
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> ---
> 
> Cc: stable@vger.kernel.org
> ---
>  Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> index 361e9cae6896c1f4d7fa1ec47a6e3a73bca2b102..b9a373b569170332f671416eb7bbc0c83f7b5ea6 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> @@ -133,6 +133,12 @@ properties:
>        and OLDI_CLK_IO_CTRL registers. This property is needed for OLDI
>        interface to work.
>  
> +  ti,clk-ctrl:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      phandle to syscon device node mapping CFG0_CLK_CTRL registers.
> +      This property is needed for proper data sampling edge.
> +
>    max-memory-bandwidth:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> 
> -- 
> 2.50.1
> 
