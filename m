Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91AB947ED2F
	for <lists+dri-devel@lfdr.de>; Fri, 24 Dec 2021 09:29:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 193D410E420;
	Fri, 24 Dec 2021 08:29:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net
 (zg8tmty1ljiyny4xntqumjca.icoremail.net [165.227.154.27])
 by gabe.freedesktop.org (Postfix) with SMTP id 744F610E26A
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Dec 2021 03:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fudan.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id:MIME-Version:Content-Transfer-Encoding; bh=BMyBRwvhGy
 luiRrlY86sBHaPYG7tA6Ci8GsbTDeggR0=; b=VqpLZHizDwmZztJ2SuqDojQVfS
 M9MEieTjUPfnKc6e/0lrLekaEYWztnpjsK7xs0oCFQqht+ORbfQU75G3Zh/iXHNR
 me9LWNSAO+oQtK6H2+Q+83b6EQCZjhuhZTb2yE/+ygn7nxrBQ7GO65HuLTN9YbmU
 P23gLXjKj+Kx9Tyco=
Received: from localhost.localdomain (unknown [10.102.225.147])
 by app2 (Coremail) with SMTP id XQUFCgDHzob378NhybUSAA--.1652S4;
 Thu, 23 Dec 2021 11:42:12 +0800 (CST)
From: Xin Xiong <xiongx18@fudan.edu.cn>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH] drm/i915/selftests: fix potential refcnt issue of a dma_buf
 object
Date: Thu, 23 Dec 2021 11:39:49 +0800
Message-Id: <20211223033948.5208-1-xiongx18@fudan.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: XQUFCgDHzob378NhybUSAA--.1652S4
X-Coremail-Antispam: 1UD129KBjvJXoW7ZryUGF45JFW7Kw1UWw4UArb_yoW8JFykp3
 y3ZFy8CrZ5tF17ta1xJFnFvasxAay3WFy8G39rGwsxAr1DZF18tFWS9Fy3AryUGryfJa4S
 yF92kFy5WFy5AF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9K14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4U
 JVW0owA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
 rcIFxwACI402YVCY1x02628vn2kIc2xKxwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
 8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
 xVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
 AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
 cIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14
 v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOrcfUUUUU
X-CM-SenderInfo: arytiiqsuqiimz6i3vldqovvfxof0/1tbiAQ4EEFKp456+1QAAs2
X-Mailman-Approved-At: Fri, 24 Dec 2021 08:28:15 +0000
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

This issue happens in an error path of igt_dmabuf_export_vmap(). When
dma_buf_vmap() succeeds and memchr_inv() returns nonzero, the function
forgets to decrement `vmapping_counter` of the dma_buf object, which
may result in refcount leaks.

Fix it by calling dma_buf_vunmap() under label `out_dma_map` in
certain error path.

Signed-off-by: Xin Xiong <xiongx18@fudan.edu.cn>
Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
---
 drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
index 4a6bb64c3..b24bc506f 100644
--- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
+++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
@@ -428,12 +428,14 @@ static int igt_dmabuf_export_vmap(void *arg)
 	if (memchr_inv(ptr, 0, dmabuf->size)) {
 		pr_err("Exported object not initialiased to zero!\n");
 		err = -EINVAL;
-		goto out;
+		goto out_dma_map;
 	}
 
 	memset(ptr, 0xc5, dmabuf->size);
 
 	err = 0;
+
+out_dma_map:
 	dma_buf_vunmap(dmabuf, &map);
 out:
 	dma_buf_put(dmabuf);
-- 
2.25.1

