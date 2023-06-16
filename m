Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 681BC732BD7
	for <lists+dri-devel@lfdr.de>; Fri, 16 Jun 2023 11:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 034B010E584;
	Fri, 16 Jun 2023 09:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B31EE10E0B7;
 Fri, 16 Jun 2023 09:32:07 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D61BE62134;
 Fri, 16 Jun 2023 09:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D6C7BC433C0;
 Fri, 16 Jun 2023 09:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686907925;
 bh=RyvbZ8xLNLVCEWUqE0qfmWc1Llk+X9g8qHjmNGYKLVM=;
 h=From:To:Cc:Subject:Date:From;
 b=aql41gS/+jx94TAWvh8KlZ36Fle4QLGqn4B5xNnEimBQx7Cd3FU9uPP7Q/YRQ12ot
 1AXM14STUqfR1eCiaTBhac+CKJXSwcBroJAVdoknmp5M2NHBhGE/SVVA7ykLMEGYHP
 HEyt50zxwBm8YNFGIcCJe+Mu26PCyZrRHm0spOjxcr3aOR1uLyy9tuh0nIJeCFlFIC
 NY1dTlUWtcNT9HZuKXS6xYKGaEqJedzVrRUWVtyo7M5EYvZAyYALT1vv+6UIp3g9gF
 7XP69Nce6j7JGcbwivO1adEkkUXZ/vkS5w3cylg65qOsU+V2Sfvb+3lNDOvDiMic2m
 gtSCeuughd6Hg==
From: Arnd Bergmann <arnd@kernel.org>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH] drm/i915: make i915_drm_client_fdinfo() reference conditional
 again
Date: Fri, 16 Jun 2023 11:31:47 +0200
Message-Id: <20230616093158.3568480-1-arnd@kernel.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Matt Roper <matthew.d.roper@intel.com>,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Arnd Bergmann <arnd@arndb.de>

The function is only defined if CONFIG_PROC_FS is enabled:

ld.lld: error: undefined symbol: i915_drm_client_fdinfo
>>> referenced by i915_driver.c
>>>               drivers/gpu/drm/i915/i915_driver.o:(i915_drm_driver) in archive vmlinux.a

Use the PTR_IF() helper to make the reference NULL otherwise.

Fixes: e894b724c316d ("drm/i915: Use the fdinfo helper")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/i915/i915_driver.c     | 2 +-
 drivers/gpu/drm/i915/i915_drm_client.h | 2 --
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 75cbc43b326dd..0ad0c5885ec27 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1816,7 +1816,7 @@ static const struct drm_driver i915_drm_driver = {
 	.open = i915_driver_open,
 	.lastclose = i915_driver_lastclose,
 	.postclose = i915_driver_postclose,
-	.show_fdinfo = i915_drm_client_fdinfo,
+	.show_fdinfo = PTR_IF(IS_ENABLED(CONFIG_PROC_FS), i915_drm_client_fdinfo),
 
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
index 4c18b99e10a4e..67816c912bca1 100644
--- a/drivers/gpu/drm/i915/i915_drm_client.h
+++ b/drivers/gpu/drm/i915/i915_drm_client.h
@@ -47,8 +47,6 @@ static inline void i915_drm_client_put(struct i915_drm_client *client)
 
 struct i915_drm_client *i915_drm_client_alloc(void);
 
-#ifdef CONFIG_PROC_FS
 void i915_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file);
-#endif
 
 #endif /* !__I915_DRM_CLIENT_H__ */
-- 
2.39.2

