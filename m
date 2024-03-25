Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A00CB88A4B6
	for <lists+dri-devel@lfdr.de>; Mon, 25 Mar 2024 15:36:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0EB210E935;
	Mon, 25 Mar 2024 14:36:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cBu3GFHg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB89110E92B
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Mar 2024 14:36:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CF6886109A;
 Mon, 25 Mar 2024 14:36:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 409D1C433F1;
 Mon, 25 Mar 2024 14:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711377408;
 bh=9Qe/3gikq2clmRBfjTNKgor6Y6DhAn8an5PiAqL/lqs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cBu3GFHgd64EEQ6NHJ6CqPTLWLLzUk1XuaHt9Ll03UYJR+IqIMELoRgvmKxNiw0xO
 Cba4oOz+nYXiGyZoJtbVOPY8qJ5JFSMGY5gMFUmwpAhqWNYZH8iZkQIoHYoywnBjlV
 BAxfA1HE1NWYaSv0WbE2RtLX8LbnglngBbBgYkqQlUydIBKvF3v+nMn5xna2ahYU2k
 AfpNyiBPzEdH1tRV/RniYF9F74eokbYmjZRzk1IcT+s7GJH8PYAsjQ8PQGnuo4t+0i
 A7ODhZOGKH+bKdebrMBNXMstZZYr7IwDpoUwQPt20sykp37tvqjoleOGhGGT8jUXRo
 GTOVpjgQwT71w==
Date: Mon, 25 Mar 2024 09:36:46 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Inki Dae <inki.dae@samsung.com>, devicetree@vger.kernel.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: display: samsung,exynos5-dp: convert to
 DT Schema
Message-ID: <171137740493.3330504.1269871894633902325.robh@kernel.org>
References: <20240313182855.14140-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240313182855.14140-1-krzysztof.kozlowski@linaro.org>
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


On Wed, 13 Mar 2024 19:28:55 +0100, Krzysztof Kozlowski wrote:
> Convert Samsung Exynos5250/5420 SoC Display Port Controller bindings to
> DT schema with a change: add power-domains, already used in DTS.
> 
> This Display Port controller is actually variant of Analogix Display
> Port bridge, however new DT Schema does not reference analogix,dp.yaml,
> because of incompatibilities in the driver.  The analogix,dp.yaml
> expects two ports, input and output, but Linux Exynos DP DRM driver and
> DTS use only one port: output.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v2:
> 1. Document deprecated samsung,hpd-gpios
> ---
>  .../bindings/display/exynos/exynos_dp.txt     | 112 ------------
>  .../display/samsung/samsung,exynos5-dp.yaml   | 163 ++++++++++++++++++
>  2 files changed, 163 insertions(+), 112 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/exynos/exynos_dp.txt
>  create mode 100644 Documentation/devicetree/bindings/display/samsung/samsung,exynos5-dp.yaml
> 

Applied, thanks!

