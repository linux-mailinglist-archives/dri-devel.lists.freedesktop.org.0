Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9737C881216
	for <lists+dri-devel@lfdr.de>; Wed, 20 Mar 2024 14:13:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2353E10FA40;
	Wed, 20 Mar 2024 13:12:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED6B10FA32
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Mar 2024 13:12:55 +0000 (UTC)
Received: from [194.95.143.137] (helo=phil.dip.tu-dresden.de)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1rmvkC-0001W6-Am; Wed, 20 Mar 2024 14:12:36 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: neil.armstrong@linaro.org,
	quic_jesszhan@quicinc.com,
	sam@ravnborg.org
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 quentin.schulz@theobroma-systems.com, klaus.goger@theobroma-systems.com,
 heiko@sntech.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 2/2] drm/panel: ltk050h3146w: drop duplicate commands from
 LTK050H3148W init
Date: Wed, 20 Mar 2024 14:12:32 +0100
Message-Id: <20240320131232.327196-2-heiko@sntech.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240320131232.327196-1-heiko@sntech.de>
References: <20240320131232.327196-1-heiko@sntech.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Heiko Stuebner <heiko.stuebner@cherry.de>

The init sequence specifies the 0x11 and 0x29 dsi commands, which are
the exit-sleep and display-on commands.

In the actual prepare step the driver already uses the appropriate
function calls for those, so drop the duplicates.

Fixes: e5f9d543419c ("drm/panel: ltk050h3146w: add support for Leadtek LTK050H3148W-CTA6 variant")
Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
index a50f5330a661..8e0f5c3e3b98 100644
--- a/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
+++ b/drivers/gpu/drm/panel/panel-leadtek-ltk050h3146w.c
@@ -295,8 +295,6 @@ static int ltk050h3148w_init_sequence(struct ltk050h3146w *ctx)
 	mipi_dsi_dcs_write_seq(dsi, 0xbd, 0x00);
 	mipi_dsi_dcs_write_seq(dsi, 0xc6, 0xef);
 	mipi_dsi_dcs_write_seq(dsi, 0xd4, 0x02);
-	mipi_dsi_dcs_write_seq(dsi, 0x11);
-	mipi_dsi_dcs_write_seq(dsi, 0x29);
 
 	ret = mipi_dsi_dcs_set_tear_on(dsi, 1);
 	if (ret < 0) {
-- 
2.39.2

