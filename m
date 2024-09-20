Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F30ED97D283
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2024 10:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62FAD10E7D5;
	Fri, 20 Sep 2024 08:21:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="W2T7HbBL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 343FE10E7D8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2024 08:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=bxwDJ
 AkXvK8AdSR7veh+eMKRy+rJ61dS+tkTSOb3PvE=; b=W2T7HbBLhfMxj+T45i8BB
 X+sfflFZsdpik4Yj/CfQu00Nz2Tu4GUIvPK0r+tOhvNoQwN6Q0P1ij/YUxoYX4wb
 /RXFhkoDvGwGvYQvLkTLZSiab1h/xa0jBrKaL11u/r+SFq4VWTmAdLzfJTAGM6CG
 NIYDfuyJHevDCwP5n8GVhY=
Received: from ProDesk.. (unknown [58.22.7.114])
 by gzga-smtp-mta-g3-4 (Coremail) with SMTP id _____wD3X7mDMO1m_7DTEw--.2482S2; 
 Fri, 20 Sep 2024 16:21:26 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, robh@kernel.org,
 conor+dt@kernel.org, s.hauer@pengutronix.de, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 derek.foreman@collabora.com, minhuadotchen@gmail.com,
 detlev.casanova@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v3 06/15] drm/rockchip: vop2: include rockchip_drm_drv.h
Date: Fri, 20 Sep 2024 16:21:21 +0800
Message-ID: <20240920082122.6742-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240920081626.6433-1-andyshrk@163.com>
References: <20240920081626.6433-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3X7mDMO1m_7DTEw--.2482S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw15AryUXr1xtry5JF43KFg_yoW8CF4UpF
 s8AFWUZrWxKFWjqr1DAF9xCr4Fy3ZrCayxGFn7G3ZxZF17KFyDGwnru3s8JrZrXr47ZF42
 krs3J34UAF42vr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UZIDcUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMw5gXmbtL08mhAAAsK
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

Move rockchip_drm_drv.h in rockchip_drm_vop2.h to fix the follow
sparse warning:

ARCH=arm64 LLVM=1 make C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__'
mrproper defconfig all  -j12

drivers/gpu/drm/rockchip/rockchip_vop2_reg.c:502:24: sparse:
warning: symbol 'vop2_platform_driver' was not declared. Should it
be static?

It is also beneficial for the upcoming support for rk3576.

Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
Signed-off-by: Min-Hua Chen <minhuadotchen@gmail.com>

---

Changes in v3:
- Split it from 10/15, as it fix a exiting compile warning.

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 1 -
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.h | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 4776a227e62c..a7f9f88869a6 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -35,7 +35,6 @@
 #include <uapi/linux/videodev2.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
 
-#include "rockchip_drm_drv.h"
 #include "rockchip_drm_gem.h"
 #include "rockchip_drm_vop2.h"
 #include "rockchip_rgb.h"
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
index 59cd6b933bfb..bc001f715847 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.h
@@ -9,6 +9,7 @@
 
 #include <linux/regmap.h>
 #include <drm/drm_modes.h>
+#include "rockchip_drm_drv.h"
 #include "rockchip_drm_vop.h"
 
 #define VOP2_VP_FEATURE_OUTPUT_10BIT        BIT(0)
-- 
2.34.1

