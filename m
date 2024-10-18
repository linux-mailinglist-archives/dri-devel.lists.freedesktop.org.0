Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 991239A41FA
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 17:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0E2F10E944;
	Fri, 18 Oct 2024 15:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QTsLzh6l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE5110E944
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 15:10:23 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2DBFD5C4D58;
 Fri, 18 Oct 2024 15:10:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05FA7C4CEC3;
 Fri, 18 Oct 2024 15:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729264222;
 bh=1PJEXr3kEPCQZZ5V+Hy5FS8SkVqvabwVcmhCAPX1iOQ=;
 h=From:To:Cc:Subject:Date:From;
 b=QTsLzh6lThzlelfZBn/cIWOm1pUUnVUt4PEgpXo6zcTOjv7CgYPjb979ht52ZkEwY
 oYEq8dlQK+JvichsF/8JBqw1yXlpH8EngGrGEG2gb0SKoKCHRmGjtBJyd2Mxu5psRj
 J1hYFJaT41xlRHJH+8Sz3ibTLpBEteYzOXaz3fiIH5fs4PN1pE4XnQgeHft2pQiNkH
 jcz5w/I8o6EFgpHSBWzoH9wvoPcwNokJxYvYITsksrU3yFhDPiyu8bjKvdlx7oClds
 GEqxnMcPj5e/Pt7/k/ZlK4qtptReFNQtcQ3WuU0InCF4klTC9nNGerwH2R/8LhDdn4
 +K6SEWbKYMA0Q==
From: Arnd Bergmann <arnd@kernel.org>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Algea Cao <algea.cao@rock-chips.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Arnd Bergmann <arnd@arndb.de>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/rockchip: avoid 64-bit division
Date: Fri, 18 Oct 2024 15:10:10 +0000
Message-Id: <20241018151016.3496613-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Arnd Bergmann <arnd@arndb.de>

Dividing a 64-bit integer prevents building this for 32-bit targets:

ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/rockchip/rockchipdrm.ko] undefined!

As this function is not performance criticial, just Use the div_u64() helper.

Fixes: 128a9bf8ace2 ("drm/rockchip: Add basic RK3588 HDMI output support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 9c796ee4c303..c8b362cc2b95 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -82,7 +82,7 @@ static void dw_hdmi_qp_rockchip_encoder_enable(struct drm_encoder *encoder)
 		 * comment in rk_hdptx_phy_power_on() from
 		 * drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
 		 */
-		phy_set_bus_width(hdmi->phy, rate / 100);
+		phy_set_bus_width(hdmi->phy, div_u64(rate, 100));
 	}
 }
 
-- 
2.39.5

