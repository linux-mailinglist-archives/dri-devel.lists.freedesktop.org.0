Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D17756C7A
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 20:49:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 890F410E039;
	Mon, 17 Jul 2023 18:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-13.smtpout.orange.fr
 [80.12.242.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948AD10E039
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 18:49:38 +0000 (UTC)
Received: from pop-os.home ([86.243.2.178]) by smtp.orange.fr with ESMTPA
 id LTHoqBKeeFmkzLTHoqiy4V; Mon, 17 Jul 2023 20:49:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1689619775;
 bh=6EdZ+Gq8+oaEzVh78T6j0Vq20F8gxMukgxRTDtUERro=;
 h=From:To:Cc:Subject:Date;
 b=sxNEjaNaSFGblebLhoZgCspR3/b7PMWw5mvvcbiA1JPdCVOiD0EcAzet5fqmrBLF0
 g1kJA04ScN0oLMVrH4T0js02kJvMR5ByBFj85S3S263Cai7ZlGu9TueW4SLJB59Nxr
 yNr1SrsLma5wvNJutFL013ubT61mwc2VkIW7B1vS1WgiZEA39BUysRBJDv3H3rLPTb
 pWvr1ye+zaTo4e7HiCsKYaVJiH9p8aKlYdZ3+ZFyBSC7oBIXCzPJWWFrbUeDnCi/Zc
 ncTIfUd0VPZ4Pw8VuSOu+/IXZUpeo1Dk6aHUaxZTE3KzUG70NVHYvE+EHhauumpuxY
 R6XZR7RXCKgVw==
X-ME-Helo: pop-os.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 17 Jul 2023 20:49:35 +0200
X-ME-IP: 86.243.2.178
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Matthew Auld <matthew.auld@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: [PATCH] drm/i915: Fix an error handling path in igt_write_huge()
Date: Mon, 17 Jul 2023 20:49:31 +0200
Message-Id: <7a036b88671312ee9adc01c74ef5b3376f690b76.1689619758.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 intel-gfx@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All error handling paths go to 'out', except this one. Be consistent and
also branch to 'out' here.

Fixes: c10a652e239e ("drm/i915/selftests: Rework context handling in hugepages selftests")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
/!\ Speculative /!\

   This patch is based on analysis of the surrounding code and should be
   reviewed with care !

   If the patch is wrong, maybe a comment in the code could explain why.

/!\ Speculative /!\
---
 drivers/gpu/drm/i915/gem/selftests/huge_pages.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
index df6c9a84252c..6b9f6cf50bf6 100644
--- a/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
+++ b/drivers/gpu/drm/i915/gem/selftests/huge_pages.c
@@ -1246,8 +1246,10 @@ static int igt_write_huge(struct drm_i915_private *i915,
 	 * times in succession a possibility by enlarging the permutation array.
 	 */
 	order = i915_random_order(count * count, &prng);
-	if (!order)
-		return -ENOMEM;
+	if (!order) {
+		err = -ENOMEM;
+		goto out;
+	}
 
 	max_page_size = rounddown_pow_of_two(obj->mm.page_sizes.sg);
 	max = div_u64(max - size, max_page_size);
-- 
2.34.1

