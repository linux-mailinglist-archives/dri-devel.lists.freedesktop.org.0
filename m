Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73888766195
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jul 2023 04:05:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 694CE10E1E7;
	Fri, 28 Jul 2023 02:05:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 386 seconds by postgrey-1.36 at gabe;
 Fri, 28 Jul 2023 02:05:27 UTC
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B2E610E1E7;
 Fri, 28 Jul 2023 02:05:27 +0000 (UTC)
Received: from 4d92782a4194.home.arpa (unknown [124.16.138.129])
 by APP-03 (Coremail) with SMTP id rQCowACnr2fXIMNkUDmTDg--.20935S2;
 Fri, 28 Jul 2023 09:58:47 +0800 (CST)
From: Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com, airlied@gmail.com,
 daniel@ffwll.ch, robdclark@chromium.org, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, chris@chris-wilson.co.uk
Subject: [PATCH] drm/i915/gem: Add check for bitmap_zalloc()
Date: Fri, 28 Jul 2023 09:58:46 +0800
Message-Id: <20230728015846.20228-1-jiasheng@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: rQCowACnr2fXIMNkUDmTDg--.20935S2
X-Coremail-Antispam: 1UD129KBjvdXoWruF4kAr1fAw1DuFWDWr17Jrb_yoWDWFg_Ca
 48Xr1rW39rGFnY9F12vwnavFyFyan5Zr48Xw1rKFZ3JrW3AwsxW39xAr15Zr17AFW7Zwnr
 GF4kZFn8Zr12kjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb38FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
 6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r
 4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
 Yx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbV
 WUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7Cj
 xVA2Y2ka0xkIwI1lc2xSY4AK67AK6w4l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7
 v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF
 1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIx
 AIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI
 42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWI
 evJa73UjIFyTuYvjfUOMKZDUUUU
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: pmld2xxhqjqxpvfd2hldfou0/
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
Cc: intel-gfx@lists.freedesktop.org, Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add the check for the return value of bitmap_zalloc() in order to
guarantee the success of the allocation.

Fixes: e9b73c67390a ("drm/i915: Reduce memory pressure during shrinker by preallocating swizzle pages")
Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
---
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_tiling.c b/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
index a049ca0b7980..e9cf99d95966 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_tiling.c
@@ -311,6 +311,11 @@ i915_gem_object_set_tiling(struct drm_i915_gem_object *obj,
 		if (!obj->bit_17) {
 			obj->bit_17 = bitmap_zalloc(obj->base.size >> PAGE_SHIFT,
 						    GFP_KERNEL);
+			if (!obj->bit_17) {
+				i915_gem_object_unlock(obj);
+				i915_gem_object_release_mmap_gtt(obj);
+				return -ENOMEM;
+			}
 		}
 	} else {
 		bitmap_free(obj->bit_17);
-- 
2.25.1

