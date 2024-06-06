Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 495D78FF622
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 22:55:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AE8D10EA91;
	Thu,  6 Jun 2024 20:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Klky7R6T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA5DB10EA91
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2024 20:55:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id B6AF9CE1C5F;
 Thu,  6 Jun 2024 20:55:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF90C2BD10;
 Thu,  6 Jun 2024 20:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717707307;
 bh=Z8HC3+x9qczXYWa/ofXyj/rI+neSSVhiNEmmwFi1TnM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Klky7R6TvA/SWXm/3TuVDEjMLW3UqxspVLmDYT/2iTA4/7C6i4efRD9ro7cSI/aDp
 XeJppgwIqMwU8TJKQ8Kq2LqDq2GN3EuRN20lpzB6RyAR/A8XvSucBFfIEg1EhMdHwr
 T62FuL+zpYjoyYlOH5DUt9oPeZx1qZ11Omx2ajIYWPct9oxVWI64xE3P1GEu39+xqA
 2eaejkBazyqIckLhLZlvCHR1BdtNQGZyB3b+or6Nt7JI8F0M9MrZPZpivxKEv84vhH
 3LE4SZlLxMVA9BSQ2dAP8UhR9VRPdorkm13Pnh1EIuuMwRs1yIWkotJ5SjPVOKHNFP
 fpyJIKqlJiRVw==
Date: Thu, 6 Jun 2024 14:55:04 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org,
 Caleb Connolly <caleb.connolly@linaro.org>, linux-kernel@vger.kernel.org,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 David Wronek <david@mainlining.org>,
 Daniel Vetter <daniel@ffwll.ch>, Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] dt-bindings: display: panel: constrain 'reg' in DSI
 panels (part two)
Message-ID: <171770730263.3844490.8634760691751503375.robh@kernel.org>
References: <20240605105659.27433-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240605105659.27433-1-krzysztof.kozlowski@linaro.org>
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


On Wed, 05 Jun 2024 12:56:59 +0200, Krzysztof Kozlowski wrote:
> DSI-attached devices could respond to more than one virtual channel
> number, thus their bindings are supposed to constrain the 'reg' property
> to match hardware.  Add missing 'reg' constrain for DSI-attached display
> panels, based on DTS sources in Linux kernel (assume all devices take
> only one channel number).
> 
> Few bindings missed previous fixup: LG SW43408 and Raydium RM69380.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> This should apply on any tree.
> ---
>  .../devicetree/bindings/display/panel/lg,sw43408.yaml        | 4 +++-
>  .../devicetree/bindings/display/panel/raydium,rm69380.yaml   | 5 +++--
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 

Applied, thanks!

