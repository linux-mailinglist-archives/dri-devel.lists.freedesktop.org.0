Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8A2189FC8
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 16:37:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76F846E8E9;
	Wed, 18 Mar 2020 15:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20BF66E8E9
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 15:37:40 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EDD74F9;
 Wed, 18 Mar 2020 16:37:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1584545858;
 bh=ca1Q/xaraWqcFRoYzOwcS30iSOqRhIos7U6A4lE3978=;
 h=From:To:Cc:Subject:Date:From;
 b=nlYQA6rkg3PS5dsv59ov7fqxPi9F9x4Rbog4LRd/0dbFbNfSEs6TlqIr8aF9Ym3i7
 2tP7Hqy3N/aS/BendnBlnx8SnZBDq/FFHPBIpn5Us1gFrpxQRYvkFKNYu3XmqEgOd+
 poX0LvywqGtem12FapcUD/RVGsIspsQv8Tje+EvI=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v11 0/5] Xilinx ZynqMP DisplayPort Subsystem DRM/KMS driver
Date: Wed, 18 Mar 2020 17:37:23 +0200
Message-Id: <20200318153728.25843-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: Michal Simek <michal.simek@xilinx.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Satish Kumar Nagireddy <SATISHNA@xilinx.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

Here's a new version of the Xilinx ZynqMP DisplayPort Subsystem driver,
the third version since I took over v8 of the series ([1]) from Hyun.

This new version is rebased on top of the DMA engine and PHY driver
changes. In particular, it uses the new interleaved cyclic DMA
transaction type
and the PHY .configure() and .power_on() operations. It
also includes reset support, which was moved out the PHY driver to the
DPSUB driver where it belongs. The DT bindings are updated accordingly.

The series depends on currently out-of-tree DMA engine ([2]) and PHY
([3]) drivers that have been posted to the corresponding mailing lists
but not merged yet. I have taken over development of both drivers, and
hope to get them upstream without too much delay. As the DRM DPSUB driver
depends on DMA engine API extensions, I plan to request a stable branch
from Vinod in order to avoid a one kernel version delay.

A branch that contains this series on top of the required dependencies
is available at

        git://linuxtv.org/pinchartl/media.git drm/dpsub/next

[1] https://lists.freedesktop.org/archives/dri-devel/2018-July/182477.html
[2] https://lore.kernel.org/dmaengine/20200123022939.9739-1-laurent.pinchart@ideasonboard.com/
[3] https://lore.kernel.org/lkml/20200311103252.17514-1-laurent.pinchart@ideasonboard.com/

Hyun Kwon (2):
  dt-bindings: display: xlnx: Add ZynqMP DP subsystem bindings
  drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem

Laurent Pinchart (3):
  arm64: dts: zynqmp: Add reset controller
  arm64: dts: zynqmp: Add DisplayPort subsystem
  arm64: dts: zynqmp: zcu106-revA: Wire up the DisplayPort subsystem

 .../display/xlnx/xlnx,zynqmp-dpsub.yaml       |  174 ++
 MAINTAINERS                                   |    9 +
 .../arm64/boot/dts/xilinx/zynqmp-clk-ccf.dtsi |    6 +
 .../boot/dts/xilinx/zynqmp-zcu106-revA.dts    |   29 +
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi        |   29 +
 drivers/gpu/drm/Kconfig                       |    2 +
 drivers/gpu/drm/Makefile                      |    1 +
 drivers/gpu/drm/xlnx/Kconfig                  |   13 +
 drivers/gpu/drm/xlnx/Makefile                 |    2 +
 drivers/gpu/drm/xlnx/zynqmp_disp.c            | 1708 ++++++++++++++++
 drivers/gpu/drm/xlnx/zynqmp_disp.h            |   43 +
 drivers/gpu/drm/xlnx/zynqmp_disp_regs.h       |  201 ++
 drivers/gpu/drm/xlnx/zynqmp_dp.c              | 1742 +++++++++++++++++
 drivers/gpu/drm/xlnx/zynqmp_dp.h              |   29 +
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c           |  330 ++++
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h           |   49 +
 16 files changed, 4367 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/xlnx/xlnx,zynqmp-dpsub.yaml
 create mode 100644 drivers/gpu/drm/xlnx/Kconfig
 create mode 100644 drivers/gpu/drm/xlnx/Makefile
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_disp.c
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_disp.h
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_dp.c
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_dp.h
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_dpsub.c
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_dpsub.h

-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
