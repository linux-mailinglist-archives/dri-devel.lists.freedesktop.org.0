Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B184146467F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 06:24:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA3E76EAA2;
	Wed,  1 Dec 2021 05:24:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6216EA9F
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Dec 2021 05:24:39 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C1BDA15;
 Wed,  1 Dec 2021 06:24:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1638336277;
 bh=OSsz52hZu3j3ZHtQWF1D4uqb6YzS5bc6/UgC9mxKUCg=;
 h=From:To:Cc:Subject:Date:From;
 b=qAcfhz2UIWSHtPR5L2+9ttkdOsOTsR9b77XFCoWOGapMgRNE62/hDbvvElavMId0+
 y1tQH1pMSebgoFcjyMi59g0SgddJmi60Su3t5uKrs6V4UVYvGTcGO4ee9j3or3NPUs
 4YvrXas7FdCYKhxqEeBweg4u+Lywf3VULK/zKMLo=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/2] R-Car DU: Add DSI encoder driver for V3U
Date: Wed,  1 Dec 2021 07:24:04 +0200
Message-Id: <20211201052406.13074-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
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
Cc: linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
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
 drivers/gpu/drm/rcar-du/Kconfig               |   7 +
 drivers/gpu/drm/rcar-du/Makefile              |   1 +
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c       | 817 ++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h  | 172 ++++
 6 files changed, 1116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi.c
 create mode 100644 drivers/gpu/drm/rcar-du/rcar_mipi_dsi_regs.h


base-commit: c18c8891111bb5e014e144716044991112f16833
-- 
Regards,

Laurent Pinchart

