Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C3E3E3D91
	for <lists+dri-devel@lfdr.de>; Mon,  9 Aug 2021 03:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7387A898EE;
	Mon,  9 Aug 2021 01:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95018898FD
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Aug 2021 01:35:05 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DCF35466;
 Mon,  9 Aug 2021 03:35:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1628472903;
 bh=VK2CG4rNEAT9j1mhsJUqBacBm2oBByG7p+CUd4pZ8zQ=;
 h=From:To:Cc:Subject:Date:From;
 b=KTMMQnJQ0XMVwyFAJQT0UKiWD0Y9j2LdADlChh+ik1mhpphlC1Q6gzpH0puB/NlAX
 KDuJC8LOeSad8yX8Uwyh45o9o7eLOAAtRO7HnxfqlVmRD3rdDlhU2HVDqd5w7/n2d5
 tHuPqlGsej+RWvGIIIN2jVNn7Z6XRFroS+LMQM6Q=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Michal Simek <michal.simek@xilinx.com>,
 Jianqiang Chen <jianqian@xilinx.com>, Rob Herring <robh+dt@kernel.org>,
 devicetree@vger.kernel.org
Subject: [PATCH 00/36] drm: xlnx: zynqmp_dpsub: Initial live video input
 support
Date: Mon,  9 Aug 2021 04:34:21 +0300
Message-Id: <20210809013457.11266-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
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

Hello,

The DPSUB is the DisplayPort subsystem, a set of hard IP cores found in
the ZynqMP family of SoCs. It combines a DisplayPort encoder, a video
blender with two input channels, and a DMA engine. The zynqmp_dpsub
driver exposes this as a DRM device with one CRTC and two planes.

In addition to those features, the DPSUB can interface with the
programmable logic (PL) found in the ZynqMP SoC. Each input to the video
blender can come from the PL instead of the DMA engine, and the blender
output can also be routed to the PL. This creates a very configurable
device that can accommodate lots of use cases, but it also makes it
difficult to model it as a DRM/KMS device.

This patch series implements initial support for live video inputs, by
restricting the supported use cases to a single live video input. In
that mode, the video blender is configured in pass-through mode, with
the whole DPSUB essentially operating as a DisplayPort encoder only. The
CRTC and plane functions are then implemented by IP cores in the PL.

To support this, the series start with patch 01/36 to model the
connections to the PL in DT using OF graph bindings. This fixes a
historical mistake that forgot to model the connection to the DP
connector in DT.

With that in place, patches 02/36 to 10/36 refactor the driver to turn
the DisplayPort encoder implementation, modelled as a DRM encoder, into
a DRM bridge. Please see individual patches for details. The rework is
internal only, simplifies the code by making use of the DRM bridge
connector helper, but doesn't bring any functional change.

Patches 11/36 to 30/36 continue refactoring of the driver, to cleanly
separate the DRM planes, CRTC, encoder and connector from the DRM bridge
implementation. The goal is to make the latter available to a DRM driver
for the PL display pipeline without registering any DRM device in the
DPSUB driver itself. Patches 31/36 to 34/36 implement this, reading
information about the connection to the PL from the device tree to
decide in which mode to operate.

Finally, patch 35/36 and 36/36 update the ZynqMP core and ZCU106A board
device tree files to create ports and connect the DPSUB to the
DisplayPort connector. I have tested the whole series without these two
patches to ensure that backward compatibility with older DT isn't
broken.

With this series applied, the DPSUB can be used as a DisplayPort encoder
by a PL display pipeline. A careful reviewer may ask me where drivers
for such a display pipelines are, and that would be a very good
question.

PL display pipelines are currently supported in the Xilinx downstream
kernel only, which is something I want to address next. That road will
be full of challenges, as in theory anything can be implemented in the
PL, including pipelines that connect cameras and displays together. If
anynoe is interested in discussing this topic, please let me know.

