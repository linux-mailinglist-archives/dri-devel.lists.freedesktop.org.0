Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7021AEAA8B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jun 2025 01:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C13C10E080;
	Thu, 26 Jun 2025 23:24:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XgMvjXc4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F61010E080
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Jun 2025 23:24:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id DD2CA6111F;
 Thu, 26 Jun 2025 23:24:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E3A3C4CEEB;
 Thu, 26 Jun 2025 23:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750980271;
 bh=3iYSIjl6d68LlL0ejDj5mcWaYaC3T+fv98YPCHJ3fTM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XgMvjXc4WdjDgwxyvHc2vg/f6VLnOix6GSsAs0057BSFLwx50Jak4odQh2wiqBlRM
 /DoEOpZ0xrOndlPf2BWV6ocn6lt7KNeq6pl5xFBmnmBSoo7Oyg47UZPtgnUFOsvlm6
 lATCkAR3de9ehf2tRs4vkSCeMwC831j/7XHkql/c3VQiEZgn5aTuQYmrmLNc8hUgf3
 r+nhGKXrRtIfVzKOU3/En+E/yTQZXTdldvQ7zXhx5ZXGWnn9OC87BEeFvd4zKkf9dP
 OUcSsMGTRxsTIdJkH5Nh2veJv/kRIDTvVrBwGFvMTt+jtqibnPgOS3E6BHlRtemQCo
 inTsjBqfaqC8Q==
Date: Thu, 26 Jun 2025 18:24:30 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Andy Yan <andyshrk@163.com>, David Airlie <airlied@gmail.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 linux-arm-kernel@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, stable@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>, kernel@collabora.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH 1/3] dt-bindings: display: vop2: Add optional PLL clock
 property for rk3576
Message-ID: <175098027014.1394278.11992805068398675511.robh@kernel.org>
References: <20250612-rk3576-hdmitx-fix-v1-0-4b11007d8675@collabora.com>
 <20250612-rk3576-hdmitx-fix-v1-1-4b11007d8675@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-rk3576-hdmitx-fix-v1-1-4b11007d8675@collabora.com>
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


On Thu, 12 Jun 2025 00:47:47 +0300, Cristian Ciocaltea wrote:
> As with the RK3588 SoC, RK3576 also allows the use of HDMI PHY PLL as an
> alternative and more accurate pixel clock source for VOP2.
> 
> Document the optional PLL clock property.
> 
> Moreover, given that this is part of a series intended to address some
> recent display problems, provide the appropriate tags to facilitate
> backporting.
> 
> Fixes: c3b7c5a4d7c1 ("dt-bindings: display: vop2: Add rk3576 support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  .../bindings/display/rockchip/rockchip-vop2.yaml   | 56 +++++++++++++++++-----
>  1 file changed, 44 insertions(+), 12 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

