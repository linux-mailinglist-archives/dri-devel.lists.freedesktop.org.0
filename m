Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A4C64020A
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 09:22:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14C9D10E6AB;
	Fri,  2 Dec 2022 08:22:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9769710E04E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 08:22:32 +0000 (UTC)
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NNmBJ4GXnzFqWj;
 Fri,  2 Dec 2022 16:21:44 +0800 (CST)
Received: from huawei.com (10.175.100.227) by kwepemi500016.china.huawei.com
 (7.221.188.220) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 2 Dec
 2022 16:22:27 +0800
From: Shang XiaoJing <shangxiaojing@huawei.com>
To: <xinliang.liu@linaro.org>, <tiantao6@hisilicon.com>, <jstultz@google.com>, 
 <kong.kongxinwei@hisilicon.com>, <puck.chen@hisilicon.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <p.zabel@pengutronix.de>,
 <architt@codeaurora.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm: kirin: Fix missing clk_disable_unprepare in
 ade_power_up()
Date: Fri, 2 Dec 2022 16:20:28 +0800
Message-ID: <20221202082028.11454-1-shangxiaojing@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500016.china.huawei.com (7.221.188.220)
X-CFilter-Loop: Reflected
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
Cc: shangxiaojing@huawei.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The clk_disable_unprepare() should be called in the error handling of
ade_power_up(). So as reset_control_assert().

Fixes: 783ad972c9a0 ("drm/hisilicon: Add crtc driver for ADE")
Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
---
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
index 871f79a6b17e..439e87923bcf 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
@@ -229,12 +229,15 @@ static int ade_power_up(struct ade_hw_ctx *ctx)
 	ret = reset_control_deassert(ctx->reset);
 	if (ret) {
 		DRM_ERROR("failed to deassert reset\n");
+		clk_disable_unprepare(ctx->media_noc_clk);
 		return ret;
 	}
 
 	ret = clk_prepare_enable(ctx->ade_core_clk);
 	if (ret) {
 		DRM_ERROR("failed to enable ade_core_clk (%d)\n", ret);
+		reset_control_assert(ctx->reset);
+		clk_disable_unprepare(ctx->media_noc_clk);
 		return ret;
 	}
 
-- 
2.17.1

