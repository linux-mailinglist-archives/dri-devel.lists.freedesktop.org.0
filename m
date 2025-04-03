Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03679A79C4A
	for <lists+dri-devel@lfdr.de>; Thu,  3 Apr 2025 08:48:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5349410E909;
	Thu,  3 Apr 2025 06:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=etehtsea.me header.i=@etehtsea.me header.b="WNBc/xzq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from qs51p00im-qukt01071901.me.com (qs51p00im-qukt01071901.me.com
 [17.57.155.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE1010E917
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Apr 2025 06:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=etehtsea.me; s=sig1;
 bh=vX1nStTTyA2W3EtaX3VYwa1Dfg3sYgIY5n0SdMP1A9E=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme;
 b=WNBc/xzqW6hc1w1xvZmvNkALMThcoORtpqWzc7S6k7HpLwRWJ7z0ZwCosnW2DI84q
 WNlBe//viYmPWvRelVykEW34qz7BL8uEXH8iwMXxGT8xWjXc3biR0LqjTI0S7Tr46+
 qmsAYrIEQkBImg0HFe2zGG18uVPPPwAMstTBZGP30uABvJC+33/NoP6jAjcAcBeHCZ
 cZccEECTodC9jTwSognP9wksu5sSbQFh1KaeEJgof1JDJkSWNGPbJjaoFti9h55x61
 GIGpDRkit07NAIRTsNEOZQnjiSoWE+e0ovF+v+6mg4GtnHehGwRyPzDHPs8H19eFk+
 JVrHi/7I9YRwg==
Received: from localhost (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
 by qs51p00im-qukt01071901.me.com (Postfix) with ESMTPSA id
 DC75962801F9; Thu,  3 Apr 2025 06:48:50 +0000 (UTC)
From: Konstantin Shabanov <mail@etehtsea.me>
To: Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Konstantin Shabanov <mail@etehtsea.me>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] (drm/rockchip): Consistently use rk3399 registers
 consts
Date: Thu,  3 Apr 2025 06:47:39 +0000
Message-ID: <20250403064740.4016-1-mail@etehtsea.me>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: F5HyCAe8Rgl6mAQE-0KnVlkmIu4GVdCO
X-Proofpoint-ORIG-GUID: F5HyCAe8Rgl6mAQE-0KnVlkmIu4GVdCO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_02,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=386
 phishscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 mlxscore=0
 adultscore=0 spamscore=0 clxscore=1030 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2503100000 definitions=main-2504030033
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

As rk3399 has its own registers definitions, update related structs to
use them.
There are no changes in behaviour as updated constants values are the
 for rk3288/rk3368/rk3399 chips.

Signed-off-by: Konstantin Shabanov <mail@etehtsea.me>
---
Apologies for resend. The first email hadn't reached the mailing list for some reason.

 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 94 ++++++++++-----------
 1 file changed, 47 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index 4e2099d86517..d1f788763318 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -906,21 +906,21 @@ static const struct vop_data rk3366_vop = {

 static const struct vop_output rk3399_output = {
 	.dp_dclk_pol = VOP_REG(RK3399_DSP_CTRL1, 0x1, 19),
-	.rgb_dclk_pol = VOP_REG(RK3368_DSP_CTRL1, 0x1, 19),
-	.hdmi_dclk_pol = VOP_REG(RK3368_DSP_CTRL1, 0x1, 23),
-	.edp_dclk_pol = VOP_REG(RK3368_DSP_CTRL1, 0x1, 27),
-	.mipi_dclk_pol = VOP_REG(RK3368_DSP_CTRL1, 0x1, 31),
+	.rgb_dclk_pol = VOP_REG(RK3399_DSP_CTRL1, 0x1, 19),
+	.hdmi_dclk_pol = VOP_REG(RK3399_DSP_CTRL1, 0x1, 23),
+	.edp_dclk_pol = VOP_REG(RK3399_DSP_CTRL1, 0x1, 27),
+	.mipi_dclk_pol = VOP_REG(RK3399_DSP_CTRL1, 0x1, 31),
 	.dp_pin_pol = VOP_REG(RK3399_DSP_CTRL1, 0x7, 16),
-	.rgb_pin_pol = VOP_REG(RK3368_DSP_CTRL1, 0x7, 16),
-	.hdmi_pin_pol = VOP_REG(RK3368_DSP_CTRL1, 0x7, 20),
-	.edp_pin_pol = VOP_REG(RK3368_DSP_CTRL1, 0x7, 24),
-	.mipi_pin_pol = VOP_REG(RK3368_DSP_CTRL1, 0x7, 28),
+	.rgb_pin_pol = VOP_REG(RK3399_DSP_CTRL1, 0x7, 16),
+	.hdmi_pin_pol = VOP_REG(RK3399_DSP_CTRL1, 0x7, 20),
+	.edp_pin_pol = VOP_REG(RK3399_DSP_CTRL1, 0x7, 24),
+	.mipi_pin_pol = VOP_REG(RK3399_DSP_CTRL1, 0x7, 28),
 	.dp_en = VOP_REG(RK3399_SYS_CTRL, 0x1, 11),
-	.rgb_en = VOP_REG(RK3288_SYS_CTRL, 0x1, 12),
-	.hdmi_en = VOP_REG(RK3288_SYS_CTRL, 0x1, 13),
-	.edp_en = VOP_REG(RK3288_SYS_CTRL, 0x1, 14),
-	.mipi_en = VOP_REG(RK3288_SYS_CTRL, 0x1, 15),
-	.mipi_dual_channel_en = VOP_REG(RK3288_SYS_CTRL, 0x1, 3),
+	.rgb_en = VOP_REG(RK3399_SYS_CTRL, 0x1, 12),
+	.hdmi_en = VOP_REG(RK3399_SYS_CTRL, 0x1, 13),
+	.edp_en = VOP_REG(RK3399_SYS_CTRL, 0x1, 14),
+	.mipi_en = VOP_REG(RK3399_SYS_CTRL, 0x1, 15),
+	.mipi_dual_channel_en = VOP_REG(RK3399_SYS_CTRL, 0x1, 3),
 };

 static const struct vop_common rk3399_common = {
@@ -975,23 +975,23 @@ static const struct vop_win_phy rk3399_win0_data = {
 	.data_formats = formats_win_full_10,
 	.nformats = ARRAY_SIZE(formats_win_full_10),
 	.format_modifiers = format_modifiers_win_full_afbc,
-	.enable = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 0),
-	.format = VOP_REG(RK3288_WIN0_CTRL0, 0x7, 1),
-	.fmt_10 = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 4),
-	.rb_swap = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 12),
-	.uv_swap = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 15),
-	.x_mir_en = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 21),
-	.y_mir_en = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 22),
-	.act_info = VOP_REG(RK3288_WIN0_ACT_INFO, 0x1fff1fff, 0),
-	.dsp_info = VOP_REG(RK3288_WIN0_DSP_INFO, 0x0fff0fff, 0),
-	.dsp_st = VOP_REG(RK3288_WIN0_DSP_ST, 0x1fff1fff, 0),
-	.yrgb_mst = VOP_REG(RK3288_WIN0_YRGB_MST, 0xffffffff, 0),
-	.uv_mst = VOP_REG(RK3288_WIN0_CBR_MST, 0xffffffff, 0),
-	.yrgb_vir = VOP_REG(RK3288_WIN0_VIR, 0x3fff, 0),
-	.uv_vir = VOP_REG(RK3288_WIN0_VIR, 0x3fff, 16),
-	.src_alpha_ctl = VOP_REG(RK3288_WIN0_SRC_ALPHA_CTRL, 0xff, 0),
-	.dst_alpha_ctl = VOP_REG(RK3288_WIN0_DST_ALPHA_CTRL, 0xff, 0),
-	.channel = VOP_REG(RK3288_WIN0_CTRL2, 0xff, 0),
+	.enable = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 0),
+	.format = VOP_REG(RK3399_WIN0_CTRL0, 0x7, 1),
+	.fmt_10 = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 4),
+	.rb_swap = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 12),
+	.uv_swap = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 15),
+	.x_mir_en = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 21),
+	.y_mir_en = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 22),
+	.act_info = VOP_REG(RK3399_WIN0_ACT_INFO, 0x1fff1fff, 0),
+	.dsp_info = VOP_REG(RK3399_WIN0_DSP_INFO, 0x0fff0fff, 0),
+	.dsp_st = VOP_REG(RK3399_WIN0_DSP_ST, 0x1fff1fff, 0),
+	.yrgb_mst = VOP_REG(RK3399_WIN0_YRGB_MST, 0xffffffff, 0),
+	.uv_mst = VOP_REG(RK3399_WIN0_CBR_MST, 0xffffffff, 0),
+	.yrgb_vir = VOP_REG(RK3399_WIN0_VIR, 0x3fff, 0),
+	.uv_vir = VOP_REG(RK3399_WIN0_VIR, 0x3fff, 16),
+	.src_alpha_ctl = VOP_REG(RK3399_WIN0_SRC_ALPHA_CTRL, 0xff, 0),
+	.dst_alpha_ctl = VOP_REG(RK3399_WIN0_DST_ALPHA_CTRL, 0xff, 0),
+	.channel = VOP_REG(RK3399_WIN0_CTRL2, 0xff, 0),
 };

 static const struct vop_win_phy rk3399_win1_data = {
@@ -999,23 +999,23 @@ static const struct vop_win_phy rk3399_win1_data = {
 	.data_formats = formats_win_full_10,
 	.nformats = ARRAY_SIZE(formats_win_full_10),
 	.format_modifiers = format_modifiers_win_full,
-	.enable = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 0),
-	.format = VOP_REG(RK3288_WIN0_CTRL0, 0x7, 1),
-	.fmt_10 = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 4),
-	.rb_swap = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 12),
-	.uv_swap = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 15),
-	.x_mir_en = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 21),
-	.y_mir_en = VOP_REG(RK3288_WIN0_CTRL0, 0x1, 22),
-	.act_info = VOP_REG(RK3288_WIN0_ACT_INFO, 0x1fff1fff, 0),
-	.dsp_info = VOP_REG(RK3288_WIN0_DSP_INFO, 0x0fff0fff, 0),
-	.dsp_st = VOP_REG(RK3288_WIN0_DSP_ST, 0x1fff1fff, 0),
-	.yrgb_mst = VOP_REG(RK3288_WIN0_YRGB_MST, 0xffffffff, 0),
-	.uv_mst = VOP_REG(RK3288_WIN0_CBR_MST, 0xffffffff, 0),
-	.yrgb_vir = VOP_REG(RK3288_WIN0_VIR, 0x3fff, 0),
-	.uv_vir = VOP_REG(RK3288_WIN0_VIR, 0x3fff, 16),
-	.src_alpha_ctl = VOP_REG(RK3288_WIN0_SRC_ALPHA_CTRL, 0xff, 0),
-	.dst_alpha_ctl = VOP_REG(RK3288_WIN0_DST_ALPHA_CTRL, 0xff, 0),
-	.channel = VOP_REG(RK3288_WIN0_CTRL2, 0xff, 0),
+	.enable = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 0),
+	.format = VOP_REG(RK3399_WIN0_CTRL0, 0x7, 1),
+	.fmt_10 = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 4),
+	.rb_swap = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 12),
+	.uv_swap = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 15),
+	.x_mir_en = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 21),
+	.y_mir_en = VOP_REG(RK3399_WIN0_CTRL0, 0x1, 22),
+	.act_info = VOP_REG(RK3399_WIN0_ACT_INFO, 0x1fff1fff, 0),
+	.dsp_info = VOP_REG(RK3399_WIN0_DSP_INFO, 0x0fff0fff, 0),
+	.dsp_st = VOP_REG(RK3399_WIN0_DSP_ST, 0x1fff1fff, 0),
+	.yrgb_mst = VOP_REG(RK3399_WIN0_YRGB_MST, 0xffffffff, 0),
+	.uv_mst = VOP_REG(RK3399_WIN0_CBR_MST, 0xffffffff, 0),
+	.yrgb_vir = VOP_REG(RK3399_WIN0_VIR, 0x3fff, 0),
+	.uv_vir = VOP_REG(RK3399_WIN0_VIR, 0x3fff, 16),
+	.src_alpha_ctl = VOP_REG(RK3399_WIN0_SRC_ALPHA_CTRL, 0xff, 0),
+	.dst_alpha_ctl = VOP_REG(RK3399_WIN0_DST_ALPHA_CTRL, 0xff, 0),
+	.channel = VOP_REG(RK3399_WIN0_CTRL2, 0xff, 0),
 };

 /*

base-commit: 6b60c282330c46954be9ae1d33cd5c7e5acb315c
--
2.48.1
