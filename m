Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C191F8F97
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A8956E098;
	Mon, 15 Jun 2020 07:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fudan.edu.cn (mail.fudan.edu.cn [202.120.224.10])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4240C89791
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 12:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fudan.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id; bh=NgezQL5SAIiQAamduSryXNCoN4qm00Nz7G4lENqQzs8=; b=r
 OoowyDKltAqTmWCoZ7g2jgoeqqnOWnzN+YyWo4rJ3e1SWRya/92jjrSr/xkkzb1a
 TjWRe5nl8kHTH6S4L1/TIKvpx5zUQO1RXhqmGHGFFSe2dMrq1E7vuec/90G03l2k
 mwK90mGaFajMvdyMvv9iz2lJ103fYdOYUq/Jh0QZeg=
Received: from localhost.localdomain (unknown [120.229.255.202])
 by app1 (Coremail) with SMTP id XAUFCgB3fTH3xuReHq4YAA--.20878S3;
 Sat, 13 Jun 2020 20:30:48 +0800 (CST)
From: Xiyu Yang <xiyuyang19@fudan.edu.cn>
To: Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH] drm/ttm: Fix dma_fence refcnt leak when adding move fence
Date: Sat, 13 Jun 2020 20:30:25 +0800
Message-Id: <1592051425-94019-1-git-send-email-xiyuyang19@fudan.edu.cn>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: XAUFCgB3fTH3xuReHq4YAA--.20878S3
X-Coremail-Antispam: 1UD129KBjvJXoWxJrWUZFyDJF1DZr45tr4UXFb_yoW8JFWxpr
 s3GrW2krn8tF17X3sIy3W0gF95Ca47XFySgFZxCas8Zwn0v3sxKr15t390qFyUZrZ2qF42
 qr1SkrsxuF1DuFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9E14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4U
 JVW0owA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
 rcIFxwACI402YVCY1x02628vn2kIc2xKxwCY02Avz4vE14v_Xr1l42xK82IYc2Ij64vIr4
 1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
 67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
 8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
 wI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
 AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbeOJUUUUUU==
X-CM-SenderInfo: irzsiiysuqikmy6i3vldqovvfxof0/
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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
Cc: Xin Tan <tanxin.ctf@gmail.com>, yuanxzhang@fudan.edu.cn, kjlu@umn.edu,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ttm_bo_add_move_fence() invokes dma_fence_get(), which returns a
reference of the specified dma_fence object to "fence" with increased
refcnt.

When ttm_bo_add_move_fence() returns, local variable "fence" becomes
invalid, so the refcount should be decreased to keep refcount balanced.

The reference counting issue happens in one exception handling path of
ttm_bo_add_move_fence(). When no_wait_gpu flag is equals to true, the
function forgets to decrease the refcnt increased by dma_fence_get(),
causing a refcnt leak.

Fix this issue by calling dma_fence_put() when no_wait_gpu flag is
equals to true.

Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index f73b81c2576e..0f20e14a4cfd 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -883,8 +883,10 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
 	if (!fence)
 		return 0;
 
-	if (no_wait_gpu)
+	if (no_wait_gpu) {
+		dma_fence_put(fence);
 		return -EBUSY;
+	}
 
 	dma_resv_add_shared_fence(bo->base.resv, fence);
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
