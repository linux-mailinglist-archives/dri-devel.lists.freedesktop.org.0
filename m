Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E07B3FDC8
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 13:30:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C39D10E66B;
	Tue,  2 Sep 2025 11:30:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="bb4+6FXc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
 by gabe.freedesktop.org (Postfix) with ESMTP id ECFEA10E66B
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 11:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=O2
 jNJs+6gEldsE4ZESof941zcVbZy7vYJYussm6EMM4=; b=bb4+6FXcO+dUnuA5vP
 Q+gC8qX1EszRH3+3iHMBw2qMoZzn1JexMrUw9egT6C90O7KbqA3WMvGxk/tpG4xV
 JFrDVp3/EozsWzFJeFQxKKk4RNo+ehRq0NeD3TTlFmL/7G8iJYk0vI93ZZQ6/7L7
 BMbpxf02clp5mEc0ttzo2e0xk=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id
 _____wBnL9cT1bZoLZjNGA--.11797S2; 
 Tue, 02 Sep 2025 19:29:27 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: dmitry.baryshkov@oss.qualcomm.com
Cc: dan.carpenter@linaro.org, jonas@kwiboo.se,
 Laurent.pinchart@ideasonboard.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, neil.armstrong@linaro.org, rfoss@kernel.org,
 simona@ffwll.ch, tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] drm/bridge: dw-dp: Fix the EMPHASIS_SHIFT for
 dw_dp_voltage_max
Date: Tue,  2 Sep 2025 19:29:14 +0800
Message-ID: <20250902112922.684581-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wBnL9cT1bZoLZjNGA--.11797S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZFyUCr45Aw1UurWrtry7Jrb_yoW8GrWkpF
 sxWFy7Kr1kXF43ta4xCr109Fn8ZasrZaySqFW7Jwsavr17uF1fuasFkFW3Wryqgw1UGrWj
 vFs3Xry5Gw1qkFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UvD7-UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBEAC8Xmi20iFqcwAAsG
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

The p(pre_emphasis) should be left-shifted by DP_TRAIN_PRE_EMPHASIS_SHIFT
to match the logic of dw_dp_voltage_max.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/dri-devel/aLaQLlJC8qMrnDAf@stanley.mountain/T/#u
Fixes: 86eecc3a9c2e ("drm/bridge: synopsys: Add DW DPTX Controller support library")
Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index 9bbfe8da3de02..e23462b49a4fb 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -767,7 +767,7 @@ static bool dw_dp_link_get_adjustments(struct dw_dp_link *link,
 			adj->pre_max_reached[i] = false;
 		}
 
-		v = min(v, dw_dp_voltage_max(p));
+		v = min(v, dw_dp_voltage_max(p << DP_TRAIN_PRE_EMPHASIS_SHIFT));
 		if (v >= (DP_TRAIN_VOLTAGE_SWING_LEVEL_3 >> DP_TRAIN_VOLTAGE_SWING_SHIFT)) {
 			adj->voltage_swing[i] = DP_TRAIN_VOLTAGE_SWING_LEVEL_3 >>
 						DP_TRAIN_VOLTAGE_SWING_SHIFT;
-- 
2.43.0

base-commit: cbcbb361cba5016331b2ba03fc09d755fc7cde38
branch: heads/drm-misc-next-2025-08-28

