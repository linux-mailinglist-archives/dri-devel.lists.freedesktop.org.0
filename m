Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8358071FBA4
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jun 2023 10:14:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8768710E62F;
	Fri,  2 Jun 2023 08:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
 by gabe.freedesktop.org (Postfix) with ESMTP id B963710E0C2
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jun 2023 07:46:08 +0000 (UTC)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
 by fd01.gateway.ufhost.com (Postfix) with ESMTP id 546D280E2;
 Fri,  2 Jun 2023 15:40:47 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Jun
 2023 15:40:47 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 2 Jun
 2023 15:40:46 +0800
From: Keith Zhao <keith.zhao@starfivetech.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH 0/9] Add DRM driver for StarFive SoC JH7110
Date: Fri, 2 Jun 2023 15:40:34 +0800
Message-ID: <20230602074043.33872-1-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 02 Jun 2023 08:14:07 +0000
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Zimmermann <tzimmermann@suse.de>, Jagan Teki <jagan@edgeble.ai>, Rob
 Herring <robh+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Keith Zhao <keith.zhao@starfivetech.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Shawn Guo <shawnguo@kernel.org>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series is a DRM driver for StarFive SoC JH7110, which includes a
display controller driver for Verisilicon DC8200 and an HMDI driver.

We use GEM framework for buffer management and allocate memory by=20
using DMA APIs.

The JH7110 display subsystem includes a display controller Verisilicon
DC8200 and an HDMI transmitter. The HDMI TX IP is designed for transmitti=
ng=20
video and audio data from DC8200 to a display device. The HDMI TX IP=20
consists of  the digital controller and the physical layer.

This series does not support HDMI audio driver.

Keith Zhao (9):
  dt-bindings: display: Add yamls for JH7110 display subsystem
  riscv: dts: starfive: jh7110: add dc&hdmi controller node
  drm/verisilicon: Add basic drm driver
  drm/verisilicon: Add gem driver for JH7110 SoC
  drm/verisilicon: Add mode config funcs
  drm/verisilicon: Add drm crtc funcs
  drm/verisilicon: Add drm plane funcs
  drm/verisilicon: Add verisilicon dc controller driver
  drm/verisilicon: Add starfive hdmi driver

 .../display/verisilicon/starfive-hdmi.yaml    |   93 +
 .../display/verisilicon/verisilicon-dc.yaml   |  110 +
 .../display/verisilicon/verisilicon-drm.yaml  |   42 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |    9 +
 .../jh7110-starfive-visionfive-2.dtsi         |   87 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |   46 +
 drivers/gpu/drm/Kconfig                       |    2 +
 drivers/gpu/drm/Makefile                      |    1 +
 drivers/gpu/drm/verisilicon/Kconfig           |   24 +
 drivers/gpu/drm/verisilicon/Makefile          |   13 +
 drivers/gpu/drm/verisilicon/starfive_hdmi.c   |  928 ++++++++
 drivers/gpu/drm/verisilicon/starfive_hdmi.h   |  296 +++
 drivers/gpu/drm/verisilicon/vs_crtc.c         |  388 ++++
 drivers/gpu/drm/verisilicon/vs_crtc.h         |   74 +
 drivers/gpu/drm/verisilicon/vs_dc.c           | 1040 +++++++++
 drivers/gpu/drm/verisilicon/vs_dc.h           |   62 +
 drivers/gpu/drm/verisilicon/vs_dc_hw.c        | 2008 +++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_dc_hw.h        |  496 ++++
 drivers/gpu/drm/verisilicon/vs_drv.c          |  301 +++
 drivers/gpu/drm/verisilicon/vs_drv.h          |   52 +
 drivers/gpu/drm/verisilicon/vs_fb.c           |  181 ++
 drivers/gpu/drm/verisilicon/vs_fb.h           |   15 +
 drivers/gpu/drm/verisilicon/vs_gem.c          |  372 +++
 drivers/gpu/drm/verisilicon/vs_gem.h          |   72 +
 drivers/gpu/drm/verisilicon/vs_plane.c        |  440 ++++
 drivers/gpu/drm/verisilicon/vs_plane.h        |   74 +
 drivers/gpu/drm/verisilicon/vs_type.h         |   72 +
 include/uapi/drm/drm_fourcc.h                 |   83 +
 include/uapi/drm/vs_drm.h                     |   50 +
 30 files changed, 7433 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/verisilicon=
/starfive-hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/verisilicon=
/verisilicon-dc.yaml
 create mode 100644 Documentation/devicetree/bindings/display/verisilicon=
/verisilicon-drm.yaml
 create mode 100644 drivers/gpu/drm/verisilicon/Kconfig
 create mode 100644 drivers/gpu/drm/verisilicon/Makefile
 create mode 100644 drivers/gpu/drm/verisilicon/starfive_hdmi.c
 create mode 100644 drivers/gpu/drm/verisilicon/starfive_hdmi.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_crtc.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_hw.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_dc_hw.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_drv.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_fb.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_fb.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_gem.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_gem.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_type.h
 create mode 100644 include/uapi/drm/vs_drm.h

--=20
2.34.1

