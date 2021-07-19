Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA723CCE86
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 09:32:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0F56E0A8;
	Mon, 19 Jul 2021 07:32:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net
 (zg8tmty1ljiyny4xntqumjca.icoremail.net [165.227.154.27])
 by gabe.freedesktop.org (Postfix) with SMTP id BFC8A89CBE
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 05:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fudan.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id; bh=hemX/0zWDEt59+DTRO7gwwVLaVwth+bbQNeeHWmsnxo=; b=t
 R+FXPmhWHA0BY7r8Vu5wFq/s6KHPEfql0owRJkTZ1UT9/VOqLqQH5ioZh6UfVJZ8
 XTl9L1BWAL/SyfJGBZPLpRa2PgnsslESxIOoudBDEIP5dgYmEqNN7hP5Xr4LNFU2
 rhDrRxGfouAN5giGUDDh6FZOUhg/kk+G5hGMHMpEq0=
Received: from localhost.localdomain (unknown [10.162.86.133])
 by app2 (Coremail) with SMTP id XQUFCgCHjRWeFPVgaUXoBA--.1704S3;
 Mon, 19 Jul 2021 13:58:54 +0800 (CST)
From: Xiyu Yang <xiyuyang19@fudan.edu.cn>
To: Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/exynos: Convert from atomic_t to refcount_t on
 g2d_cmdlist_userptr->refcount
Date: Mon, 19 Jul 2021 13:58:51 +0800
Message-Id: <1626674331-55731-1-git-send-email-xiyuyang19@fudan.edu.cn>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: XQUFCgCHjRWeFPVgaUXoBA--.1704S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Wry3tF17ZF4rJryrtFy7Wrg_yoW8ZryUpF
 4ay347trWS9F97tFyUAa4UZa4Fva4FyryrGrW3K3sakry3Jr15Awn3KF98AFW5XrWxtr1q
 9r1j9ry5AFsruF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
 648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMx
 C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
 wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
 vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
 0xvaj40_Gr0_Zr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
 W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU1c4S5UUUUU==
X-CM-SenderInfo: irzsiiysuqikmy6i3vldqovvfxof0/
X-Mailman-Approved-At: Mon, 19 Jul 2021 07:32:43 +0000
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
Cc: Xin Tan <tanxin.ctf@gmail.com>, yuanxzhang@fudan.edu.cn,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

refcount_t type and corresponding API can protect refcounters from
accidental underflow and overflow and further use-after-free situations.

Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
---
 drivers/gpu/drm/exynos/exynos_drm_g2d.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index cab4d2c370a7..4921e84c374d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -4,6 +4,7 @@
  * Authors: Joonyoung Shim <jy0922.shim@samsung.com>
  */
 
+#include <linux/refcount.h>
 #include <linux/clk.h>
 #include <linux/component.h>
 #include <linux/delay.h>
@@ -208,7 +209,7 @@ struct g2d_cmdlist_userptr {
 	struct page		**pages;
 	unsigned int		npages;
 	struct sg_table		*sgt;
-	atomic_t		refcount;
+	refcount_t		refcount;
 	bool			in_pool;
 	bool			out_of_list;
 };
@@ -386,9 +387,9 @@ static void g2d_userptr_put_dma_addr(struct g2d_data *g2d,
 	if (force)
 		goto out;
 
-	atomic_dec(&g2d_userptr->refcount);
+	refcount_dec(&g2d_userptr->refcount);
 
-	if (atomic_read(&g2d_userptr->refcount) > 0)
+	if (refcount_read(&g2d_userptr->refcount) > 0)
 		return;
 
 	if (g2d_userptr->in_pool)
@@ -436,7 +437,7 @@ static dma_addr_t *g2d_userptr_get_dma_addr(struct g2d_data *g2d,
 			 * and different size.
 			 */
 			if (g2d_userptr->size == size) {
-				atomic_inc(&g2d_userptr->refcount);
+				refcount_inc(&g2d_userptr->refcount);
 				*obj = g2d_userptr;
 
 				return &g2d_userptr->dma_addr;
@@ -461,7 +462,7 @@ static dma_addr_t *g2d_userptr_get_dma_addr(struct g2d_data *g2d,
 	if (!g2d_userptr)
 		return ERR_PTR(-ENOMEM);
 
-	atomic_set(&g2d_userptr->refcount, 1);
+	refcount_set(&g2d_userptr->refcount, 1);
 	g2d_userptr->size = size;
 
 	start = userptr & PAGE_MASK;
-- 
2.7.4

