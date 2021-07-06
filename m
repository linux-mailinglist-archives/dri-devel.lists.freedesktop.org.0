Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 476273BCBB8
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jul 2021 13:15:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98C2D6E09C;
	Tue,  6 Jul 2021 11:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C7D6E077
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Jul 2021 11:15:27 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6189661C2E;
 Tue,  6 Jul 2021 11:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625570127;
 bh=fkdniDa+xDCETYQggD9oaebwsk6k8b5LwB+FE25nR24=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SozdEaTIqJeM2c4mMkehVoGQ6ULU55BLkMRjMOuVOktkjXvg99+/iOlBRbhPfKA3E
 SEMuF8qO/5kznUVIKltqE5ehvuEy97zXMdCDMORAcx2jn3F8+aWlsQbegI0WG2Q+Q4
 Ik4qrnOjQJgswDsZpglaDE1xwEcZ75d2qTxRspgo9kEaULO++EBUVJjAR3Kbc7AVTZ
 a6rKEFFbagHZUyvXQ7qUb9kVcILVOwv1zn4MTWDcd7b2+Vm7ispN3HYukQyGkMDSzw
 xuDnyh4dYws4KOQTJ+1xEZur430rOuaZrNuSJ/iJZFZzogFO+uIToXZNfVZP5VNjDn
 DngmkSmX/Y+ag==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.13 055/189] drm: rockchip: add missing registers for
 RK3066
Date: Tue,  6 Jul 2021 07:11:55 -0400
Message-Id: <20210706111409.2058071-55-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210706111409.2058071-1-sashal@kernel.org>
References: <20210706111409.2058071-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, Alex Bee <knaerzche@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alex Bee <knaerzche@gmail.com>

[ Upstream commit 742203cd56d150eb7884eb45abb7d9dbc2bdbf04 ]

Add dither_up, dsp_lut_en and data_blank registers to enable their
respective functionality for RK3066's VOP.

While at that also fix .rb_swap and .format registers for all windows,
which have to be set though RK3066_SYS_CTRL1 register.
Also remove .scl from win1: Scaling is only supported on the primary
plane.

Signed-off-by: Alex Bee <knaerzche@gmail.com>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20210528130554.72191-4-knaerzche@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/rockchip/rockchip_vop_reg.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
index b8dcee64a1f7..a6fe03c3748a 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop_reg.c
@@ -349,8 +349,8 @@ static const struct vop_win_phy rk3066_win0_data = {
 	.nformats = ARRAY_SIZE(formats_win_full),
 	.format_modifiers = format_modifiers_win_full,
 	.enable = VOP_REG(RK3066_SYS_CTRL1, 0x1, 0),
-	.format = VOP_REG(RK3066_SYS_CTRL0, 0x7, 4),
-	.rb_swap = VOP_REG(RK3066_SYS_CTRL0, 0x1, 19),
+	.format = VOP_REG(RK3066_SYS_CTRL1, 0x7, 4),
+	.rb_swap = VOP_REG(RK3066_SYS_CTRL1, 0x1, 19),
 	.act_info = VOP_REG(RK3066_WIN0_ACT_INFO, 0x1fff1fff, 0),
 	.dsp_info = VOP_REG(RK3066_WIN0_DSP_INFO, 0x0fff0fff, 0),
 	.dsp_st = VOP_REG(RK3066_WIN0_DSP_ST, 0x1fff1fff, 0),
@@ -361,13 +361,12 @@ static const struct vop_win_phy rk3066_win0_data = {
 };
 
 static const struct vop_win_phy rk3066_win1_data = {
-	.scl = &rk3066_win_scl,
 	.data_formats = formats_win_full,
 	.nformats = ARRAY_SIZE(formats_win_full),
 	.format_modifiers = format_modifiers_win_full,
 	.enable = VOP_REG(RK3066_SYS_CTRL1, 0x1, 1),
-	.format = VOP_REG(RK3066_SYS_CTRL0, 0x7, 7),
-	.rb_swap = VOP_REG(RK3066_SYS_CTRL0, 0x1, 23),
+	.format = VOP_REG(RK3066_SYS_CTRL1, 0x7, 7),
+	.rb_swap = VOP_REG(RK3066_SYS_CTRL1, 0x1, 23),
 	.act_info = VOP_REG(RK3066_WIN1_ACT_INFO, 0x1fff1fff, 0),
 	.dsp_info = VOP_REG(RK3066_WIN1_DSP_INFO, 0x0fff0fff, 0),
 	.dsp_st = VOP_REG(RK3066_WIN1_DSP_ST, 0x1fff1fff, 0),
@@ -382,8 +381,8 @@ static const struct vop_win_phy rk3066_win2_data = {
 	.nformats = ARRAY_SIZE(formats_win_lite),
 	.format_modifiers = format_modifiers_win_lite,
 	.enable = VOP_REG(RK3066_SYS_CTRL1, 0x1, 2),
-	.format = VOP_REG(RK3066_SYS_CTRL0, 0x7, 10),
-	.rb_swap = VOP_REG(RK3066_SYS_CTRL0, 0x1, 27),
+	.format = VOP_REG(RK3066_SYS_CTRL1, 0x7, 10),
+	.rb_swap = VOP_REG(RK3066_SYS_CTRL1, 0x1, 27),
 	.dsp_info = VOP_REG(RK3066_WIN2_DSP_INFO, 0x0fff0fff, 0),
 	.dsp_st = VOP_REG(RK3066_WIN2_DSP_ST, 0x1fff1fff, 0),
 	.yrgb_mst = VOP_REG(RK3066_WIN2_MST, 0xffffffff, 0),
@@ -408,6 +407,9 @@ static const struct vop_common rk3066_common = {
 	.dither_down_en = VOP_REG(RK3066_DSP_CTRL0, 0x1, 11),
 	.dither_down_mode = VOP_REG(RK3066_DSP_CTRL0, 0x1, 10),
 	.dsp_blank = VOP_REG(RK3066_DSP_CTRL1, 0x1, 24),
+	.dither_up = VOP_REG(RK3066_DSP_CTRL0, 0x1, 9),
+	.dsp_lut_en = VOP_REG(RK3066_SYS_CTRL1, 0x1, 31),
+	.data_blank = VOP_REG(RK3066_DSP_CTRL1, 0x1, 25),
 };
 
 static const struct vop_win_data rk3066_vop_win_data[] = {
-- 
2.30.2

