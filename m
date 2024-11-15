Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A6A9CEB51
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 16:11:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B97D10E883;
	Fri, 15 Nov 2024 15:11:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="2oiJfz2P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48C410E885
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 15:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nk174AGwbrN2iQ6lu65t+DAZ0jlZZM5p3WBAEQT210c=; b=2oiJfz2PsPaSVvAFd/OOAOWE9i
 04gX2fak00SItozpZvfRKoQVQPDAg+TqJPLjy3Yf35Q/4wumcBHRVS5dkoQULujJU4Ligq/XI5H1H
 MfWmVd+Nk58nZjqvJUp4ooBzGefeQPkx2Qf1S+fhSNyd2S3T7/NY16r/pYe6gSyMkgd05QvCVHCfZ
 /CWAK2cC6vcUez7l7Uvi0T4fhZapXNnXdM9kRAkTsEsPuV/KTQp1sxmtLW3WcRkmzAKAg8yoMQ6sq
 No1uZbmGJwUDon5wSTkVfwAyLTofPYWsgWWAeW/CBByIsft0295JLpJioFTu6c4+c8R6XT1e5Lslu
 eAo6tqSw==;
Received: from i53875a30.versanet.de ([83.135.90.48]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1tBxz5-0002mM-O9; Fri, 15 Nov 2024 16:11:43 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@theobroma-systems.com, hjc@rock-chips.com,
 andy.yan@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, sebastian.reichel@collabora.com,
 Heiko Stuebner <heiko.stuebner@cherry.de>,
 Quentin Schulz <quentin.schulz@cherry.de>, Andy Yan <andyshrk@163.com>
Subject: [PATCH v2] drm/rockchip: vop2: fix rk3588 dp+dsi maxclk verification
Date: Fri, 15 Nov 2024 16:11:31 +0100
Message-ID: <20241115151131.416830-1-heiko@sntech.de>
X-Mailer: git-send-email 2.45.2
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

The clock is in Hz while the value checked against is in kHz, so
actual frequencies will never be able to be below to max value.
Fix this by specifying the max-value in Hz too.

Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Acked-by: Andy Yan<andyshrk@163.com>
---
changes in v2:
- drop the separate vp3-config patch, as vp3 will always get the leftover
  resources, so _should_ be fine (Andy)
- fix error output to also report Hz for the value in Hz (Quentin)
- add received Reviews+Acks

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 9ad025aa9ab0..0c8ec7220fbe 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1864,9 +1864,9 @@ static unsigned long rk3588_calc_cru_cfg(struct vop2_video_port *vp, int id,
 		else
 			dclk_out_rate = v_pixclk >> 2;
 
-		dclk_rate = rk3588_calc_dclk(dclk_out_rate, 600000);
+		dclk_rate = rk3588_calc_dclk(dclk_out_rate, 600000000);
 		if (!dclk_rate) {
-			drm_err(vop2->drm, "DP dclk_out_rate out of range, dclk_out_rate: %ld KHZ\n",
+			drm_err(vop2->drm, "DP dclk_out_rate out of range, dclk_out_rate: %ld Hz\n",
 				dclk_out_rate);
 			return 0;
 		}
@@ -1881,9 +1881,9 @@ static unsigned long rk3588_calc_cru_cfg(struct vop2_video_port *vp, int id,
 		 * dclk_rate = N * dclk_core_rate N = (1,2,4 ),
 		 * we get a little factor here
 		 */
-		dclk_rate = rk3588_calc_dclk(dclk_out_rate, 600000);
+		dclk_rate = rk3588_calc_dclk(dclk_out_rate, 600000000);
 		if (!dclk_rate) {
-			drm_err(vop2->drm, "MIPI dclk out of range, dclk_out_rate: %ld KHZ\n",
+			drm_err(vop2->drm, "MIPI dclk out of range, dclk_out_rate: %ld Hz\n",
 				dclk_out_rate);
 			return 0;
 		}
-- 
2.45.2

