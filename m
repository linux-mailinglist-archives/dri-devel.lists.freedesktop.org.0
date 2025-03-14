Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52504A607D4
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 04:39:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B3E110E28C;
	Fri, 14 Mar 2025 03:39:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="PWVa65gW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 06C2810E289
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 03:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=5S7qD
 G/7DiIxk9A/IfhgNysBrSkCcxry2fy219vj0Rk=; b=PWVa65gWwB60fYUl0DgFM
 qqU4lQK8+asSfFZ3hKaiARZPi1+eiw1qf1BiE1xHX+0QmKhX1WgIziNA6IccxXKf
 7fvF5dmHDPV4asXNl6Td04lu21uBPuSZLokvOcEDVLk1Z9UQeFoBzCYdcHk/Attm
 kjSU0XXixtLdjuFiE5JZCQ=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id
 _____wC3bE_SpNNn4bIfSw--.42501S5; 
 Fri, 14 Mar 2025 11:39:07 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: lumag@kernel.org
Cc: mripard@kernel.org, neil.armstrong@linaro.org,
 dri-devel@lists.freedesktop.org, dianders@chromium.org,
 jani.nikula@intel.com, lyude@redhat.com, jonathanh@nvidia.com,
 thierry.reding@gmail.com, victor.liu@nxp.com, rfoss@kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 4/5] drm/bridge: anx78xx: Switch to common helpers to power
 up/down dp link
Date: Fri, 14 Mar 2025 11:38:43 +0800
Message-ID: <20250314033856.538352-4-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250314033856.538352-1-andyshrk@163.com>
References: <20250314033856.538352-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wC3bE_SpNNn4bIfSw--.42501S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr4ktrWfZFyxArWfXr1kZrb_yoW8Ww45pr
 1fKw42yr1xuw13Xr4YkF10gFW5Za4DW395CrW7Cw4vy3WUAFnF9a4IvFyfJ3s8JryrAr10
 qr1DJasrZa409w7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jm388UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0h0QXmfTn9eUNAAAsd
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

Use the common dp link power up/down helpers to avoid duplicating code.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 .../drm/bridge/analogix/analogix-anx78xx.c    | 30 +------------------
 1 file changed, 1 insertion(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
index f74694bb9c50..3d9daa885eef 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
@@ -656,35 +656,7 @@ static int anx78xx_dp_link_training(struct anx78xx *anx78xx)
 	if (err)
 		return err;
 
-	/*
-	 * Power up the sink (DP_SET_POWER register is only available on DPCD
-	 * v1.1 and later).
-	 */
-	if (anx78xx->dpcd[DP_DPCD_REV] >= 0x11) {
-		err = drm_dp_dpcd_readb(&anx78xx->aux, DP_SET_POWER, &dpcd[0]);
-		if (err < 0) {
-			DRM_ERROR("Failed to read DP_SET_POWER register: %d\n",
-				  err);
-			return err;
-		}
-
-		dpcd[0] &= ~DP_SET_POWER_MASK;
-		dpcd[0] |= DP_SET_POWER_D0;
-
-		err = drm_dp_dpcd_writeb(&anx78xx->aux, DP_SET_POWER, dpcd[0]);
-		if (err < 0) {
-			DRM_ERROR("Failed to power up DisplayPort link: %d\n",
-				  err);
-			return err;
-		}
-
-		/*
-		 * According to the DP 1.1 specification, a "Sink Device must
-		 * exit the power saving state within 1 ms" (Section 2.5.3.1,
-		 * Table 5-52, "Sink Control Field" (register 0x600).
-		 */
-		usleep_range(1000, 2000);
-	}
+	drm_dp_link_power_up(&anx78xx->aux, anx78xx->dpcd[DP_DPCD_REV]);
 
 	/* Possibly enable downspread on the sink */
 	err = regmap_write(anx78xx->map[I2C_IDX_TX_P0],
-- 
2.34.1

