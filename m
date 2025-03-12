Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9A0A5D670
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 07:42:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9172610E6DB;
	Wed, 12 Mar 2025 06:42:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="otuhekoT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id D56F210E6DB
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Mar 2025 06:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=Y9A+G
 MGKN+/gUY1pm2Jf9qbSfuZPHc1NStiINtfiC4E=; b=otuhekoTwyJx+JqzGhknl
 /Iv7vVn5kEHxqjM52cwGzgtak+d431j79xyTzrismLDKslKWhSqlTn2MS2U1hNdE
 qYnxFLnpq1cDQLlFlXm4MJdqJO0UwhXd99Z+zVxZQ1jYNzw8O+d2KEc0SbRiX7Qc
 nMcy8ciC2LTSJWZfaSDNak=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id
 _____wAnro3MLNFnNsQBSQ--.34149S2; 
 Wed, 12 Mar 2025 14:42:23 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, piotr.oniszczuk@gmail.com,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] drm/rockchip: vop2: Fix interface enable/mux setting of DP1
 on rk3588
Date: Wed, 12 Mar 2025 14:42:10 +0800
Message-ID: <20250312064218.524143-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAnro3MLNFnNsQBSQ--.34149S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cw1rKFyDJrWUWr1DGFWfKrg_yoW8JFW7pr
 s0yryYqrWkKrWjvF1fGF4Fyr4SkanFkayIka1fKa9xGa48tr1kGr98Ja1kAry7Xr17ZFyj
 krZIyrW3uFW2yFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jbwIDUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hYOXmfRJTn62wAAsf
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

This is a copy-paste error, which affects DP1 usage.

Fixes: 328e6885996c ("drm/rockchip: vop2: Add platform specific callback")
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index a8b1ebfc5af5..de2da4f4e434 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -1753,9 +1753,9 @@ static unsigned long rk3588_set_intf_mux(struct vop2_video_port *vp, int id, u32
 		dip |= FIELD_PREP(RK3588_DSP_IF_POL__DP0_PIN_POL, polflags);
 		break;
 	case ROCKCHIP_VOP2_EP_DP1:
-		die &= ~RK3588_SYS_DSP_INFACE_EN_MIPI1_MUX;
-		die |= RK3588_SYS_DSP_INFACE_EN_MIPI1 |
-			   FIELD_PREP(RK3588_SYS_DSP_INFACE_EN_MIPI1_MUX, vp->id);
+		die &= ~RK3588_SYS_DSP_INFACE_EN_DP1_MUX;
+		die |= RK3588_SYS_DSP_INFACE_EN_DP1 |
+			   FIELD_PREP(RK3588_SYS_DSP_INFACE_EN_DP1_MUX, vp->id);
 		dip &= ~RK3588_DSP_IF_POL__DP1_PIN_POL;
 		dip |= FIELD_PREP(RK3588_DSP_IF_POL__DP1_PIN_POL, polflags);
 		break;
-- 
2.34.1

