Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7185CD05B94
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 20:04:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487BD10E7B4;
	Thu,  8 Jan 2026 19:04:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="BD6a4vJX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 974A510E7B8
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 19:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
 bh=WBscWiAcWdp/hFnULczKZ/bdY9UUlluznf57AoT+VeU=; b=BD6a4vJXOQQcwp946mh2IuOht6
 QCqrXoCfVvwFYyjRpEyGtotTZjI5gEECIGbVWgYpFVizelst7RqVFw7V6ipRBUFYfFi//vrk4t02L
 lNoyQTwoyh6tdVBIwGrPBP8PfuUrgw6itGx7kyw66jq2iLAcjOai7M3FeJv+sFgRtctCEMgYmLvnb
 x8JqNBdRGMFgDMN3XldtxauDM2KgODhvWrNSBTAwsiCqPKlneKIL76yBa2XnEYfyIwPoF52M62eRo
 KIjeQBcXHdkmxNDvAJrgK/7opHfNwQ3j3hYAUyPcsT2u/A/RapUegEkebxEOeHdfMgMm3QKZkEIdT
 UNqPZt/g==;
Received: from [192.76.154.238] (helo=phil.dip.tu-dresden.de)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vdvJI-001XT5-Fo; Thu, 08 Jan 2026 20:04:41 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Chaoyi Chen <kernel@airkyi.com>
Cc: Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-phy@lists.infradead.org, Chaoyi Chen <chaoyi.chen@rock-chips.com>
Subject: Re: (subset) [PATCH 0/9] drm/rockchip: Introduce Rockchip RK3506 VOP
Date: Thu,  8 Jan 2026 20:04:36 +0100
Message-ID: <176789904486.3303270.3558903343785181315.b4-ty@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251106020632.92-1-kernel@airkyi.com>
References: <20251106020632.92-1-kernel@airkyi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Thu, 06 Nov 2025 10:06:23 +0800, Chaoyi Chen wrote:
> The VOP on rk3506:
> - Support 2 lane MIPI DSI interface, 1.5Gbps/lane.
> - Support RGB interface.
> - Max output resolution is 1280x1280@60fps.
> - WIN1 layer support RGB888/ARGB8888/RGB565.
> - Support Gamma LUT.
> 
> [...]

Applied, thanks!

[3/9] dt-bindings: display: rockchip,dw-mipi-dsi: Add compatible for rk3506
      commit: 3af0f4d5d433921fa399bbe6396221c8a9985869
[4/9] dt-bindings: display: rockchip,vop: Add compatible for rk3506
      commit: 7919273e495b9154cc7e5f7713f002290f4d9597
[7/9] drm/rockchip: dsi: Add support for rk3506
      commit: cabeacc7eadc2d0033a2fc7304dfb900f9a32095
[9/9] drm/rockchip: vop: Add support for rk3506
      commit: ec27500c8f2b65a3be6ce39a5844d6d246d1b2b0

Best regards,
-- 
Heiko Stuebner <heiko@sntech.de>