Laurent Pinchart (36):
  dt-bindings: display: xlnx: zynqmp-dpsub: Add OF graph ports
  drm: xlnx: zynqmp_dpsub: Switch to atomic encoder enable/disable
  drm: xlnx: zynqmp_dpsub: Constify mode argument to function
  drm: xlnx: zynqmp_dpsub: Create DRM bridge to model DP encoder
  drm: xlnx: zynqmp_dpsub: Don't access connector in
    zynqmp_dp_set_format()
  drm: xlnx: zynqmp_dpsub: Move connector registration to bridge attach
  drm: xlnx: zynqmp_dpsub: Move encoder to DPSUB core
  drm: xlnx: zynqmp_dpsub: Attach to the next bridge
  drm: xlnx: zynqmp_dpsub: Use DRM connector bridge helper
  drm: xlnx: zynqmp_dpsub: Report HPD through the bridge
  drm: xlnx: zynqmp_dpsub: Drop unused zynqmp_disp.event field
  drm: xlnx: zynqmp_dpsub: Drop unused zynqmp_disp_format.bus_fmt field
  drm: xlnx: zynqmp_dpsub: Don't pass CRTC to zynqmp_disp_setup_clock()
  drm: xlnx: zynqmp_dpsub: Configure blender in zynqmp_disp_enable()
  drm: xlnx: zynqmp_dpsub: Use local variable in
    zynqmp_disp_layer_update()
  drm: xlnx: zynqmp_dpsub: Pass format info to
    zynqmp_disp_layer_set_format()
  drm: xlnx: zynqmp_dpsub: Remplace hardcoded values with ARRAY_SIZE()
  drm: xlnx: zynqmp_dpsub: Don't use drmm_kcalloc() for temporary data
  drm: xlnx: zynqmp_dpsub: Move pclk from zynqmp_disp to zynqmp_dpsub
  drm: xlnx: zynqmp_dpsub: Move audio clk from zynqmp_disp to
    zynqmp_dpsub
  drm: xlnx: zynqmp_dpsub: Move CRTC to zynqmp_dpsub structure
  drm: xlnx: zynqmp_dpsub: Move planes to zynqmp_dpsub structure
  drm: xlnx: zynqmp_dpsub: Move CRTC handling to zynqmp_kms.c
  drm: xlnx: zynqmp_dpsub: Move planes handling to zynqmp_kms.c
  drm: xlnx: zynqmp_dpsub: Register AUX bus at bridge attach time
  drm: xlnx: zynqmp_dpsub: Move DP bridge init to zynqmp_dp_probe()
  drm: xlnx: zynqmp_dpsub: Manage DP and DISP allocations manually
  drm: xlnx: zynqmp_dpsub: Move all DRM init and cleanup to zynqmp_kms.c
  drm: xlnx: zynqmp_dpsub: Decouple DRM device from zynqmp_dpsub
  drm: xlnx: zynqmp_dpsub: Rename zynqmp_dpsub_handle_vblank with DRM
    prefix
  drm: xlnx: zynqmp_dpsub: Parse DT to find connected ports
  drm: xlnx: zynqmp_dpsub: Allow configuration of layer mode
  drm: xlnx: zynqmp_dpsub: Support operation without DMA engine
  drm: xlnx: zynqmp_dpsub: Add support for live video input
  arm64: dts: zynqmp: Add ports for the DisplayPort subsystem
  arm64: dts: zynqmp: zcu106a: Describe DisplayPort connector

 .../display/xlnx/xlnx,zynqmp-dpsub.yaml       |  67 ++
 .../boot/dts/xilinx/zynqmp-zcu106-revA.dts    |  20 +
 arch/arm64/boot/dts/xilinx/zynqmp.dtsi        |  24 +
 drivers/gpu/drm/xlnx/Makefile                 |   2 +-
 drivers/gpu/drm/xlnx/zynqmp_disp.c            | 646 ++++--------------
 drivers/gpu/drm/xlnx/zynqmp_disp.h            |  48 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c              | 482 +++++++------
 drivers/gpu/drm/xlnx/zynqmp_dp.h              |   4 +-
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c           | 316 +++++----
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h           |  46 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c             | 539 +++++++++++++++
 drivers/gpu/drm/xlnx/zynqmp_kms.h             |  48 ++
 12 files changed, 1343 insertions(+), 899 deletions(-)
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_kms.c
 create mode 100644 drivers/gpu/drm/xlnx/zynqmp_kms.h

-- 
Regards,

Laurent Pinchart

