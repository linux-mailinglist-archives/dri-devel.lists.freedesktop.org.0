Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E04149AE64
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 09:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE8E310EDEA;
	Tue, 25 Jan 2022 08:49:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CA3310EC77
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 15:23:50 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id u15so14241044wrt.3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jan 2022 07:23:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HoCKTXe73b6LRfZ2yfJRg1I4/082DZV6wf8n+3iyv3U=;
 b=DXFMPQqZJ0tKT0e1GyjQjptwLQE+7cHPUKFQBr+FQZeLkkE77ifDs5YB3GOF2h2Seh
 bgVGO7FGtiVNy3Mg062PsxfHEv95vu/7FuDahESCUCJFO1xZnM5iGo1upx+/pmKrvaB6
 CSUStL3QD1cOCq8v/QVMbsKXpJs2to+BaJ6sFHSy/sLvqdOxY9TIlA8KUI4Jrj4Zarux
 H3yY4uEjrAm5+t5Un+56XZMFQGrGxPIHVNdV9OMQtXbVEBu7Yd1EyCdR9Putf8JzYEQ7
 7zdN+Tdh+rSzq6KW5FsWt+yw5LYnZnrdPn/KOiBaoshGM3xl5+rV4Szbq/KKk17PP89m
 4qiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HoCKTXe73b6LRfZ2yfJRg1I4/082DZV6wf8n+3iyv3U=;
 b=1rFyLiirYlXnCAYd6/BJy4OWEpL10VceYYtJFtxEhHIfWdJo37KV6qNdu9Hbg8KJm2
 eUDlW4/IxqwCDnJswUFKabvQAKDQzck4kb/Zcz7J0Dr5ss6N8YR5yi2iA/k/aQrOsMtl
 oAwjXQhssOqx+QhSXymiq3Ht08v5yIPcnADCVqIVvaFsJJyDXYauw/zGCYE3no8nO742
 06/1w+9b8qWoLPrGTvwJpsY/H838bZnZdZWXYYXj0zSTXP/JeihtKJNEGugeNiq3esEB
 s8k50ehNxUaSdnGhGWT5FsqJdlQmMQ7xukJh15tMmjuh3vwywmrVLCde5VA3XPL6wB2g
 KnJg==
X-Gm-Message-State: AOAM533YPyZ2PGvS+x0E2+EhWI0vSgpJEzFfZxx1iF4/P22V4VX5AEMc
 HvBNIMBgH87K3Rbd9lO3E/snYg==
X-Google-Smtp-Source: ABdhPJwuOAaYhLMRPNPmkmjib9G4ImRHpSjbxVDsSwkT8tECvG6c7seMPvA24tjBSCj5SaEJ5QMa9Q==
X-Received: by 2002:a5d:544c:: with SMTP id w12mr1825656wrv.47.1643037828828; 
 Mon, 24 Jan 2022 07:23:48 -0800 (PST)
Received: from localhost.localdomain (179.160.117.78.rev.sfr.net.
 [78.117.160.179])
 by smtp.gmail.com with ESMTPSA id p14sm3806868wmq.40.2022.01.24.07.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 07:23:48 -0800 (PST)
From: Julien STEPHAN <jstephan@baylibre.com>
To: 
Subject: [PATCH] drm/mediatek: allow commands to be sent during video mode
Date: Mon, 24 Jan 2022 16:22:50 +0100
Message-Id: <20220124152250.441809-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 25 Jan 2022 08:48:57 +0000
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

When the DSI is in video mode, all commands are rejected.

Detect current DSI mode in mtk_dsi_host_transfer() and switch modes
temporarily to allow commands to be sent.

Signed-off-by: Julien STEPHAN <jstephan@baylibre.com>
Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 34 ++++++++++++++++++++++--------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 5d90d2eb0019..7d66fdc7f81d 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -891,24 +891,34 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 	u8 read_data[16];
 	void *src_addr;
 	u8 irq_flag = CMD_DONE_INT_FLAG;
-
-	if (readl(dsi->regs + DSI_MODE_CTRL) & MODE) {
-		DRM_ERROR("dsi engine is not command mode\n");
-		return -EINVAL;
+	u32 dsi_mode;
+
+	dsi_mode = readl(dsi->regs + DSI_MODE_CTRL);
+	if (dsi_mode & MODE) {
+		mtk_dsi_stop(dsi);
+		if (mtk_dsi_switch_to_cmd_mode(dsi, VM_DONE_INT_FLAG, 500)) {
+			recv_cnt = -EINVAL;
+			goto restore_dsi_mode;
+		}
 	}
 
 	if (MTK_DSI_HOST_IS_READ(msg->type))
 		irq_flag |= LPRX_RD_RDY_INT_FLAG;
 
-	if (mtk_dsi_host_send_cmd(dsi, msg, irq_flag) < 0)
-		return -ETIME;
+	if (mtk_dsi_host_send_cmd(dsi, msg, irq_flag) < 0) {
+		recv_cnt = -ETIME;
+		goto restore_dsi_mode;
+	}
 
-	if (!MTK_DSI_HOST_IS_READ(msg->type))
-		return 0;
+	if (!MTK_DSI_HOST_IS_READ(msg->type)) {
+		recv_cnt = 0;
+		goto restore_dsi_mode;
+	}
 
 	if (!msg->rx_buf) {
 		DRM_ERROR("dsi receive buffer size may be NULL\n");
-		return -EINVAL;
+		recv_cnt = -EINVAL;
+		goto restore_dsi_mode;
 	}
 
 	for (i = 0; i < 16; i++)
@@ -933,6 +943,12 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 	DRM_INFO("dsi get %d byte data from the panel address(0x%x)\n",
 		 recv_cnt, *((u8 *)(msg->tx_buf)));
 
+restore_dsi_mode:
+	if (dsi_mode & MODE) {
+		mtk_dsi_set_mode(dsi);
+		mtk_dsi_start(dsi);
+	}
+
 	return recv_cnt;
 }
 
-- 
2.34.1

