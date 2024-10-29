Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D58409B5003
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 18:03:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C05E610E695;
	Tue, 29 Oct 2024 17:03:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1113 seconds by postgrey-1.36 at gabe;
 Tue, 29 Oct 2024 09:01:51 UTC
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com
 [45.249.212.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0754910E0DD
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 09:01:50 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.235])
 by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4Xd3g53mZqz4f3jR1
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 16:42:57 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
 by mail.maildlp.com (Postfix) with ESMTP id 3462E1A058E
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 16:43:15 +0800 (CST)
Received: from hulk-vt.huawei.com (unknown [10.67.174.121])
 by APP3 (Coremail) with SMTP id _Ch0CgC3R8QYoCBnPGUEAQ--.29843S2;
 Tue, 29 Oct 2024 16:43:15 +0800 (CST)
From: Chen Ridong <chenridong@huaweicloud.com>
To: zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, maaz.mombasawala@broadcom.com,
 martin.krastev@broadcom.com
Cc: dri-devel@lists.freedesktop.org, chenridong@huawei.com,
 wangweiyang2@huawei.com
Subject: [PATCH] drm/vmwgfx: avoid null_ptr_deref in
 vmw_framebuffer_surface_create_handle
Date: Tue, 29 Oct 2024 08:34:29 +0000
Message-Id: <20241029083429.1185479-1-chenridong@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _Ch0CgC3R8QYoCBnPGUEAQ--.29843S2
X-Coremail-Antispam: 1UD129KBjvdXoWruF13CrWrCw4ftF43CrWfZrb_yoWDKrX_G3
 4kZrn7JF45GFn5Z3Z29398Z34Ikw1rZrs7uF4FqFy5KF9rZwnYg3y8K34ktr97Ga15GFs8
 Aa18GF4Ivr1DKjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbI8YFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
 Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
 A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
 67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
 0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
 x7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
 0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAa
 w2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxV
 Aqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q
 6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6x
 kF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AK
 xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
 xUOBMKDUUUU
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/
X-Mailman-Approved-At: Tue, 29 Oct 2024 17:03:24 +0000
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

From: Chen Ridong <chenridong@huawei.com>

The 'vmw_user_object_buffer' function may return NULL with incorrect
inputs. To avoid possible null pointer dereference, add a check whether
the 'bo' is NULL in the vmw_framebuffer_surface_create_handle.

Fixes: d6667f0ddf46 ("drm/vmwgfx: Fix handling of dumb buffers")
Signed-off-by: Chen Ridong <chenridong@huawei.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index f39bf992364d..8db38927729b 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -1265,6 +1265,8 @@ static int vmw_framebuffer_surface_create_handle(struct drm_framebuffer *fb,
 	struct vmw_framebuffer_surface *vfbs = vmw_framebuffer_to_vfbs(fb);
 	struct vmw_bo *bo = vmw_user_object_buffer(&vfbs->uo);
 
+	if (WARN_ON(!bo))
+		return -EINVAL;
 	return drm_gem_handle_create(file_priv, &bo->tbo.base, handle);
 }
 
-- 
2.34.1

