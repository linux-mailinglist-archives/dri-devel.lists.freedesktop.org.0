Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A2052A8DB
	for <lists+dri-devel@lfdr.de>; Tue, 17 May 2022 19:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DAC3113309;
	Tue, 17 May 2022 17:06:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 461 seconds by postgrey-1.36 at gabe;
 Tue, 17 May 2022 17:06:00 UTC
Received: from azure-sdnproxy-3.icoremail.net (azure-sdnproxy.icoremail.net
 [20.232.28.96])
 by gabe.freedesktop.org (Postfix) with SMTP id C44CA113304;
 Tue, 17 May 2022 17:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pku.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id; bh=MROzn9fmBpUF3Gg9docGTHNNzmGre+Z1nUGu3X6sHf8=; b=t
 X4Vxmewiy4R85EScZZIhba9iJQHa1OILVxZdeY3X2vYOQxt+KP3MhQ0KlhbcE6j3
 IYKImZqv2uvpZeQb4Bkx++NobzQC1vjk07MeOEEHmaBtIT92/wIPRXhMMYwmsVzV
 TUWtRcoSjVW6yQIggqN79iu7oaUEXBqDqCoUuSo3yI=
Received: from localhost (unknown [10.129.21.144])
 by front01 (Coremail) with SMTP id 5oFpogAHA+bP04NiyvtJBw--.53634S2;
 Wed, 18 May 2022 00:56:47 +0800 (CST)
From: Yongzhi Liu <lyz_cs@pku.edu.cn>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch, John.C.Harrison@Intel.com, matthew.auld@intel.com,
 matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 maarten.lankhorst@linux.intel.com
Subject: [PATCH] drm/i915: check fence to avoid null pointer dereference
Date: Tue, 17 May 2022 09:56:41 -0700
Message-Id: <1652806601-88104-1-git-send-email-lyz_cs@pku.edu.cn>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: 5oFpogAHA+bP04NiyvtJBw--.53634S2
X-Coremail-Antispam: 1UD129KBjvdXoWrtw4kCr47ZFWfGr1kArykuFg_yoWfZrXE9a
 ykArn7G39Fkrs093W7Cr98AFy0yF1vvF4vgw1xtrWIkry2yws8XrZ3uw18Zr17GayjqF4U
 Jan29FZ8XF18GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbaxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2
 jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzx
 vE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWU
 JVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7V
 AKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2kIc2xKxwCY02Av
 z4vE-syl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWkJr1UJwCFx2IqxVCFs4
 IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
 MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
 WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
 6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
 BIdaVFxhVjvjDU0xZFpf9x0JUdHUDUUUUU=
X-CM-SenderInfo: irzqijirqukmo6sn3hxhgxhubq/1tbiAwEJBlPy7vIULQABsI
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
Cc: Yongzhi Liu <lyz_cs@pku.edu.cn>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

if drm_syncobj_fence_get return null, we will get a
null pointer. Fix this by adding the null pointer check
on fence.

Signed-off-by: Yongzhi Liu <lyz_cs@pku.edu.cn>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index fd0e15d..3a82a62 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -3184,6 +3184,10 @@ eb_fences_add(struct i915_execbuffer *eb, struct i915_request *rq,
 		struct dma_fence *fence;
 
 		fence = drm_syncobj_fence_get(eb->gem_context->syncobj);
+		if (!fence) {
+			DRM_DEBUG("Syncobj has no fence\n");
+			return ERR_PTR(-EINVAL);
+		}
 		err = i915_request_await_dma_fence(rq, fence);
 		dma_fence_put(fence);
 		if (err)
-- 
2.7.4

