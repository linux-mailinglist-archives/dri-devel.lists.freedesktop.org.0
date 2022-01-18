Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35670493152
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 00:17:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D20310E2CA;
	Tue, 18 Jan 2022 23:17:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 71417 seconds by postgrey-1.36 at gabe;
 Tue, 18 Jan 2022 12:05:17 UTC
Received: from zg8tmtyylji0my4xnjiumje2.icoremail.net
 (zg8tmtyylji0my4xnjiumje2.icoremail.net [162.243.162.216])
 by gabe.freedesktop.org (Postfix) with SMTP id 25B3810E508
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 12:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pku.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id; bh=5O5U7jsnHA7kBZ7RZnQht5rKmv8b+xsNFODgWa6IJVM=; b=h
 5BcuwSvNQCBvm11EbUyflIk+RG+nEAqLmaEWdccBI1pZY7mFHbjREveJJ32Chdaq
 x95XhIjuNKlORFN/kHAnnR6xL2ABHU3sm/ASHMaawuwVL3q6FGOH9q9piXIZJrKF
 IOswzR26dHiZVPXwUNSUgEGoRNGD47h8g0eI5Ghxws=
Received: from localhost (unknown [10.129.21.144])
 by front01 (Coremail) with SMTP id 5oFpogC3vTkJrOZhATZ0AA--.62223S2;
 Tue, 18 Jan 2022 20:01:14 +0800 (CST)
From: Yongzhi Liu <lyz_cs@pku.edu.cn>
To: airlied@linux.ie, daniel@ffwll.ch, nirmoy.das@amd.com, lijo.lazar@amd.com,
 Jingwen.Chen2@amd.com, evan.quan@amd.com, Jack.Zhang1@amd.com,
 kevin1.wang@amd.com, tom.stdenis@amd.com
Subject: [PATCH] drm/amdgpu: Add missing pm_runtime_put_autosuspend
Date: Tue, 18 Jan 2022 04:01:12 -0800
Message-Id: <1642507272-17545-1-git-send-email-lyz_cs@pku.edu.cn>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: 5oFpogC3vTkJrOZhATZ0AA--.62223S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKrW7ZFW7WF1rGrW8GF4rKrg_yoWfuFX_K3
 yUXr9rXw13AF1qqr1Iyw43ZrWIvFZ8ZF18Wr1ftFySyryUZrWDJryjvrn8Zw4rWr17GF1D
 X390gF1fAwnI9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb3AFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E
 87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
 8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
 Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
 xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc2xSY4AK
 6svPMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Kr1UJr1l4I8I3I0E4IkC6x
 0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
 zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
 4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
 CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
 nIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-CM-SenderInfo: irzqijirqukmo6sn3hxhgxhubq/1tbiAwEKBlPy7uA+KwADs3
X-Mailman-Approved-At: Tue, 18 Jan 2022 23:17:04 +0000
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
Cc: Yongzhi Liu <lyz_cs@pku.edu.cn>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code, thus a matching decrement is needed
on the error handling path to keep the counter balanced.

Signed-off-by: Yongzhi Liu <lyz_cs@pku.edu.cn>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
index 9aea1cc..4b950de 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_debugfs.c
@@ -1120,8 +1120,10 @@ static ssize_t amdgpu_debugfs_gfxoff_read(struct file *f, char __user *buf,
 		return -EINVAL;
 
 	r = pm_runtime_get_sync(adev_to_drm(adev)->dev);
-	if (r < 0)
+	if (r < 0) {
+		pm_runtime_put_autosuspend(adev_to_drm(adev)->dev);
 		return r;
+	}
 
 	while (size) {
 		uint32_t value;
-- 
2.7.4

