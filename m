Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C3DBA72DF8
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 11:43:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2A910E2CB;
	Thu, 27 Mar 2025 10:43:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="WA0CCfH7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23B5510E304
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 10:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1743072185;
 bh=fcmsPDvyJrFK4GUPYEu4wM1ttExq41wVLVPQCTwACik=;
 h=From:To:Cc:Subject:Date:From;
 b=WA0CCfH7DtO+ACcYEAQYg6cSNl55At5hLVZO9+vTTYfN1T3OoVz200sf0NJQVdMvj
 Js8ZjKdR2vK6sH6dZ2kHkX9ndi9Q1FfVl1M7wKf+ZWMzk7PxC2hznrje2db9zekY8x
 5cYG+F//En3SpKXDac6JcEhL5sEcLyeChuV7ykw2MAHjQVMZwTWcYFy1d3FhO/GYg3
 +zRJezySXUC3y7XXQGLl2QInTi/yglhkk9mia/vpZAoyqgySZH8DOw4L2JWqHqlOKF
 BH6+3pjmLhU9lbvRZSnHjQRTEzp4CiMn3EdUMmVRW4iAiq6GBs3daIaUevsNQpkXu8
 kGWhWadJ3AlMg==
Received: from localhost.localdomain (unknown
 [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 52BB017E0A5F;
 Thu, 27 Mar 2025 11:43:05 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Maciej Falkowski <maciej.falkowski@linux.intel.com>,
 Oded Gabbay <ogabbay@kernel.org>
Subject: [PATCH 1/3] accel/ivpu: pages_use_count is now a refcount_t
Date: Thu, 27 Mar 2025 11:42:58 +0100
Message-ID: <20250327104300.1982058-1-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.48.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit 051b6646d36d ("drm/shmem-helper: Use refcount_t for
pages_use_count") changed the type of
drm_gem_shmem_object::pages_use_count but accel drivers were left
behind.

Fixes: 051b6646d36d ("drm/shmem-helper: Use refcount_t for pages_use_count")
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Cc: Maciej Falkowski <maciej.falkowski@linux.intel.com>
Cc: Oded Gabbay <ogabbay@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/accel/ivpu/ivpu_gem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index 8741c73b92ce..09c9c5256af5 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -282,7 +282,7 @@ static void ivpu_gem_bo_free(struct drm_gem_object *obj)
 	ivpu_bo_unbind_locked(bo);
 	mutex_destroy(&bo->lock);
 
-	drm_WARN_ON(obj->dev, bo->base.pages_use_count > 1);
+	drm_WARN_ON(obj->dev, refcount_read(&bo->base.pages_use_count) > 1);
 	drm_gem_shmem_free(&bo->base);
 }
 
-- 
2.48.1

