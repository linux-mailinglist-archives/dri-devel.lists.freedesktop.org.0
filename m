Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B434B09B96
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 08:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324F610E8D7;
	Fri, 18 Jul 2025 06:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="ki+en/rF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.5])
 by gabe.freedesktop.org (Postfix) with ESMTP id EED1610E8D6
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 06:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=I5
 N1yFgSMKSP+yKcbwHy28RLjBgi4tDP/QpC0dPcGt8=; b=ki+en/rFRoCuGDoc9o
 jj5icWfNYuhgFscJfdlQOsyh8LJDuKh1mdo4qsx2swDaz57tsHTSz+EMB/vi9Xk5
 b+5LFHS9zy3gESIYW+wTyyA8JJzF/Cr290qDCSm/S+UY+k5LEbNTex2E+mykwF1k
 SdO6u4W1zZqhqeFcV2eBfL8Bo=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id
 _____wCHvgSR7HloFskiFg--.22270S2; 
 Fri, 18 Jul 2025 14:41:26 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: heiko@sntech.de
Cc: hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH 1/2] drm/rockchip: vop2: Add delay between poll registers
Date: Fri, 18 Jul 2025 14:41:13 +0800
Message-ID: <20250718064120.8811-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCHvgSR7HloFskiFg--.22270S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tr4UWrW3KFW5tF48AF1rXrb_yoW8Zr17pw
 4jgF12gF97Ga1jvr1xtr4DZw4Yyan7Aay7Gws7t3s7Gr98Kw1DJ3sI93ZYyFyUJ3Z7ArWj
 vw47J39rAF4q9r7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jweOJUUUUU=
X-Originating-IP: [103.29.142.67]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEgSOXmh56BWTowAAsa
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

According to the implementation of read_poll_timeout_atomic, if the
delay time is 0, it will only use a simple loop based on timeout_us to
decrement the count. Therefore, the final timeout time will differ
significantly from the setted timteout time. So, here we set a specific
delay time to ensure that the calculation of the timeout duration is accurate.

Fixes: 3e89a8c68354 ("drm/rockchip: vop2: Fix the update of LAYER/PORT select registers when there are multi display output on rk3588/rk3568")
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 45c5e39878133..d712c5b6b50e3 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -2066,7 +2066,7 @@ static void rk3568_vop2_wait_for_port_mux_done(struct vop2 *vop2)
 	 * Spin until the previous port_mux figuration is done.
 	 */
 	ret = readx_poll_timeout_atomic(rk3568_vop2_read_port_mux, vop2, port_mux_sel,
-					port_mux_sel == vop2->old_port_sel, 0, 50 * 1000);
+					port_mux_sel == vop2->old_port_sel, 10, 50 * 1000);
 	if (ret)
 		DRM_DEV_ERROR(vop2->dev, "wait port_mux done timeout: 0x%x--0x%x\n",
 			      port_mux_sel, vop2->old_port_sel);
@@ -2086,7 +2086,7 @@ static void rk3568_vop2_wait_for_layer_cfg_done(struct vop2 *vop2, u32 cfg)
 	 * Spin until the previous layer configuration is done.
 	 */
 	ret = readx_poll_timeout_atomic(rk3568_vop2_read_layer_cfg, vop2, atv_layer_cfg,
-					atv_layer_cfg == cfg, 0, 50 * 1000);
+					atv_layer_cfg == cfg, 10, 50 * 1000);
 	if (ret)
 		DRM_DEV_ERROR(vop2->dev, "wait layer cfg done timeout: 0x%x--0x%x\n",
 			      atv_layer_cfg, cfg);
-- 
2.43.0

