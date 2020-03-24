Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A4C19225D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Mar 2020 09:16:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C72A6E58E;
	Wed, 25 Mar 2020 08:16:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CB3E6E4FF
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Mar 2020 17:26:54 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost1.synopsys.com
 [10.225.0.209])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id E3BD74050A;
 Tue, 24 Mar 2020 17:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1585070357; bh=5jpnq54XJHVyKdtK2ilj2VKnRPLNG0vB+S9snG16b+o=;
 h=From:To:Cc:Subject:Date:From;
 b=Z6mHaE2EPkseUJzW3ecM6rDhihFKYmeEXlQFWTNaPW/mi23fOlrG3Kpfp627zcdua
 1uYxvN3odnDj3BvxDCOf53kQeur9CXvGSQgClV0MTpE8pQ61OJQCWuxo7wytHm2wwH
 AznVO7gFKzaP69emDCLoTMGz64YUAd3gLoLFX8s3Xsj6xuBsZHLDx68bZKvUXPdBx0
 SRID1z1Z5YOnC5YC9brN1yjAC0DM7/BXX5mOn4TDjWzmUgXKzg5UojvNepcoBCXMuq
 fDbILVxcPlaxCFeVA1wauKngEH7EEr2qtx1jtpSN1so1T0DgTo8eshuZTrVrDrMYep
 ZzCz492Rf91zw==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 66A45A005B;
 Tue, 24 Mar 2020 17:19:14 +0000 (UTC)
From: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] drm: Add support for IPK DSI Host Driver
Date: Tue, 24 Mar 2020 18:18:18 +0100
Message-Id: <cover.1585067507.git.angelo.ribeiro@synopsys.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Wed, 25 Mar 2020 08:16:37 +0000
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
Cc: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This patch series adds support for the display subsystem in the Synopsys
DesignWare IPK devices.

The display pipeline is limited and does not have access to memory, the
validation is done using a VPG (Video Pattern Generator), as DPI
stimulus for the DW MIPI DSI Host.

A Synopsys DesignWare MIPI DSI Host v1.40 is used in the IPK device, that
so far, is fully compatible with the driver dw-mipi-dsi.

To activate the VPG use the sysfs pattern variable, assigning values from
0 (shutdown) to 4. The usage of the VPG and the Synopsys DesignWare MIPI
DSI Host internal video generator is mutually exclusive.

The submission of this driver aims to be used as a work base for the
submission of enhancements over the Synopsys DesignWare MIPI DSI Host.

Angelo Ribeiro (4):
  dt-bindings: display: Add IPK DSI subsystem bindings
  drm: ipk: Add DRM driver for DesignWare IPK DSI
  drm: ipk: Add extensions for DW MIPI DSI Host driver
  MAINTAINERS: Add IPK MIPI DSI Host driver entry

 .../bindings/display/snps,dw-ipk-dsi.yaml          | 163 ++++++
 .../bindings/display/snps,dw-ipk-vpg.yaml          |  77 +++
 MAINTAINERS                                        |   8 +
 drivers/gpu/drm/Kconfig                            |   2 +
 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/ipk/Kconfig                        |  22 +
 drivers/gpu/drm/ipk/Makefile                       |   8 +
 drivers/gpu/drm/ipk/dw-drv.c                       | 189 +++++++
 drivers/gpu/drm/ipk/dw-ipk.h                       |  30 ++
 drivers/gpu/drm/ipk/dw-mipi-dsi-ipk.c              | 556 ++++++++++++++++++++
 drivers/gpu/drm/ipk/dw-vpg.c                       | 559 +++++++++++++++++++++
 drivers/gpu/drm/ipk/dw-vpg.h                       |  55 ++
 12 files changed, 1670 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/snps,dw-ipk-dsi.yaml
 create mode 100644 Documentation/devicetree/bindings/display/snps,dw-ipk-vpg.yaml
 create mode 100644 drivers/gpu/drm/ipk/Kconfig
 create mode 100644 drivers/gpu/drm/ipk/Makefile
 create mode 100644 drivers/gpu/drm/ipk/dw-drv.c
 create mode 100644 drivers/gpu/drm/ipk/dw-ipk.h
 create mode 100644 drivers/gpu/drm/ipk/dw-mipi-dsi-ipk.c
 create mode 100644 drivers/gpu/drm/ipk/dw-vpg.c
 create mode 100644 drivers/gpu/drm/ipk/dw-vpg.h

-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
