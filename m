Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4402A814206
	for <lists+dri-devel@lfdr.de>; Fri, 15 Dec 2023 07:57:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0459810E0F2;
	Fri, 15 Dec 2023 06:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out30-118.freemail.mail.aliyun.com
 (out30-118.freemail.mail.aliyun.com [115.124.30.118])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3935010E0F2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Dec 2023 06:57:48 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R551e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=ay29a033018046049;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=14; SR=0;
 TI=SMTPD_---0VyWoQ7T_1702623454; 
Received: from localhost(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0VyWoQ7T_1702623454) by smtp.aliyun-inc.com;
 Fri, 15 Dec 2023 14:57:45 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: hjc@rock-chips.com
Subject: [PATCH] drm/rockchip: vop2: Remove the unused variable if_dclk_rate
Date: Fri, 15 Dec 2023 14:57:33 +0800
Message-Id: <20231215065733.48895-1-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 Abaci Robot <abaci@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 mripard@kernel.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, andy.yan@rock-chips.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Variable if_dclk_rate is not effectively used, so delete it.

drivers/gpu/drm/rockchip/rockchip_drm_vop2.c:1688:16: warning: variable ‘if_dclk_rate’ set but not used.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=7750
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 44508c2dd614..b4e7cddaf25a 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1685,13 +1685,11 @@ static unsigned long rk3588_calc_cru_cfg(struct vop2_video_port *vp, int id,
 	unsigned long dclk_core_rate = v_pixclk >> 2;
 	unsigned long dclk_rate = v_pixclk;
 	unsigned long dclk_out_rate;
-	unsigned long if_dclk_rate;
 	unsigned long if_pixclk_rate;
 	int K = 1;
 
 	if (vop2_output_if_is_hdmi(id)) {
 		/*
-		 * K = 2: dclk_core = if_pixclk_rate > if_dclk_rate
 		 * K = 1: dclk_core = hdmie_edp_dclk > if_pixclk_rate
 		 */
 		if (output_mode == ROCKCHIP_OUT_MODE_YUV420) {
@@ -1700,10 +1698,8 @@ static unsigned long rk3588_calc_cru_cfg(struct vop2_video_port *vp, int id,
 		}
 
 		if_pixclk_rate = (dclk_core_rate << 1) / K;
-		if_dclk_rate = dclk_core_rate / K;
 		/*
 		 * *if_pixclk_div = dclk_rate / if_pixclk_rate;
-		 * *if_dclk_div = dclk_rate / if_dclk_rate;
 		 */
 		 *if_pixclk_div = 2;
 		 *if_dclk_div = 4;
-- 
2.20.1.7.g153144c

