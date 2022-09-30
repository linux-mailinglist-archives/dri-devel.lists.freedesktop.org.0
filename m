Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8769C5F0F24
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 17:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E48A810ED66;
	Fri, 30 Sep 2022 15:42:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0A5A10ED63;
 Fri, 30 Sep 2022 15:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664552541; x=1696088541;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nIcncyGkzAFU5EaPSD+Vi95qDGxy7a548QZ9hHeem30=;
 b=kTdK3i8kbqkHwTa1ne9NTldfwQuGFB0M4pzQRwdbzPiVoMwF1GPUmVua
 Wk5xe3mSX7v3GH67IjYjOmXaHqxd1VZ5XMJw7TSyFQ78XYS+bYdoPyQhH
 xad7iGe16B75aiK0sA4E9Y9tLHDwWp+RFl5iUD55OMjyZyXYjfc2VDqyg
 hwz21eXNv3cVlwT/nbL+KsDCeumn01p/iqu7FcpHeF1ywOa7zwMFq2jLC
 aQGJlkoN0hAy4r9ZK14+/VSxghrNjD98tWTrYoUM6+ntyBbQ8gTAVnhVN
 kBVKKXvXehmRo5HuOAlohkx4l73vaok9zMZUa91NBS9NUMy3VGhpqbQKW A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="282583549"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="282583549"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 08:42:21 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10486"; a="711835709"
X-IronPort-AV: E=Sophos;i="5.93,358,1654585200"; d="scan'208";a="711835709"
Received: from dtrawins-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.7.39])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2022 08:42:20 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/ttm: move bo->resource check in vm_access
Date: Fri, 30 Sep 2022 16:39:57 +0100
Message-Id: <20220930153957.416938-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.37.3
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Touching bo->resource looks like it should require first locking the
object, since this state is dynamic and could potentially change from
under us.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_vm.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
index 38119311284d..8a0de14d8c85 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
@@ -412,13 +412,15 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 		 << PAGE_SHIFT);
 	int ret;
 
-	if (len < 1 || (offset + len) >> PAGE_SHIFT > bo->resource->num_pages)
-		return -EIO;
-
 	ret = ttm_bo_reserve(bo, true, false, NULL);
 	if (ret)
 		return ret;
 
+	if (len < 1 || (offset + len) >> PAGE_SHIFT > bo->resource->num_pages) {
+		ret = -EIO;
+		goto out_reserve;
+	}
+
 	switch (bo->resource->mem_type) {
 	case TTM_PL_SYSTEM:
 		fallthrough;
@@ -433,6 +435,7 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
 			ret = -EIO;
 	}
 
+out_reserve:
 	ttm_bo_unreserve(bo);
 
 	return ret;
-- 
2.37.3

