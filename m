Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EA3376EEB
	for <lists+dri-devel@lfdr.de>; Sat,  8 May 2021 04:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B6A96E82F;
	Sat,  8 May 2021 02:43:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91EF66E82F;
 Sat,  8 May 2021 02:43:17 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4FcWl96FjXzBtdK;
 Sat,  8 May 2021 10:40:37 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Sat, 8 May 2021 10:43:06 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd
 <swboyd@chromium.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, freedreno
 <freedreno@lists.freedesktop.org>, linux-kernel
 <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/1] drm/msm/dpu: Fix error return code in dpu_mdss_init()
Date: Sat, 8 May 2021 10:42:54 +0800
Message-ID: <20210508024254.1877-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.177.72]
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
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix to return a negative error code from the error handling case instead
of 0, as done elsewhere in this function.

Fixes: 070e64dc1bbc ("drm/msm/dpu: Convert to a chained irq chip")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
index 06b56fec04e0..1b6c9fb500a1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
@@ -253,8 +253,10 @@ int dpu_mdss_init(struct drm_device *dev)
 		goto irq_domain_error;
 
 	irq = platform_get_irq(pdev, 0);
-	if (irq < 0)
+	if (irq < 0) {
+		ret = irq;
 		goto irq_error;
+	}
 
 	irq_set_chained_handler_and_data(irq, dpu_mdss_irq,
 					 dpu_mdss);
-- 
2.25.1


