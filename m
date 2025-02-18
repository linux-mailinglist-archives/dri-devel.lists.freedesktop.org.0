Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C74A39AC8
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 12:28:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D96C710E67B;
	Tue, 18 Feb 2025 11:28:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="cZJUjtrU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5DCC710E67B
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 11:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=d0dLU
 mQ/SZsMZv+9oBNfUWjAlyGRPbs7a7RCXjujakY=; b=cZJUjtrUdU8zpp9SJL6Cm
 hPbkCC1QbdsFrCxaBJluBzaS+78+vJlR/JiMlSZUxSE+ht8voCbD16D8TSquOifo
 CCRwCmsck1DV7Mie0QolDuyi5/OqdN9xW73JBOAh39nxjCl2GYXXo3JhOUgzfJbu
 n4jenrGUrustUC5FoJ1LXc=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id
 _____wD333uybrRnLIPUMQ--.34107S3; 
 Tue, 18 Feb 2025 19:27:51 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 derek.foreman@collabora.com, detlev.casanova@collabora.com,
 daniel@fooishbar.org, robh@kernel.org, sebastian.reichel@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v15 01/13] drm/rockchip: vop2: use devm_regmap_field_alloc for
 cluster-regs
Date: Tue, 18 Feb 2025 19:27:28 +0800
Message-ID: <20250218112744.34433-2-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218112744.34433-1-andyshrk@163.com>
References: <20250218112744.34433-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD333uybrRnLIPUMQ--.34107S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxGFW7GFWUWrykJr4fGF17Wrg_yoWrCw4fpF
 4rGwnxuF45Grn29rWkArn8AF1Fk39rta1rCFn7uwnI9r1qgr97C3Wqk3Wjyrs0kryv9FZr
 tFsxt3y3ua4Ygr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UXYFZUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkBT3Xme0bEsvuAABsP
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

From: Heiko Stuebner <heiko@sntech.de>

Right now vop2_cluster_init() copies the base vop2_cluster_regs
and adapts the reg value with the current window's offset before
adding the fields to the regmap.

This conflicts with the notion of reg_fields being const, see
https://lore.kernel.org/all/20240706-regmap-const-structs-v1-1-d08c776da787@weissschuh.net/
for reference, which now causes checkpatch to actually warn about that.

So instead of creating one big copy and changing it afterwards,
add the reg_fields individually using devm_regmap_field_alloc().

Functional it is the same, just that the reg_field we're handling
can stay const.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 66 +++++++++-----------
 1 file changed, 31 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index afc946ead870..ebc9cb93073c 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -3400,7 +3400,7 @@ static int vop2_find_rgb_encoder(struct vop2 *vop2)
 	return -ENOENT;
 }
 
-static struct reg_field vop2_cluster_regs[VOP2_WIN_MAX_REG] = {
+static const struct reg_field vop2_cluster_regs[VOP2_WIN_MAX_REG] = {
 	[VOP2_WIN_ENABLE] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 0, 0),
 	[VOP2_WIN_FORMAT] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 1, 5),
 	[VOP2_WIN_RB_SWAP] = REG_FIELD(RK3568_CLUSTER_WIN_CTRL0, 14, 14),
@@ -3471,28 +3471,26 @@ static struct reg_field vop2_cluster_regs[VOP2_WIN_MAX_REG] = {
 static int vop2_cluster_init(struct vop2_win *win)
 {
 	struct vop2 *vop2 = win->vop2;
-	struct reg_field *cluster_regs;
-	int ret, i;
-
-	cluster_regs = kmemdup(vop2_cluster_regs, sizeof(vop2_cluster_regs),
-			       GFP_KERNEL);
-	if (!cluster_regs)
-		return -ENOMEM;
-
-	for (i = 0; i < ARRAY_SIZE(vop2_cluster_regs); i++)
-		if (cluster_regs[i].reg != 0xffffffff)
-			cluster_regs[i].reg += win->offset;
+	int i;
 
-	ret = devm_regmap_field_bulk_alloc(vop2->dev, vop2->map, win->reg,
-					   cluster_regs,
-					   ARRAY_SIZE(vop2_cluster_regs));
+	for (i = 0; i < ARRAY_SIZE(vop2_cluster_regs); i++) {
+		const struct reg_field field = {
+			.reg = (vop2_cluster_regs[i].reg != 0xffffffff) ?
+					vop2_cluster_regs[i].reg + win->offset :
+					vop2_cluster_regs[i].reg,
+			.lsb = vop2_cluster_regs[i].lsb,
+			.msb = vop2_cluster_regs[i].msb
+		};
 
-	kfree(cluster_regs);
+		win->reg[i] = devm_regmap_field_alloc(vop2->dev, vop2->map, field);
+		if (IS_ERR(win->reg[i]))
+			return PTR_ERR(win->reg[i]);
+	}
 
-	return ret;
+	return 0;
 };
 
-static struct reg_field vop2_esmart_regs[VOP2_WIN_MAX_REG] = {
+static const struct reg_field vop2_esmart_regs[VOP2_WIN_MAX_REG] = {
 	[VOP2_WIN_ENABLE] = REG_FIELD(RK3568_SMART_REGION0_CTRL, 0, 0),
 	[VOP2_WIN_FORMAT] = REG_FIELD(RK3568_SMART_REGION0_CTRL, 1, 5),
 	[VOP2_WIN_DITHER_UP] = REG_FIELD(RK3568_SMART_REGION0_CTRL, 12, 12),
@@ -3559,26 +3557,24 @@ static struct reg_field vop2_esmart_regs[VOP2_WIN_MAX_REG] = {
 static int vop2_esmart_init(struct vop2_win *win)
 {
 	struct vop2 *vop2 = win->vop2;
-	struct reg_field *esmart_regs;
-	int ret, i;
-
-	esmart_regs = kmemdup(vop2_esmart_regs, sizeof(vop2_esmart_regs),
-			      GFP_KERNEL);
-	if (!esmart_regs)
-		return -ENOMEM;
-
-	for (i = 0; i < ARRAY_SIZE(vop2_esmart_regs); i++)
-		if (esmart_regs[i].reg != 0xffffffff)
-			esmart_regs[i].reg += win->offset;
+	int i;
 
-	ret = devm_regmap_field_bulk_alloc(vop2->dev, vop2->map, win->reg,
-					   esmart_regs,
-					   ARRAY_SIZE(vop2_esmart_regs));
+	for (i = 0; i < ARRAY_SIZE(vop2_esmart_regs); i++) {
+		const struct reg_field field = {
+			.reg = (vop2_esmart_regs[i].reg != 0xffffffff) ?
+				vop2_esmart_regs[i].reg + win->offset :
+				vop2_esmart_regs[i].reg,
+			.lsb = vop2_esmart_regs[i].lsb,
+			.msb = vop2_esmart_regs[i].msb
+		};
 
-	kfree(esmart_regs);
+		win->reg[i] = devm_regmap_field_alloc(vop2->dev, vop2->map, field);
+		if (IS_ERR(win->reg[i]))
+			return PTR_ERR(win->reg[i]);
+	}
 
-	return ret;
-};
+	return 0;
+}
 
 static int vop2_win_init(struct vop2 *vop2)
 {
-- 
2.34.1

