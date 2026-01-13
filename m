Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A452D190FB
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jan 2026 14:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D875E10E4D4;
	Tue, 13 Jan 2026 13:15:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD54710E4D4
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 13:15:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 20E396000A;
 Tue, 13 Jan 2026 13:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C887C116C6;
 Tue, 13 Jan 2026 13:15:04 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Sandy Huang <hjc@rock-chips.com>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] drm/rockchip: DRM_ROCKCHIP should depend on ARCH_ROCKCHIP
Date: Tue, 13 Jan 2026 14:15:01 +0100
Message-ID: <5db192d31cc51f027f107c01c01a353a0569ebf4.1768310045.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
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

Rockchip display hardware is only available on Rockchip SoCs.  Hence add
a dependency on ARCH_ROCKCHIP, to prevent asking the user about this
driver when configuring a kernel without Rockchip platform support.

Before, this dependency was implicit through a hard dependency on
ROCKCHIP_IOMMU.

Fixes: 0244539f9a4f3b56 ("drm/rockchip: Drop ROCKCHIP_IOMMU depend for DRM_ROCKCHIP")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/rockchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index 025bd770f499e6ed..1479b8c4ed40ad16 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -2,6 +2,7 @@
 config DRM_ROCKCHIP
 	tristate "DRM Support for Rockchip"
 	depends on DRM
+	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	depends on ROCKCHIP_IOMMU || !ROCKCHIP_IOMMU
 	depends on OF
 	select DRM_CLIENT_SELECTION
-- 
2.43.0

