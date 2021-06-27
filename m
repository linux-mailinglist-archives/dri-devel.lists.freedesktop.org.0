Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D10D3B5975
	for <lists+dri-devel@lfdr.de>; Mon, 28 Jun 2021 09:06:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B3FD6E18F;
	Mon, 28 Jun 2021 07:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 376 seconds by postgrey-1.36 at gabe;
 Sun, 27 Jun 2021 08:54:05 UTC
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4F7D6E029
 for <dri-devel@lists.freedesktop.org>; Sun, 27 Jun 2021 08:54:05 +0000 (UTC)
Received: from localhost (unknown [192.168.167.16])
 by lucky1.263xmail.com (Postfix) with ESMTP id 0A31ACF056;
 Sun, 27 Jun 2021 16:47:45 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-SKE-CHECKED: 1
X-ANTISPAM-LEVEL: 2
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P12363T139708910794496S1624783659924687_; 
 Sun, 27 Jun 2021 16:47:46 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <456593cc75213b8b0db436fb9310d05b>
X-RL-SENDER: andy.yan@rock-chips.com
X-SENDER: yxj@rock-chips.com
X-LOGIN-NAME: andy.yan@rock-chips.com
X-FST-TO: hjc@rock-chips.com
X-RCPT-COUNT: 7
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: Andy Yan <andy.yan@rock-chips.com>
To: hjc@rock-chips.com, heiko@sntech.de, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org
Subject: [PATCH] drm/rockchip: Check iommu itself instead of it's parent for
 device_is_available
Date: Sun, 27 Jun 2021 16:47:37 +0800
Message-Id: <20210627084737.309163-1-andy.yan@rock-chips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 28 Jun 2021 07:06:06 +0000
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
Cc: Andy Yan <andy.yan@rock-chips.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When iommu itself is disabled in dts, we should
fallback to non-iommu buffer, check iommu parent
is meanless here.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/rockchip/rockchip_drm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index 212bd87c0c4a..0d20c8cc1ffa 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -366,7 +366,7 @@ static int rockchip_drm_platform_of_probe(struct device *dev)
 		}
 
 		iommu = of_parse_phandle(port->parent, "iommus", 0);
-		if (!iommu || !of_device_is_available(iommu->parent)) {
+		if (!iommu || !of_device_is_available(iommu)) {
 			DRM_DEV_DEBUG(dev,
 				      "no iommu attached for %pOF, using non-iommu buffers\n",
 				      port->parent);
-- 
2.25.1



