Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 947AE1B01F1
	for <lists+dri-devel@lfdr.de>; Mon, 20 Apr 2020 08:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E77156E1E8;
	Mon, 20 Apr 2020 06:55:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 410 seconds by postgrey-1.36 at gabe;
 Mon, 20 Apr 2020 05:51:01 UTC
Received: from fudan.edu.cn (mail.fudan.edu.cn [202.120.224.10])
 by gabe.freedesktop.org (Postfix) with ESMTP id 03AB86E176;
 Mon, 20 Apr 2020 05:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fudan.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id; bh=Kde4d4Iskv/eESUo3kW89uQutTL1AA81UbKX+DBEwr0=; b=W
 edNlbtZZjgiW2Kq8k8ac+CLyF4EGP7+i19/4xZApaEBNO3Wx9fyOFXDL9ZUPnIJ9
 tCPlGpUr8EKV9xrHIQy436U9ijsoldMg+xFYHIGRiReOY82ID4wcnuLFOwkaCy4i
 tdHmo+PT5icLN+7Fde4Y5v1nIBa83Xe9ysLpaFh88o=
Received: from localhost.localdomain (unknown [120.229.255.67])
 by app1 (Coremail) with SMTP id XAUFCgD3_8dsNp1eenwWAA--.8407S3;
 Mon, 20 Apr 2020 13:43:09 +0800 (CST)
From: Xiyu Yang <xiyuyang19@fudan.edu.cn>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Imre Deak <imre.deak@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915/selftests:  Fix i915_address_space refcnt leak
Date: Mon, 20 Apr 2020 13:41:54 +0800
Message-Id: <1587361342-83494-1-git-send-email-xiyuyang19@fudan.edu.cn>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: XAUFCgD3_8dsNp1eenwWAA--.8407S3
X-Coremail-Antispam: 1UD129KBjvJXoW7KF43Gry7CFy3Jw4xArW3trb_yoW8Cw13pr
 45Ca4Iyr90yw47ta9Fvws5W3WfA3WxKay8Cr1kWwn5Gr1UJa4Skr1Sgry5JFWUCrWfXry2
 vrW2kFWava4FkaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9E14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26rxl
 6s0DM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
 YxC7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkIecxEwVAFwVW8WwCF04k20xvY0x0EwIxGrw
 CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
 14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
 IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42xK8VAv
 wI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
 AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbfOz3UUUUU==
X-CM-SenderInfo: irzsiiysuqikmy6i3vldqovvfxof0/
X-Mailman-Approved-At: Mon, 20 Apr 2020 06:55:01 +0000
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

igt_ppgtt_pin_update() invokes i915_gem_context_get_vm_rcu(), which
returns a reference of the i915_address_space object to "vm" with
increased refcount.

When igt_ppgtt_pin_update() returns, "vm" becomes invalid, so the
refcount should be decreased to keep refcount balanced.

The reference counting issue happens in two exception handling paths of
igt_ppgtt_pin_update(). When i915_gem_object_create_internal() returns
IS_ERR, the refcnt increased by i915_gem_context_get_vm_rcu() is not
decreased, causing a refcnt leak.

Fix this issue by jumping to "out_vm" label when
i915_gem_object_create_internal() returns IS_ERR.

Fixes: 4049866f0913 ("drm/i915/selftests: huge page tests")
Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
---
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index 9311250d7d6f..7a7763be6b2e 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -1578,8 +1578,10 @@ static int igt_ppgtt_pin_update(void *arg)
 		unsigned int page_size = BIT(first);
 
 		obj = i915_gem_object_create_internal(dev_priv, page_size);
-		if (IS_ERR(obj))
-			return PTR_ERR(obj);
+		if (IS_ERR(obj)) {
+			err = PTR_ERR(obj);
+			goto out_vm;
+		}
 
 		vma = i915_vma_instance(obj, vm, NULL);
 		if (IS_ERR(vma)) {
@@ -1632,8 +1634,10 @@ static int igt_ppgtt_pin_update(void *arg)
 	}
 
 	obj = i915_gem_object_create_internal(dev_priv, PAGE_SIZE);
-	if (IS_ERR(obj))
-		return PTR_ERR(obj);
+	if (IS_ERR(obj)) {
+		err = PTR_ERR(obj);
+		goto out_vm;
+	}
 
 	vma = i915_vma_instance(obj, vm, NULL);
 	if (IS_ERR(vma)) {
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
