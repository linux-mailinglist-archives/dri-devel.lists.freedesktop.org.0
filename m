Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DAE91A08FA
	for <lists+dri-devel@lfdr.de>; Tue,  7 Apr 2020 10:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F62A6E5A3;
	Tue,  7 Apr 2020 08:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.73.133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EA766E3C6
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Apr 2020 13:24:31 +0000 (UTC)
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com
 [10.225.0.210])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 1B6E9404BC;
 Mon,  6 Apr 2020 13:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1586179471; bh=xeamFtw2uG08AI9EO53BHEhyv9mLd3kcvfzJrejiJ6g=;
 h=From:To:Cc:Subject:Date:From;
 b=Jm5ZS6KrXGIHPXfYbiq92oTFnvAqU/BcwfDHIUY3/k4CHsgxL/vjOxKWV1su2EWUP
 1AOzyMlC/GQTbvPisDIbdehRlz8MD1fLn6nNl1EsMStEEICwt/Ek/HbqE1evoTAXiN
 CKhvfdwAAmvPs5l4ob40sXK6SCeRs4Ke2KYGpQOuZw7QNkUEY1rmL0KmlIUvqLpY86
 zJBznkW+1sXrHYOQcbu6z7KErU+Npmrl45uUehTgPn607CNrJPk7kWZ0UfqUlqKG33
 20H57rJvXYCrwUVi6rCs1okOaOanDIs9pZQ3kXUxOJbss5hKvWhgWzSEHusJPdFTMO
 tzYq9c953uSbg==
Received: from de02dwia024.internal.synopsys.com
 (de02dwia024.internal.synopsys.com [10.225.19.81])
 by mailhost.synopsys.com (Postfix) with ESMTP id 749B7A005C;
 Mon,  6 Apr 2020 13:24:26 +0000 (UTC)
From: Angelo Ribeiro <Angelo.Ribeiro@synopsys.com>
To: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 airlied@linux.ie, daniel@ffwll.ch, Gustavo.Pimentel@synopsys.com,
 Joao.Pinto@synopsys.com
Subject: [PATCH v2 0/4] drm: Add support for IPK DSI Host Driver
Date: Mon,  6 Apr 2020 15:24:10 +0200
Message-Id: <cover.1586174459.git.angelo.ribeiro@synopsys.com>
X-Mailer: git-send-email 2.7.4
X-Mailman-Approved-At: Tue, 07 Apr 2020 08:09:32 +0000
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

Changes in v2:
  - Fixed dt-bindings issues, see
    https://patchwork.ozlabs.org/patch/1260819/.

Angelo Ribeiro (4):
  dt-bindings: display: Add IPK DSI subsystem bindings
  drm: ipk: Add DRM driver for DesignWare IPK DSI
  drm: ipk: Add extensions for DW MIPI DSI Host driver
  MAINTAINERS: Add IPK MIPI DSI Host driver entry

 .../bindings/display/snps,dw-ipk-dsi.yaml          | 162 ++++++
 .../bindings/display/snps,dw-ipk-vpg.yaml          |  75 +++
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
 12 files changed, 1667 insertions(+)
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
