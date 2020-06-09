Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD98D1F42F8
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jun 2020 19:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9EDC6E320;
	Tue,  9 Jun 2020 17:48:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD73D6E314
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jun 2020 17:48:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: aratiu) with ESMTPSA id B100A2A3B92
From: Adrian Ratiu <adrian.ratiu@collabora.com>
To: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v9 11/11] Documentation: gpu: todo: Add dw-mipi-dsi
 consolidation plan
Date: Tue,  9 Jun 2020 20:49:59 +0300
Message-Id: <20200609174959.955926-12-adrian.ratiu@collabora.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200609174959.955926-1-adrian.ratiu@collabora.com>
References: <20200609174959.955926-1-adrian.ratiu@collabora.com>
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
 Daniel Vetter <daniel.vetter@ffwll.ch>, Philippe CORNU <philippe.cornu@st.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yannick FERTRE <yannick.fertre@st.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, linux-imx@nxp.com,
 kernel@collabora.com, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This documents the longer-term plan to cleanup the dw-mipi-dsi bridge
based drivers after the regmap refactor and i.MX6 driver have landed.

The goal is to get the entire bridge logic in one place and continue
the refactorings under the drm/bridge tree.

Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Adrian Ratiu <adrian.ratiu@collabora.com>
---
 Documentation/gpu/todo.rst | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 658b52f7ffc6c..2b142980a4b16 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -548,6 +548,31 @@ See drivers/gpu/drm/amd/display/TODO for tasks.
 
 Contact: Harry Wentland, Alex Deucher
 
+Reorganize dw-mipi-dsi bridge-based host-controller drivers
+-----------------------------------------------------------
+
+The Synopsys DW MIPI DSI bridge is used by a number of SoC platform drivers
+(STM, Rockchip, i.MX) which don't cleanly encapsulate their bridge logic which
+gets split between the Synopsys bridge (drm/bridge/synopsys/dw-mipi-dsi.c) and
+platform drivers like drm/imx/dw_mipi_dsi-imx6.c by passing around the bridge
+configuration regmap, creating new bridges / daisy chaining in platform drivers,
+duplicating encoder creation, having too much encoder logic instead of using the
+simple encoder interface and so on.
+
+The goal of this rework is to make the dw-mipi-dsi driver a better encapsulated
+bridge by moving all bridge-related logic under drm/bridge, including the SoC
+bindings which chain to the core Synopsys code under drm/bridge/dw-mipi-dsi/
+from which they can be further consolidated and cleaned up.
+
+If this goal proves to be impossible then drm_bridge might not be the correct
+abstraction for these host controllers and unifying their logic into a helper
+library encapsulating a drm_encoder might be more desirable, in other words to
+move away from drm_bridge entirely.
+
+Contact: Adrian Ratiu, Daniel Vetter, Laurent Pinchart
+
+Level: Intermediate
+
 Bootsplash
 ==========
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
