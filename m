Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2689FC7A6
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2024 03:30:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BE1110E682;
	Thu, 26 Dec 2024 02:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="Eevo40RW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9067C10E682
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2024 02:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=8oqYD/B3UMlO69nH16a4qOpq5t9+uPPTLogH0zzGwks=; b=Eevo40RWUifZuus8
 s48V+jvzoplAN44z3+2xITvRxcWrZODQotuSNCN8wjQZybqro18vPFkZgTbEAYY235W6LwC57qM0D
 dpOdCBNN7PDJKRu9/yia/r984fVZljCpIJLXNEbIa71EQfRv66ll2UPeFeYN6r0XcLzuJBuEFjcAA
 Orxi5NXo7PFbANyaAqxZDDIkL70ou2H+gmTU/LBgBb6NSDiUE61Mf4r4ZqSijCM3VZLWZAHJngA5B
 8p/Lx6Sm+y23DjoDBG5Lqwcc08wY5/4H6y/CDracxO4tbiTPnV4PXOIv2htKKk8EMyo0q2EH1hoj3
 XQQRX5RXR+LOz2Lmog==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tQdbO-007F0L-17;
 Thu, 26 Dec 2024 02:27:54 +0000
From: linux@treblig.org
To: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, deller@gmx.de,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 1/7] gpu: ipu-v3: ipu-ic: Remove unused
 ipu_ic_task_graphics_init
Date: Thu, 26 Dec 2024 02:27:46 +0000
Message-ID: <20241226022752.219399-2-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241226022752.219399-1-linux@treblig.org>
References: <20241226022752.219399-1-linux@treblig.org>
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

ipu_ic_task_graphics_init() was added in 2014 by
commit 1aa8ea0d2bd5 ("gpu: ipu-v3: Add Image Converter unit")
but has been unused.

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/ipu-v3/ipu-ic.c | 73 -------------------------------------
 include/video/imx-ipu-v3.h  |  4 --
 2 files changed, 77 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-ic.c b/drivers/gpu/ipu-v3/ipu-ic.c
index 846461bac70d..acd76ecc5221 100644
--- a/drivers/gpu/ipu-v3/ipu-ic.c
+++ b/drivers/gpu/ipu-v3/ipu-ic.c
@@ -321,79 +321,6 @@ void ipu_ic_task_disable(struct ipu_ic *ic)
 }
 EXPORT_SYMBOL_GPL(ipu_ic_task_disable);
 
-int ipu_ic_task_graphics_init(struct ipu_ic *ic,
-			      const struct ipu_ic_colorspace *g_in_cs,
-			      bool galpha_en, u32 galpha,
-			      bool colorkey_en, u32 colorkey)
-{
-	struct ipu_ic_priv *priv = ic->priv;
-	struct ipu_ic_csc csc2;
-	unsigned long flags;
-	u32 reg, ic_conf;
-	int ret = 0;
-
-	if (ic->task == IC_TASK_ENCODER)
-		return -EINVAL;
-
-	spin_lock_irqsave(&priv->lock, flags);
-
-	ic_conf = ipu_ic_read(ic, IC_CONF);
-
-	if (!(ic_conf & ic->bit->ic_conf_csc1_en)) {
-		struct ipu_ic_csc csc1;
-
-		ret = ipu_ic_calc_csc(&csc1,
-				      V4L2_YCBCR_ENC_601,
-				      V4L2_QUANTIZATION_FULL_RANGE,
-				      IPUV3_COLORSPACE_RGB,
-				      V4L2_YCBCR_ENC_601,
-				      V4L2_QUANTIZATION_FULL_RANGE,
-				      IPUV3_COLORSPACE_RGB);
-		if (ret)
-			goto unlock;
-
-		/* need transparent CSC1 conversion */
-		ret = init_csc(ic, &csc1, 0);
-		if (ret)
-			goto unlock;
-	}
-
-	ic->g_in_cs = *g_in_cs;
-	csc2.in_cs = ic->g_in_cs;
-	csc2.out_cs = ic->out_cs;
-
-	ret = __ipu_ic_calc_csc(&csc2);
-	if (ret)
-		goto unlock;
-
-	ret = init_csc(ic, &csc2, 1);
-	if (ret)
-		goto unlock;
-
-	if (galpha_en) {
-		ic_conf |= IC_CONF_IC_GLB_LOC_A;
-		reg = ipu_ic_read(ic, IC_CMBP_1);
-		reg &= ~(0xff << ic->bit->ic_cmb_galpha_bit);
-		reg |= (galpha << ic->bit->ic_cmb_galpha_bit);
-		ipu_ic_write(ic, reg, IC_CMBP_1);
-	} else
-		ic_conf &= ~IC_CONF_IC_GLB_LOC_A;
-
-	if (colorkey_en) {
-		ic_conf |= IC_CONF_KEY_COLOR_EN;
-		ipu_ic_write(ic, colorkey, IC_CMBP_2);
-	} else
-		ic_conf &= ~IC_CONF_KEY_COLOR_EN;
-
-	ipu_ic_write(ic, ic_conf, IC_CONF);
-
-	ic->graphics = true;
-unlock:
-	spin_unlock_irqrestore(&priv->lock, flags);
-	return ret;
-}
-EXPORT_SYMBOL_GPL(ipu_ic_task_graphics_init);
-
 int ipu_ic_task_init_rsc(struct ipu_ic *ic,
 			 const struct ipu_ic_csc *csc,
 			 int in_width, int in_height,
diff --git a/include/video/imx-ipu-v3.h b/include/video/imx-ipu-v3.h
index c422a403c099..0bb1d714cbf5 100644
--- a/include/video/imx-ipu-v3.h
+++ b/include/video/imx-ipu-v3.h
@@ -445,10 +445,6 @@ int ipu_ic_task_init_rsc(struct ipu_ic *ic,
 			 int in_width, int in_height,
 			 int out_width, int out_height,
 			 u32 rsc);
-int ipu_ic_task_graphics_init(struct ipu_ic *ic,
-			      const struct ipu_ic_colorspace *g_in_cs,
-			      bool galpha_en, u32 galpha,
-			      bool colorkey_en, u32 colorkey);
 void ipu_ic_task_enable(struct ipu_ic *ic);
 void ipu_ic_task_disable(struct ipu_ic *ic);
 int ipu_ic_task_idma_init(struct ipu_ic *ic, struct ipuv3_channel *channel,
-- 
2.47.1

