Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B403BA39AD2
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 12:29:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2785C10E677;
	Tue, 18 Feb 2025 11:29:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="gIvTrfuR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 75CAE10E67F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2025 11:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=FElbK
 wJG9bbVudahow88EWjSdaPcuW8HWtyI1wDmCXQ=; b=gIvTrfuRh+ISFtQY6u9+h
 /Fysvpr+issDL9+StHdQoCAFrbPdcfnv2vs5GQ780sw+uHizULIhGY22h4//rpS0
 S28YE2x9LDvqwZ/EOs2NorYCnytQAKwi3b8gdVaSe8+q5WKztR7A7SkcasdaPzDt
 +dBjdU8+821BzbRLGjj6z4=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id
 _____wD333uybrRnLIPUMQ--.34107S6; 
 Tue, 18 Feb 2025 19:27:54 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, krzk+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 derek.foreman@collabora.com, detlev.casanova@collabora.com,
 daniel@fooishbar.org, robh@kernel.org, sebastian.reichel@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH v15 04/13] drm/rockchip: vop2: Merge vop2_cluster/esmart_init
 function
Date: Tue, 18 Feb 2025 19:27:31 +0800
Message-ID: <20250218112744.34433-5-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218112744.34433-1-andyshrk@163.com>
References: <20250218112744.34433-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wD333uybrRnLIPUMQ--.34107S6
X-Coremail-Antispam: 1Uf129KBjvJXoWxWw4UKF1rCF1xJF4rCw1DAwb_yoW5XF13pF
 W3Gr13Wr4UGFsF9r4kJrn8uF1Fkr12yaykAa48Kw1akwnrKr9FkFn5GF10yr90krWv9Fy2
 yF4kK3y3ua429r7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UJR67UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkAn3Xme0bEsv8gAAsZ
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

Now these two function share the same logic, they can
be merged as one.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

Changes in v15:
- Fix nr_regs arguments for smart windows register.

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 42 +++++---------------
 1 file changed, 11 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 32724232c2d5..e3147a58ff0e 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -2423,18 +2423,18 @@ static int vop2_find_rgb_encoder(struct vop2 *vop2)
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
@@ -2445,28 +2445,6 @@ static int vop2_cluster_init(struct vop2_win *win)
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
@@ -2483,9 +2461,11 @@ static int vop2_win_init(struct vop2 *vop2)
 		win->win_id = i;
 		win->vop2 = vop2;
 		if (vop2_cluster_window(win))
-			ret = vop2_cluster_init(win);
+			ret = vop2_regmap_init(win, vop2->data->cluster_reg,
+					       vop2->data->nr_cluster_regs);
 		else
-			ret = vop2_esmart_init(win);
+			ret = vop2_regmap_init(win, vop2->data->smart_reg,
+					       vop2->data->nr_smart_regs);
 		if (ret)
 			return ret;
 	}
-- 
2.34.1

