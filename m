Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FB404B44D3
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 09:48:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4EBF10E239;
	Mon, 14 Feb 2022 08:48:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4CF710E260
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 08:48:52 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id s10so12036291wrb.1
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 00:48:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZDE2yNU8P4fdqNYbBxxI65OvUTBCmdeIAAj2LgzPKAs=;
 b=IbonyEV+9C8urgFscwP5SMpYJpuDdalopVZGuNmDcbOwE9H1M2gOG/T9JIe5n6zRfr
 gLeUe/kNbG05x3kGzKQl3tY2DUYimObTU0eFumzwlPdM/efcUmq8pQ8y30qYimDuQoHX
 l9AQMBqziiDy0cHCLrAqr5+O8aBiLcsGDZv9nv09B6wyPSYba3OaH05P9t3Z8ZQSAf5M
 nAiNLn0/lthA91A3AiMODe4afZk+GRyvjM5f16ipS8S9z5+abCM9d1slFnciY5kr7fxz
 cvY9aO09VsLyeeGVSrFww1O4EcX5untTiJaYwWDPDWaH16rCt3wViM95+wkVYDmBNPmw
 qtQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZDE2yNU8P4fdqNYbBxxI65OvUTBCmdeIAAj2LgzPKAs=;
 b=I2aUBOaLtQ9180t2ZnyzUtqoJxMgi6OsccAK1fu5+YQf24RnWKhnKHXx6A2UESHeie
 lVfu9sjk1Qc6nAS8wENNsb+QLvdm/2/v1jGi849RBoBwR5hjSGoWjrm35GmSYGS23Qgv
 xpkQdsWHTh30zmo65+gi9AdG03DOPZFOa4XguXgqiiaQ1eBFofosEIq5P5PVEDQytQzL
 hlUPbidiOhrRCkmWcJmCNOMZJlmctcrEKvSJYZ/H1MmseKYOxjvTFiVeRyN+KT/0bNSq
 KaQISLX5rUTSRVnKUSbsS8WSVdqtM3WfAm9BG98xG501Tit0JMKmtHU1q2bt2N9oPezB
 m/rw==
X-Gm-Message-State: AOAM531K6gU2C0OP8qxwZsb33MGZ0OhSMvYqJ823TbsOlWRevMvhLFZ4
 ewpaX3rOkIxJv1UqweI2C+L6Ww==
X-Google-Smtp-Source: ABdhPJyzL++bK8rE9MHyjyMK5tAC+ty5zZCR7BnVxJXu2kuykUHnUrWNsGeRiBmI+OFT7STG1OHTww==
X-Received: by 2002:a5d:42c2:: with SMTP id t2mr10275152wrr.168.1644828531216; 
 Mon, 14 Feb 2022 00:48:51 -0800 (PST)
Received: from localhost.localdomain (179.160.117.78.rev.sfr.net.
 [78.117.160.179])
 by smtp.gmail.com with ESMTPSA id f8sm7189992wmq.19.2022.02.14.00.48.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 00:48:50 -0800 (PST)
From: Julien STEPHAN <jstephan@baylibre.com>
To: angelogioacchino.delregno@collabora.com
Subject: [PATCH v3] drm/mediatek: allow commands to be sent during video mode
Date: Mon, 14 Feb 2022 09:47:36 +0100
Message-Id: <20220214084736.3374211-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.35.1
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR MEDIATEK" <dri-devel@lists.freedesktop.org>,
 "moderated list:DRM DRIVERS FOR MEDIATEK" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Julien STEPHAN <jstephan@baylibre.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mipi dsi panel drivers can use mipi_dsi_dcs_{set,get}_display_brightness()
to request backlight changes.

This can be done during panel initialization (dsi is in command mode)
or afterwards (dsi is in Video Mode).

When the DSI is in Video Mode, all commands are rejected.

Detect current DSI mode in mtk_dsi_host_transfer() and switch modes
temporarily to allow commands to be sent.

Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
Changes in v3:
    - increase readability of code and use correct return variable (see
      comment https://lore.kernel.org/linux-mediatek/4907bdc1-b4a6-e9ad-5cfa-266fc20c0bec@collabora.com/)

Changes in v2:
    - update commit message to be more descriptive


 drivers/gpu/drm/mediatek/mtk_dsi.c | 33 ++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 5d90d2eb0019..7f1b2b7ed3fd 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -891,24 +891,33 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 	u8 read_data[16];
 	void *src_addr;
 	u8 irq_flag = CMD_DONE_INT_FLAG;
+	u32 dsi_mode;
+	int ret;

-	if (readl(dsi->regs + DSI_MODE_CTRL) & MODE) {
-		DRM_ERROR("dsi engine is not command mode\n");
-		return -EINVAL;
+	dsi_mode = readl(dsi->regs + DSI_MODE_CTRL);
+	if (dsi_mode & MODE) {
+		mtk_dsi_stop(dsi);
+		ret = mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500);
+		if (ret)
+			goto restore_dsi_mode;
 	}

 	if (MTK_DSI_HOST_IS_READ(msg->type))
 		irq_flag |= LPRX_RD_RDY_INT_FLAG;

-	if (mtk_dsi_host_send_cmd(dsi, msg, irq_flag) < 0)
-		return -ETIME;
+	ret = mtk_dsi_host_send_cmd(dsi, msg, irq_flag);
+	if (ret)
+		goto restore_dsi_mode;

-	if (!MTK_DSI_HOST_IS_READ(msg->type))
-		return 0;
+	if (!MTK_DSI_HOST_IS_READ(msg->type)) {
+		recv_cnt = 0;
+		goto restore_dsi_mode;
+	}

 	if (!msg->rx_buf) {
 		DRM_ERROR("dsi receive buffer size may be NULL\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto restore_dsi_mode;
 	}

 	for (i = 0; i < 16; i++)
@@ -933,7 +942,13 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 	DRM_INFO("dsi get %d byte data from the panel address(0x%x)\n",
 		 recv_cnt, *((u8 *)(msg->tx_buf)));

-	return recv_cnt;
+restore_dsi_mode:
+	if (dsi_mode & MODE) {
+		mtk_dsi_set_mode(dsi);
+		mtk_dsi_start(dsi);
+	}
+
+	return ret < 0 ? ret: recv_cnt;
 }

 static const struct mipi_dsi_host_ops mtk_dsi_ops = {
--
2.35.1

