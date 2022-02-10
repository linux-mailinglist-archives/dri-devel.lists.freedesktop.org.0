Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A65EE4B1F8C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 08:47:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02AE910E9EB;
	Fri, 11 Feb 2022 07:47:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 908AF10E840
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 12:47:51 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 x3-20020a05600c21c300b0037c01ad715bso774831wmj.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 04:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mntgPn8Qh+Nga93zR2phIa+qhcyXEPyRC4rw0pc7QyU=;
 b=CBWimZf5de7rEjmsIbxW3CkZ60rLERED1BkV9KD7RlFFX1/jSQ0iQujTrsjEqdyatc
 TGucGngeS0HAEfQdmLnuUU9bJYzv7aeAxdxRp3pVk2sfsjvLg+iqX9DDb7KH3YkypUJr
 oJgdm4QB/zazezXnNWw/2NGivfLqUJ5hD+6MHG8JsjA+SxJ9CZZRttVTo/z9Mof1cyDX
 /tUdxtb5mjbVUUppHuRWzxdARUE+sWUAOKJFgjgi4D1pZaWfhTpLSQTEOGp27Oc3ss6c
 8CHO5LzVKWymSWP06deo8tlSVJQO21bHmYgdFZIUwRtYgm0Rwc0ivlRgKF7Cwc1wjRKH
 lA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mntgPn8Qh+Nga93zR2phIa+qhcyXEPyRC4rw0pc7QyU=;
 b=uHucvnylSmlOdeNQaeEGsFJnv5VsqrmUUC/J6knVWHYk/zXw+48Xr5ZQGS44qwXgEw
 QBmrB0HcM2sqBSp/iUcJrwk3tC5JDoy9l4Yq7dkR4YBTReNOEkIFLC8RU0oRz9i9cBSb
 49FyqwCnzkiBlOfcK9dqMcgotnyA++QAyfvPyoPWjmYTd54hEeOy2uxAZ89nJwUMhMCn
 eh8Jk+RBbYIw0nnc/e1+zlbTAPSpnBbfM3N0ZO8yb4WLKr0CwArjdbD03/pcsrQM+dT4
 2QbBFR7Nj0mFemIw/cGL5T1iOX0vfXWB0CK8BxwhiYlKCH6CVvojzSCwXWxGIouqqlMt
 Ma4g==
X-Gm-Message-State: AOAM531HFG/lShsi+FKFRJvxdVGFBsPubvCrZsLDwidK49ekJHXfTFeT
 OaFlvPn+oGMXksLUixRHpnaOOZJV2Xtlp8q9
X-Google-Smtp-Source: ABdhPJx1QVGMDH3bSUlRi8xCAZYjMCX58cJhV8Nzi0bBPvuN8l8LEJFyXhAp8Uy4QXE2zk+rqIBFWQ==
X-Received: by 2002:a1c:4e0c:: with SMTP id g12mr2050270wmh.67.1644497270112; 
 Thu, 10 Feb 2022 04:47:50 -0800 (PST)
Received: from localhost.localdomain (179.160.117.78.rev.sfr.net.
 [78.117.160.179])
 by smtp.gmail.com with ESMTPSA id 24sm1331687wmf.48.2022.02.10.04.47.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 04:47:49 -0800 (PST)
From: Julien STEPHAN <jstephan@baylibre.com>
To: ck.hu@mediatek.com
Subject: [PATCH v2] drm/mediatek: allow commands to be sent during video mode
Date: Thu, 10 Feb 2022 13:46:38 +0100
Message-Id: <20220210124638.2330904-1-jstephan@baylibre.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 11 Feb 2022 07:47:51 +0000
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
Changes in v2:
  - update commit message to be more descriptive

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
2.35.1

