Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC5BCB8E2D
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 14:21:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6369910E0F5;
	Fri, 12 Dec 2025 13:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oCP7H1vy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB69E10E0F5
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 13:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765545670; x=1797081670;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Xw4J35AXVe0tIkMKb4FDDQucWVWj6fFu2dpxmn3jH6M=;
 b=oCP7H1vyCRD8Tt5hf5xM+gpsQJ2Dts+ThO3Qz/6XLSALWRMr4lwZ8Nmx
 DPmMyLkg6cdpelf4HCE+RA/3q0rK+wpUMJ0qP+EnbiQ1gxYHgJ/Ml7t6p
 FDYtcRk18GvOvSr19pIpCNaKRbf2MCxRwAR5pa47XfiiKcS5ILezPP6+2
 J/qGFlsEtkbumEbhoYGhCd4n/xepkMZvEdrjkLzvr/oOddYKn8tEhvo60
 fH39t2UDBfCg4tVEuzmq9a8ijjHuPNlGjqt8WYCRJuwt8RPhYYRYWUhLX
 ZB5uM7BL98e7PFYyT/hiIB+m9Hj32DVGB9ABAOR+1Pat4G5lvKpbnAzSi Q==;
X-CSE-ConnectionGUID: 0GTkqBdSQiS3qTs6r75SKQ==
X-CSE-MsgGUID: 3XnzWwozQjSQ/V9Z+ADmBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67431201"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="67431201"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 05:21:10 -0800
X-CSE-ConnectionGUID: 1HmC4w25RVOQZLSEfMTe6A==
X-CSE-MsgGUID: gWX8bhMzTvedXw/eKlj1pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="196695487"
Received: from pl-npu-pc-kwachow.igk.intel.com ([10.91.220.239])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 05:21:06 -0800
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: David.Francis@amd.com
Cc: felix.kuehling@amd.com, christian.koenig@amd.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, sumit.semwal@linaro.org,
 andrzej.kacprowski@linux.intel.com, maciej.falkowski@linux.intel.com,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, stable@vger.kernel.org,
 Karol Wachowski <karol.wachowski@linux.intel.com>
Subject: [PATCH v2] drm: Fix object leak in DRM_IOCTL_GEM_CHANGE_HANDLE
Date: Fri, 12 Dec 2025 14:20:52 +0100
Message-ID: <20251212132052.474096-1-karol.wachowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
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

Add missing drm_gem_object_put() call when drm_gem_object_lookup()
successfully returns an object. This fixes a GEM object reference
leak that can prevent driver modules from unloading when using
prime buffers.

Fixes: 53096728b891 ("drm: Add DRM prime interface to reassign GEM handle")
Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
---
Changes between v1 and v2:
 - move setting ret value under if branch as suggested in review
 - add Cc: stable 6.18+
---
 drivers/gpu/drm/drm_gem.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index ca1956608261..bcc08a6aebf8 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1010,8 +1010,10 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
 	if (!obj)
 		return -ENOENT;
 
-	if (args->handle == args->new_handle)
-		return 0;
+	if (args->handle == args->new_handle) {
+		ret = 0;
+		goto out;
+	}
 
 	mutex_lock(&file_priv->prime.lock);
 
@@ -1043,6 +1045,8 @@ int drm_gem_change_handle_ioctl(struct drm_device *dev, void *data,
 
 out_unlock:
 	mutex_unlock(&file_priv->prime.lock);
+out:
+	drm_gem_object_put(obj);
 
 	return ret;
 }
-- 
2.43.0

