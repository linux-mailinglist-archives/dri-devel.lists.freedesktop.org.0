Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3FB97DF68
	for <lists+dri-devel@lfdr.de>; Sun, 22 Sep 2024 00:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E1C710E03B;
	Sat, 21 Sep 2024 22:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=kwiboo.se header.i=@kwiboo.se header.b="cwZKpVj6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50C1310E337
 for <dri-devel@lists.freedesktop.org>; Sat, 21 Sep 2024 22:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1726957889; bh=8XVidTJxe1Ijnds0MNBHEWFnH2eEKvVTfDWt1cqAA5Q=;
 b=cwZKpVj6ZHJnJw/S/gspYt31Uow+2xcQa4NC6NVPC5OncO8eKXT8ASUA9Uzm7Ky4MzG2QD1Fu
 e3mWA6Qf0nBRnO06lFUohkSWNeSym6qyMhwNIydsomxKn1V301h3DWKNxqs7UNbdJj0Fl+PL0xE
 aWY2/QX5zoiibrcEuDJjeIWAK65tZis3xc2/9PIg0swF45HVjSl4erESCABnIl5jpgDpvUIse1p
 06K1ZU6Gm7EpvztBrl69YI8+A3zo8XS4TTe0unb60k415JvX8Zz7D3LFm79MWw9HUYIC5JG74j4
 TQsnhOhgQ1h6ve2Jt7ysNdSV/4ceUhEkcym1sLXNJg5A==
From: Jonas Karlman <jonas@kwiboo.se>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sandy Huang <hjc@rock-chips.com>,
 Heiko Stuebner <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 3/3] drm/rockchip: vop: Split rk3288-vop into big and lit
Date: Sat, 21 Sep 2024 22:20:03 +0000
Message-ID: <20240921222007.2301868-4-jonas@kwiboo.se>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240921222007.2301868-1-jonas@kwiboo.se>
References: <20240921222007.2301868-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-ForwardEmail-ID: 66ef46c318c10b4d4a165d2b
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

The Rockchip RK3288 SoC contain two different Visual Output Processor
(VOP) blocks, VOP_BIG and VOP_LIT. The VOP blocks support different max
output resolution, 3840x2160 and 2560x1600.

Add support for the compatible used to differentiate between VOP_BIG and
VOP_LIT, support for the old compatible is kept for compatibility with
older device tree.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 27 +++++++++++++++------
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index e2c6ba26f437..978db93cda33 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -762,7 +762,7 @@ static const struct vop_intr rk3288_vop_intr = {
 	.clear = VOP_REG(RK3288_INTR_CTRL0, 0xf, 8),
 };
 
-static const struct vop_data rk3288_vop = {
+static const struct vop_data rk3288_vop_big = {
 	.version = VOP_VERSION(3, 1),
 	.feature = VOP_FEATURE_OUTPUT_RGB10,
 	.intr = &rk3288_vop_intr,
@@ -772,14 +772,22 @@ static const struct vop_data rk3288_vop = {
 	.win = rk3288_vop_win_data,
 	.win_size = ARRAY_SIZE(rk3288_vop_win_data),
 	.lut_size = 1024,
-	/*
-	 * This is the maximum resolution for the VOPB, the VOPL can only do
-	 * 2560x1600, but we can't distinguish them as they have the same
-	 * compatible.
-	 */
 	.max_output = { 3840, 2160 },
 };
 
+static const struct vop_data rk3288_vop_lit = {
+	.version = VOP_VERSION(3, 1),
+	.feature = VOP_FEATURE_OUTPUT_RGB10,
+	.intr = &rk3288_vop_intr,
+	.common = &rk3288_common,
+	.modeset = &rk3288_modeset,
+	.output = &rk3288_output,
+	.win = rk3288_vop_win_data,
+	.win_size = ARRAY_SIZE(rk3288_vop_win_data),
+	.lut_size = 1024,
+	.max_output = { 2560, 1600 },
+};
+
 static const int rk3368_vop_intrs[] = {
 	FS_INTR,
 	0, 0,
@@ -1245,8 +1253,13 @@ static const struct of_device_id vop_driver_dt_match[] = {
 	  .data = &rk3066_vop },
 	{ .compatible = "rockchip,rk3188-vop",
 	  .data = &rk3188_vop },
+	{ .compatible = "rockchip,rk3288-vop-big",
+	  .data = &rk3288_vop_big },
+	{ .compatible = "rockchip,rk3288-vop-lit",
+	  .data = &rk3288_vop_lit },
+	/* rockchip,rk3288-vop kept for backward compatibility */
 	{ .compatible = "rockchip,rk3288-vop",
-	  .data = &rk3288_vop },
+	  .data = &rk3288_vop_big },
 	{ .compatible = "rockchip,rk3368-vop",
 	  .data = &rk3368_vop },
 	{ .compatible = "rockchip,rk3366-vop",
-- 
2.46.1

