Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE669E941C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 13:32:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50C2710E71B;
	Mon,  9 Dec 2024 12:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="mMvkan7X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 651D710E71A
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 12:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=74SCF
 EhyKUBw3QujU7m2Ujgf98W8fbRXMPY5M8M5yjw=; b=mMvkan7X9KHRjf/Ptn6XG
 jdUYzygfkjFLheJg/EJzkjZGrYiefty2e+xeXzR+z/cMY+M7ZjHbkDmtxJOeU/yA
 /v0KvJ3j2JAhUbiT13YjIVAsfRaaC5GBUDQ1Akzm131/c7+b/wr7yvLTbDXYxE7w
 OPX+DFqnuzUCzQSUiyETyA=
Received: from ProDesk.. (unknown [58.22.7.114])
 by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id
 _____wBHDaBQ41Zn269cMQ--.14778S2; 
 Mon, 09 Dec 2024 20:32:19 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, s.hauer@pengutronix.de,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, derek.foreman@collabora.com,
 detlev.casanova@collabora.com, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v5 08/18] drm/rockchip: vop2: Add check for 32 bpp format
Date: Mon,  9 Dec 2024 20:32:12 +0800
Message-ID: <20241209123215.2781721-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241209122943.2781431-1-andyshrk@163.com>
References: <20241209122943.2781431-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBHDaBQ41Zn269cMQ--.14778S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZF45Xw1rZr1ktrWrurWUCFg_yoWDKwbEk3
 4xZw1fWrs7uFn8AwnFga4fCFZFyan29F4UGayvyas5AF1kZw10qayIk3yUGasxGF4avFn7
 Aayjqr1fuF13CjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU166zUUUUUU==
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiqR6wXmdW3c3pJwACs0
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

Changes in v5:
-  Added in V5

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index bd8db45eeba6..1f101a3c3942 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1224,7 +1224,15 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 				return -EINVAL;
 			}
 		}
+	}
 
+	if (fb->format->format == DRM_FORMAT_XRGB2101010 || fb->format->format == DRM_FORMAT_XBGR2101010) {
+		if (vop2->data->soc_id == 3588) {
+			if (!rockchip_afbc(plane, fb->modifier)) {
+				drm_err(vop2->drm, "Unsupported linear 32 bpp for %s\n", win->data->name);
+				return -EINVAL;
+			}
+		}
 	}
 
 	/*
-- 
2.34.1

