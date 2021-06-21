Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 020E13AE41B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 09:25:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5AE89DED;
	Mon, 21 Jun 2021 07:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10F6A89DED
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 07:25:14 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id u18so7574004pfk.11
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 00:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/pGjb2AmXz+lBmXRvuYK+0My7OEKqfzWIwfNjkS45hA=;
 b=B9B52vgxd/J4eTdK7UlVsZJ7csp6Wy5F6P2A20Mfw0H1RRWpOrSZaJTujs3hnlfzCz
 lquOWxd8ZvszDgJBt5LkR7OIgGAYPjCdylfqn/O2NYN4AtmxpZNGZJgy/JPcPkMTY5hX
 nywtvsNF2KIYxRwwwQnWW7ejXPXt/r/tOk/hU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/pGjb2AmXz+lBmXRvuYK+0My7OEKqfzWIwfNjkS45hA=;
 b=LYgW3+Mr/wIYwrRPkA4cy8Opb/wy5OPZsA1thIlf+ljYshNWFTtXqZJ9Iu9NokaAsm
 SgTssqm1nxuXQ/1Mo4ZB8nkO+JeOrgSFt1cdjo8DtOLtOQhvbJuEVkV8DhM3tX2t5DVp
 c7ywPSU/BgCbTIlfK4pBm253z4GN9OQCgq4Cc23MqAg5g3PJ9oj+Q1Ai/bzurRHlvhB1
 l19kpQfYs06Y9Qx9hLCS79f1VyS5ZU2/vjsbnuWz8p82zfQCv8dxOyn8oZk1SI4jKeOH
 DQPE+Pvx4wzdbX9JQOZlHhlRTor2b/mkI9jq0/UU1iHnt6y0q5ypoy7jmyfaIOOwqQhU
 TsKA==
X-Gm-Message-State: AOAM530Fn8TF1dgyIoU0cBrsDbZe7XpIsP1fXOcWmZ/LKr2/eqUjI/8D
 dZzBoL8xudRsLcBwWU5GqQTE8DKn9txMBw==
X-Google-Smtp-Source: ABdhPJxo+t1TLHHi1OZRYJMnwd/WKQz+bnqZydSgYB9/egnda8r4P1VP3GSrFWZ7KhGsl+nW3aljHQ==
X-Received: by 2002:a63:ed17:: with SMTP id d23mr22382992pgi.107.1624260313749; 
 Mon, 21 Jun 2021 00:25:13 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c00a:a884:139:e97f:a55d:7f66])
 by smtp.gmail.com with ESMTPSA id
 21sm13951294pfh.103.2021.06.21.00.25.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 00:25:13 -0700 (PDT)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Tomasz Figa <t.figa@samsung.com>,
 Fancy Fang <chen.fang@nxp.com>
Subject: [RFC PATCH 5/9] soc: imx8mm: blk-ctl: Add MIPI DPHY reset enable
Date: Mon, 21 Jun 2021 12:54:20 +0530
Message-Id: <20210621072424.111733-6-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621072424.111733-1-jagan@amarulasolutions.com>
References: <20210621072424.111733-1-jagan@amarulasolutions.com>
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
Cc: devicetree@vger.kernel.org,
 Francis Laniel <francis.laniel@amarulasolutions.com>,
 Matteo Lisi <matteo.lisi@engicam.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 Milco Pratesi <milco.pratesi@engicam.com>,
 Anthony Brandon <anthony@amarulasolutions.com>, linux-phy@lists.infradead.org,
 linux-amarula@amarulasolutions.com, linux-arm-kernel@lists.infradead.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add MIPI DPHY reset enable pin in blk-ctl driver for i.MX8MM.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/soc/imx/blk-ctl-imx8mm.c         | 4 ++++
 include/dt-bindings/power/imx8mm-power.h | 5 +++--
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/imx/blk-ctl-imx8mm.c b/drivers/soc/imx/blk-ctl-imx8mm.c
index 5ca8d6c52917..a9d900754faf 100644
--- a/drivers/soc/imx/blk-ctl-imx8mm.c
+++ b/drivers/soc/imx/blk-ctl-imx8mm.c
@@ -25,6 +25,7 @@
 #define MEDIA_BLK_MIPI_CSI_I_PRESETN_SFT_EN			BIT(4)
 #define MEDIA_BLK_CAMERA_PIXEL_RESET_N_SFT_EN			BIT(3)
 #define MEDIA_BLK_CSI_BRIDGE_SFT_EN				GENMASK(2, 0)
+#define MEDIA_BLK_GPR_MIPI_M_RESETN				BIT(17)
 
 #define MEDIA_BLK_BUS_PD_MASK					BIT(12)
 #define MEDIA_BLK_MIPI_CSI_PD_MASK				GENMASK(11, 10)
@@ -41,6 +42,9 @@ static struct imx_blk_ctl_hw imx8mm_dispmix_blk_ctl_pds[] = {
 	IMX_BLK_CTL_PD("MIPI_DSI", "mipi", IMX8MM_BLK_CTL_PD_DISPMIX_MIPI_DSI, 0x4,
 		       MEDIA_BLK_MIPI_DSI_PD_MASK, 0, MEDIA_BLK_MIPI_DSI_I_PRESETN_SFT_EN,
 		       IMX_BLK_CTL_PD_RESET),
+	IMX_BLK_CTL_PD("DPHY", "dphy", IMX8MM_BLK_CTL_PD_DISPMIX_MIPI_DPHY, 0x4,
+		       MEDIA_BLK_MIPI_DSI_PD_MASK, 0x8, MEDIA_BLK_GPR_MIPI_M_RESETN,
+		       IMX_BLK_CTL_PD_RESET),
 	IMX_BLK_CTL_PD("MIPI_CSI", "mipi", IMX8MM_BLK_CTL_PD_DISPMIX_MIPI_CSI, 0x4,
 		       MEDIA_BLK_MIPI_CSI_PD_MASK, 0,
 		       MEDIA_BLK_MIPI_CSI_I_PRESETN_SFT_EN | MEDIA_BLK_CAMERA_PIXEL_RESET_N_SFT_EN,
diff --git a/include/dt-bindings/power/imx8mm-power.h b/include/dt-bindings/power/imx8mm-power.h
index a10266befa9c..8becb123e191 100644
--- a/include/dt-bindings/power/imx8mm-power.h
+++ b/include/dt-bindings/power/imx8mm-power.h
@@ -27,7 +27,8 @@
 #define IMX8MM_BLK_CTL_PD_DISPMIX_CSI_BRIDGE	0
 #define IMX8MM_BLK_CTL_PD_DISPMIX_LCDIF		1
 #define IMX8MM_BLK_CTL_PD_DISPMIX_MIPI_DSI	2
-#define IMX8MM_BLK_CTL_PD_DISPMIX_MIPI_CSI	3
-#define IMX8MM_BLK_CTL_PD_DISPMIX_MAX		4
+#define IMX8MM_BLK_CTL_PD_DISPMIX_MIPI_DPHY	3
+#define IMX8MM_BLK_CTL_PD_DISPMIX_MIPI_CSI	4
+#define IMX8MM_BLK_CTL_PD_DISPMIX_MAX		5
 
 #endif
-- 
2.25.1

