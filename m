Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 715CF1F8F92
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1665489FE3;
	Mon, 15 Jun 2020 07:27:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Sat, 13 Jun 2020 12:36:54 UTC
Received: from fudan.edu.cn (mail.fudan.edu.cn [202.120.224.73])
 by gabe.freedesktop.org (Postfix) with ESMTP id D65686E06D
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jun 2020 12:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fudan.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id; bh=Uegl0SpVnFO8BtnkbSKSuuBgccmV+e1V63cuPeChxt0=; b=R
 8ZEzQzor7wn12D5lTz+ITJfIu5vucfXmpU3Gooq4MwS82dGzzedP0r/jdAaRdMH6
 lU7tubZ46WCBNwjdMzS7lXIvuUE3GfITW1w0FrM+LDYSAVBogX2mlv25KFJUK54l
 6nxUBEJykZKjypzpPM1wHMEf9RQQUJUqqzzJ+9VBmk=
Received: from localhost.localdomain (unknown [120.229.255.202])
 by app2 (Coremail) with SMTP id XQUFCgCXnKCQxuReIWm1AA--.270S3;
 Sat, 13 Jun 2020 20:29:05 +0800 (CST)
From: Xiyu Yang <xiyuyang19@fudan.edu.cn>
To: Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH] drm/ttm: Fix dma_fence refcnt leak in ttm_bo_vm_fault_reserved
Date: Sat, 13 Jun 2020 20:28:38 +0800
Message-Id: <1592051318-93958-1-git-send-email-xiyuyang19@fudan.edu.cn>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: XQUFCgCXnKCQxuReIWm1AA--.270S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr1xXFyUXF4rKrykuw47CFg_yoW8Gr1xpr
 4xGryj9rnYqFy7tw13A3W5ZFyF9asxtFyFgrZ0ka4rZan8JasxGr4rtrWYgryUZrWxAr1I
 qF1Sgw43ZF1Dua7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9E14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4U
 JVW0owA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
 rcIFxwACI402YVCY1x02628vn2kIc2xKxwCY02Avz4vE14v_Xr1l42xK82IYc2Ij64vIr4
 1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK
 67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI
 8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAv
 wI8IcIk0rVW3JVWrJr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
 AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbgAw7UUUUU==
X-CM-SenderInfo: irzsiiysuqikmy6i3vldqovvfxof0/
X-Mailman-Approved-At: Mon, 15 Jun 2020 07:27:17 +0000
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

ttm_bo_vm_fault_reserved() invokes dma_fence_get(), which returns a
reference of the specified dma_fence object to "moving" with increased
refcnt.

When ttm_bo_vm_fault_reserved() returns, local variable "moving" becomes
invalid, so the refcount should be decreased to keep refcount balanced.

The reference counting issue happens in several exception handling paths
of ttm_bo_vm_fault_reserved(). When those error scenarios occur such as
"err" equals to -EBUSY, the function forgets to decrease the refcnt
increased by dma_fence_get(), causing a refcnt leak.

Fix this issue by calling dma_fence_put() when no_wait_gpu flag is
equals to true.

Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index a43aa7275f12..fa03fab02076 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -300,8 +300,10 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
 			break;
 		case -EBUSY:
 		case -ERESTARTSYS:
+			dma_fence_put(moving);
 			return VM_FAULT_NOPAGE;
 		default:
+			dma_fence_put(moving);
 			return VM_FAULT_SIGBUS;
 		}
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
