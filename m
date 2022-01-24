Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D017497713
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 02:54:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B9E210E5E9;
	Mon, 24 Jan 2022 01:54:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B96B510E27C;
 Mon, 24 Jan 2022 01:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642989254; x=1674525254;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KXyxgwUM4bkXvDM+XyNRIjGv+8i1m09MysFfC7KN7A8=;
 b=Z5Pco8GtxyNqDKHUduC4Y5R1leAPoQimDF9hc5zhPoj+FVuA0vh1wmDh
 pZ+VoB9cvt5zLgNojaVNON8cnUhXY9liwJ8RvZzYHeUjDxHzKIV1gVd8H
 Bxgx43wjXXq22Vt1ReBrG/PxC844XN5EWBK+dJNs46gCLP4LBB8WV1AKT
 TjFX2etnIjedsIIoCYdzKAXVTMOcAwIMCSzFjziVpzHxsnDRrFXCQc7UK
 6y55KOKzsWN3D4Z8TvB0PnuuLfSJWqhnq6PI0qHF0Sj4/4x8xZ8y06XM9
 uLyjCXDfA2nyCPowq2Za0HrUuqrSCbHgS4c2vko9KHOHzL6UeXq2E7mpK g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="226616221"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="226616221"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 17:54:14 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="627320397"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 17:54:14 -0800
From: ira.weiny@intel.com
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH V2 4/7] drm/radeon: Replace kmap() with kmap_local_page()
Date: Sun, 23 Jan 2022 17:54:06 -0800
Message-Id: <20220124015409.807587-5-ira.weiny@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220124015409.807587-1-ira.weiny@intel.com>
References: <20220124015409.807587-1-ira.weiny@intel.com>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Ira Weiny <ira.weiny@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ira Weiny <ira.weiny@intel.com>

kmap() is being deprecated and this usage is local to the thread.  Use
kmap_local_page() instead.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 drivers/gpu/drm/radeon/radeon_ttm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
index 11b21d605584..76d7906e1785 100644
--- a/drivers/gpu/drm/radeon/radeon_ttm.c
+++ b/drivers/gpu/drm/radeon/radeon_ttm.c
@@ -907,11 +907,11 @@ static ssize_t radeon_ttm_gtt_read(struct file *f, char __user *buf,
 
 		page = rdev->gart.pages[p];
 		if (page) {
-			ptr = kmap(page);
+			ptr = kmap_local_page(page);
 			ptr += off;
 
 			r = copy_to_user(buf, ptr, cur_size);
-			kunmap(rdev->gart.pages[p]);
+			kunmap_local(ptr);
 		} else
 			r = clear_user(buf, cur_size);
 
-- 
2.31.1

