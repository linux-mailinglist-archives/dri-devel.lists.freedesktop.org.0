Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 939CD249C30
	for <lists+dri-devel@lfdr.de>; Wed, 19 Aug 2020 13:46:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 525C86E03B;
	Wed, 19 Aug 2020 11:46:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 852B26E233
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 11:46:23 +0000 (UTC)
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de
 [95.90.213.163])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5830222CAF;
 Wed, 19 Aug 2020 11:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1597837582;
 bh=LoNkbNy+NbjfyHcUs4+KMDZxZVHRuvvlVTe95ZNdLs4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=bATRGdhaVauZk8Mcvy7xJgUod2GIp+bRJhO7vR0Ectunmwi3GyMGhQ/El7sPn3xL8
 hCwVOfXbzxcjqCjF/jr/noSGmSBhQCBqxLjgxEQISKq1ynE0YtjCKBM+a4SgydH7kK
 FLKIhXij/al6d2WLeHcl4VbsvQk0IO1xBbr4rJY0=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1k8MXs-00Euau-9x; Wed, 19 Aug 2020 13:46:20 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 23/49] staging: hikey9xx/gpu: Change the logic which sets the
 burst mode
Date: Wed, 19 Aug 2020 13:45:51 +0200
Message-Id: <617e29a2482984b2b46e2b41a33b78428fcbc4f9.1597833138.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1597833138.git.mchehab+huawei@kernel.org>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
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
Cc: devel@driverdev.osuosl.org, Liwei Cai <cailiwei@hisilicon.com>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 linux-kernel@vger.kernel.org, linuxarm@huawei.com,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, mauro.chehab@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The logic there is more complex than it needs. It also places
the device with a wrong setting if the flags are missed.

This currently happens on Kirin970 for HDMI, as there's a bug
at the part of the driver which selects between PANEL or
OUTPUT at encoder init code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../hikey9xx/gpu/kirin9xx_dw_drm_dsi.c        | 34 +++++++++++--------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c b/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
index e904943d9f9e..ffc8b8e61062 100644
--- a/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
+++ b/drivers/staging/hikey9xx/gpu/kirin9xx_dw_drm_dsi.c
@@ -902,26 +902,28 @@ static void dw_dsi_set_mode(struct dw_dsi *dsi, enum dsi_work_mode mode)
 	writel(POWERUP, base + PWR_UP);
 }
 
-static void dsi_set_burst_mode(void __iomem *base, unsigned long flags)
+static void dsi_set_burst_mode(void __iomem *base, unsigned long burst_flags)
 {
+	unsigned long flags;
 	u32 val;
-	u32 mode_mask = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
-		MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
-	u32 non_burst_sync_pulse = MIPI_DSI_MODE_VIDEO |
-		MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
-	u32 non_burst_sync_event = MIPI_DSI_MODE_VIDEO;
 
-	/*
-	 * choose video mode type
-	 */
-	if ((flags & mode_mask) == non_burst_sync_pulse)
+	flags = burst_flags;
+	flags &= MIPI_DSI_MODE_VIDEO |
+		 MIPI_DSI_MODE_VIDEO_BURST |
+		 MIPI_DSI_MODE_VIDEO_SYNC_PULSE;
+
+	if (!(flags & MIPI_DSI_MODE_VIDEO)) {
+		DRM_WARN("MIPI_DSI_MODE_VIDEO was not set! Using DSI_NON_BURST_SYNC_PULSES");
 		val = DSI_NON_BURST_SYNC_PULSES;
-	else if ((flags & mode_mask) == non_burst_sync_event)
-		val = DSI_NON_BURST_SYNC_EVENTS;
-	else
+	} else if (flags & MIPI_DSI_MODE_VIDEO_BURST) {
 		val = DSI_BURST_SYNC_PULSES_1;
+	} else if (flags & MIPI_DSI_MODE_VIDEO_SYNC_PULSE) {
+		val = DSI_NON_BURST_SYNC_PULSES;
+	} else {
+		val = DSI_NON_BURST_SYNC_EVENTS;
+	}
 
-	DRM_INFO("burst_mode = 0x%x (DSI_NON_BURST_SYNC_PULSES => 0)", val);
+	DRM_INFO("burst_mode = 0x%x (flags: 0x%04lx)", val, burst_flags);
 	set_reg(base + MIPIDSI_VID_MODE_CFG_OFFSET, val, 2, 0);
 }
 
@@ -1047,6 +1049,10 @@ static void dsi_mipi_init(struct dw_dsi *dsi, char __iomem *mipi_dsi_base)
 	WARN_ON(!mipi_dsi_base);
 
 	id = dsi->cur_client;
+
+	DRM_INFO("dsi_mipi_init, id=%d\n", id);
+
+
 	mipi = &dsi->mipi;
 
 	if (mipi->max_tx_esc_clk == 0) {
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
