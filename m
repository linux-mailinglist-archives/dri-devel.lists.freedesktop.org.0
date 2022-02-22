Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B383D4BFB10
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 15:46:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C8C310E619;
	Tue, 22 Feb 2022 14:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 85926 seconds by postgrey-1.36 at gabe;
 Tue, 22 Feb 2022 14:46:26 UTC
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net
 (zg8tmty1ljiyny4xntqumjca.icoremail.net [165.227.154.27])
 by gabe.freedesktop.org (Postfix) with SMTP id F278B10E61A;
 Tue, 22 Feb 2022 14:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pku.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id; bh=/N7f5ydQqsIl84ZhQi0C4HKqO/xehbQ85yFBefZFYwk=; b=X
 UeNkJ9QAmEf/PymO4YyvkY/VCWtYG0jdJ5o54ElhmJQpY0U/D64umY6rXX1f9vV5
 InUUDK4xv8o6zA84TeLIl5qiAm2jTQ467gHirl6qOFBeoBwRmJ9I8TuoMNH+zjob
 b8kCEL01GyFja+suykJjqK8x/ftQlh1N5LiXaF24Cw=
Received: from localhost (unknown [10.129.21.144])
 by front01 (Coremail) with SMTP id 5oFpogBnbjot9xRiEyD3AQ--.4786S2;
 Tue, 22 Feb 2022 22:46:05 +0800 (CST)
From: Yongzhi Liu <lyz_cs@pku.edu.cn>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@linux.ie,
 daniel@ffwll.ch, thomas.hellstrom@linux.intel.com,
 maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
 matthew.d.roper@intel.com, lyz_cs@pku.edu.cn, tzimmermann@suse.de,
 michal.winiarski@intel.com
Subject: [PATCH] drm/i915: Check input parameter for NULL
Date: Tue, 22 Feb 2022 06:46:01 -0800
Message-Id: <1645541161-46607-1-git-send-email-lyz_cs@pku.edu.cn>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: 5oFpogBnbjot9xRiEyD3AQ--.4786S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JF1DGr45Gr1kXw4xCw4xCrg_yoWDZwc_CF
 Wakr1fGwnrWrs0kF17Cws3AFy0yFyjgr4kuw10yrZ3Jry2yr4DX3s2yr1UAF18GFWUuF9x
 Gw4Du3Z8Ars0kjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb3AFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E
 87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
 8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_
 Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
 xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc2xSY4AK
 6svPMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Kr1UJr1l4I8I3I0E4IkC6x
 0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
 zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
 4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
 CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
 nIWIevJa73UjIFyTuYvjfUoOJ5UUUUU
X-CM-SenderInfo: irzqijirqukmo6sn3hxhgxhubq/1tbiAwEIBlPy7uKuvgAXsm
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[why]
i915_gem_object_put_pages_phys() frees pages and standard
pattern is to allow caller to not care if it's
NULL or not. This will reduce burden on
the callers to perform this check.

[how]
Fix it by adding Null check.

Signed-off-by: Yongzhi Liu <lyz_cs@pku.edu.cn>
---
 drivers/gpu/drm/i915/gem/i915_gem_phys.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_phys.c b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
index ca6faff..09c3dcb 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_phys.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_phys.c
@@ -95,8 +95,13 @@ void
 i915_gem_object_put_pages_phys(struct drm_i915_gem_object *obj,
 			       struct sg_table *pages)
 {
-	dma_addr_t dma = sg_dma_address(pages->sgl);
-	void *vaddr = sg_page(pages->sgl);
+	dma_addr_t dma;
+	void *vaddr;
+
+	if (!pages)
+		return;
+	dma = sg_dma_address(pages->sgl);
+	vaddr = sg_page(pages->sgl);
 
 	__i915_gem_object_release_shmem(obj, pages, false);
 
-- 
2.7.4

