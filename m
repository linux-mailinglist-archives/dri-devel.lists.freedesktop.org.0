Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD70EC75902
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 18:11:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1285C10E78E;
	Thu, 20 Nov 2025 17:11:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c5uFQpvh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD45A10E78E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 17:11:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D723B601D5;
 Thu, 20 Nov 2025 17:11:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA96C4CEF1;
 Thu, 20 Nov 2025 17:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763658681;
 bh=TfM2YGVstdUmq53j7IGiDD+amyYXGtUqIi5XE9Ifz5g=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=c5uFQpvh4EUbZUfHI+5dPnMVhzGhcSvQWpCEZdWd9vKaFLSpJcbsiNlywguxdr/3Q
 2pu7Pn2ytetA9M7shWSXDZfs/I5HVOtl/RQT/Dap0d0gjW/wnBVey2VN99wk3u+CVx
 +POI0wDOrFmOt5lpqkTxQh4eXMgNo+lB21aD2KkGPXOoMT3FCwG547zhHbTyjnwW/6
 5w/9/cnJDPUgPAZx0H4Zgu9G9yCkj3OdamRno+nFbXp1zU0EJDDuHhd3/foxfSH0wa
 MQlAwk7ObCBIBJuRIDY+VEnPTi5QhMCeQ3OlwUIXkAgK3DAkVOnzJpBIa2x9c5IWCH
 EPI5YSHLK0d4Q==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Chaoyi Chen <kernel@airkyi.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-phy@lists.infradead.org, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20251106020632.92-1-kernel@airkyi.com>
References: <20251106020632.92-1-kernel@airkyi.com>
Subject: Re: (subset) [PATCH 0/9] drm/rockchip: Introduce Rockchip RK3506 VOP
Message-Id: <176365867573.207696.11271190998956084830.b4-ty@kernel.org>
Date: Thu, 20 Nov 2025 22:41:15 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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

[2/9] dt-bindings: phy: rockchip-inno-dsidphy: Add compatible for rk3506
      commit: 323c5c05a0a07b931ede1fa0a3396a1a165ed798
[6/9] phy: rockchip: inno-dsidphy: Add support for rk3506
      commit: 785a9d5bb145109558063080ebc9a3e8be86471d

Best regards,
-- 
~Vinod


