Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BCB21BBE03
	for <lists+dri-devel@lfdr.de>; Tue, 28 Apr 2020 14:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5A86E415;
	Tue, 28 Apr 2020 12:46:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32CFF6E2DE
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Apr 2020 14:00:47 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 06A19C033C;
 Mon, 27 Apr 2020 14:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1587996046; bh=np9+0SGRO5CaLrwr1Pizf5LJopqBu07ZFdqwDx9Fs1Q=;
 h=From:To:Cc:Subject:Date:From;
 b=HIYDC723zkMlQHI8NzCRQP2ThO+woMb/tkOCy8o3bXBb1pa3DpTNV++gMeuQTfsfR
 wQgu0wipPf792I3GgsQYeSrbY0xFR+ElX00w2CalqK+OHuFecp0L5ski6Bb8nPStux
 q0r/JVPCI6cl1d5AhgTsZr7Z+nlB4Kqz+Mf73EGSJRw7uxsDfl4xOCxJjCF/knfFUH
 c7KE0WaCHRqM5LNHyJKOz3S7hegB0cbr0rv7R2ukFLcf36zUXWCtLPH41aQ0xUR1Br
 1I1ticdTJPhYnLjWANpxJsoqS6RTRtnuV4gxEJ8gKoww55MHa69rxhtiOHEPsyLTrV
 /5FTguflHuZUw==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 2C463A005C;
 Mon, 27 Apr 2020 14:00:41 +0000 (UTC)
From: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] drm: Add support for IPK DSI Host Driver
Date: Mon, 27 Apr 2020 16:00:32 +0200
Message-Id: <cover.1587992776.git.angelo.ribeiro@synopsys.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 28 Apr 2020 12:46:22 +0000
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

Adds support for the display subsystem in the Synopsys
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

 .../bindings/display/snps,dw-ipk-dsi.yaml          | 159 ++++++
 .../bindings/display/snps,dw-ipk-vpg.yaml          |  73 +++
 MAINTAINERS                                        |   8 +
 drivers/gpu/drm/Kconfig                            |   2 +
 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/ipk/Kconfig                        |  22 +
 drivers/gpu/drm/ipk/Makefile                       |   6 +
 drivers/gpu/drm/ipk/dw-drv.c                       | 169 +++++++
 drivers/gpu/drm/ipk/dw-ipk.h                       |  26 +
 drivers/gpu/drm/ipk/dw-mipi-dsi-ipk.c              | 557 +++++++++++++++++++++
 drivers/gpu/drm/ipk/dw-vpg.c                       | 412 +++++++++++++++
 drivers/gpu/drm/ipk/dw-vpg.h                       |  48 ++
 12 files changed, 1483 insertions(+)
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
