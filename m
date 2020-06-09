Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA871F42DF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 19:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD4FA89D40;
	Tue,  9 Jun 2020 17:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DDFA89D40
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 17:48:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id 132B52A3B67
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v9 00/11] Genericize DW MIPI DSI bridge and add i.MX 6 driver
Date: Tue,  9 Jun 2020 20:49:48 +0300
Message-Id: <20200609174959.955926-1-adrian.ratiu@collabora.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Philippe CORNU <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yannick FERTRE <yannick.fertre@st.com>,
 Andrzej Hajda <a.hajda@samsung.com>, linux-imx@nxp.com, kernel@collabora.com,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[Re-submitting to cc dri-devel, sorry about the noise]

Hello all,

v9 cleanly applies on top of latest next-20200609 tree.

v9 does not depend on other patches as the last binding doc has been merged.

All feedback up to this point has been addressed. Specific details in
individual patch changelogs.

The biggest changes are the deprecation of the Synopsys DW bridge bind()
API in favor of of_drm_find_bridge() and .attach callbacks, the addition
of a TODO entry which outlines future planned bridge driver refactorings
and a reordering of some i.MX 6 patches to appease checkpatch.

The idea behind the TODO is to get this regmap and i.MX 6 driver merged
and then do the rest of refactorings in-tree because it's easier and the
refactorings themselves are out-of-scope of this series which is adding
i.MX 6 support and is quite big already, so please, if there are more
refactoring ideas, let's add them to the TODO doc. :) I intend to tackle
those after this series is merged to avoid two complex inter-dependent
simultaneous series.

As always more testing is welcome especially on Rockchip and STM SoCs.

Big thank you to everyone who has contributed to this up to now,
Adrian

Adrian Ratiu (11):
  drm: bridge: dw_mipi_dsi: add initial regmap infrastructure
  drm: bridge: dw_mipi_dsi: abstract register access using reg_fields
  drm: bridge: dw_mipi_dsi: add dsi v1.01 support
  drm: bridge: dw_mipi_dsi: remove bind/unbind API
  dt-bindings: display: add i.MX6 MIPI DSI host controller doc
  ARM: dts: imx6qdl: add missing mipi dsi properties
  drm: imx: Add i.MX 6 MIPI DSI host platform driver
  drm: stm: dw-mipi-dsi: let the bridge handle the HW version check
  drm: bridge: dw-mipi-dsi: split low power cfg register into fields
  drm: bridge: dw-mipi-dsi: fix bad register field offsets
  Documentation: gpu: todo: Add dw-mipi-dsi consolidation plan

 .../display/imx/fsl,mipi-dsi-imx6.yaml        | 112 +++
 Documentation/gpu/todo.rst                    |  25 +
 arch/arm/boot/dts/imx6qdl.dtsi                |   8 +
 drivers/gpu/drm/bridge/synopsys/Kconfig       |   1 +
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 713 ++++++++++++------
 drivers/gpu/drm/imx/Kconfig                   |   8 +
 drivers/gpu/drm/imx/Makefile                  |   1 +
 drivers/gpu/drm/imx/dw_mipi_dsi-imx6.c        | 399 ++++++++++
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   |   7 +-
 drivers/gpu/drm/stm/dw_mipi_dsi-stm.c         |  16 +-
 10 files changed, 1059 insertions(+), 231 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,mipi-dsi-imx6.yaml
 create mode 100644 drivers/gpu/drm/imx/dw_mipi_dsi-imx6.c

-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
