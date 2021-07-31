Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 848C93DC270
	for <lists+dri-devel@lfdr.de>; Sat, 31 Jul 2021 03:40:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F31356F4E8;
	Sat, 31 Jul 2021 01:40:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C206E409
 for <dri-devel@lists.freedesktop.org>; Sat, 31 Jul 2021 01:40:11 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 14722BC0;
 Sat, 31 Jul 2021 03:40:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1627695609;
 bh=mK1sC34SkdfPesSr/ljz81ambUX1M83KGmYChMaWyRY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pufoELx8ZCqFJsB9hE7XnbQxOidC0Aa4nNfmB2zZil7kvynm4ZtF9JjCKSvdRrkw9
 ZZhKDjQFDEzUwkLT2QoNTeeA92VOuai+7rUThdxXV9LvkmWy/9ZCi2iMEltruzyWCz
 f6S49U3EyJSxaSajFK6Sq5kg9xlC9ZD8gBWDTrio=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Cc: Tomi Valkeinen <tomba@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Jyri Sarha <jyri.sarha@iki.fi>, Jonathan Hunter <jonathanh@nvidia.com>,
 linux-renesas-soc@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-imx@nxp.com,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-tegra@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>,
 Alain VOLMAT-SCND-01 <alain.volmat@foss.st.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v2 1/9] drm/omap: Use correct printk format specifiers for
 size_t
Date: Sat, 31 Jul 2021 04:39:46 +0300
Message-Id: <20210731013954.11926-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731013954.11926-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20210731013954.11926-1-laurent.pinchart+renesas@ideasonboard.com>
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

The correct format specifier for size_t is %zu. Using %d (or %u)
generates a warning on 64-bit platforms. Fix it.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/omapdrm/dss/dsi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/dsi.c b/drivers/gpu/drm/omapdrm/dss/dsi.c
index 5f1722b040f4..503b5d4bf2c2 100644
--- a/drivers/gpu/drm/omapdrm/dss/dsi.c
+++ b/drivers/gpu/drm/omapdrm/dss/dsi.c
@@ -2094,7 +2094,7 @@ static int dsi_vc_send_long(struct dsi_data *dsi, int vc,
 	u8 b1, b2, b3, b4;
 
 	if (dsi->debug_write)
-		DSSDBG("dsi_vc_send_long, %d bytes\n", msg->tx_len);
+		DSSDBG("dsi_vc_send_long, %zu bytes\n", msg->tx_len);
 
 	/* len + header */
 	if (dsi->vc[vc].tx_fifo_size * 32 * 4 < msg->tx_len + 4) {
@@ -2390,7 +2390,7 @@ static int dsi_vc_generic_read(struct omap_dss_device *dssdev, int vc,
 
 	return 0;
 err:
-	DSSERR("%s(vc %d, reqlen %d) failed\n", __func__,  vc, msg->tx_len);
+	DSSERR("%s(vc %d, reqlen %zu) failed\n", __func__,  vc, msg->tx_len);
 	return r;
 }
 
-- 
Regards,

Laurent Pinchart

