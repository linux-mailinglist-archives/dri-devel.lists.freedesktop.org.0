Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A74DE80C8A3
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 12:58:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0994110E3B3;
	Mon, 11 Dec 2023 11:58:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.220])
 by gabe.freedesktop.org (Postfix) with ESMTP id BFB5210E3B3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 11:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=zb21F
 grwTHHIjSU2lLqUEQQ7s329de26aUDP8GoQ+6A=; b=P3L9x7KP2EPLbuN8RwRxk
 fThdmeeZFiFu641TC1M0dSm0dDcVd+WGOWLlg8vE5JcH75mX+jZQlSOrjpQdehOa
 D8WQsBMRSSDa2+mZhLi0OKfUIQIHvnDmIAo1ZokVHBpsdBZ98WLW2t3ENdc+ECph
 QazmN2Ltlp39u0DpFSsdwc=
Received: from ProDesk.. (unknown [58.22.7.114])
 by zwqz-smtp-mta-g2-1 (Coremail) with SMTP id _____wA3l3NB+XZlin16FQ--.4568S2; 
 Mon, 11 Dec 2023 19:57:56 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Subject: [PATCH v5 05/16] drm/rockchip: vop2: Add write mask for VP config done
Date: Mon, 11 Dec 2023 19:57:52 +0800
Message-Id: <20231211115752.1785013-1-andyshrk@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231211115547.1784587-1-andyshrk@163.com>
References: <20231211115547.1784587-1-andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wA3l3NB+XZlin16FQ--.4568S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw4rKw17GrW5WF13XF4fKrg_yoW8Ar1xpF
 WrAay5urs2kFsFgr4qkFy5Zr1aya9rAa92yr97Kw13Xas0qr1DZFn09F1jyr98JFWxZr1a
 ywsrAryrGF4jvrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jTKZXUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEghDXmVOA43AjAAAsu
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
Cc: devicetree@vger.kernel.org, chris.obbard@collabora.com, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kever.yang@rock-chips.com, linux-rockchip@lists.infradead.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 Andy Yan <andy.yan@rock-chips.com>, sebastian.reichel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Andy Yan <andy.yan@rock-chips.com>

The write mask bit is used to make sure when writing
config done bit for one VP will not overwrite the other.

Unfortunately, the write mask bit is missing on
rk3566/8, that means when we write to these bits,
it will not take any effect.

We need this to make the vop work properly after
rk3566/8 variants.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>

---

(no changes since v3)

Changes in v3:
- split from the vop2 driver patch

 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index a019cc9bbd54..25c1f33c5622 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -268,12 +268,23 @@ static bool vop2_cluster_window(const struct vop2_win *win)
 	return win->data->feature & WIN_FEATURE_CLUSTER;
 }
 
+/*
+ * Note:
+ * The write mask function is missing on rk3566/8, write
+ * to this bit has no effect, for the other soc(rk3588 and
+ * the following...), this function works well.
+ *
+ * GLB_CFG_DONE_EN doesn't have a write mask bit
+ *
+ */
 static void vop2_cfg_done(struct vop2_video_port *vp)
 {
 	struct vop2 *vop2 = vp->vop2;
+	u32 val = RK3568_REG_CFG_DONE__GLB_CFG_DONE_EN;
+
+	val |= BIT(vp->id) | (BIT(vp->id) << 16);
 
-	regmap_set_bits(vop2->map, RK3568_REG_CFG_DONE,
-			BIT(vp->id) | RK3568_REG_CFG_DONE__GLB_CFG_DONE_EN);
+	regmap_set_bits(vop2->map, RK3568_REG_CFG_DONE, val);
 }
 
 static void vop2_win_disable(struct vop2_win *win)
-- 
2.34.1

