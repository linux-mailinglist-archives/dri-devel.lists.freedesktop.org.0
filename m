Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A92CA3B1BC3
	for <lists+dri-devel@lfdr.de>; Wed, 23 Jun 2021 15:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0436E8F7;
	Wed, 23 Jun 2021 13:57:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D49C6E8F0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Jun 2021 13:57:13 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DBE348B6;
 Wed, 23 Jun 2021 15:57:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1624456632;
 bh=GEx8uiIOnApr4OXxJ6reuG9i7sC2s5RjkNiSXbR8EwE=;
 h=From:To:Cc:Subject:Date:From;
 b=nFSXJKvYoHdQX9aAnlD+NzZFfuAKKe306ROvBMu+Ws+CdCHCPBk3tITlKvzJf4T+Q
 jQX7z1/WukX18JPY0vcNVV8Rdnqr5PgyZG4V5eVDOqz1N2TmIp4rDOBrjhbh36h4bV
 5KChax0lkLPCzHy5XzhBpf10c6EyYAzDSGB1GrTM=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] R-Car DU: Add DSI encoder driver for V3U
Date: Wed, 23 Jun 2021 16:56:37 +0300
Message-Id: <20210623135639.17125-1-laurent.pinchart+renesas@ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

This patch series adds a driver for the DSI encoder found in the R-Car
V3U SoC, which is the first SoC in the family that supports DSI.

The driver is based on an implementation from the BSP written by Luu
Hoai, with lots of further rework. If anyone is interested in the
history, a broken down v1 is available from [1].

The driver has been successfully tested on the Falcon board, which
connects an SN65DSI86 to the output of the DSI encoder. Further patches
are needed for the ti-sn65dsi86 driver to enable usage in plain DP
(non-eDP) mode, as the Falcon board has a mini-DP connector wired to the
output of the SN65DSI86. This is work in progress (see [2]).

[1] https://lore.kernel.org/linux-renesas-soc/189c7a07-29cd-39f4-1dec-56aa94c11fba@ideasonboard.com/T/#mafbe130386cbc8326f85cad46860813516ef4a80
[2] https://lore.kernel.org/linux-renesas-soc/20210322030128.2283-1-laurent.pinchart+renesas@ideasonboard.com/

LUU HOAI (1):
  drm: rcar-du: Add R-Car DSI driver

Laurent Pinchart (1):
  dt-bindings: display: bridge: Add binding for R-Car MIPI DSI/CSI-2 TX

 .../display/bridge/renesas,dsi-csi2-tx.yaml   | 118 +++
 MAINTAINERS                                   |   1 +
 drivers/gpu/drm/rcar-du/Kconfig               |   6 +
 drivers/gpu/drm/rcar-du/Makefile              |   1 +
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c       | 827 ++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h  | 172 ++++
 6 files changed, 1125 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h

-- 
Regards,

Laurent Pinchart

