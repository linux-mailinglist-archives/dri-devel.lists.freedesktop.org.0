Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 131CEB26CAE
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 18:41:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E252310E8B9;
	Thu, 14 Aug 2025 16:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icenowy.me header.i=uwu@icenowy.me header.b="isWE0l3K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com
 [136.143.188.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E5610E8B9
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 16:41:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1755189675; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=MFiMSUFBzcPyJQfzfi3I/S6DML4BVSDvoL9Lsw/UeEKe8k5sCXoaHuuedjScG4EJf2D3lNqbM6jx1K3uZi8KTmhZ4N4Pv8QAKhx5m+DUGu8dYExELWznw8RA1yKJJ8SLIeZiu1ZtFivZRGDy/hZyIAMcVj8vs8aJ5ZceEue8pis=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1755189675;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=tYr5jhJDJkvIw+fj7xDK3ZbOSE4uzShS1SUkkize5pw=; 
 b=IvV/GLDmncNbKjqCJ8zUTlKZNqiRlXsI7sO5LWhwADqI9QG9zV7/DO1T51TLbqEBvx3Hsyn/bXeNK0WRPVfDQW63z4hEEZsdhDAKqInFi7EytqwHgV6ECSNWVWWcNJnbh0Tj+5HEJKksT4B5X9v0q5Rwua/8B5dbzcPZtIE0dD4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=icenowy.me;
 spf=pass  smtp.mailfrom=uwu@icenowy.me;
 dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755189675; 
 s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=tYr5jhJDJkvIw+fj7xDK3ZbOSE4uzShS1SUkkize5pw=;
 b=isWE0l3Kx6NoGeGN/PVwYi6mz11STftVqqGqBZebJoSZ99B3NQ1ezb+q2dMBnPkY
 AsVOaLSLCdmebhGGR7Zz9nLJGlbLis9Ji9xivSXisipUpwXLjIhuPbVBJjdZxaUuvuK
 Zs7eyRbzO+qdAlBqzuuBXNtCBrp2IiUl3qllb2IBZ6p7979fRe1Jo8uy1evUcvLBDmJ
 Y+0r66XphheK8h9ERmonRSLUB5pmU05VrMfJtETv4A7IFBW51d323HlsaIIdsqDeJM+
 0r+cphiRSZOM7p0RQdHD+avsvjzhvda8iP+KnAH9Usn205tu2rg0rxQRV8Qm7jxzeq2
 sFLb26XyZg==
Received: by mx.zohomail.com with SMTPS id 1755189674180753.6754186286712;
 Thu, 14 Aug 2025 09:41:14 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <fustini@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Yao Zi <ziyao@disroot.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Icenowy Zheng <uwu@icenowy.me>
Subject: [RFC PATCH 0/8] Verisilicon DC8200 driver (and adaption to TH1520)
Date: Fri, 15 Aug 2025 00:40:40 +0800
Message-ID: <20250814164048.2336043-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
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

This patchset tries to add a driver for Verisilicon DC8200 driver, and
demonstrates the driver on T-Head TH1520 with its HDMI output.

This display controller IP is used on StarFive JH7110 too, but as the
HDMI controller used there isn't as common as the DesignWare one, I
choose to use TH1520 in this patchset.

The DC driver is written with other DC-series (mainly DC8000, which is
known to be used on Eswin EIC7700 SoC) display controllers in mind, and
uses the identification registers available on all Vivante branded IPs.
A known exception is DCNano display controller, which is unlikely to be
supported by this driver because of totally different register map and
no known identification registers. (P.S. the in-tree loongson DRM driver
seems to be for some DCNano instances based on the register map.)

The HDMI controller seems to come with some common PHY by Synopsys, the
DesignWare HDMI TX 2.0 PHY. By searching a few register names from the
BSP driver of that PHY, that PHY seems to be used by a in-tree dw-hdmi
glue, rcar_dw_hdmi -- an updated downstream version of rcar_dw_hdmi
contains all 6 registers set here in the th1520-dw-hdmi driver. Some
more suprising thing is that RK3288 uses the same PHY too, but the
in-tree dw_hdmi-rockchip driver writes the configuration data array in a
weird way to reuse the HDMI 3D TX PHY configuring function. It might be
valuable to add common configuring function and configuration data
definition for this HDMI 2.0 PHY too, but the current driver in this
patchset simply duplicated most configuration logic from rcar_dw_hdmi
driver (but with 3 extra configuration registers configured).

This patchset depends on a TH1520 clock fix patchset at [1] and a TH1520
VOSYS reset addition patchset at [2]. The reset addition patchset is
just applied to reset/next, so it might appear in linux-next/master or
not.

[1] https://lore.kernel.org/linux-riscv/20250813072702.2176993-1-uwu@icenowy.me/
[2] https://lore.kernel.org/linux-riscv/20250813081716.2181843-1-uwu@icenowy.me/

Icenowy Zheng (8):
  dt-bindings: vendor-prefixes: add verisilicon
  dt-bindings: display: add versilicon,dc
  drm: verisilicon: add a driver for Verisilicon display controllers
  dt-bindings: display/bridge: add binding for TH1520 HDMI controller
  drm/bridge: add a driver for T-Head TH1520 HDMI controller
  riscv: dts: thead: add DPU and HDMI device tree nodes
  riscv: dts: thead: lichee-pi-4a: enable HDMI
  MAINTAINERS: assign myself as maintainer for verislicon DC driver

 .../display/bridge/thead,th1520-dw-hdmi.yaml  | 120 +++++++
 .../bindings/display/verisilicon,dc.yaml      | 127 +++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   8 +
 .../boot/dts/thead/th1520-lichee-pi-4a.dts    |  25 ++
 arch/riscv/boot/dts/thead/th1520.dtsi         |  70 ++++
 drivers/gpu/drm/Kconfig                       |   2 +
 drivers/gpu/drm/Makefile                      |   1 +
 drivers/gpu/drm/bridge/Kconfig                |  10 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/th1520-dw-hdmi.c       | 170 +++++++++
 drivers/gpu/drm/verisilicon/Kconfig           |  15 +
 drivers/gpu/drm/verisilicon/Makefile          |   5 +
 drivers/gpu/drm/verisilicon/vs_bridge.c       | 330 ++++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_bridge.h       |  40 +++
 drivers/gpu/drm/verisilicon/vs_bridge_regs.h  |  47 +++
 drivers/gpu/drm/verisilicon/vs_crtc.c         | 217 ++++++++++++
 drivers/gpu/drm/verisilicon/vs_crtc.h         |  29 ++
 drivers/gpu/drm/verisilicon/vs_crtc_regs.h    |  60 ++++
 drivers/gpu/drm/verisilicon/vs_dc.c           | 233 +++++++++++++
 drivers/gpu/drm/verisilicon/vs_dc.h           |  39 +++
 drivers/gpu/drm/verisilicon/vs_dc_top_regs.h  |  27 ++
 drivers/gpu/drm/verisilicon/vs_drm.c          | 177 ++++++++++
 drivers/gpu/drm/verisilicon/vs_drm.h          |  29 ++
 drivers/gpu/drm/verisilicon/vs_hwdb.c         | 150 ++++++++
 drivers/gpu/drm/verisilicon/vs_hwdb.h         |  29 ++
 drivers/gpu/drm/verisilicon/vs_plane.c        | 102 ++++++
 drivers/gpu/drm/verisilicon/vs_plane.h        |  68 ++++
 .../gpu/drm/verisilicon/vs_primary_plane.c    | 166 +++++++++
 .../drm/verisilicon/vs_primary_plane_regs.h   |  53 +++
 30 files changed, 2352 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/thead,th1520-dw-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/verisilicon,dc.yaml
 create mode 100644 drivers/gpu/drm/bridge/th1520-dw-hdmi.c
 create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
 create mode 100644 drivers/gpu/drm/verisilicon/Makefile
 create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_bridge_regs.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc_regs.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_top_regs.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_drm.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_drm.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_hwdb.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_hwdb.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_primary_plane.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_primary_plane_regs.h

-- 
2.50.1

