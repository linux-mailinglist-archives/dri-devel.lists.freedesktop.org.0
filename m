Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 753E696BB77
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 14:03:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF9010E779;
	Wed,  4 Sep 2024 12:03:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="otUW57mT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2350210E386
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 12:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=nYl6R
 aOevEa8MgLD9U2NqZad2vg+D1DKC2FCulVFIRo=; b=otUW57mTcvLNRSqXFC5By
 f2Y2SjtIe5QxKUoji6AeKOf4yXtU06z3JZermJHSW1r9j+qIFi4MNTDlm5EzK30X
 NjRswBMxwo6wpBCNZ0vShlBmVwBhFmydxUq+gsruttxKgRUpjsYUbhjsaZzicTlz
 9XhlAQUJKffInmeym1VJ8c=
Received: from ProDesk.. (unknown [58.22.7.114])
 by gzga-smtp-mta-g3-0 (Coremail) with SMTP id _____wA3HxFgTNhmiRMZCA--.50872S5;
 Wed, 04 Sep 2024 20:02:47 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: detlev.casanova@collabora.com
Cc: sjoerd@collabora.com, sebastian.reichel@collabora.com, heiko@sntech.de,
 hjc@rock-chips.com, cristian.ciocaltea@collabora.com, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, krzk+dt@kernel.org,
 devicetree@vger.kernel.org, robh@kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v2 03/11] drm/rockchip: vop2: Support 32x8 superblock afbc
Date: Wed,  4 Sep 2024 20:02:30 +0800
Message-Id: <20240904120238.3856782-4-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240904120238.3856782-1-andyshrk@163.com>
References: <20240904120238.3856782-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wA3HxFgTNhmiRMZCA--.50872S5
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw17Cr1DZryxXr13uF1xZrb_yoW8Kw1rpr
 WfZrWqgr4DK3WjqanrJr98ZF45Aan2kay7XFnrKw1qgryYkrZrG3sFka4DZrWDt3yfGFW0
 vFn7JrW7Zw1Fyr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jqv38UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/1tbiMwdQXmXAnoefwgABsa
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

This is the only afbc format supported by the upcoming
VOP for rk3576.

Add support for it.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v2:
- split it from main patch add support for rk3576

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 467c3d66c735..2fef6b76abd0 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1357,16 +1357,18 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		vop2_win_write(win, VOP2_WIN_AFBC_HALF_BLOCK_EN, half_block_en);
 
 	if (afbc_en) {
-		u32 stride;
+		u32 stride, block_w;
+
+		/* the afbc superblock is 16 x 16 or 32 x 8 */
+		block_w = fb->modifier & AFBC_FORMAT_MOD_BLOCK_SIZE_32x8 ? 32 : 16;
 
-		/* the afbc superblock is 16 x 16 */
 		afbc_format = vop2_convert_afbc_format(fb->format->format);
 
 		/* Enable color transform for YTR */
 		if (fb->modifier & AFBC_FORMAT_MOD_YTR)
 			afbc_format |= (1 << 4);
 
-		afbc_tile_num = ALIGN(actual_w, 16) >> 4;
+		afbc_tile_num = ALIGN(actual_w, block_w) / block_w;
 
 		/*
 		 * AFBC pic_vir_width is count by pixel, this is different
@@ -1377,6 +1379,9 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 			drm_err(vop2->drm, "vp%d %s stride[%d] not 64 pixel aligned\n",
 				vp->id, win->data->name, stride);
 
+		 /* It's for head stride, each head size is 16 byte */
+		stride = ALIGN(stride, block_w) / block_w * 16;
+
 		uv_swap = vop2_afbc_uv_swap(fb->format->format);
 		/*
 		 * This is a workaround for crazy IC design, Cluster
@@ -1407,7 +1412,11 @@ static void vop2_plane_atomic_update(struct drm_plane *plane,
 		else
 			vop2_win_write(win, VOP2_WIN_AFBC_AUTO_GATING_EN, 1);
 
-		vop2_win_write(win, VOP2_WIN_AFBC_BLOCK_SPLIT_EN, 0);
+		if (fb->modifier & AFBC_FORMAT_MOD_SPLIT)
+			vop2_win_write(win, VOP2_WIN_AFBC_BLOCK_SPLIT_EN, 1);
+		else
+			vop2_win_write(win, VOP2_WIN_AFBC_BLOCK_SPLIT_EN, 0);
+
 		transform_offset = vop2_afbc_transform_offset(pstate, half_block_en);
 		vop2_win_write(win, VOP2_WIN_AFBC_HDR_PTR, yrgb_mst);
 		vop2_win_write(win, VOP2_WIN_AFBC_PIC_SIZE, act_info);
-- 
2.34.1

