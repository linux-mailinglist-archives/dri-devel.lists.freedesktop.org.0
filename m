Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D442AC3ED07
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 08:50:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16B3010E02A;
	Fri,  7 Nov 2025 07:50:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="imw/8Vrn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7268410E02A
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 07:50:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 901AA60143;
 Fri,  7 Nov 2025 07:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3410C4CEF5;
 Fri,  7 Nov 2025 07:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762501845;
 bh=ZXzKa8ciq7q/j+7BGMdEknERpfHO5K+oFihg98YcdwA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=imw/8VrnU5YGb2Z8C1CEjEKTn4GkSaIhA7J8yV/eZA0dJRdpIux3cmE/ecgKoVBgU
 CUfNPW/R2B/3WL+/Wvix8Jwvf28ryX9hpbt+zY2T0P3HkOMqVrfinGx7MJObmHCuEu
 OE3y5C6iH6BNc3U/em1VvLF4O75Ph28WcDQ0nuyVkPf034qPlCUn+kDpdWVRN8u5GJ
 pD1jV+oHOZ7PMrEfMPsuhui25OKYFQ0lGPgoajkdOy4yWhUZu8w05jRgdcxB79v41b
 UyII87fQxMwE2M7tt49BGYWbw8RAFrYHl0s1DeYxYpHLUpdy+HxcOHXnSCk3bIGHiW
 7nPCcLuLAhRMw==
Date: Fri, 7 Nov 2025 08:50:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Swamil Jain <s-jain1@ti.com>
Cc: jyri.sarha@iki.fi, tomi.valkeinen@ideasonboard.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, 
 simona@ffwll.ch, nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 louis.chauvet@bootlin.com, 
 aradhya.bhatia@linux.dev, devarsht@ti.com, praneeth@ti.com, h-shenoy@ti.com, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 2/5] dt-bindings: mfd: syscon: Add
 ti,am625-dss-clk-ctrl
Message-ID: <20251107-ambrosial-soft-grebe-ebaa3b@kuoka>
References: <20251106141227.899054-1-s-jain1@ti.com>
 <20251106141227.899054-3-s-jain1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251106141227.899054-3-s-jain1@ti.com>
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

On Thu, Nov 06, 2025 at 07:42:24PM +0530, Swamil Jain wrote:
> From: Louis Chauvet <louis.chauvet@bootlin.com>
> 
> The dt-bindings for the multi-function device (mfd) syscon need to include
> ti,am625-dss-clk-ctrl. On AM62X, AM62A and AM62P devicess, the display
> controller (tidss) has external registers to control certain clock
> properties. These registers are located in the device configuration
> registers, so they need to be declared using syscon. They will later be
> used with a phandle in the tidss node.
> 
> Fixes: ad2ac9dc9426 ("drm/tidss: Add support for AM625 DSS")
> Fixes: 5cc5ea7b6d7b ("drm/tidss: Add support for AM62A7 DSS")

Adding missing hardware is not a fix. Drop both.

> Cc: stable@vger.kernel.org

For sure not a stable commit. You just add new hardware.

> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> Signed-off-by: Swamil Jain <s-jain1@ti.com>
> ---
>  Documentation/devicetree/bindings/mfd/syscon.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

With these fixed/dropped:

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

