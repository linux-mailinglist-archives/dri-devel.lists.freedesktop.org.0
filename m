Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CCE496BB70
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 14:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5301310E394;
	Wed,  4 Sep 2024 12:03:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="NCdUCw8A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id 18B1210E386
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 12:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=M1QKT
 NQpk3AJnRUVpFtwnoS6CV+5zNobj1gYTC1w0YY=; b=NCdUCw8AASbbrP3hOckDS
 n3dmBpjRmHg2M85j5v6jdZSrlV8kNeb0d9/T5+pjnDN48M6mZ1BNmBdEdJSJGF35
 bvtUrwXhldROvgaqVEuvMWq5o6jESrkLJWUKNOxXCjc/uHfhTP2+jj9pZKmTecld
 TEpFjRRwup3fgcQD5n6D+U=
Received: from ProDesk.. (unknown [58.22.7.114])
 by gzga-smtp-mta-g3-0 (Coremail) with SMTP id
 _____wA3HxFgTNhmiRMZCA--.50872S10; 
 Wed, 04 Sep 2024 20:02:52 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: detlev.casanova@collabora.com
Cc: sjoerd@collabora.com, sebastian.reichel@collabora.com, heiko@sntech.de,
 hjc@rock-chips.com, cristian.ciocaltea@collabora.com, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 08/11] drm/rockchip: vop2: Add uv swap for cluster window
Date: Wed,  4 Sep 2024 20:02:35 +0800
Message-Id: <20240904120238.3856782-9-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904120238.3856782-1-andyshrk@163.com>
References: <20240904120238.3856782-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wA3HxFgTNhmiRMZCA--.50872S10
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFW8Ww1kAF4UAw47JFy7ZFb_yoW8Gr4kpw
 43ZrWq9r45Kw4Iq34kJFW5ZFWfCwnxKayxZws7tw109ry3KFyDK3Z0kFWUArnFya12ka17
 tFn3A3y7ZF4jvrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jsF4iUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gxQXmWX0KXl7wAAsd
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

The Cluster windows of upcoming VOP on rk3576 also support
linear YUV support, we need to set uv swap bit for it.

As the VOP2_WIN_UV_SWA register defined on rk3568/rk3588 is
0xffffffff, so this register will not be touched on these
two platforms.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

(no changes since v1)

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index df8194697a58..d0b763b0dd6c 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1274,10 +1274,8 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 
 	rb_swap = vop2_win_rb_swap(fb->format->format);
 	vop2_win_write(win, VOP2_WIN_RB_SWAP, rb_swap);
-	if (!vop2_cluster_window(win)) {
-		uv_swap = vop2_win_uv_swap(fb->format->format);
-		vop2_win_write(win, VOP2_WIN_UV_SWAP, uv_swap);
-	}
+	uv_swap = vop2_win_uv_swap(fb->format->format);
+	vop2_win_write(win, VOP2_WIN_UV_SWAP, uv_swap);
 
 	if (fb->format->is_yuv) {
 		vop2_win_write(win, VOP2_WIN_UV_VIR, DIV_ROUND_UP(fb->pitches[1], 4));
-- 
2.34.1

