Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D65264376
	for <lists+dri-devel@lfdr.de>; Thu, 10 Sep 2020 12:14:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0126E8EC;
	Thu, 10 Sep 2020 10:14:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27AB46E8EC;
 Thu, 10 Sep 2020 10:14:52 +0000 (UTC)
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AD94321556;
 Thu, 10 Sep 2020 10:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599732891;
 bh=AcUbWjUNABtsxL784pj65r84bPoExG1gWe7wAJecyfQ=;
 h=Date:From:To:Cc:Subject:From;
 b=qVf8Rc8AqGxyxVKw4/gDV9LstyBxSyBmcuGudVr7FlLI/lyuwQOLYen1OarGXTy6O
 S2J5ptH/XTuXwqPaNYGmTjAhonpEwLAHD0Xok6FNUA+cqRtCTTGHF9jMdvMr9NYRBy
 9XqcLvm2eqp5zVZqKKlIT0MKhMUc20/LehslBQGc=
Date: Thu, 10 Sep 2020 05:21:20 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@intel.com>
Subject: [PATCH][next] drm/i915: Fix inconsistent IS_ERR and PTR_ERR
Message-ID: <20200910102120.GA9481@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
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
 dri-devel@lists.freedesktop.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix inconsistent IS_ERR and PTR_ERR in i915_gem_object_copy_blt().

The proper pointer to be passed as argument to PTR_ERR() is vma[1].

This bug was detected with the help of Coccinelle.

Fixes: 6b05030496f7 ("drm/i915: Convert i915_gem_object/client_blt.c to use ww locking as well, v2.")
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/gpu/drm/i915/gem/i915_gem_object_blt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c b/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c
index d93eb36160c9..aee7ad3cc3c6 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_object_blt.c
@@ -364,7 +364,7 @@ int i915_gem_object_copy_blt(struct drm_i915_gem_object *src,
 
 	vma[1] = i915_vma_instance(dst, vm, NULL);
 	if (IS_ERR(vma[1]))
-		return PTR_ERR(vma);
+		return PTR_ERR(vma[1]);
 
 	i915_gem_ww_ctx_init(&ww, true);
 	intel_engine_pm_get(ce->engine);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
