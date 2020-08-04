Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9EE623B2ED
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 04:57:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B023E6E3A8;
	Tue,  4 Aug 2020 02:57:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D21B06E3AA
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 02:57:27 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-V6zM3gGDObaSMbvkv-94WA-1; Mon, 03 Aug 2020 22:57:22 -0400
X-MC-Unique: V6zM3gGDObaSMbvkv-94WA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 798AE91270;
 Tue,  4 Aug 2020 02:57:21 +0000 (UTC)
Received: from tyrion-bne-redhat-com.redhat.com (vpn2-54-17.bne.redhat.com
 [10.64.54.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC29A90E76;
 Tue,  4 Aug 2020 02:57:19 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 16/59] drm/radeon: use new ttm man init path
Date: Tue,  4 Aug 2020 12:55:49 +1000
Message-Id: <20200804025632.3868079-17-airlied@gmail.com>
In-Reply-To: <20200804025632.3868079-1-airlied@gmail.com>
References: <20200804025632.3868079-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: gmail.com
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
Cc: sroland@vmware.com, christian.koenig@amd.com,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Dave Airlie <airlied@redhat.com>

Use the new common manager init path.

Signed-off-by: Dave Airlie <airlied@redhat.com>
---
 drivers/gpu/drm/radeon/radeon_ttm.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 0b07d8ed6edd..84c02b4529c0 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -70,19 +70,17 @@ static int radeon_ttm_init_vram(struct radeon_device *rdev)
 {
 	struct ttm_mem_type_manager *man = &rdev->mman.bdev.man[TTM_PL_VRAM];
 
-	man->func = &ttm_bo_manager_func;
 	man->available_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
 	man->default_caching = TTM_PL_FLAG_WC;
 
-	return ttm_bo_init_mm(&rdev->mman.bdev, TTM_PL_VRAM,
-			      rdev->mc.real_vram_size >> PAGE_SHIFT);
+	return ttm_range_man_init(&rdev->mman.bdev, man,
+				  rdev->mc.real_vram_size >> PAGE_SHIFT);
 }
 
 static int radeon_ttm_init_gtt(struct radeon_device *rdev)
 {
 	struct ttm_mem_type_manager *man = &rdev->mman.bdev.man[TTM_PL_TT];
 
-	man->func = &ttm_bo_manager_func;
 	man->available_caching = TTM_PL_MASK_CACHING;
 	man->default_caching = TTM_PL_FLAG_CACHED;
 	man->use_tt = true;
@@ -98,8 +96,8 @@ static int radeon_ttm_init_gtt(struct radeon_device *rdev)
 	}
 #endif
 
-	return ttm_bo_init_mm(&rdev->mman.bdev, TTM_PL_TT,
-			      rdev->mc.gtt_size >> PAGE_SHIFT);
+	return ttm_range_man_init(&rdev->mman.bdev, man,
+				  rdev->mc.gtt_size >> PAGE_SHIFT);
 }
 
 static void radeon_evict_flags(struct ttm_buffer_object *bo,
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
