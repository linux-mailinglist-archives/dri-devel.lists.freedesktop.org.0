Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EAA26A5EA6A
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 05:09:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FBA10E061;
	Thu, 13 Mar 2025 04:09:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="SX4lGM0M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B053710E061
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 04:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1741838946;
 bh=j7zpBJEhB8SicI9BKDz1KSrdQOhg5JL4HopKFTPur5k=;
 h=From:To:Cc:Subject:Date:From;
 b=SX4lGM0MJqbfxx/mmhRW/n7CDZtvZE7XoQBSAsi7njweboGy54o2bj3TW1FZSnXb1
 VqOdVU5io0S7jhRC6EjGGIZR7FWHaohcv6kOeFGKwoeW97j64l1lt+Mcmm4XRnsZre
 H86YgGn8p64XJlpt30ggZ4qMRlyKnuxg0TuM9cqIaQ17iSHHqYffjgK9WTz70LupPd
 oeu0zu9ysPLG1JM+ISSmuPoa8hpXWENiyrIvZ5MnBRzR48J7MjJv0ZpMAc6tYaREqc
 MSBJ2rMh+XcQwHHOC76pnLhX1GpwN2WmIrxH6/FTqvgRknBKV88aOctfb/3sjOyTjZ
 vpADPxWWOmW5g==
Received: from debian.. (unknown [171.76.87.92])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: vignesh)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 0CE6417E023F;
 Thu, 13 Mar 2025 05:09:01 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, nfraprado@collabora.com,
 angelogioacchino.delregno@collabora.com, krzk@kernel.org,
 daniels@collabora.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 arnd@kernel.org, ck.hu@mediatek.com, laura.nao@collabora.com,
 matthias.bgg@gmail.com, tzimmermann@suse.de, mripard@kernel.org,
 lumag@kernel.org, ville.syrjala@linux.intel.com, jani.nikula@intel.com,
 arnd@arndb.de, geert+renesas@glider.be, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3] arm64: defconfig: mediatek: enable PHY drivers
Date: Thu, 13 Mar 2025 09:38:24 +0530
Message-ID: <20250313040855.62259-1-vignesh.raman@collabora.com>
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

The mediatek display driver fails to probe on mt8173-elm-hana and
mt8183-kukui-jacuzzi-juniper-sku16 in v6.14-rc4 due to missing PHY
configurations.

Commit [1] stopped selecting the MediaTek PHY drivers, requiring them
to be explicitly enabled in defconfig.

Enable the following PHY drivers for MediaTek platforms:
- CONFIG_PHY_MTK_HDMI=m for HDMI display
- CONFIG_PHY_MTK_MIPI_DSI=m for DSI display
- CONFIG_PHY_MTK_DP=m for DP display

[1] commit 924d66011f24 ("drm/mediatek: stop selecting foreign drivers")

Fixes: 924d66011f24 ("drm/mediatek: stop selecting foreign drivers")
Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Include board details in the commit message.  
  - Sort newly added PHY configs in defconfig.

v3:
  - Use defconfig/savedefconfig to get the correct configs ordering.
  - Removed PHY_MTK_XSPHY since it is not required for probing display driver.
  - Add the commit details which deselected the MediaTek PHY drivers and
    added a Fixes tag.
  - Enabled CONFIG_PHY_MTK_DP, which was previously deselected.

---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1f25423de383..fa8ee7070b37 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1573,6 +1573,9 @@ CONFIG_PHY_HISTB_COMBPHY=y
 CONFIG_PHY_HISI_INNO_USB2=y
 CONFIG_PHY_MVEBU_CP110_COMPHY=y
 CONFIG_PHY_MTK_TPHY=y
+CONFIG_PHY_MTK_HDMI=m
+CONFIG_PHY_MTK_MIPI_DSI=m
+CONFIG_PHY_MTK_DP=m
 CONFIG_PHY_QCOM_EDP=m
 CONFIG_PHY_QCOM_PCIE2=m
 CONFIG_PHY_QCOM_QMP=m
-- 
2.47.2

