Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C606465F9BB
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 03:56:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DD0710E82C;
	Fri,  6 Jan 2023 02:56:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp23.cstnet.cn [159.226.251.23])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8CF6110E82C;
 Fri,  6 Jan 2023 02:56:16 +0000 (UTC)
Received: from localhost.localdomain (unknown [124.16.138.125])
 by APP-03 (Coremail) with SMTP id rQCowAAHDZXKjbdjuQe+Cg--.60117S2;
 Fri, 06 Jan 2023 10:56:10 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@gmail.com,
 daniel@ffwll.ch, marijn.suijten@somainline.org, vkoul@kernel.org,
 dianders@chromium.org, marex@denx.de, vladimir.lypak@gmail.com
Subject: [PATCH] drm/msm/dsi: Add missing check for alloc_ordered_workqueue
Date: Fri,  6 Jan 2023 10:56:09 +0800
Message-Id: <20230106025609.29499-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAAHDZXKjbdjuQe+Cg--.60117S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr17KF43GFWUZw4DGw4kJFb_yoW8Zr1DpF
 WaqF4UtrWFyw4ft3y2yF4Uu3WrCa1rtayxGay7Ww12vw13tr4UZwn8G3WjgFy8tFWDW345
 GFZIy34Dur1vy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
 6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
 n2IY04v7MxkIecxEwVAFwVW8JwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
 W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
 1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
 IIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
 x4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
 DU0xZFpf9x0JUyxRDUUUUU=
X-Originating-IP: [124.16.138.125]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
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
Cc: linux-arm-msm@vger.kernel.org, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add check for the return value of alloc_ordered_workqueue as it may return
NULL pointer and cause NULL pointer dereference.
Moreover, change the "return ret" into "goto fail" in order to be
consistent with the others.

Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
Fixes: 32d3e0feccfe ("drm/msm: dsi: Use OPP API to set clk/perf state")
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 89aadd3b3202..12239f628d5a 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1944,19 +1944,19 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 
 	ret = devm_pm_opp_set_clkname(&pdev->dev, "byte");
 	if (ret)
-		return ret;
+		goto fail;
 	/* OPP table is optional */
 	ret = devm_pm_opp_of_add_table(&pdev->dev);
 	if (ret && ret != -ENODEV) {
 		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
-		return ret;
+		goto fail;
 	}
 
 	msm_host->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
 	if (msm_host->irq < 0) {
 		ret = msm_host->irq;
 		dev_err(&pdev->dev, "failed to get irq: %d\n", ret);
-		return ret;
+		goto fail;
 	}
 
 	/* do not autoenable, will be enabled later */
@@ -1966,7 +1966,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to request IRQ%u: %d\n",
 				msm_host->irq, ret);
-		return ret;
+		goto fail;
 	}
 
 	init_completion(&msm_host->dma_comp);
@@ -1977,6 +1977,11 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 
 	/* setup workqueue */
 	msm_host->workqueue = alloc_ordered_workqueue("dsi_drm_work", 0);
+	if (!msm_host->workqueue) {
+		ret = -ENOMEM;
+		goto fail;
+	}
+
 	INIT_WORK(&msm_host->err_work, dsi_err_worker);
 
 	msm_dsi->id = msm_host->id;
-- 
2.25.1

