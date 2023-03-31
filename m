Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9200A6D1C3A
	for <lists+dri-devel@lfdr.de>; Fri, 31 Mar 2023 11:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAFF410F189;
	Fri, 31 Mar 2023 09:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2E0B10F18A;
 Fri, 31 Mar 2023 09:27:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5D399B82DBD;
 Fri, 31 Mar 2023 09:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D8DDC4339C;
 Fri, 31 Mar 2023 09:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680254823;
 bh=XRTu35ZdFafbPJyWFWpW6/BJvUu4jTdjrS1uNGlsFd4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gCzBoIumvl2CYBRlyFq0DAw31z7YCmbHwo/1nXRhYpAR9r3721pGR3X8lSHIVlT+Q
 PlW/pCxm58t52C9YDeusnUX4HToQQJ7kJvpEBw32CSFfZWkNSXRj8rwzYYasASxQm1
 4BO2ZiwuRCUQokL+TPMUkXBR9s8K2NNZkGN61QKRxkR1niK09Q1ZF2BJTieRwQ7JMW
 EpJxnksA6/iaXiIoszEovLASYgnySjbS0tITJamYXbWno99Ikdhx1qK86kbpgtY/Rs
 YsJW6eZoxFn0o5KXVXXi9U5ESc4Z3jFz9wxWwuj1tRs+GQql8DXFNW0t4XtWVVH5Bl
 Mz+bXgqZB9tHA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org
Subject: [PATCH 17/19] drm/i915/display/intel_display_power: Fix incorrectly
 documented function __intel_display_power_put_async()
Date: Fri, 31 Mar 2023 10:26:05 +0100
Message-Id: <20230331092607.700644-18-lee@kernel.org>
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
In-Reply-To: <20230331092607.700644-1-lee@kernel.org>
References: <20230331092607.700644-1-lee@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/i915/display/intel_display_power.c:712: warning: expecting prototype for intel_display_power_put_async(). Prototype was for __intel_display_power_put_async() instead

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Imre Deak <imre.deak@intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/gpu/drm/i915/display/intel_display_power.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display_power.c b/drivers/gpu/drm/i915/display/intel_display_power.c
index f86060195987c..7d1e492b6bfb5 100644
--- a/drivers/gpu/drm/i915/display/intel_display_power.c
+++ b/drivers/gpu/drm/i915/display/intel_display_power.c
@@ -697,7 +697,7 @@ intel_display_power_put_async_work(struct work_struct *work)
 }
 
 /**
- * intel_display_power_put_async - release a power domain reference asynchronously
+ * __intel_display_power_put_async - release a power domain reference asynchronously
  * @i915: i915 device instance
  * @domain: power domain to reference
  * @wakeref: wakeref acquired for the reference that is being released
-- 
2.40.0.348.gf938b09366-goog

