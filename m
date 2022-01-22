Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 762D7496CE2
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jan 2022 17:31:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BF2110E1DF;
	Sat, 22 Jan 2022 16:30:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from azure-sdnproxy-2.icoremail.net (azure-sdnproxy.icoremail.net
 [52.175.55.52])
 by gabe.freedesktop.org (Postfix) with SMTP id 1AA4210E1DF
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jan 2022 16:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pku.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id; bh=alq4ir+0MOG88pcfGYwcw057jT8x9vR4bRokF24UWbg=; b=R
 yNOVBZcEZ3yWqkD2aoKSIg5F2m6frcZAOhiXdi3zE193mbE0A0W1hEj3J9QlzB+V
 MiyWOCK3HcfiFngbT7aYiH1CWqhr2HUGWJqbsOoSq1xcVSsHuqgbBbD8uNNNGOwU
 K62x4GHKlrh2/Sjjrv+uZufqtIt2ZqAXyckQAqDmXA=
Received: from localhost (unknown [10.129.21.144])
 by front02 (Coremail) with SMTP id 54FpogA3PyM0MOxhuSOfAA--.56422S2;
 Sun, 23 Jan 2022 00:26:28 +0800 (CST)
From: Yongzhi Liu <lyz_cs@pku.edu.cn>
To: emma@anholt.net,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/v3d: Add missing unlock
Date: Sat, 22 Jan 2022 08:26:27 -0800
Message-Id: <1642868787-61384-1-git-send-email-lyz_cs@pku.edu.cn>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: 54FpogA3PyM0MOxhuSOfAA--.56422S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtFykGFy3ArW7uF43Aw15CFg_yoWDGFb_Ga
 13Xwn7WF4UCrsIqF17A3yavrWFvFykCF4rZwnrKa43t3sF9FykKry8Zr1UXr1rJa18uFsr
 tr1fZrsayFn7KjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbxxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E
 87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcx
 kEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v2
 6r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2
 Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkIecxEwVCm-wCF04k20xvY0x0EwIxG
 rwCF04k20xvE74AGY7Cv6cx26w4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
 8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWU
 twCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
 0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
 Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUoO
 J5UUUUU
X-CM-SenderInfo: irzqijirqukmo6sn3hxhgxhubq/1tbiAwEOBlPy7uC2rgAAs9
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
Cc: Yongzhi Liu <lyz_cs@pku.edu.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[why]
Unlock is needed on the error handling path to prevent dead lock.

[how]
Fix this by adding drm_gem_unlock_reservations on the error handling path.

Signed-off-by: Yongzhi Liu <lyz_cs@pku.edu.cn>
---
 drivers/gpu/drm/v3d/v3d_gem.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index c7ed2e1..0c989dc 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -798,6 +798,8 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
 
 		if (!render->base.perfmon) {
 			ret = -ENOENT;
+			drm_gem_unlock_reservations(last_job->bo,
+				    last_job->bo_count, &acquire_ctx);
 			goto fail;
 		}
 	}
@@ -1027,6 +1029,8 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
 						     args->perfmon_id);
 		if (!job->base.perfmon) {
 			ret = -ENOENT;
+			drm_gem_unlock_reservations(clean_job->bo, clean_job->bo_count,
+						    &acquire_ctx);
 			goto fail;
 		}
 	}
-- 
2.7.4

