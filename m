Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 483575EFED2
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 22:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A0C10EB4B;
	Thu, 29 Sep 2022 20:43:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC98110E075
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 20:42:41 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3E66047C;
 Thu, 29 Sep 2022 22:42:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664484160;
 bh=7QLmF1EUxQU6uKa6wA9EHsGTHwOIMC3SjKhgpHFxBCI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=an+ccUkgP4KVKMo9hXhsiwYtPmxoP7gCAh5S5cNiqwsZwkTBafZF+vgL2A74CwInV
 O7M41py2z8xYXPRNKiAci6NL1LrEMj8XsrIj4u+vN+PMV+iMYT87QFKd0zKe6cFCiE
 fVJ5X2ssGeLKXulTq/+RVZl3cvt1ALeIVINp7frM=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/4] drm: lcdif: Don't use BIT() for multi-bit register
 fields
Date: Thu, 29 Sep 2022 23:42:33 +0300
Message-Id: <20220929204235.773-3-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220929204235.773-1-laurent.pinchart@ideasonboard.com>
References: <20220929204235.773-1-laurent.pinchart@ideasonboard.com>
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Liu Ying <victor.liu@nxp.com>, Daniel Scally <dan.scally@ideasonboard.com>,
 Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The BIT() macro is meant to represent a single bit. Don't use it for
values of register fields that span multiple bits.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Marek Vasut <marex@denx.de>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
Reviewed-by: Liu Ying <victor.liu@nxp.com>
---
Changes since v1:

- Use hex for field values
---
 drivers/gpu/drm/mxsfb/lcdif_regs.h | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/lcdif_regs.h b/drivers/gpu/drm/mxsfb/lcdif_regs.h
index 013f2cace2a0..0d5d9bedd94a 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_regs.h
+++ b/drivers/gpu/drm/mxsfb/lcdif_regs.h
@@ -138,9 +138,9 @@
 
 #define DISP_PARA_DISP_ON		BIT(31)
 #define DISP_PARA_SWAP_EN		BIT(30)
-#define DISP_PARA_LINE_PATTERN_UYVY_H	(GENMASK(29, 28) | BIT(26))
-#define DISP_PARA_LINE_PATTERN_RGB565	GENMASK(28, 26)
-#define DISP_PARA_LINE_PATTERN_RGB888	0
+#define DISP_PARA_LINE_PATTERN_UYVY_H	(0xd << 26)
+#define DISP_PARA_LINE_PATTERN_RGB565	(0x7 << 26)
+#define DISP_PARA_LINE_PATTERN_RGB888	(0x0 << 26)
 #define DISP_PARA_LINE_PATTERN_MASK	GENMASK(29, 26)
 #define DISP_PARA_DISP_MODE_MASK	GENMASK(25, 24)
 #define DISP_PARA_BGND_R_MASK		GENMASK(23, 16)
@@ -202,18 +202,18 @@
 
 #define CTRLDESCL0_5_EN			BIT(31)
 #define CTRLDESCL0_5_SHADOW_LOAD_EN	BIT(30)
-#define CTRLDESCL0_5_BPP_16_RGB565	BIT(26)
-#define CTRLDESCL0_5_BPP_16_ARGB1555	(BIT(26) | BIT(24))
-#define CTRLDESCL0_5_BPP_16_ARGB4444	(BIT(26) | BIT(25))
-#define CTRLDESCL0_5_BPP_YCbCr422	(BIT(26) | BIT(25) | BIT(24))
-#define CTRLDESCL0_5_BPP_24_RGB888	BIT(27)
-#define CTRLDESCL0_5_BPP_32_ARGB8888	(BIT(27) | BIT(24))
-#define CTRLDESCL0_5_BPP_32_ABGR8888	(BIT(27) | BIT(25))
+#define CTRLDESCL0_5_BPP_16_RGB565	(0x4 << 24)
+#define CTRLDESCL0_5_BPP_16_ARGB1555	(0x5 << 24)
+#define CTRLDESCL0_5_BPP_16_ARGB4444	(0x6 << 24)
+#define CTRLDESCL0_5_BPP_YCbCr422	(0x7 << 24)
+#define CTRLDESCL0_5_BPP_24_RGB888	(0x8 << 24)
+#define CTRLDESCL0_5_BPP_32_ARGB8888	(0x9 << 24)
+#define CTRLDESCL0_5_BPP_32_ABGR8888	(0xa << 24)
 #define CTRLDESCL0_5_BPP_MASK		GENMASK(27, 24)
-#define CTRLDESCL0_5_YUV_FORMAT_Y2VY1U	0
-#define CTRLDESCL0_5_YUV_FORMAT_Y2UY1V	BIT(14)
-#define CTRLDESCL0_5_YUV_FORMAT_VY2UY1	BIT(15)
-#define CTRLDESCL0_5_YUV_FORMAT_UY2VY1	(BIT(15) | BIT(14))
+#define CTRLDESCL0_5_YUV_FORMAT_Y2VY1U	(0x0 << 14)
+#define CTRLDESCL0_5_YUV_FORMAT_Y2UY1V	(0x1 << 14)
+#define CTRLDESCL0_5_YUV_FORMAT_VY2UY1	(0x2 << 14)
+#define CTRLDESCL0_5_YUV_FORMAT_UY2VY1	(0x3 << 14)
 #define CTRLDESCL0_5_YUV_FORMAT_MASK	GENMASK(15, 14)
 
 #define CSC0_CTRL_CSC_MODE_RGB2YCbCr	GENMASK(2, 1)
-- 
Regards,

Laurent Pinchart

