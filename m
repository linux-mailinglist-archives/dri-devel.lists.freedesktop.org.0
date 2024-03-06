Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62712872F29
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 08:01:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F7F5112F77;
	Wed,  6 Mar 2024 07:01:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aINIoHSf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228CA112F6E;
 Wed,  6 Mar 2024 07:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709708507; x=1741244507;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tcQ4DWII7a5vFVqrDp1AZ/G+iqHwm15Ml6TIhcKLkTk=;
 b=aINIoHSfutauqQWYbibWOaFr8SU90jsyPV/XOH8eUXyp3rsfWYXpNB/8
 Z8byZt/F7UuDdBQUCLDqq8KvXM4w0E5ilprQ8i0iu3bAosPVSUg4W5qsI
 GPwA0ZkmZD4r23V5vId+p0Gh5diOaUgW3EHO5wVhA53/bxIdTq85ZiyIS
 4cllldPlCUOoM7pPz4XFciEmAllY+RIx2cy6KM96Yly7w0Fv5UpwEgXkv
 iyc71Oyqytvk5i5/1OHOiraDnik3DiBg8L0ZchV/oT+J1dRwbKhCxRrbE
 ZBmBDLT5Y8mgpxoZrLKiynCkktE1YEAafVeiZJ6v34+JVb9QWRH3H0hVg A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4457482"
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; 
   d="scan'208";a="4457482"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 23:01:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,207,1705392000"; d="scan'208";a="14314407"
Received: from fatinf5x-mobl.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.40])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2024 23:01:45 -0800
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v4 4/4] drm/ttm: Allow continued swapout after -ENOSPC falure
Date: Wed,  6 Mar 2024 08:01:25 +0100
Message-ID: <20240306070125.27071-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240306070125.27071-1-thomas.hellstrom@linux.intel.com>
References: <20240306070125.27071-1-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

The -ENOSPC failure from ttm_bo_swapout() meant that the lru_lock
was dropped and simply restarting the iteration meant we'd likely
hit the same error again on the same resource. Now that we can
restart the iteration even if the lock was dropped, do that.

Cc: Christian König <christian.koenig@amd.com>
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
Cc: <dri-devel@lists.freedesktop.org>
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_device.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index e8a6a1dab669..4a030b4bc848 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -168,15 +168,20 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
 
 			num_pages = PFN_UP(bo->base.size);
 			ret = ttm_bo_swapout(bo, ctx, gfp_flags);
-			/* ttm_bo_swapout has dropped the lru_lock */
-			if (!ret) {
-				ttm_resource_cursor_fini(&cursor);
-				return num_pages;
-			}
-			if (ret != -EBUSY) {
-				ttm_resource_cursor_fini(&cursor);
-				return ret;
+			/* Couldn't swap out, and retained the lru_lock */
+			if (ret == -EBUSY)
+				continue;
+			/* Couldn't swap out and dropped the lru_lock */
+			if (ret == -ENOSPC) {
+				spin_lock(&bdev->lru_lock);
+				continue;
 			}
+			/*
+			 * Dropped the lock and either succeeded or
+			 * hit an error that forces us to break.
+			 */
+			ttm_resource_cursor_fini(&cursor);
+			return ret ? ret : num_pages;
 		}
 	}
 	ttm_resource_cursor_fini_locked(&cursor);
-- 
2.44.0

