Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B61891F0F
	for <lists+dri-devel@lfdr.de>; Fri, 29 Mar 2024 15:57:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5124B112759;
	Fri, 29 Mar 2024 14:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P0LO53W+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA8510E1FC;
 Fri, 29 Mar 2024 14:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1711724260; x=1743260260;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tcQ4DWII7a5vFVqrDp1AZ/G+iqHwm15Ml6TIhcKLkTk=;
 b=P0LO53W+CDd4YkI4SarBiwXeK3U+twusFEVMGu5c2T7Wfk94H+6lrpLe
 J2iQ6bFDGH3eZ7k/LjomCc/ODO0n2wcskPmkqbv4naskvDrY2iivA8Rs7
 etVihk5LwiKsq+7wI9gV63UkQWocUfB05iE9Tlgb7uMtEhnx+whDsZh55
 8wXaHox0F7xCg+f3C1TpEgnyDfJdxX/1oPUOG1AfVsYPnx3jnYw8yTXs9
 GWjJR40ojok8/2fH1POdkdKuvGD5PmR0sL1k5+2jy9yuJrSQ0ZP/Hbn5B
 otpESndabrM9vNnQKYebB7QgMheXnJbMT4w4iBggCqJ2u6fA45FYisV0q w==;
X-CSE-ConnectionGUID: jPCJeqFzRy62FlAIWJ8mQg==
X-CSE-MsgGUID: ZUgWRXfUQ1C3afKvoqB6ug==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="7023681"
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; 
   d="scan'208";a="7023681"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 07:57:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,165,1708416000"; d="scan'208";a="47962419"
Received: from satiarax-mobl1.gar.corp.intel.com (HELO fedora..)
 ([10.249.254.13])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2024 07:57:28 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 4/8] drm/ttm: Allow continued swapout after -ENOSPC falure
Date: Fri, 29 Mar 2024 15:57:03 +0100
Message-ID: <20240329145707.3087-5-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329145707.3087-1-thomas.hellstrom@linux.intel.com>
References: <20240329145707.3087-1-thomas.hellstrom@linux.intel.com>
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

