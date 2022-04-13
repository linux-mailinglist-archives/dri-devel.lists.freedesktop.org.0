Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1774FF1B1
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 10:21:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3C7E10FBE7;
	Wed, 13 Apr 2022 08:21:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F46A10FBE6;
 Wed, 13 Apr 2022 08:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649838107; x=1681374107;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=U69oTtnsuoF+2HIaIybh2b28ZIsOKec9noRM9rQWa2U=;
 b=Hd2lMZOjkAbBENGZPd2hgBBoBXl0uBoOnvnelxoJJOsTZ5s1J9sJK+Dd
 Cjh+WS53+HmbpVpFVG3gEEdxrWDW4A32KIq02G/nVqfkaTgie07wu5vzl
 aPGGyE5mLkd50/l988npTTa2tVJM4evlCZATzDD5Z5e5GKX/BmIWESDRh
 jD5LQay6onsbb9xx2J1zUIW+Z5EhUgj7zsqi5ogbL+J/XjGDCFNy7p3px
 sxdtaFSrBXQoVzvGPSght0NrTnumnHmXjtz40/UsD/QIIexNQPliELuId
 j3Ml2g40lWtgmXqQwJmqPskfftdnvYXpFp6H+MnEFDh5qp7WXaQq0QW5n A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="325512932"
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; d="scan'208";a="325512932"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 01:21:46 -0700
X-IronPort-AV: E=Sophos;i="5.90,256,1643702400"; d="scan'208";a="573170394"
Received: from jomolloy-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.23.209])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2022 01:21:45 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/ttm: fixup ttm_bo_add_move_fence
Date: Wed, 13 Apr 2022 09:21:33 +0100
Message-Id: <20220413082133.272445-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It looks like we still need to call dma_fence_put() on the man->move,
otherwise we just end up leaking it, leading to fireworks later.

Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5689
Fixes: 8bb31587820a ("drm/ttm: remove bo->moving")
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index 015a94f766de..b15b77e10383 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -744,6 +744,8 @@ static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
 		dma_fence_put(fence);
 		return ret;
 	}
+
+	dma_fence_put(fence);
 	return 0;
 }
 
-- 
2.34.1

