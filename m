Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9618E1E07BA
	for <lists+dri-devel@lfdr.de>; Mon, 25 May 2020 09:21:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C6D889D02;
	Mon, 25 May 2020 07:21:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zju.edu.cn (mail.zju.edu.cn [61.164.42.155])
 by gabe.freedesktop.org (Postfix) with ESMTP id 470ED6E21D
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 02:19:03 +0000 (UTC)
Received: from localhost.localdomain (unknown [222.205.77.158])
 by mail-app2 (Coremail) with SMTP id by_KCgCXlTCH2cleb8zBAQ--.12234S4;
 Sun, 24 May 2020 10:18:50 +0800 (CST)
From: Dinghao Liu <dinghao.liu@zju.edu.cn>
To: dinghao.liu@zju.edu.cn,
	kjlu@umn.edu
Subject: [PATCH] drm/panfrost: Fix runtime PM imbalance in
 panfrost_perfcnt_enable_locked
Date: Sun, 24 May 2020 10:18:46 +0800
Message-Id: <20200524021846.9913-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: by_KCgCXlTCH2cleb8zBAQ--.12234S4
X-Coremail-Antispam: 1UD129KBjvJXoW7ZrWkur1furW8uw1DXrW8Zwb_yoW8XrW7pF
 Z7uFy5Zry8C347t3s7CasrZay3ua43KrykGFZ8G3y5Aa17tFyktr4qka4YqFWUZFWkAFn8
 tws7K3y7u3WYyF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9l1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2
 z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcV
 Aq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r10
 6r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
 vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkIecxE
 wVAFwVW8JwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fKr1UJr1l4I8I3I
 0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
 GVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
 0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0
 rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
 4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUF3kuDUUUU
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgEJBlZdtORShQAPsP
X-Mailman-Approved-At: Mon, 25 May 2020 07:21:04 +0000
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code. Thus a pairing decrement is needed on
the error handling path to keep the counter balanced. For all error
paths after pm_runtime_get_sync(), things are the same.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---
 drivers/gpu/drm/panfrost/panfrost_perfcnt.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
index 6913578d5aa7..d99bd2f0503a 100644
--- a/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
+++ b/drivers/gpu/drm/panfrost/panfrost_perfcnt.c
@@ -83,11 +83,13 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
 
 	ret = pm_runtime_get_sync(pfdev->dev);
 	if (ret < 0)
-		return ret;
+		goto err_pm_get;
 
 	bo = drm_gem_shmem_create(pfdev->ddev, perfcnt->bosize);
-	if (IS_ERR(bo))
-		return PTR_ERR(bo);
+	if (IS_ERR(bo)) {
+		ret = PTR_ERR(bo);
+		goto err_pm_get;
+	}
 
 	/* Map the perfcnt buf in the address space attached to file_priv. */
 	ret = panfrost_gem_open(&bo->base, file_priv);
@@ -168,6 +170,8 @@ static int panfrost_perfcnt_enable_locked(struct panfrost_device *pfdev,
 	panfrost_gem_close(&bo->base, file_priv);
 err_put_bo:
 	drm_gem_object_put_unlocked(&bo->base);
+err_pm_get:
+	pm_runtime_put_noidle(pfdev->dev);
 	return ret;
 }
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
