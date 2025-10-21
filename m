Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 223EEBF503D
	for <lists+dri-devel@lfdr.de>; Tue, 21 Oct 2025 09:43:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 222B810E587;
	Tue, 21 Oct 2025 07:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="XSIgqbQ8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6123A10E586
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Oct 2025 07:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
 bh=UxK1OP46sV11zbhWQ+0/zP7tImTHzu011gOU5DK+oxg=; b=XSIgqbQ8NchDx3T8OcaMUkhoS2
 Ql52y6+JPPw8y/0PzCt+36TBG54fvqr7vQmQcEbGB3X6iYlpgv5HpLlqKo7TIE9FX4FOu5bh8cHk2
 wa/yDCXV8GCgC8RN2z8GU5wqw+vdr5ZfmrV0m5AM7wO4LizdR5SLXEbUDQ+jom7RkSnyaJOpLMX2g
 6QYDmIh/aXNzPd8cBJSFnhjqVBejlIxeKYfAYqFAVYvfgpKVFJBz2vT7v6aVmGLrLnDRZ+wyWcTbL
 A2kvYtJYWrOSjSWbxijjZ5QNCa7Li87XIrXjtbnU4iQ4wEjCPXc0ZzTstz7TyI/s6pVxwesA6jP33
 ahp/mnhA==;
Received: from [212.111.240.218] (helo=phil.guestnet.ukdd.de)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1vB71M-0000uy-8P; Tue, 21 Oct 2025 09:43:04 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 quentin.schulz@cherry.de, andy.yan@rock-chips.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, cn.liweihao@gmail.com
Subject: [PATCH v2 0/9] General RK3368 HDMI support and 2 outputs for
 RK3368-Lion
Date: Tue, 21 Oct 2025 09:42:45 +0200
Message-ID: <20251021074254.87065-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
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

This series adds the necessary bits for HDMI output on RK3368 and enables
this on RK3368-Lion. At the same time, use the recently added DSI support
to enable the generic Video-Demo-adapter as an overlay on Lion as well.


The reason I'm shaving this Yak is that the recently added DSI support
created DTC warnings about a single endpoint with an address.

So it was either removing the @0 from the endpoint, or adding a second
output option :-) .

changes in v2:
- pick up Conor's Ack for the compatible
- fix the spelling errors reported by Diederik

Heiko Stuebner (9):
  dt-bindings: display: rockchip: dw-hdmi: Add compatible for RK3368
    HDMI
  drm/rockchip: hdmi: add RK3368 controller variant
  soc: rockchip: grf: Add select correct PWM implementation on RK3368
  arm64: dts: rockchip: Add power-domain to RK3368 DSI controller
  arm64: dts: rockchip: Add power-domain to RK3368 VOP controller
  arm64: dts: rockchip: Use phandle for i2c_lvds_blc on rk3368-lion
    haikou
  arm64: dts: rockchip: Add HDMI node to RK3368
  arm64: dts: rockchip: Enable HDMI output on RK3368-Lion-Haikou
  arm64: dts: rockchip: Add the Video-Demo overlay for Lion Haikou

 .../display/rockchip/rockchip,dw-hdmi.yaml    |   1 +
 arch/arm64/boot/dts/rockchip/Makefile         |   5 +
 .../rk3368-lion-haikou-video-demo.dtso        | 174 ++++++++++++++++++
 .../boot/dts/rockchip/rk3368-lion-haikou.dts  |  36 +++-
 arch/arm64/boot/dts/rockchip/rk3368.dtsi      |  45 +++++
 drivers/gpu/drm/rockchip/dw_hdmi-rockchip.c   |  16 ++
 drivers/soc/rockchip/grf.c                    |   1 +
 7 files changed, 268 insertions(+), 10 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3368-lion-haikou-video-demo.dtso

-- 
2.47.2

