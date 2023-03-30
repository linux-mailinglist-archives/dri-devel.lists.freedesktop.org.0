Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 264046D0069
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 12:00:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3697010ED85;
	Thu, 30 Mar 2023 10:00:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail11.truemail.it (mail11.truemail.it [IPv6:2001:4b7e:0:8::81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C64610ED95
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 09:59:52 +0000 (UTC)
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it
 [93.49.2.63])
 by mail11.truemail.it (Postfix) with ESMTPA id AD06E20FA7;
 Thu, 30 Mar 2023 11:59:49 +0200 (CEST)
From: Francesco Dolcini <francesco@dolcini.it>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v1 5/6] drm/bridge: tc358768: Add parallel data format cfg
Date: Thu, 30 Mar 2023 11:59:40 +0200
Message-Id: <20230330095941.428122-6-francesco@dolcini.it>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230330095941.428122-1-francesco@dolcini.it>
References: <20230330095941.428122-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add configuration for parallel data format register, tc358768 supports
different mapping on the parallel input RGB interface, enable the
configuration for it.

Valid values, and the related meaning, are:
  0 = R[7:0], G[7:0], B[7:0]
  1 = R[1:0], G[1:0], B[1:0], R[7:2], G[7:2], B[7:2]
  2 = 8’b0, R[4:0], G[5:0], B[4:0]

Use 0 by default, consistently with the HW default.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index f4499ae7bee6..4462264274af 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -854,6 +854,11 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 	if (mode->flags & DRM_MODE_FLAG_PHSYNC)
 		tc358768_update_bits(priv, TC358768_PP_MISC, BIT(0), BIT(0));
 
+	/* PDataF: Parallel Data Format */
+	val = 0;
+	of_property_read_u32(bridge->of_node, "toshiba,input-rgb-mode", &val);
+	tc358768_update_bits(priv, TC358768_CONFCTL, BIT(8) | BIT(9), val << 8);
+
 	/* Start DSI Tx */
 	tc358768_write(priv, TC358768_DSI_START, 0x1);
 
-- 
2.25.1

