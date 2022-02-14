Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB78F4B45B9
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 10:29:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF9610E249;
	Mon, 14 Feb 2022 09:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C48C89668
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 09:28:57 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id k1so25723919wrd.8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 01:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KStTxY9XVfRTy0jNX2vsLO+sccZ6tcP3+MXbZKzhUog=;
 b=RRmTvdH206P9cFagseNai5Qkh/Y3gvxhEZYcItRUx3Z9rEGdbrrj8+RMSJBQMDQ6Ti
 /KIXUPdzytBTQ0ksw/z3Qy94t1bAcG+ahCZXsO5wv9qTuL6ocOaX36x2KxnoYqtfHLdE
 nFbBnJLi7GqAsDtg8KQ+jO0zGiDqzGuWjOsar7FHjFlqRu68oHIVacm6iRybNRxOjlTl
 Qws1U8zaHo6hRAFlR2mkexqUTohqw7KSmEu/U0A0tn4DOBw/2YdbewEFZPnm+YTTOocr
 Wb13phnqsbITLtgPk2htUT1bTW3fTdqeyiUuqExmM68oWDlGVOFyFj6r2o+jO7ofAevM
 SIag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KStTxY9XVfRTy0jNX2vsLO+sccZ6tcP3+MXbZKzhUog=;
 b=dckn0KM0jq3HcqK0KNfGwdUBFt7AU8WVUKSK8k7LutQp29IeKnInzNPD/LJvcRiFyx
 N/w25wk6CIZYRqIc9oaz9tow6NkKPIpHwLgdEy2NxVU7wHYZZigZkGXTTzBpKJcFyJNs
 JKWPbcGMORxPSqOGSPFkoviC+AeZyO4DzsVLZIuzdeHlaDJstml1ivvwD4n3+wnjhu+l
 Wb8NxMgqcDKhWAPicKGaXzPd10Nz5gOGLSl6AnG7lzOj7HMrzG6lsVf6eLf8miwvWQ0U
 DocrGpAnrJUHQT2yO1/xPFNwyE8OaImASffctsa5TLvamk03mTi2sjQIZVydrHXbsWez
 SilA==
X-Gm-Message-State: AOAM533srHgC5OqvI84YsrL4lNPoSWSDVBQ7p2X2jY2cZf/tdbTHqB6G
 tF/54Q69ioyiiNtVee6/M7wAnA==
X-Google-Smtp-Source: ABdhPJyGQ/UgchooSSeFiGSP/VpjbWioBhy23eoI5rS7fHkwylzEihvSntyQAg6+0NSZa+CRPy+XjA==
X-Received: by 2002:adf:fe01:: with SMTP id n1mr10579723wrr.141.1644830935927; 
 Mon, 14 Feb 2022 01:28:55 -0800 (PST)
Received: from localhost.localdomain (179.160.117.78.rev.sfr.net.
 [78.117.160.179])
 by smtp.gmail.com with ESMTPSA id o14sm11182012wmr.3.2022.02.14.01.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 01:28:55 -0800 (PST)
From: Julien STEPHAN <jstephan@baylibre.com>
To: angelogioacchino.delregno@collabora.com
Subject: [PATCH v4] drm/mediatek: allow commands to be sent during video mode
Date: Mon, 14 Feb 2022 10:27:42 +0100
Message-Id: <20220214092742.3461587-1-jstephan@baylibre.com>
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
Changes in v4:
    - fix missing space:  "ret : recv_cnt;"
Changes in v3:
    - increase readability of code and use correct return variable (see
      comment
https://lore.kernel.org/linux-mediatek/4907bdc1-b4a6-e9ad-5cfa-266fc20c0bec@collabora.com/)

Changes in v2:
    - update commit message to be more descriptive

 drivers/gpu/drm/mediatek/mtk_dsi.c | 33 ++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 5d90d2eb0019..abdd9cdebd86 100644
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
+	return ret < 0 ? ret : recv_cnt;
 }

 static const struct mipi_dsi_host_ops mtk_dsi_ops = {
--
2.35.1

