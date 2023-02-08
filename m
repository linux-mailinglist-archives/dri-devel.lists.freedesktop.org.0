Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C35C68F175
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 15:57:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDC2910E7B2;
	Wed,  8 Feb 2023 14:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3BB10E7B0;
 Wed,  8 Feb 2023 14:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1675868245; x=1707404245;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uV7AgTbrch/Eu7LxtX7piER6N6FgL/dvdUlPwqpriz0=;
 b=IqAgXwVtJIwpCdvv6s84vAZxUbU+FFGBx6YpekR+UbsIGOnGCVE2PO9B
 tojRLEnUQALkBE2jjUGMe4WW7kElM4lNGmLXTwpnD8xcK5WokdhxC1qSq
 9OEmttkF2m/hjVHj6Kkkok70ymehu4+PcmQ0S+YkWQrZk1JgNRTSD+56I
 MOYd2I7qR/RaJ43e1r0y8SW+P7VfMXRg39hXBZhOI7z4Wknt7UEsgjL/u
 UtrX4igatqUAk0VzFsJu86ZBWhfQy37GpD/mzmwW4JNwdbU5vhfvuUtjn
 cUo/sCykg35B2SLoaUew+UszJKS5W2+M+UFglIWqDXrEggqHqhvirZ0VE A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="328469205"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="328469205"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2023 06:57:25 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="617233452"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; d="scan'208";a="617233452"
Received: from hassanka-mobl1.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.31.252])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2023 06:57:24 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/4] drm/radeon: handle NULL bo->resource in move callback
Date: Wed,  8 Feb 2023 14:53:19 +0000
Message-Id: <20230208145319.397235-4-matthew.auld@intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208145319.397235-1-matthew.auld@intel.com>
References: <20230208145319.397235-1-matthew.auld@intel.com>
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

The ttm bo now initially has NULL bo->resource, and leaves the driver
the handle that. However it looks like we forgot to handle that for
radeon.  It looks like this will just null-ptr-deref in
radeon_bo_move(), if bo->resource is NULL.

Fix this by calling move_null().

Fixes: 180253782038 ("drm/ttm: stop allocating dummy resources during BO creation")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/radeon/radeon_ttm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 67075c85f847..2220cdf6a3f6 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -213,7 +213,8 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
 
 	rbo = container_of(bo, struct radeon_bo, tbo);
 	rdev = radeon_get_rdev(bo->bdev);
-	if (old_mem->mem_type == TTM_PL_SYSTEM && bo->ttm == NULL) {
+	if (!old_mem || (old_mem->mem_type == TTM_PL_SYSTEM &&
+			 bo->ttm == NULL)) {
 		ttm_bo_move_null(bo, new_mem);
 		goto out;
 	}
-- 
2.39.1

