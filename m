Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A4C497715
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 02:54:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA85D10E57D;
	Mon, 24 Jan 2022 01:54:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F80210E27C;
 Mon, 24 Jan 2022 01:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642989256; x=1674525256;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BBygKGffoL5d5GTpz8jASmHam5hJkymlp1BmAKuyaH0=;
 b=PD4oMlRRxBya31CJ67nZZoXbbELU3HVJQjWbceQvGLHUaFyLNA5lHoLo
 tK4Hh9B7pCs4dGRaVVmN+i3QsbfN4F1rMe+bVqsJQDrxJcN8rLj5p2/X1
 4iYnPYLv/zhZXGFJ7fhf6OzpaSgvKGwe8A/t1MVt9l+fr3D+AtA3A6hMj
 tfFjpWpxWfAc9rc5100fSjdwnGX65fbB+dO3zTZ6dsbPnlJxbSCSw5b0Z
 coR9aE+6m8k0RVOPvJxHYOZnvZrLRAi+sOBhPR32k0XFAtoMuQ79TuABF
 W6kovrFCD39/5EKHxVbmiAXD+MrsdVR64pQuAmW/WQFj5DBx4hvKCX0U3 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="226616229"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="226616229"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 17:54:15 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="627320411"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2022 17:54:15 -0800
From: ira.weiny@intel.com
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Subject: [PATCH V2 7/7] drm/radeon: Ensure kunmap is called on error
Date: Sun, 23 Jan 2022 17:54:09 -0800
Message-Id: <20220124015409.807587-8-ira.weiny@intel.com>
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

The default case leaves the buffer object mapped in error.

Add radeon_bo_kunmap() to that case to ensure the mapping is cleaned up.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>

---
NOTE: It seems like this function could use a fair bit of refactoring
but this is the easiest way to fix the actual bug.
---
 drivers/gpu/drm/radeon/radeon_uvd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/radeon/radeon_uvd.c b/drivers/gpu/drm/radeon/radeon_uvd.c
index 377f9cdb5b53..7cca283f6202 100644
--- a/drivers/gpu/drm/radeon/radeon_uvd.c
+++ b/drivers/gpu/drm/radeon/radeon_uvd.c
@@ -560,6 +560,7 @@ static int radeon_uvd_cs_msg(struct radeon_cs_parser *p, struct radeon_bo *bo,
 
 	default:
 
+		radeon_bo_kunmap(bo);
 		DRM_ERROR("Illegal UVD message type (%d)!\n", msg_type);
 		return -EINVAL;
 	}
-- 
2.31.1

