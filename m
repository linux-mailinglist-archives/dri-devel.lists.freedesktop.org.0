Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 447CDA02451
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jan 2025 12:33:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 707F010E63A;
	Mon,  6 Jan 2025 11:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=8bytes.org header.i=@8bytes.org header.b="s8EREmB2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 515 seconds by postgrey-1.36 at gabe;
 Mon, 06 Jan 2025 11:33:25 UTC
Received: from mail.8bytes.org (mail.8bytes.org [85.214.250.239])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4338610E62D
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jan 2025 11:33:25 +0000 (UTC)
Received: from 8bytes.org (p54921e31.dip0.t-ipconnect.de [84.146.30.49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.8bytes.org (Postfix) with ESMTPSA id 46E6B2E0016;
 Mon,  6 Jan 2025 12:24:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
 s=default; t=1736162687;
 bh=A2VbHCh2nvdE8f5DyLA9vLSAC91A3zhxUCopF+zUwsk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s8EREmB2Oljv3DrxUsRvmMVdnIZeXQOKGmreXPF1w/R8bB/8ImGDiR6Ra4TYb+cLr
 ZEUmRouXeJ8L3ZVWIQhFm0wXAIR9WG1jGXNVFhaii1V3Rt0p+0TJHnCg2yw6Td/2sM
 1ilO4a1IQbNvExxFWnpVZo4xinTJsj/RXfMKH0qK5f2EzMZb7ZrQ9kKw9FNOansmuy
 6pAJsXGw9ssTZu2UaHL/9gyItieOHF4hebKU775HU97zaC7/Fo9PvlpFOrEvP6N6Ny
 eApdlDbnkayhisHkOXTbq7RQyOuwyzrxS3MjSog5MFJFxC+AQ+PVld/RqnRQydX7ci
 pndIhk04I4JbA==
Date: Mon, 6 Jan 2025 12:24:46 +0100
From: Joerg Roedel <joro@8bytes.org>
To: Parthiban Nallathambi <parthiban@linumiz.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH 09/22] iommu: sun50i: make reset control optional
Message-ID: <Z3u9fuZ2n1y3Or_-@8bytes.org>
References: <20241227-a133-display-support-v1-0-13b52f71fb14@linumiz.com>
 <20241227-a133-display-support-v1-9-13b52f71fb14@linumiz.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241227-a133-display-support-v1-9-13b52f71fb14@linumiz.com>
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

On Fri, Dec 27, 2024 at 04:37:56PM +0530, Parthiban Nallathambi wrote:
> A133/A100 SoC doesn't have reset control from the CCU. Get reset
> control line optionally.
> 
> Signed-off-by: Parthiban Nallathambi <parthiban@linumiz.com>
> ---
>  drivers/iommu/sun50i-iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Joerg Roedel <jroedel@suse.de>

