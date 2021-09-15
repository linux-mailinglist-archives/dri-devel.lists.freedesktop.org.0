Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8206F40C343
	for <lists+dri-devel@lfdr.de>; Wed, 15 Sep 2021 12:05:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 356A16E8F3;
	Wed, 15 Sep 2021 10:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77BBE6E8F3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Sep 2021 10:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=H02mAIocDVlt1y29wV21JNgw3jYmwGMhTDSYDOZrTw4=; 
 b=DHv/FK4Md1PSo9UCbeDSuV0qG+7IYC8lxUaUxpTQ5enorO5+w/WF21LqFZG2G1RgD3f7MVlhfZUYxQ+6CNziBIrmkH2ZEtIendlbN0cywBQbuzfrKRMh/+SVmY/hjlFYLOqQJ/k5BNT/ukmPMEvDkcibVx1hKec2Z+EgSxfemGhRCdNrc9LuTtXesRI/C7PhJJHwrVMbhmH32/lx8vC+/24rmYlvYygNehdjCJTW0ghOiiIqq+xjuYn3bNV4Z0iOHE+vkFOZQCZA8ZOBPIDOeh3xPLOF/8xZb+gWNlrj9QYUtDhSzJMPntas3q/z45L3SVVyRWslxSC+T0av/jqHXQ==;
Received: from 191.49.165.83.dynamic.reverse-mundo-r.com ([83.165.49.191]
 helo=zeus.mundo-R.com) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1mQRn3-00033P-QF; Wed, 15 Sep 2021 12:05:17 +0200
From: Iago Toral Quiroga <itoral@igalia.com>
To: dri-devel@lists.freedesktop.org
Cc: mwen@igalia.com
Subject: [PATCH v2] drm/v3d: fix wait for TMU write combiner flush
Date: Wed, 15 Sep 2021 12:05:07 +0200
Message-Id: <20210915100507.3945-1-itoral@igalia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210915085707.7ph5sx4nnetb2mbn@mail.igalia.com>
References: <20210915085707.7ph5sx4nnetb2mbn@mail.igalia.com>
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

The hardware sets the TMUWCF bit back to 0 when the TMU write
combiner flush completes so we should be checking for that instead
of the L2TFLS bit.

v2 (Melissa Wen):
  - Add Signed-off-by and Fixes tags.
  - Change the error message for the timeout to be more clear.

Fixes spurious Vulkan CTS failures in:
dEQP-VK.binding_model.descriptorset_random.*

Fixes: d223f98f02099 ("drm/v3d: Add support for compute shader dispatch")
Signed-off-by: Iago Toral Quiroga <itoral@igalia.com>
Reviewed-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_gem.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
index a3529809d547..1953706bdaeb 100644
--- a/drivers/gpu/drm/v3d/v3d_gem.c
+++ b/drivers/gpu/drm/v3d/v3d_gem.c
@@ -197,8 +197,8 @@ v3d_clean_caches(struct v3d_dev *v3d)
 
 	V3D_CORE_WRITE(core, V3D_CTL_L2TCACTL, V3D_L2TCACTL_TMUWCF);
 	if (wait_for(!(V3D_CORE_READ(core, V3D_CTL_L2TCACTL) &
-		       V3D_L2TCACTL_L2TFLS), 100)) {
-		DRM_ERROR("Timeout waiting for L1T write combiner flush\n");
+		       V3D_L2TCACTL_TMUWCF), 100)) {
+		DRM_ERROR("Timeout waiting for TMU write combiner flush\n");
 	}
 
 	mutex_lock(&v3d->cache_clean_lock);
-- 
2.25.1

