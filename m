Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90574B22B49
	for <lists+dri-devel@lfdr.de>; Tue, 12 Aug 2025 17:02:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E0289B78;
	Tue, 12 Aug 2025 15:02:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=sntech.de header.i=@sntech.de header.b="wifyCwkw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 175B889B78
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Aug 2025 15:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de; 
 s=gloria202408;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Reply-To:Content-Type:In-Reply-To:References;
 bh=2VkIKlblba9WFkmenTXpPIqq84rYzCyImM7Q0AHXy3k=; b=wifyCwkwUbqJZwuXlj5yaBcMH1
 2/TVBmEOOq9QpItnTrSOyY0MjmhVotrk1eRpimODPFcZDC1bjmMuIjo44t2PwbAtOw7jYOm3pwvC6
 7+CS6oidJ+xLxi6IFeQ1Sy9atvU8XHsmDNiqmwbsR6qqCVAgfqcDb2/ETKjtf30xp9KTEhqhZOWWs
 JrJu2OP/N+rejZVBlSiX9w3Uh+s3f5UCB4Lw5g/W8sK5nWcZl7UHzf5n4Zj2lgRO9NJa/YcMDZ8WB
 jbn9TrNJ+iIMj8PIEkU+0IOB9QZDj79lEMKMB+p8WaA4opNYq5bTcir8TJnAgEAIIL7lMwToMbni2
 B/tzhhzw==;
Received: from i53875a42.versanet.de ([83.135.90.66]
 helo=localhost.localdomain)
 by gloria.sntech.de with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <heiko@sntech.de>)
 id 1ulqVd-0004VY-UD; Tue, 12 Aug 2025 17:01:53 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/rockchip: vop2: move clk-disable into its own function
Date: Tue, 12 Aug 2025 17:01:43 +0200
Message-ID: <20250812150143.1126584-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
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

Right now vop2_enable calls vop2_core_clks_prepare_enable to handle the
vop clocks, but vop2_disable directly disables the clocks.

Not nice from a symmetry point of view and also if we ever need to disable
the clocks elsewhere, this would become a problem, so move clock disable
into its own function as well.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 07ea2d2cf6d6..827ce440026c 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -785,6 +785,13 @@ static int vop2_core_clks_prepare_enable(struct vop2 *vop2)
 	return ret;
 }
 
+static void vop2_core_clks_disable_unprepare(struct vop2 *vop2)
+{
+	clk_disable_unprepare(vop2->pclk);
+	clk_disable_unprepare(vop2->aclk);
+	clk_disable_unprepare(vop2->hclk);
+}
+
 static void rk3588_vop2_power_domain_enable_all(struct vop2 *vop2)
 {
 	u32 pd;
@@ -867,9 +874,7 @@ static void vop2_disable(struct vop2 *vop2)
 
 	regcache_drop_region(vop2->map, 0, vop2_regmap_config.max_register);
 
-	clk_disable_unprepare(vop2->pclk);
-	clk_disable_unprepare(vop2->aclk);
-	clk_disable_unprepare(vop2->hclk);
+	vop2_core_clks_disable_unprepare(vop2);
 }
 
 static bool vop2_vp_dsp_lut_is_enabled(struct vop2_video_port *vp)
-- 
2.47.2

