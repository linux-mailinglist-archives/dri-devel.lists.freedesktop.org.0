Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 469EE9FC7AC
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2024 03:30:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E03010E687;
	Thu, 26 Dec 2024 02:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="OWjTPVYF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF98510E688
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2024 02:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=yXPgWv/039w1DyrPkw5OOxKhH6440KjCye1nUeVurvk=; b=OWjTPVYFBHSCtQMs
 8L78DLn9tCBaDou3Ky31EIG4UabrDzOUFYegaOp0IXEQSpBiUYDy/H/uSuWiU1NleRQg2jzFqyMbt
 AssPaAXJy47TFNuFXaAyiA6aLn4Yw9GbFQN1KdVc7rQuS/5TcukA/Ih5LGmrJGsHs0f1BEssx5JfD
 p5v3xFFui/5Bc/BivfJ90lClLt3vskDfhQZPmex16Ny0katC6ZqdOADSj7O3Zk2KqF6r+WwDqPa3R
 FEU76F6ahoRcPC+1LqfMrlSNdu72IwTsjEma31ba+yIp4//bDnzFmdZ2TxRJavmKNgNJfA+xWKtJd
 RiUDMxUtLrXmi9UkHg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tQdbP-007F0L-2Z;
 Thu, 26 Dec 2024 02:27:55 +0000
From: linux@treblig.org
To: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, deller@gmx.de,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 3/7] gpu: ipu-v3: Remove unused ipu_idmac_channel_busy
Date: Thu, 26 Dec 2024 02:27:48 +0000
Message-ID: <20241226022752.219399-4-linux@treblig.org>
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

The last use of ipu_idmac_channel_busy() was removed in 2017 by
commit eb8c88808c83 ("drm/imx: add deferred plane disabling")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/ipu-v3/ipu-common.c | 6 ------
 drivers/gpu/ipu-v3/ipu-prv.h    | 2 --
 2 files changed, 8 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-common.c b/drivers/gpu/ipu-v3/ipu-common.c
index a8570e1bdf28..fa77e4e64f12 100644
--- a/drivers/gpu/ipu-v3/ipu-common.c
+++ b/drivers/gpu/ipu-v3/ipu-common.c
@@ -484,12 +484,6 @@ int ipu_idmac_enable_channel(struct ipuv3_channel *channel)
 }
 EXPORT_SYMBOL_GPL(ipu_idmac_enable_channel);
 
-bool ipu_idmac_channel_busy(struct ipu_soc *ipu, unsigned int chno)
-{
-	return (ipu_idmac_read(ipu, IDMAC_CHA_BUSY(chno)) & idma_mask(chno));
-}
-EXPORT_SYMBOL_GPL(ipu_idmac_channel_busy);
-
 int ipu_idmac_wait_busy(struct ipuv3_channel *channel, int ms)
 {
 	struct ipu_soc *ipu = channel->ipu;
diff --git a/drivers/gpu/ipu-v3/ipu-prv.h b/drivers/gpu/ipu-v3/ipu-prv.h
index 3884acb7995a..16322b2137f8 100644
--- a/drivers/gpu/ipu-v3/ipu-prv.h
+++ b/drivers/gpu/ipu-v3/ipu-prv.h
@@ -216,8 +216,6 @@ void ipu_srm_dp_update(struct ipu_soc *ipu, bool sync);
 int ipu_module_enable(struct ipu_soc *ipu, u32 mask);
 int ipu_module_disable(struct ipu_soc *ipu, u32 mask);
 
-bool ipu_idmac_channel_busy(struct ipu_soc *ipu, unsigned int chno);
-
 int ipu_csi_init(struct ipu_soc *ipu, struct device *dev, int id,
 		 unsigned long base, u32 module, struct clk *clk_ipu);
 void ipu_csi_exit(struct ipu_soc *ipu, int id);
-- 
2.47.1

