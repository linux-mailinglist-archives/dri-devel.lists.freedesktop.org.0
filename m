Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A589F1D36
	for <lists+dri-devel@lfdr.de>; Sat, 14 Dec 2024 09:15:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4DD610E2B0;
	Sat, 14 Dec 2024 08:15:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="ZgVrV/Co";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5A9CA10E09C
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Dec 2024 08:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=hnZl0
 kD0NHFixyUuAcDalCU1UJrY0bC/p+e25gYBb4Y=; b=ZgVrV/CoIZRLIDk8o4Y7Y
 7Jw/fBZL4LYb/6HsYBzGlVIq6EoRNBdgK05qS722dw4VS1ss2yHOA6J89vO5gvD3
 /J1kEvVjPgK/iBJZZNzbqOoiz6dQwCy+OiopS/i8hiP4mpAwvucEMMrrUOHgzXK1
 vxwZygxlYtgIywvPrKhUs8=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id
 _____wD3vwGjPl1n3T_wAQ--.16730S8; 
 Sat, 14 Dec 2024 16:15:40 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, s.hauer@pengutronix.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
 detlev.casanova@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v6 06/16] drm/rockchip: vop2: Add check for 32 bpp format for
 rk3588
Date: Sat, 14 Dec 2024 16:15:14 +0800
Message-ID: <20241214081529.3330243-7-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241214081529.3330243-1-andyshrk@163.com>
References: <20241209122943.2781431-1-andyshrk@163.com>
 <20241214081529.3330243-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD3vwGjPl1n3T_wAQ--.16730S8
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF45Xw1rCw4DKF4DXw4xJFb_yoWkCwb_K3
 47Zw13WrZ7CFn8A3W2qa4fGFZFyan29F4rKayvya4rtF1kZ3WvqayIkry7Was8CFW3KFnr
 Cayjqr1rCF13ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0wZ23UUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqQq1XmddM6ytkwAAsT
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

RK3588 only support DRM_FORMAT_XRGB2101010/XBGR2101010 in afbc mode.

Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v6:
- Move 32 bpp check to format_mod_supported() hook

Changes in v5:
- Added in V5

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 94f77faf14d1..85d281edfbfe 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -603,6 +603,15 @@ static bool rockchip_vop2_mod_supported(struct drm_plane *plane, u32 format,
 		}
 	}
 
+	if (format == DRM_FORMAT_XRGB2101010 || format == DRM_FORMAT_XBGR2101010) {
+		if (vop2->data->soc_id == 3588) {
+			if (!rockchip_afbc(plane, modifier)) {
+				drm_dbg_kms(vop2->drm, "Only support 32 bpp format with afbc\n");
+				return false;
+			}
+		}
+	}
+
 	if (modifier == DRM_FORMAT_MOD_LINEAR)
 		return true;
 
-- 
2.34.1

