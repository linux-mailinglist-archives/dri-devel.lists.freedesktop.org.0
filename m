Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C771513865F
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2020 13:36:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3D36E500;
	Sun, 12 Jan 2020 12:36:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from shell.v3.sk (unknown [167.172.186.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB82C6E175
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Jan 2020 01:07:40 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id 3300CDFDFC;
 Sat, 11 Jan 2020 01:07:47 +0000 (UTC)
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 8kCThNlZmmB8; Sat, 11 Jan 2020 01:07:45 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by zimbra.v3.sk (Postfix) with ESMTP id C2993DFE01;
 Sat, 11 Jan 2020 01:07:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
 by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id AnlUCaXlPKcH; Sat, 11 Jan 2020 01:07:45 +0000 (UTC)
Received: from furthur.lan (unknown [109.183.109.54])
 by zimbra.v3.sk (Postfix) with ESMTPSA id 5A4B6DFCD9;
 Sat, 11 Jan 2020 01:07:45 +0000 (UTC)
From: Lubomir Rintel <lkundrak@v3.sk>
To: Russell King <linux@armlinux.org.uk>
Subject: [PATCH v3 2/3] drm/armada: optionally enable the peripheral clock
Date: Sat, 11 Jan 2020 02:07:33 +0100
Message-Id: <20200111010734.286836-3-lkundrak@v3.sk>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200111010734.286836-1-lkundrak@v3.sk>
References: <20200111010734.286836-1-lkundrak@v3.sk>
MIME-Version: 1.0
X-Mailman-Approved-At: Sun, 12 Jan 2020 12:36:09 +0000
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
Cc: David Airlie <airlied@linux.ie>, Lubomir Rintel <lkundrak@v3.sk>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It needs to be enabled (at least on MMP2) in order for the register
writes to LCDC to work.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 drivers/gpu/drm/armada/armada_crtc.c | 7 +++++++
 drivers/gpu/drm/armada/armada_crtc.h | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/armada/armada_crtc.c b/drivers/gpu/drm/armada/armada_crtc.c
index da9ba8be8b097..0f343bf584c8c 100644
--- a/drivers/gpu/drm/armada/armada_crtc.c
+++ b/drivers/gpu/drm/armada/armada_crtc.c
@@ -772,6 +772,7 @@ static void armada_drm_crtc_destroy(struct drm_crtc *crtc)
 
 	of_node_put(dcrtc->crtc.port);
 
+	clk_disable_unprepare(dcrtc->periphclk);
 	kfree(dcrtc);
 }
 
@@ -928,6 +929,11 @@ static int armada_drm_crtc_create(struct drm_device *drm, struct device *dev,
 	dcrtc->clk = ERR_PTR(-EINVAL);
 	dcrtc->spu_iopad_ctrl = CFG_VSCALE_LN_EN | CFG_IOPAD_DUMB24;
 
+	dcrtc->periphclk = devm_clk_get(dev, "periph");
+	if (IS_ERR(dcrtc->periphclk))
+		dcrtc->periphclk = NULL;
+	WARN_ON(clk_prepare_enable(dcrtc->periphclk));
+
 	endpoint = of_get_next_child(port, NULL);
 	of_property_read_u32(endpoint, "bus-width", &bus_width);
 	of_node_put(endpoint);
@@ -1015,6 +1021,7 @@ static int armada_drm_crtc_create(struct drm_device *drm, struct device *dev,
 err_crtc_init:
 	primary->funcs->destroy(primary);
 err_crtc:
+	clk_disable_unprepare(dcrtc->periphclk);
 	kfree(dcrtc);
 
 	return ret;
diff --git a/drivers/gpu/drm/armada/armada_crtc.h b/drivers/gpu/drm/armada/armada_crtc.h
index b21267d1745f1..48fc974a65808 100644
--- a/drivers/gpu/drm/armada/armada_crtc.h
+++ b/drivers/gpu/drm/armada/armada_crtc.h
@@ -39,6 +39,7 @@ struct armada_crtc {
 	void			*variant_data;
 	unsigned		num;
 	void __iomem		*base;
+	struct clk		*periphclk;
 	struct clk		*clk;
 	struct {
 		uint32_t	spu_v_h_total;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
