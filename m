Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4E51DF652
	for <lists+dri-devel@lfdr.de>; Sat, 23 May 2020 11:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 823496E1D3;
	Sat, 23 May 2020 09:33:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zju.edu.cn (mail.zju.edu.cn [61.164.42.155])
 by gabe.freedesktop.org (Postfix) with ESMTP id 52DE76E9D7
 for <dri-devel@lists.freedesktop.org>; Fri, 22 May 2020 13:41:27 +0000 (UTC)
Received: from localhost.localdomain (unknown [222.205.77.158])
 by mail-app2 (Coremail) with SMTP id by_KCgCnHr521sdefxCvAQ--.52070S4;
 Fri, 22 May 2020 21:41:14 +0800 (CST)
From: Dinghao Liu <dinghao.liu@zju.edu.cn>
To: dinghao.liu@zju.edu.cn,
	kjlu@umn.edu
Subject: [PATCH] [v2] drm/panfrost: Fix runtime PM imbalance on error
Date: Fri, 22 May 2020 21:41:09 +0800
Message-Id: <20200522134109.27204-1-dinghao.liu@zju.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: by_KCgCnHr521sdefxCvAQ--.52070S4
X-Coremail-Antispam: 1UD129KBjvdXoW7Xr4fWrWfWw4fGFy8KFWDtwb_yoWDXFX_Wr
 17Zry3uw4ayw1qgw4vva13uFya9a45Wayxu34Ig343CayDA34UC34IvF4DZr18u3W3Zr1D
 tanYqFyayr4DGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbTxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E
 87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
 8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
 Jr4lYx0Ex4A2jsIE14v26F4j6r4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64
 vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkIecxE
 wVAFwVW5GwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26r4fKr1UJr1l4I8I3I
 0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWU
 GVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI
 0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0
 rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY6I8E87Iv6xkF7I0E14v26r
 4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7VUbIPfJUUUUU==
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAg4IBlZdtOQvSwABs8
X-Mailman-Approved-At: Sat, 23 May 2020 09:33:36 +0000
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

The caller expects panfrost_job_hw_submit() to increase
runtime PM usage counter. The refcount decrement on the
error branch of WARN_ON() will break the counter balance
and needs to be removed.

Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>
---

Changelog:

v2: - Remove refcount decrement on the error path of
      WARN_ON() rather than add refcount decrement
      on the error path of pm_runtime_get_sync().
---
 drivers/gpu/drm/panfrost/panfrost_job.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
index 7914b1570841..1092d9754f0f 100644
--- a/drivers/gpu/drm/panfrost/panfrost_job.c
+++ b/drivers/gpu/drm/panfrost/panfrost_job.c
@@ -150,7 +150,6 @@ static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
 		return;
 
 	if (WARN_ON(job_read(pfdev, JS_COMMAND_NEXT(js)))) {
-		pm_runtime_put_sync_autosuspend(pfdev->dev);
 		return;
 	}
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
