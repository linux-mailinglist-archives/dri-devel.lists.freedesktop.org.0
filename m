Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E4BCDD157
	for <lists+dri-devel@lfdr.de>; Wed, 24 Dec 2025 22:50:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A668112C9A;
	Wed, 24 Dec 2025 21:50:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 407 seconds by postgrey-1.36 at gabe;
 Wed, 24 Dec 2025 09:18:08 UTC
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7960E10E3EB
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Dec 2025 09:18:08 +0000 (UTC)
Received: from localhost.localdomain (unknown [36.112.3.209])
 by APP-03 (Coremail) with SMTP id rQCowAA3WeAqrktpKV_RAQ--.6200S2;
 Wed, 24 Dec 2025 17:11:06 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: zack.rusin@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, jakob@vmware.com, thellstrom@vmware.com
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>, stable@vger.kernel.org
Subject: [PATCH] drm/vmwgfx: Fix an error return check in
 vmw_compat_shader_add()
Date: Wed, 24 Dec 2025 17:11:05 +0800
Message-Id: <20251224091105.1569464-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowAA3WeAqrktpKV_RAQ--.6200S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFy5GryxJw47AF47Jw4UXFb_yoWkGrb_Gr
 yjyrnrZrWUZasYv3ZFk3y3Zry0kw109Fs7uws8ta43CF9IyFWjq34UCr9xXr1fGFs5Gryk
 Gw45Ga1fJr9rCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb3xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
 Cr1l84ACjcxK6I8E87Iv67AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
 1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
 n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
 IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
 C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-Originating-IP: [36.112.3.209]
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiBwsGE2lLmnBJlAAAsM
X-Mailman-Approved-At: Wed, 24 Dec 2025 21:50:05 +0000
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

In vmw_compat_shader_add(), the return value check of vmw_shader_alloc()
is not proper. Modify the check for the return pointer 'res'.

Found by code review and compiled on ubuntu 20.04.

Fixes: 18e4a4669c50 ("drm/vmwgfx: Fix compat shader namespace")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_shader.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
index 69dfe69ce0f8..7ed938710342 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
@@ -923,8 +923,10 @@ int vmw_compat_shader_add(struct vmw_private *dev_priv,
 	ttm_bo_unreserve(&buf->tbo);
 
 	res = vmw_shader_alloc(dev_priv, buf, size, 0, shader_type);
-	if (unlikely(ret != 0))
+	if (IS_ERR(res)) {
+		ret = PTR_ERR(res);
 		goto no_reserve;
+	}
 
 	ret = vmw_cmdbuf_res_add(man, vmw_cmdbuf_res_shader,
 				 vmw_shader_key(user_key, shader_type),
-- 
2.25.1

