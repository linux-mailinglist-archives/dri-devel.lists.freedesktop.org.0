Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 674299ECA0E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 11:15:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D54C310EAED;
	Wed, 11 Dec 2024 10:15:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="IKrpu1xP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82D710EAE9
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 10:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733912127;
 bh=ih7Vsnj9ywdYxh7tR2qjlznCSvRVx5lmggLsQKhoolI=;
 h=From:Subject:Date:To:Cc:From;
 b=IKrpu1xPLywnKIeJ53zP0EULAmN3li50hVFXh2h8PoJ56+0TOh8pjicWQRgcPun5N
 wsAtHooBHZH/JsRTU66C/RcxcdXou1sV95/A46QFVTGcvxEvMFYDgMpqapncJLqpCF
 qBYgAK47aPvXfAtPYD/9qaGHUjt9c1Q92YrSql5eqyPEHTA5OHoFd9MugDPVtoaNYn
 5faLjjYOgqmoZcJZwsUEXdAbsoa0v2UG956+pFxY+iGgfhhXffXPa3uunWY8uUh0n/
 KANbkGeQs9Vty3nV9HyH3t7jYFrBVGQTCYs5n0sChEBqy+F30QRb3YYagWlcMyA4o5
 p4qxkd88HP24Q==
Received: from localhost (unknown [188.27.48.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: cristicc)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 1888017E35F5;
 Wed, 11 Dec 2024 11:15:27 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Subject: [PATCH v2 0/5] Improve Rockchip VOP2 display modes handling on
 RK3588 HDMI0
Date: Wed, 11 Dec 2024 12:15:04 +0200
Message-Id: <20241211-vop2-hdmi0-disp-modes-v2-0-471cf5001e45@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAChmWWcC/4WNTQ6CMBBGr0Jm7RhaEMGV9zAs+jPIJMCQ1jQaw
 t2tXMDle8n3vg0iBaYIt2KDQIkjy5JBnwpwo1mehOwzgy51rZRqMMmqcfQzl+g5rjiLp4i26qh
 qVHdt2gHydg008PvoPvrMI8eXhM9xk9TP/ismhSVq68xFeVu3XXt3Mk3GSjBnJzP0+75/AXjGU
 P6+AAAA
X-Change-ID: 20241116-vop2-hdmi0-disp-modes-b39e3619768f
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 FUKAUMI Naoki <naoki@radxa.com>
X-Mailer: b4 0.14.2
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

VOP2 support for RK3588 SoC is currently not capable to handle the full
range of display modes advertised by the connected screens, e.g. it
doesn't cope well with non-integer refresh rates like 59.94, 29.97,
23.98, etc.

There are two HDMI PHYs available on RK3588, each providing a PLL that
can be used by three out of the four VOP2 video ports as an alternative
and more accurate pixel clock source. This is able to correctly handle
all display modes up to 4K@60Hz.

As for the moment HDMI1 output is not supported upstream, the patch
series targets HDMI0 only.

Additionally, note that testing any HDMI 2.0 specific modes, e.g.
4K@60Hz, requires high TMDS clock ratio and scrambling support [1]. The
patch is usable but not yet ready to be submitted - I will handle this
soon.

Thanks,
Cristian

[1] https://gitlab.collabora.com/hardware-enablement/rockchip-3588/linux/-/commits/rk3588-hdmi-bridge-next-20241115

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
Changes in v2:
- Collected Acked-by tag from Rob and Tested-by from Naoki
- Rebased series onto v6.13-rc1
- Link to v1: https://lore.kernel.org/r/20241116-vop2-hdmi0-disp-modes-v1-0-2bca51db4898@collabora.com

---
Cristian Ciocaltea (5):
      dt-bindings: display: vop2: Add optional PLL clock properties
      drm/rockchip: vop2: Drop unnecessary if_pixclk_rate computation
      drm/rockchip: vop2: Improve display modes handling on RK3588 HDMI0
      arm64: dts: rockchip: Enable HDMI0 PHY clk provider on RK3588
      arm64: dts: rockchip: Add HDMI0 PHY PLL clock source to VOP2 on RK3588

 .../bindings/display/rockchip/rockchip-vop2.yaml   |  4 +++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |  7 +++--
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       | 36 +++++++++++++++++++++-
 3 files changed, 44 insertions(+), 3 deletions(-)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20241116-vop2-hdmi0-disp-modes-b39e3619768f

