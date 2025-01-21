Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B48B3A17BC4
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04C9810E546;
	Tue, 21 Jan 2025 10:33:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="iTYBWP2m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1189210E545
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=zlwQ/
 zugAITGUW6CmnYVDBT+3S9dhbJfYNreL5Qv5dI=; b=iTYBWP2myVhsHIpDKi2ie
 JS2DdUczwL0iNZlm4mjY73U/fqZtgHKi4lbvcgq9Qcikx8CE3gXO6PVt6Peph6Gu
 XAvM9pwgCNSwJ5dNo411doTVeVcSxFMSE3NuYuCS8s7hCyP4hXT6LIFuCsDhVIlC
 kHfld4EqwRxUYeTpmA/uoM=
Received: from ProDesk.. (unknown [])
 by gzsmtp1 (Coremail) with SMTP id PCgvCgDHkqjYd49nreMjBg--.21590S6;
 Tue, 21 Jan 2025 18:33:03 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 derek.foreman@collabora.com, detlev.casanova@collabora.com,
 daniel@fooishbar.org, robh@kernel.org, sebastian.reichel@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v12 04/13] drm/rockchip: vop2: Merge vop2_cluster/esmart_init
 function
Date: Tue, 21 Jan 2025 18:32:41 +0800
Message-ID: <20250121103254.2528004-5-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250121103254.2528004-1-andyshrk@163.com>
References: <20250121103254.2528004-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: PCgvCgDHkqjYd49nreMjBg--.21590S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxWw4UKF17CrWktr18AFykAFb_yoW5Xr1DpF
 W3Jr43Xr4UGFsF9r4kJrn8uF1Fkr12yaykAa48KwnIkwnrKF9FkFn5JF10yr90krWvkFy2
 yFs7K3y3ua429r7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j8eOXUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0h-bXmePdPc5TgABsV
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

Now these two function share the same logic, the can
be merged as one.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

(no changes since v1)

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 42 +++++---------------
 1 file changed, 11 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index f7e2df1431b0..29a81ff152f3 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2398,18 +2398,18 @@ static int vop2_find_rgb_encoder(struct vop2 *vop2)
 	return -ENOENT;
 }
 
-static int vop2_cluster_init(struct vop2_win *win)
+static int vop2_regmap_init(struct vop2_win *win, const struct reg_field *regs,
+			    int nr_regs)
 {
 	struct vop2 *vop2 = win->vop2;
 	int i;
 
-	for (i = 0; i < vop2->data->nr_cluster_regs; i++) {
+	for (i = 0; i < nr_regs; i++) {
 		const struct reg_field field = {
-			.reg = (vop2->data->cluster_reg[i].reg != 0xffffffff) ?
-				vop2->data->cluster_reg[i].reg + win->offset :
-				vop2->data->cluster_reg[i].reg,
-			.lsb = vop2->data->cluster_reg[i].lsb,
-			.msb = vop2->data->cluster_reg[i].msb
+			.reg = (regs[i].reg != 0xffffffff) ?
+				regs[i].reg + win->offset : regs[i].reg,
+			.lsb = regs[i].lsb,
+			.msb = regs[i].msb
 		};
 
 		win->reg[i] = devm_regmap_field_alloc(vop2->dev, vop2->map, field);
@@ -2420,28 +2420,6 @@ static int vop2_cluster_init(struct vop2_win *win)
 	return 0;
 };
 
-static int vop2_esmart_init(struct vop2_win *win)
-{
-	struct vop2 *vop2 = win->vop2;
-	int i;
-
-	for (i = 0; i < vop2->data->nr_smart_regs; i++) {
-		const struct reg_field field = {
-			.reg = (vop2->data->smart_reg[i].reg != 0xffffffff) ?
-				vop2->data->smart_reg[i].reg + win->offset :
-				vop2->data->smart_reg[i].reg,
-			.lsb = vop2->data->smart_reg[i].lsb,
-			.msb = vop2->data->smart_reg[i].msb
-		};
-
-		win->reg[i] = devm_regmap_field_alloc(vop2->dev, vop2->map, field);
-		if (IS_ERR(win->reg[i]))
-			return PTR_ERR(win->reg[i]);
-	}
-
-	return 0;
-}
-
 static int vop2_win_init(struct vop2 *vop2)
 {
 	const struct vop2_data *vop2_data = vop2->data;
@@ -2458,9 +2436,11 @@ static int vop2_win_init(struct vop2 *vop2)
 		win->win_id = i;
 		win->vop2 = vop2;
 		if (vop2_cluster_window(win))
-			ret = vop2_cluster_init(win);
+			ret = vop2_regmap_init(win, vop2->data->cluster_reg,
+					       vop2->data->nr_cluster_regs);
 		else
-			ret = vop2_esmart_init(win);
+			ret = vop2_regmap_init(win, vop2->data->smart_reg,
+					       vop2->data->nr_cluster_regs);
 		if (ret)
 			return ret;
 	}
-- 
2.34.1

