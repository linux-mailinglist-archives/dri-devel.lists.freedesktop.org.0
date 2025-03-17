Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B73CA64525
	for <lists+dri-devel@lfdr.de>; Mon, 17 Mar 2025 09:21:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4872410E3AA;
	Mon, 17 Mar 2025 08:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="Mb9gDgLP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id A9B6A10E3AA
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Mar 2025 08:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=xuKzq
 xXQuuudyoZS1yA8FZNGTyjI0RvfS078un9hEUk=; b=Mb9gDgLPOWJMzRTOAwR60
 6lhkA+PBspsGBAcme3DUKgjd5IL5CkuckuTsLw68dzW1tDa0hcT1psbYLCpWPdRp
 Nvv6SEV7YJvoWudVX9sAM8GqU3y4LonngTRtbVrb2L0VVgDHlrhsvGIlr4HhXhkU
 tMbIxgXOciDXAsBPcUElQo=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id
 _____wCXg9tg29dn5rCCTQ--.26560S2; 
 Mon, 17 Mar 2025 16:20:51 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: cristian.ciocaltea@collabora.com, hjc@rock-chips.com,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] drm/rockchip: dw_hdmi_qp: Fix io init for
 dw_hdmi_qp_rockchip_resume
Date: Mon, 17 Mar 2025 16:20:39 +0800
Message-ID: <20250317082047.564404-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCXg9tg29dn5rCCTQ--.26560S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw48Kw17JF48CFy3Xr1UWrg_yoW8CF43p3
 y3AryjkrWkGr4UXwn5A3Z2yFW2y3ZrJw4SqFWxKas2y3W09r1fGr93ua1rXrZxXF9rZF4a
 krZ3t34fJa1UXaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jIyxiUUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0hkTXmfX1jmrPQAAsP
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

Use cfg->ctrl_ops->io_init callback make it work for all platform.

Fixes: 3f60dbd40d3f ("drm/rockchip: dw_hdmi_qp: Add platform ctrl callback")
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 .../gpu/drm/rockchip/dw_hdmi_qp-rockchip.c    | 23 +++----------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index 3d1dddb34603..631a7080862b 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -600,27 +600,10 @@ static void dw_hdmi_qp_rockchip_remove(struct platform_device *pdev)
 static int __maybe_unused dw_hdmi_qp_rockchip_resume(struct device *dev)
 {
 	struct rockchip_hdmi_qp *hdmi = dev_get_drvdata(dev);
-	u32 val;
-
-	val = HIWORD_UPDATE(RK3588_SCLIN_MASK, RK3588_SCLIN_MASK) |
-	      HIWORD_UPDATE(RK3588_SDAIN_MASK, RK3588_SDAIN_MASK) |
-	      HIWORD_UPDATE(RK3588_MODE_MASK, RK3588_MODE_MASK) |
-	      HIWORD_UPDATE(RK3588_I2S_SEL_MASK, RK3588_I2S_SEL_MASK);
-	regmap_write(hdmi->vo_regmap,
-		     hdmi->port_id ? RK3588_GRF_VO1_CON6 : RK3588_GRF_VO1_CON3,
-		     val);
-
-	val = HIWORD_UPDATE(RK3588_SET_HPD_PATH_MASK,
-			    RK3588_SET_HPD_PATH_MASK);
-	regmap_write(hdmi->regmap, RK3588_GRF_SOC_CON7, val);
+	const struct rockchip_hdmi_qp_cfg *cfg;
 
-	if (hdmi->port_id)
-		val = HIWORD_UPDATE(RK3588_HDMI1_GRANT_SEL,
-				    RK3588_HDMI1_GRANT_SEL);
-	else
-		val = HIWORD_UPDATE(RK3588_HDMI0_GRANT_SEL,
-				    RK3588_HDMI0_GRANT_SEL);
-	regmap_write(hdmi->vo_regmap, RK3588_GRF_VO1_CON9, val);
+	cfg = of_device_get_match_data(dev);
+	cfg->ctrl_ops->io_init(hdmi);
 
 	dw_hdmi_qp_resume(dev, hdmi->hdmi);
 
-- 
2.43.0

