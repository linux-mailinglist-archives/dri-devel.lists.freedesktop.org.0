Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 216594F5812
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 10:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1757110E906;
	Wed,  6 Apr 2022 08:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6789110E32E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 08:47:45 +0000 (UTC)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CA5791A06DE;
 Wed,  6 Apr 2022 10:40:13 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 802B81A129E;
 Wed,  6 Apr 2022 10:40:13 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id
 663E1183AC8A; Wed,  6 Apr 2022 16:40:11 +0800 (+08)
From: Sandor.yu@nxp.com
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com
Subject: [PATCH v1 2/5] drm: bridge: dw_hdmi: enable overflow workaround for
 v2.13a
Date: Wed,  6 Apr 2022 16:48:34 +0800
Message-Id: <5339589121b05c0db7ee4befdc48c7e4ab4f1653.1649230434.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1649230434.git.Sandor.yu@nxp.com>
References: <cover.1649230434.git.Sandor.yu@nxp.com>
In-Reply-To: <cover.1649230434.git.Sandor.yu@nxp.com>
References: <cover.1649230434.git.Sandor.yu@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: Sandor.yu@nxp.com, shengjiu.wang@nxp.com, amuel@sholland.org,
 cai.huoqing@linux.dev, maxime@cerno.tech, hverkuil-cisco@xs4all.nl
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sandor Yu <Sandor.yu@nxp.com>

iMX865 HDMI (v2.13a) have been identified as needing the workaround.
Tests show that one iteration is enough.

Without the workaround, iMX865 HDMI audio may not work
after cable plugout/in, because HDMI mode is not really set in
register HDMI_FC_INVIDCONF.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 4befc104d220..b11577de4836 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2087,9 +2087,9 @@ static void dw_hdmi_clear_overflow(struct dw_hdmi *hdmi)
 	 *
 	 * The number of iterations matters and depends on the HDMI TX revision
 	 * (and possibly on the platform). So far i.MX6Q (v1.30a), i.MX6DL
-	 * (v1.31a) and multiple Allwinner SoCs (v1.32a) have been identified
-	 * as needing the workaround, with 4 iterations for v1.30a and 1
-	 * iteration for others.
+	 * (v1.31a), iMX865(v2.13a) and multiple Allwinner SoCs (v1.32a)
+	 * have been identified as needing the workaround,
+	 * with 4 iterations for v1.30a and 1 iteration for others.
 	 * The Amlogic Meson GX SoCs (v2.01a) have been identified as needing
 	 * the workaround with a single iteration.
 	 * The Rockchip RK3288 SoC (v2.00a) and RK3328/RK3399 SoCs (v2.11a) have
@@ -2106,6 +2106,7 @@ static void dw_hdmi_clear_overflow(struct dw_hdmi *hdmi)
 	case 0x201a:
 	case 0x211a:
 	case 0x212a:
+	case 0x213a:
 		count = 1;
 		break;
 	default:
-- 
2.25.1

