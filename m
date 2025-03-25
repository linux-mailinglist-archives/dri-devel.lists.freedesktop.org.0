Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0176AA701CB
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 14:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1D4310E39B;
	Tue, 25 Mar 2025 13:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="dxreNc9c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id A20F110E39B
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 13:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=3ucf6
 AoqLVgzdE7q3wAWYQlze/5NWs4H0gsNuLMxD1E=; b=dxreNc9ccopxYG01xgXf4
 /H+rax6ja1dbu4x7Tml1Gi1mxwvl30pxLoNj8lu5dvHci2tyvABU8VUrjHWs3gO3
 G640giOhtilpMw/LxyvgFB05eTSoSBwoUP7oZ5Tm6xPGTKminiwCeq6njim3Yozm
 +3B1a/roYWau4zgGiwIEzQ=
Received: from ProDesk.. (unknown [])
 by gzsmtp4 (Coremail) with SMTP id PygvCgAnc2bLr+JnWNnrAA--.35530S2;
 Tue, 25 Mar 2025 21:29:51 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: conor+dt@kernel.org, krzk+dt@kernel.org, robh@kernel.org,
 hjc@rock-chips.com, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 0/6] Two fixes of RK3036 HDMI
Date: Tue, 25 Mar 2025 21:29:34 +0800
Message-ID: <20250325132944.171111-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PygvCgAnc2bLr+JnWNnrAA--.35530S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF47WFy5uF1rJF4fGr48JFb_yoW8XF1kpa
 98Ca98Xrn7G3WSqrnIyF4kAFWYyF95Gan5GrWfJw1xAr4Ygw1IvryagwsYvFn8C3WxZasF
 yw18KFWUCrs7Z3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j1HqcUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0g0bXmfirF9iZQAAsr
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

From: Andy Yan <andy.yan@rock-chips.com>

When preparing to convert the current inno hdmi driver into a bridge driver,
I found that there are several issues currently existing with it:

1. When the system starts up, the first time it reads the EDID, it will
   fail.
   This is because RK3036 HDMI DDC bus requires it's PHY's reference clock
   to be enabled first before normal DDC communication can be carried out.

2. The signal is unstable. When running the glmark2 test on the screen,
   there is a small probability of seeing some screen flickering.
   This is because The HSYNC/VSYNC polarity of rk3036 HDMI are controlled
   by GRF. This part is missing in the current driver.

This series first try to Fix Document in the dt-binding, then add the
missing part in driver and dts.

Changes in v2:
- Included the HSYNC/VSYNC polarity fix

Andy Yan (6):
  dt-bindings: display: rockchip,inno-hdmi: Fix Document of RK3036
    compatible
  dt-bindings: display: rockchip,inno-hdmi: Document GRF for RK3036 HDMI
  drm/rockchip: inno-hdmi: Simplify error handler with dev_err_probe
  drm/rockchip: inno-hdmi: Fix video timing HSYNC/VSYNC polarity setting
    for rk3036
  ARM: dts: rockchip: Add ref clk for hdmi
  Revert "ARM: dts: rockchip: drop grf reference from rk3036 hdmi"

 .../display/rockchip/rockchip,inno-hdmi.yaml  | 20 ++++---
 arch/arm/boot/dts/rockchip/rk3036.dtsi        |  5 +-
 drivers/gpu/drm/rockchip/inno_hdmi.c          | 55 ++++++++++++++-----
 3 files changed, 55 insertions(+), 25 deletions(-)

-- 
2.43.0

