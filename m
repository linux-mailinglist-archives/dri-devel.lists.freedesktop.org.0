Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B5D72C4AE
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 14:44:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D3D10E223;
	Mon, 12 Jun 2023 12:44:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E88810E223;
 Mon, 12 Jun 2023 12:44:16 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6C32561447;
 Mon, 12 Jun 2023 12:44:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62198C433EF;
 Mon, 12 Jun 2023 12:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686573854;
 bh=gq5hRxWovnLtF31u4zc0XX1gnCt36dRWdFL6GhVRm1Y=;
 h=From:To:Cc:Subject:Date:From;
 b=aNZ6vU+zqRHWZ7v5rU9caKOXoKFrLPpnXcJFL7SjBButK5TfSon8w7qd0ZGp3yPsX
 EI2aVc23QU7o5UMTofxC4fGvGweV9D6QVN3tE084zyRWCdedehtmIrGLbT0VoKpqdw
 BT5zR5FmOIvCn1GZl8eJESDk4BGo0K/dPVAQHhF3a0XxsP8kX962PEjdsRaf+Dn6S6
 syUv+UxCqUM8TTY2vYE8wjvhxTtSHo356wst1ETPwgdjxwxXSpbs8BzigsIqWGMteP
 dB4wSGS686NpkLtVIG7xL2SsTi2m3BtYsQxqmS+4eOCxf6HmMm0b6OSVoD/mQr+iS1
 WWdWTKzRDvpCQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/i915/gmch: avoid unused variable warning
Date: Mon, 12 Jun 2023 14:43:59 +0200
Message-Id: <20230612124408.521325-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
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
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

When CONFIG_PNP is disabled, the mchbar_addr variable is only written but
not read:

drivers/gpu/drm/i915/soc/intel_gmch.c: In function 'intel_alloc_mchbar_resource':
drivers/gpu/drm/i915/soc/intel_gmch.c:41:13: error: variable 'mchbar_addr' set but not used [-Werror=unused-but-set-variable]
   41 |         u64 mchbar_addr;
      |             ^~~~~~~~~~~

No idea why this showed up now, but it's easy to fix by changing the #ifdef to
an IS_ENABLED() check that the compiler can see through.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I saw this last week already, so it's likely that someone else already sent
a fix for it.

 drivers/gpu/drm/i915/soc/intel_gmch.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/soc/intel_gmch.c b/drivers/gpu/drm/i915/soc/intel_gmch.c
index 6d0204942f7a5..49c7fb16e934f 100644
--- a/drivers/gpu/drm/i915/soc/intel_gmch.c
+++ b/drivers/gpu/drm/i915/soc/intel_gmch.c
@@ -47,11 +47,9 @@ intel_alloc_mchbar_resource(struct drm_i915_private *i915)
 	mchbar_addr = ((u64)temp_hi << 32) | temp_lo;
 
 	/* If ACPI doesn't have it, assume we need to allocate it ourselves */
-#ifdef CONFIG_PNP
-	if (mchbar_addr &&
+	if (IS_ENABLED(CONFIG_PNP) && mchbar_addr &&
 	    pnp_range_reserved(mchbar_addr, mchbar_addr + MCHBAR_SIZE))
 		return 0;
-#endif
 
 	/* Get some space for it */
 	i915->gmch.mch_res.name = "i915 MCHBAR";
-- 
2.39.2

