Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D217AC6D10
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 17:43:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 059EB10E66A;
	Wed, 28 May 2025 15:43:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dweNF/36";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC2B10E66A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 15:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748446992; x=1779982992;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LT5sZcgWanipbC74Xj2ValyaujbUYodZaj1yLXjvPK0=;
 b=dweNF/36t+DppU1C8cZZlJ1yaRJz3hOJ98xCmg4GIlI907jWdJH2quXq
 IcebtND6Z4ghGDRKcPPAM56m+InW9LhKtIKua3o+WGiRHjKDRdJ900E7s
 HdsrsiLJzTqnNz/oIQEJC8QmdgZ9em8AtcykaumbG8hhGDbXViyhgBbvg
 FbwsbtxLrDKCUr+pejgM4Te+wuxTOjmkvDTyupz/JypC7hZijqWwTSP45
 zuGZ8yemVlFd4qb/zf9oi7jw66oeKyj9bMWM0PyO8kqWuTN2U9QpKuKHj
 41hMm8nCCEb89LA6oyWb2ernyKig9v3+rgaSgHNdwJjKsDYRCLETiU/kX A==;
X-CSE-ConnectionGUID: swHhLxiqTYaCpmYaqzLyIg==
X-CSE-MsgGUID: kEnqCfYYRbCg7wLkWKRG4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="38105658"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="38105658"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 08:43:11 -0700
X-CSE-ConnectionGUID: 8BF1fk8GRz+JTiNwBoudOQ==
X-CSE-MsgGUID: ZGfro0/UQr64SyryR9dtzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; d="scan'208";a="148409607"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2025 08:42:27 -0700
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jeff.hugo@oss.qualcomm.com, lizhi.hou@amd.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 stable@vger.kernel.org
Subject: [PATCH] accel/ivpu: Fix warning in ivpu_gem_bo_free()
Date: Wed, 28 May 2025 17:42:25 +0200
Message-ID: <20250528154225.500394-1-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.45.1
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

Don't WARN if imported buffers are in use in ivpu_gem_bo_free() as they
can be indeed used in the original context/driver.

Fixes: 647371a6609d ("accel/ivpu: Add GEM buffer object management")
Cc: <stable@vger.kernel.org> # v6.3
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_gem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index 5908268ca45e9..0371a8b4a474f 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -285,7 +285,8 @@ static void ivpu_gem_bo_free(struct drm_gem_object *obj)
 	list_del(&bo->bo_list_node);
 	mutex_unlock(&vdev->bo_list_lock);
 
-	drm_WARN_ON(&vdev->drm, !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_READ));
+	drm_WARN_ON(&vdev->drm, !bo->base.base.import_attach &&
+		    !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_READ));
 	drm_WARN_ON(&vdev->drm, ivpu_bo_size(bo) == 0);
 	drm_WARN_ON(&vdev->drm, bo->base.vaddr);
 
-- 
2.45.1

