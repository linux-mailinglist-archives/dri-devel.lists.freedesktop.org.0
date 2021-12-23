Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C6547ED30
	for <lists+dri-devel@lfdr.de>; Fri, 24 Dec 2021 09:29:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C692310E422;
	Fri, 24 Dec 2021 08:29:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 424 seconds by postgrey-1.36 at gabe;
 Thu, 23 Dec 2021 02:22:24 UTC
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net
 (zg8tmty1ljiyny4xntqumjca.icoremail.net [165.227.154.27])
 by gabe.freedesktop.org (Postfix) with SMTP id E9E8410E256
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 02:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fudan.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id:MIME-Version:Content-Transfer-Encoding; bh=Gc2peLWVrP
 Ce1WMAtOEAOlkjXLnzxq87QH1KHL93r4E=; b=BtF1JRGcOjBltYke80Au/FNhtb
 pu8yd6PiAFM4s3JGLg2IhKkj6JmJHxvMQNocqD98OesuVnkwX63caNx1C3aJ4Sm7
 EvW+aXNrwMojf+lZUZtPBlPQnS33iQ46f+OUh3KuDlRKrbhWG1jjjPq59uCbid6a
 10dbXshTS6X3Nv8YY=
Received: from localhost.localdomain (unknown [10.102.225.147])
 by app1 (Coremail) with SMTP id XAUFCgAHD2uf28Nh4N8SAA--.779S4;
 Thu, 23 Dec 2021 10:15:10 +0800 (CST)
From: Xin Xiong <xiongx18@fudan.edu.cn>
To: VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Zack Rusin <zackr@vmware.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/vmwgfx:fix refcount leak in vmw_kms_fb_create()
Date: Thu, 23 Dec 2021 10:13:42 +0800
Message-Id: <20211223021342.3650-1-xiongx18@fudan.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: XAUFCgAHD2uf28Nh4N8SAA--.779S4
X-Coremail-Antispam: 1UD129KBjvJXoW7JrW5ZrWkXFy8Jw4xAry3CFg_yoW8Jr4rpr
 43Cry2krWfXa12gFZrAa95WFyUt3ZFgFyFkFWkuwn8Gr13Z3sxt3y5A3yjgryDCrWkAr4r
 XF1Ikw4UCF4qyFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9l14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26rxl
 6s0DM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
 YxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkIecxEwVCm-wCF04k20xvY0x0EwIxGrwCFx2
 IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v2
 6r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67
 AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IY
 s7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
 WUJVW8JbIYCTnIWIevJa73UjIFyTuYvjfUFYFADUUUU
X-CM-SenderInfo: arytiiqsuqiimz6i3vldqovvfxof0/1tbiARACEFKp452wKgABsd
X-Mailman-Approved-At: Fri, 24 Dec 2021 08:28:14 +0000
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
 Xiyu Yang <xiyuyang19@fudan.edu.cn>, Xin Xiong <xiongx18@fudan.edu.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This issue happens in one error path of vmw_kms_fb_create(). The
function forgets to decrement the refcount of a ttm_base_object obj,
which is increased by vmw_user_lookup_handle() earlier, when
vmw_user_lookup_handle() returns 0 but vfb is not yet created. This
may incur reference count leak.

Fix it by decrement reference count in that error path instead of
assigning the obj to vfb->user_obj.

Signed-off-by: Xin Xiong <xiongx18@fudan.edu.cn>
Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index 74fa41909..453fa714f 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -1426,7 +1426,7 @@ static struct drm_framebuffer *vmw_kms_fb_create(struct drm_device *dev,
 	if (surface)
 		vmw_surface_unreference(&surface);
 
-	if (ret) {
+	if (ret || !vfb) {
 		DRM_ERROR("failed to create vmw_framebuffer: %i\n", ret);
 		ttm_base_object_unref(&user_obj);
 		return ERR_PTR(ret);
-- 
2.25.1

