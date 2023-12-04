Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 187598032D2
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 13:33:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3E6010E379;
	Mon,  4 Dec 2023 12:33:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4783710E1BF
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 12:33:24 +0000 (UTC)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
 by fd01.gateway.ufhost.com (Postfix) with ESMTP id 00B9481BB;
 Mon,  4 Dec 2023 20:33:17 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 4 Dec
 2023 20:33:17 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 4 Dec
 2023 20:33:16 +0800
From: Keith Zhao <keith.zhao@starfivetech.com>
To: Keith Zhao <keith.zhao@starfivetech.com>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>
Subject: [v3 0/6] DRM driver for verisilicon
Date: Mon, 4 Dec 2023 20:33:09 +0800
Message-ID: <20231204123315.28456-1-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
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
Cc: aou@eecs.berkeley.edu, suijingfeng@loongson.cn, tzimmermann@suse.de,
 paul.walmsley@sifive.com, mripard@kernel.org, xingyu.wu@starfivetech.com,
 jack.zhu@starfivetech.com, palmer@dabbelt.com,
 krzysztof.kozlowski+dt@linaro.org, william.qiu@starfivetech.com,
 shengyang.chen@starfivetech.com, changhuang.liang@starfivetech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch is a drm driver for Starfive Soc JH7110,
I am sending Drm driver part and HDMI driver part.

We used GEM framework for buffer management,
and for buffer allocation,we use DMA APIs.

the Starfive HDMI servers as interface between a LCD Controller=20
and a HDMI bus.=20
A HDMI TX consists of one HDMI transmitter controller=20
and one HDMI transmitter PHY.
(Sound support is not include in this patch)

This patchset should be applied on next branch.

V1:
Changes since v1:
- Further standardize the yaml file.
- Dts naming convention improved.
- Fix the problem of compiling and loading ko files.
- Use drm new api to automatically manage resources.
- Drop vs_crtc_funcs&vs_plane_funcs, subdivide the plane's help interface=
.
- Reduce the modifiers unused.
- Optimize the hdmi driver code

V2:
Changes since v2:
- fix the error about checking the yaml file.
- match drm driver GEM DMA API.
- Delete the custom crtc property .
- hdmi use drmm_ new api to automatically manage resources.
- update the modifiers comments.
- enabling KASAN, fix the error during removing module=20

V3:
Changes since v3:
- Delete the custom plane property.
- Delete the custom fourcc modifiers.
- Adjust the calculation mode of hdmi pixclock.
- Add match data for dc8200 driver.
- Adjust some magic values.
- Add a simple encoder for dsi output.

Keith Zhao (6):
  dt-bindings: display: Add yamls for JH7110 display system
  riscv: dts: starfive: jh7110: display subsystem
  drm/vs: Register DRM device
  drm/vs: Add KMS crtc&plane
  drm/vs: Add hdmi driver
  drm/vs: simple encoder

 .../starfive/starfive,display-subsystem.yaml  |  104 ++
 .../starfive/starfive,dsi-encoder.yaml        |   92 ++
 .../starfive/starfive,jh7110-dc8200.yaml      |  113 ++
 .../starfive/starfive,jh7110-inno-hdmi.yaml   |   82 ++
 .../soc/starfive/starfive,jh7110-syscon.yaml  |    1 +
 MAINTAINERS                                   |    8 +
 .../jh7110-starfive-visionfive-2.dtsi         |  134 ++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |   49 +
 drivers/gpu/drm/Kconfig                       |    2 +
 drivers/gpu/drm/Makefile                      |    1 +
 drivers/gpu/drm/verisilicon/Kconfig           |   21 +
 drivers/gpu/drm/verisilicon/Makefile          |   12 +
 drivers/gpu/drm/verisilicon/starfive_hdmi.c   |  849 ++++++++++++
 drivers/gpu/drm/verisilicon/starfive_hdmi.h   |  304 +++++
 drivers/gpu/drm/verisilicon/vs_crtc.c         |  208 +++
 drivers/gpu/drm/verisilicon/vs_crtc.h         |   42 +
 drivers/gpu/drm/verisilicon/vs_dc.c           | 1192 +++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_dc.h           |   67 +
 drivers/gpu/drm/verisilicon/vs_dc_hw.c        | 1022 ++++++++++++++
 drivers/gpu/drm/verisilicon/vs_dc_hw.h        |  580 ++++++++
 drivers/gpu/drm/verisilicon/vs_drv.c          |  323 +++++
 drivers/gpu/drm/verisilicon/vs_drv.h          |   46 +
 drivers/gpu/drm/verisilicon/vs_modeset.c      |   39 +
 drivers/gpu/drm/verisilicon/vs_modeset.h      |   10 +
 drivers/gpu/drm/verisilicon/vs_plane.c        |  301 +++++
 drivers/gpu/drm/verisilicon/vs_plane.h        |   39 +
 drivers/gpu/drm/verisilicon/vs_simple_enc.c   |  195 +++
 drivers/gpu/drm/verisilicon/vs_simple_enc.h   |   23 +
 drivers/gpu/drm/verisilicon/vs_type.h         |   69 +
 29 files changed, 5928 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/starfive/st=
arfive,display-subsystem.yaml
 create mode 100644 Documentation/devicetree/bindings/display/starfive/st=
arfive,dsi-encoder.yaml
 create mode 100644 Documentation/devicetree/bindings/display/starfive/st=
arfive,jh7110-dc8200.yaml
 create mode 100644 Documentation/devicetree/bindings/display/starfive/st=
arfive,jh7110-inno-hdmi.yaml
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
 create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_simple_enc.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_simple_enc.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_type.h

--=20
2.34.1

