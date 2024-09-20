Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B7D97D276
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 10:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83DF110E2F1;
	Fri, 20 Sep 2024 08:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="Ms/OpU2x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6A23A10E2F1
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 08:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=GBq4X
 3SvjcKdAw76+LCZ96Aeae4FkXSnYqiBRPXZuM4=; b=Ms/OpU2xi0lF+5s6ABh2o
 yW/zFVMA64LbYDTSwaf8EpKAuzQzwpnTPAZF2sZv/aDKCbf4B0mbFz80m0BJLE0a
 Pd6MftUJWeiep/YPfLfiEDyVnfBX6AX6tdjSa4ZXqTm5D6znQLto6ceTurcepa0T
 iARi+8b9tBdYiKKv6gjbx0=
Received: from ProDesk.. (unknown [58.22.7.114])
 by gzga-smtp-mta-g3-0 (Coremail) with SMTP id _____wCnL3ZVMO1mBh1QBg--.6466S2; 
 Fri, 20 Sep 2024 16:20:40 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, robh@kernel.org,
 conor+dt@kernel.org, s.hauer@pengutronix.de, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 derek.foreman@collabora.com, minhuadotchen@gmail.com,
 detlev.casanova@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v3 02/15] drm/rockchip: Set dma mask to 64 bit
Date: Fri, 20 Sep 2024 16:20:23 +0800
Message-ID: <20240920082036.6623-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240920081626.6433-1-andyshrk@163.com>
References: <20240920081626.6433-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCnL3ZVMO1mBh1QBg--.6466S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF1xur1rJr1fWF13GFWUtwb_yoW8WFWfp3
 s0kFZrKrW8GayDXFWjkFsxAF45Kw1vya17G343JwnxJw17Krn8A3ZI9FyDt3y3Jr1xC3Wa
 yrsxKrWI9Fs2vr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jFT5dUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0h5gXmWX0hsr2QAAs7
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

From: Andy Yan <andy.yan@rock-chips.com>

The vop mmu support translate physical address upper 4 GB to iova
below 4 GB. So set dma mask to 64 bit to indicate we support address
> 4GB.

This can avoid warnging message like this on some boards with DDR
> 4 GB:

rockchip-drm display-subsystem: swiotlb buffer is full (sz: 266240 bytes), total 32768 (slots), used 130 (slots)
rockchip-drm display-subsystem: swiotlb buffer is full (sz: 266240 bytes), total 32768 (slots), used 0 (slots)
rockchip-drm display-subsystem: swiotlb buffer is full (sz: 266240 bytes), total 32768 (slots), used 130 (slots)
rockchip-drm display-subsystem: swiotlb buffer is full (sz: 266240 bytes), total 32768 (slots), used 130 (slots)
rockchip-drm display-subsystem: swiotlb buffer is full (sz: 266240 bytes), total 32768 (slots), used 0 (slots)

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Tested-by: Derek Foreman <derek.foreman@collabora.com>
---

(no changes since v1)

 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index 04ef7a2c3833..8bc2ff3b04bb 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -445,7 +445,9 @@ static int rockchip_drm_platform_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	return 0;
+	ret = dma_coerce_mask_and_coherent(dev, DMA_BIT_MASK(64));
+
+	return ret;
 }
 
 static void rockchip_drm_platform_remove(struct platform_device *pdev)
-- 
2.34.1

