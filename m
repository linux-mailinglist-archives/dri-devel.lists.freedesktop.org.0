Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F036C0D3E
	for <lists+dri-devel@lfdr.de>; Mon, 20 Mar 2023 10:27:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 508FF10E2B4;
	Mon, 20 Mar 2023 09:27:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1F210E2B4
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Mar 2023 09:27:37 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EAA26B80DB4;
 Mon, 20 Mar 2023 09:27:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35E2AC433EF;
 Mon, 20 Mar 2023 09:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1679304454;
 bh=QbPogjyr1BoUidcc0YCdJtl8E5N/xyZZT5EardkOkC8=;
 h=Subject:To:Cc:From:Date:From;
 b=TEhEeejQER+Pk6UCTSqh13XCVFEBGFhtLfRmg9WMemWSfw7xhFeg8PvU05lMXc+c5
 xS5P5JpSM45NIvF7agGyxSFRKUjJeYNnbCxc5yH9QTuVICFhz9IF8zqfHjm7DMuxBS
 sJdRlKT+BjiHfNMKlxgtJtrZXBPKVDH6tM23sLH4=
Subject: Patch "drm/ttm: Fix a NULL pointer dereference" has been added to the
 6.1-stable tree
To: Arunpravin.PaneerSelvam@amd.com, Felix.Kuehling@amd.com,
 Philip.Yang@amd.com, alexander.deucher@amd.com, anshuman.gupta@intel.com,
 christian.koenig@amd.com, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 matthew.auld@intel.com, nirmoy.das@intel.com, qiang.yu@amd.com,
 ray.huang@amd.com, thomas.hellstrom@linux.intel.com, tvrtko.ursulin@intel.com
From: <gregkh@linuxfoundation.org>
Date: Mon, 20 Mar 2023 10:26:26 +0100
Message-ID: <16793043867150@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/ttm: Fix a NULL pointer dereference

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-ttm-fix-a-null-pointer-dereference.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 9a9a8fe26751334b7739193a94eba741073b8a55 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Tue, 7 Mar 2023 15:46:15 +0100
Subject: drm/ttm: Fix a NULL pointer dereference
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 9a9a8fe26751334b7739193a94eba741073b8a55 upstream.

The LRU mechanism may look up a resource in the process of being removed
from an object. The locking rules here are a bit unclear but it looks
currently like res->bo assignment is protected by the LRU lock, whereas
bo->resource is protected by the object lock, while *clearing* of
bo->resource is also protected by the LRU lock. This means that if
we check that bo->resource points to the LRU resource under the LRU
lock we should be safe.
So perform that check before deciding to swap out a bo. That avoids
dereferencing a NULL bo->resource in ttm_bo_swapout().

Fixes: 6a9b02899402 ("drm/ttm: move the LRU into resource handling v4")
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: Philip Yang <Philip.Yang@amd.com>
Cc: Qiang Yu <qiang.yu@amd.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.19+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230307144621.10748-2-thomas.hellstrom@linux.intel.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/ttm/ttm_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index e7147e304637..b84f74807ca1 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -158,7 +158,7 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 			struct ttm_buffer_object *bo = res->bo;
 			uint32_t num_pages;
 
-			if (!bo)
+			if (!bo || bo->resource != res)
 				continue;
 
 			num_pages = PFN_UP(bo->base.size);
-- 
2.40.0



Patches currently in stable-queue which might be from thomas.hellstrom@linux.intel.com are

queue-6.1/drm-ttm-fix-a-null-pointer-dereference.patch
