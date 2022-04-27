Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E82C51256C
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 00:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B59710F722;
	Wed, 27 Apr 2022 22:44:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BFC410F74C;
 Wed, 27 Apr 2022 22:44:12 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4D806B82708;
 Wed, 27 Apr 2022 22:44:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F29B5C385AA;
 Wed, 27 Apr 2022 22:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651099449;
 bh=OeoXLpSjFFW6YXYpM+6X1nCwuoz/C5wuMa1J1bJYg/o=;
 h=Date:From:To:Cc:Subject:From;
 b=mZYO1TnlG1jhH6wwXv7uGnA2tmATzmBfcvQCkMPaaVVojbu0+4O11HvMgieSLnNBn
 HnBBftQJkegNqvIOJUYFoWDLGkphWjYeC3WQLhPxgzZL0v31oYwCTaIrdVZyGHqJbk
 gJFYxMNz2uAuUDyX3oaBo0n12t/eCT9bZoishwc++Nj+ah4IKroF4rp6UbUlY4sZb8
 7RAiCxJR7ZmvO0n7II3qcrjSRnPb7mWxpeDBwrerc8qIXHzgXmKXNBldulrRKEO3zO
 aaqGKJ8IcGX+Id2sF+ARH6ByQ3V2ZHjk+tJQAqBGaC9eRs5OZ6NEfnrYyu9frrF7kB
 ufYknbLSKYW+A==
Date: Wed, 27 Apr 2022 17:53:01 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH][next] drm/i915: Fix -Wstringop-overflow warning in call to
 intel_read_wm_latency()
Message-ID: <20220427225301.GA24406@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: intel-gfx@lists.freedesktop.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following -Wstringop-overflow warnings when building with GCC-11:

drivers/gpu/drm/i915/intel_pm.c:3106:9: warning: ‘intel_read_wm_latency’ accessing 16 bytes in a region of size 10 [-Wstringop-overflow=]
 3106 |         intel_read_wm_latency(dev_priv, dev_priv->wm.pri_latency);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/gpu/drm/i915/intel_pm.c:3106:9: note: referencing argument 2 of type ‘u16 *’ {aka ‘short unsigned int *’}
drivers/gpu/drm/i915/intel_pm.c:2861:13: note: in a call to function ‘intel_read_wm_latency’
 2861 | static void intel_read_wm_latency(struct drm_i915_private *dev_priv,
      |             ^~~~~~~~~~~~~~~~~~~~~

by removing the over-specified array size from the argument declarations.

It seems that this code is actually safe because the size of the
array depends on the hardware generation, and the function checks
for that.

This helps with the ongoing efforts to globally enable
-Wstringop-overflow.

Link: https://github.com/KSPP/linux/issues/181
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/gpu/drm/i915/intel_pm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_pm.c b/drivers/gpu/drm/i915/intel_pm.c
index ee0047fdc95d..5735915facc5 100644
--- a/drivers/gpu/drm/i915/intel_pm.c
+++ b/drivers/gpu/drm/i915/intel_pm.c
@@ -2862,7 +2862,7 @@ static void ilk_compute_wm_level(const struct drm_i915_private *dev_priv,
 }
 
 static void intel_read_wm_latency(struct drm_i915_private *dev_priv,
-				  u16 wm[8])
+				  u16 wm[])
 {
 	struct intel_uncore *uncore = &dev_priv->uncore;
 
-- 
2.27.0

