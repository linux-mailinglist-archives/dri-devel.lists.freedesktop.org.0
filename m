Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F70402999
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 15:20:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C80C689D5C;
	Tue,  7 Sep 2021 13:20:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 444 seconds by postgrey-1.36 at gabe;
 Tue, 07 Sep 2021 12:34:19 UTC
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net
 (zg8tmty1ljiyny4xntqumjca.icoremail.net [165.227.154.27])
 by gabe.freedesktop.org (Postfix) with SMTP id 913D789DBF;
 Tue,  7 Sep 2021 12:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fudan.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id; bh=DqqdvAhQhT8ubUpthKcwBqEGHjOC11SOaq08JX4tQd8=; b=O
 ZBGiOn3u9Idg2NzkuxY75lk8m5lYt5pelCZaAeY+SD6Oh6tNImXlVbxHLHxzpQhg
 SumjUuyys6PTbKVijLxTuKPXssYNdC3ILZtgflHCy6c4YrnzVV5uLnyJ6oNTgLaz
 zv1GT16/F/WRIc0FbIAv4tETV0W1yH582LocC53hq4=
Received: from t640 (unknown [10.176.36.8])
 by app1 (Coremail) with SMTP id XAUFCgDnkaR9WjdhdkUvAA--.44636S3;
 Tue, 07 Sep 2021 20:26:37 +0800 (CST)
From: Chenyuan Mi <cymi20@fudan.edu.cn>
To: 
Cc: yuanxzhang@fudan.edu.cn, Chenyuan Mi <cymi20@fudan.edu.cn>,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>, Xin Tan <tanxin.ctf@gmail.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/nouveau/svm: Fix refcount leak bug and missing check
 against null bug
Date: Tue,  7 Sep 2021 20:26:33 +0800
Message-Id: <20210907122633.16665-1-cymi20@fudan.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: XAUFCgDnkaR9WjdhdkUvAA--.44636S3
X-Coremail-Antispam: 1UD129KBjvJXoWrtry5AF18JrW5CFy8Kr17ZFb_yoW8Jr4fpa
 1DCFy2vrs8KayxKw1Iy3Z5uFyfAanrKayfGay7tas0gw1rAFy5Xw4YqryDtry7Xr1Ska4a
 vFnIgFZI9Fs8AFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBq14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
 648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMx
 C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
 wI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwC2zVAIFx02awCIc40Y0x0EwIxGrwCI42
 IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY
 6xAIw20EY4v20xvaj40_Wr1j6rW3Jr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z2
 80aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7sRia0P7UUUUU==
X-CM-SenderInfo: isqsiiisuqikmt6i3vldqovvfxof0/
X-Mailman-Approved-At: Tue, 07 Sep 2021 13:20:26 +0000
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

The reference counting issue happens in one exception handling path of
nouveau_svmm_bind(). When cli->svm.svmm is null, the function forgets
to decrease the refcount of mm increased by get_task_mm(), causing a
refcount leak.

Fix this issue by using mmput() to decrease the refcount in the
exception handling path.

Also, the function forgets to do check against null when get mm
by get_task_mm().

Fix this issue by adding null check after get mm by get_task_mm().

Signed-off-by: Chenyuan Mi <cymi20@fudan.edu.cn>
Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index b0c3422cb01f..9985bfde015a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -162,10 +162,14 @@ nouveau_svmm_bind(struct drm_device *dev, void *data,
 	 */
 
 	mm = get_task_mm(current);
+	if (!mm) {
+		return -EINVAL;
+	}
 	mmap_read_lock(mm);
 
 	if (!cli->svm.svmm) {
 		mmap_read_unlock(mm);
+		mmput(mm);
 		return -EINVAL;
 	}
 
-- 
2.17.1

