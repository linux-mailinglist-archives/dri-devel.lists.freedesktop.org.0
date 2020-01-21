Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 158111447E5
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 23:48:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34C946E4F3;
	Tue, 21 Jan 2020 22:48:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E86126E4F3
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2020 22:48:45 +0000 (UTC)
Received: from mail.linser.at ([80.109.168.170] helo=phil.Hitronhub.home)
 by gloria.sntech.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <heiko@sntech.de>)
 id 1iu2KA-0005xB-3m; Tue, 21 Jan 2020 23:48:42 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: hjc@rock-chips.com
Subject: [PATCH] drm/rockchip: rgb: don't count non-existent devices when
 determining subdrivers
Date: Tue, 21 Jan 2020 23:48:28 +0100
Message-Id: <20200121224828.4070067-1-heiko@sntech.de>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
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
Cc: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org, miquel.raynal@bootlin.com,
 linux-arm-kernel@lists.infradead.org, christoph.muellner@theobroma-systems.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

rockchip_drm_endpoint_is_subdriver() may also return error codes.
For example if the target-node is in the disabled state, so no
platform-device is getting created for it.

In that case current code would count that as external rgb device,
which in turn would make probing the rockchip-drm device fail.

So only count the target as rgb device if the function actually
returns 0.

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
---
 drivers/gpu/drm/rockchip/rockchip_rgb.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/rockchip/rockchip_rgb.c
index ae730275a34f..79a7e60633e0 100644
--- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
@@ -98,7 +98,8 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 		if (of_property_read_u32(endpoint, "reg", &endpoint_id))
 			endpoint_id = 0;
 
-		if (rockchip_drm_endpoint_is_subdriver(endpoint) > 0)
+		/* if subdriver (> 0) or error case (< 0), ignore entry */
+		if (rockchip_drm_endpoint_is_subdriver(endpoint) != 0)
 			continue;
 
 		child_count++;
-- 
2.24.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
