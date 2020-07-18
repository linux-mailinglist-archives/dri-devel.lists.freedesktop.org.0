Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CCD22475E
	for <lists+dri-devel@lfdr.de>; Sat, 18 Jul 2020 02:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 067476E33C;
	Sat, 18 Jul 2020 00:14:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9276E332
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Jul 2020 00:14:03 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BBFA771D;
 Sat, 18 Jul 2020 02:14:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595031242;
 bh=hd1We5134wc0TBACd+gXD23itIoYs7LgBdqILhnZ/hg=;
 h=From:To:Cc:Subject:Date:From;
 b=wbksfY9bzh1GcayCuvYOIMO/cMe9EZgvVobpoYfQSTI/z/kOrzc6yDRmClJxsUryJ
 LDsU44mcjD+DL7MEXZneHaYDZTMrZvv5BXrPwfiK5qwfv8dbCMnFXqBDr0jV0ur20I
 HlXDhNkh56KLBZAIVJ/gmZGWA+wZ/48LUqQ5/g0c=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v12 0/2] Xilinx ZynqMP DisplayPort Subsystem DRM/KMS driver
Date: Sat, 18 Jul 2020 03:13:45 +0300
Message-Id: <20200718001347.25451-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
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

Here's a new and hopefully last version of the Xilinx ZynqMP DisplayPort
Subsystem driver, the fourth version since I took over v8 of the series
([1]) from Hyun.

This new version is based on top of the dmaengine topic branch that
contains the required dependencies, available at

	git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git topic/xilinx

That branch is itself based directly on top of v5.8-rc1, and has been
merged in the dmaengine -next branch scheduled for v5.9. I have verified
that the result doesn't conflict with drm-next.

DT integration has been stripped out in this version and will be
submitted separately.

The tag that contains this series on top of the required dependencies is
available at

        git://linuxtv.org/pinchartl/media.git drm-xilinx-dpsub-20200718

I will send a pull request shortly.

[1] https://lists.freedesktop.org/archives/dri-devel/2018-July/182477.html

Hyun Kwon (2):
  dt-bindings: display: xlnx: Add ZynqMP DP subsystem bindings
  drm: xlnx: DRM/KMS driver for Xilinx ZynqMP DisplayPort Subsystem

 .../display/xlnx/xlnx,zynqmp-dpsub.yaml       |  174 ++
 MAINTAINERS                                   |    9 +
 drivers/gpu/drm/Kconfig                       |    2 +
 drivers/gpu/drm/Makefile                      |    1 +
 drivers/gpu/drm/xlnx/Kconfig                  |   13 +
 drivers/gpu/drm/xlnx/Makefile                 |    2 +
 drivers/gpu/drm/xlnx/zynqmp_disp.c            | 1697 ++++++++++++++++
 drivers/gpu/drm/xlnx/zynqmp_disp.h            |   42 +
 drivers/gpu/drm/xlnx/zynqmp_disp_regs.h       |  201 ++
 drivers/gpu/drm/xlnx/zynqmp_dp.c              | 1734 +++++++++++++++++
 drivers/gpu/drm/xlnx/zynqmp_dp.h              |   27 +
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c           |  322 +++
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h           |   54 +
 13 files changed, 4278 insertions(+)
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
