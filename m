Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6052976B075
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 12:10:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BFE10E38E;
	Tue,  1 Aug 2023 10:10:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ex01.ufhost.com (ex01.ufhost.com [61.152.239.75])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9E77610E388
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 10:10:38 +0000 (UTC)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
 by ex01.ufhost.com (Postfix) with ESMTP id E7FDA24E231;
 Tue,  1 Aug 2023 18:10:32 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 1 Aug
 2023 18:10:32 +0800
Received: from xiaofei.localdomain (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 1 Aug
 2023 18:10:32 +0800
From: Keith Zhao <keith.zhao@starfivetech.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
 <linux-media@vger.kernel.org>, <linaro-mm-sig@lists.linaro.org>
Subject: [PATCH v1 v1 0/7] DRM driver for verisilicon
Date: Tue, 1 Aug 2023 18:10:23 +0800
Message-ID: <20230801101030.2040-1-keith.zhao@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX061.cuchost.com
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Jagan Teki <jagan@edgeble.ai>, Rob
 Herring <robh+dt@kernel.org>, Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Keith Zhao <keith.zhao@starfivetech.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Shawn Guo <shawnguo@kernel.org>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch is a drm driver for Starfive Soc JH7110,
I am sending Drm driver part and HDMI driver part.

We used GEM framework for buffer management , and=20
for buffer allocation,we use DMA APIs.

the Starfive HDMI servers as interface between a LCD=20
Controller and a HDMI bus. A HDMI TX consists of one=20
HDMI transmitter controller and one HDMI transmitter PHY.
(Sound support is not include in this patch)

This patchset should be applied after the patchset:
https://patchwork.kernel.org/project/linux-clk/cover/20230713113902.56519=
-1-xingyu.wu@starfivetech.com/

V1:
Changes since v1:
- Further standardize the yaml file.
- Dts naming convention improved.
- Fix the problem of compiling and loading ko files.
- Use drm new api to automatically manage resources.
- Drop struct vs_crtc_funcs&vs_plane_funcs=EF=BC=8Csubdivide the plane's =
help interface
- Reduce the modifiers unused.
- Optimize the hdmi driver code

Keith Zhao (7):
  MAINTAINERS: Update starfive maintainers
  dt-bindings: display: Add yamls for JH7110 display system
  riscv: dts: starfive: jh7110: add dc controller and hdmi  node
  drm/fourcc: Add drm/vs tiled modifiers
  drm/vs: Register DRM device
  drm/vs: Add KMS crtc&plane
  drm/vs: Add hdmi

 .../starfive/starfive,display-subsystem.yaml  |   41 +
 .../starfive/starfive,jh7110-dc8200.yaml      |  107 +
 .../starfive/starfive,jh7110-inno-hdmi.yaml   |   92 +
 MAINTAINERS                                   |    7 +
 .../jh7110-starfive-visionfive-2.dtsi         |   87 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |   43 +
 drivers/gpu/drm/Kconfig                       |    2 +
 drivers/gpu/drm/Makefile                      |    1 +
 drivers/gpu/drm/verisilicon/Kconfig           |   25 +
 drivers/gpu/drm/verisilicon/Makefile          |   13 +
 drivers/gpu/drm/verisilicon/starfive_hdmi.c   |  940 ++++++++
 drivers/gpu/drm/verisilicon/starfive_hdmi.h   |  295 +++
 drivers/gpu/drm/verisilicon/vs_crtc.c         |  365 +++
 drivers/gpu/drm/verisilicon/vs_crtc.h         |   54 +
 drivers/gpu/drm/verisilicon/vs_dc.c           | 1036 +++++++++
 drivers/gpu/drm/verisilicon/vs_dc.h           |   87 +
 drivers/gpu/drm/verisilicon/vs_dc_hw.c        | 2008 +++++++++++++++++
 drivers/gpu/drm/verisilicon/vs_dc_hw.h        |  496 ++++
 drivers/gpu/drm/verisilicon/vs_drv.c          |  274 +++
 drivers/gpu/drm/verisilicon/vs_drv.h          |   54 +
 drivers/gpu/drm/verisilicon/vs_gem.c          |  298 +++
 drivers/gpu/drm/verisilicon/vs_gem.h          |   50 +
 drivers/gpu/drm/verisilicon/vs_modeset.c      |   92 +
 drivers/gpu/drm/verisilicon/vs_modeset.h      |   13 +
 drivers/gpu/drm/verisilicon/vs_plane.c        |  502 +++++
 drivers/gpu/drm/verisilicon/vs_plane.h        |   65 +
 drivers/gpu/drm/verisilicon/vs_type.h         |   70 +
 include/uapi/drm/drm_fourcc.h                 |   27 +
 include/uapi/drm/vs_drm.h                     |   50 +
 29 files changed, 7194 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/starfive/st=
arfive,display-subsystem.yaml
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
 create mode 100644 drivers/gpu/drm/verisilicon/vs_gem.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_gem.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_modeset.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.c
 create mode 100644 drivers/gpu/drm/verisilicon/vs_plane.h
 create mode 100644 drivers/gpu/drm/verisilicon/vs_type.h
 create mode 100644 include/uapi/drm/vs_drm.h

--=20
2.34.1

