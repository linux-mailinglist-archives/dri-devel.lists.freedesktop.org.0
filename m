Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C36BCB8E8F
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 14:42:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A11310E02A;
	Fri, 12 Dec 2025 13:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E+TEqJcg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AD5710E02A
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 13:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765546927; x=1797082927;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+N6oKhkiZLcP3Z1qHVWb0TI+z5GajXR73dJGaQCtn00=;
 b=E+TEqJcgsynn6TD7J2paq7g5UvG8oZNTTPGVIdl53uMf3SsNC/jgpxCC
 cyoXwnzJpem3k591RBggseY9+/ZwV8VzvI0bi8AapoXVvv8ue5rzgtS1I
 5QubSnBHeQok7rjFpFln8lHemV5COtduFhOEJNWnrrIimHHWGaX6odvw3
 y4IIGAOYYh3FohRETt1UzJAzUuvgLchKlSHJc4SvQqx5/tBqdmfPbeb4s
 /5NPMZITaO2XCoc9Wzh4p0H5GHi7oTyVyct14t5mfTb5t/0mMpd0/9L3m
 eAjDNYHex8/fRWY4x9XjZunUAOPJYf7Yg0mzMBloAr/Mk805fwO0WaeTA A==;
X-CSE-ConnectionGUID: 6Fz2s9UCSO6JvS42CRjUaw==
X-CSE-MsgGUID: tb3KpTymS4+R3fpqZyKLaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67297737"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="67297737"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 05:42:06 -0800
X-CSE-ConnectionGUID: ZqO+5AZgR4CdaNAYBiR2KA==
X-CSE-MsgGUID: G+bGaWfhTuyeYWxf/bkTxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; d="scan'208";a="201515027"
Received: from pl-npu-pc-kwachow.igk.intel.com ([10.91.220.239])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2025 05:42:02 -0800
From: Karol Wachowski <karol.wachowski@linux.intel.com>
To: David.Francis@amd.com,
	christian.koenig@amd.com
Cc: felix.kuehling@amd.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, sumit.semwal@linaro.org,
 andrzej.kacprowski@linux.intel.com, maciej.falkowski@linux.intel.com,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Karol Wachowski <karol.wachowski@linux.intel.com>, stable@vger.kernel.org
Subject: [PATCH v3] drm: Fix object leak in DRM_IOCTL_GEM_CHANGE_HANDLE
Date: Fri, 12 Dec 2025 14:41:33 +0100
Message-ID: <20251212134133.475218-1-karol.wachowski@linux.intel.com>
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
Cc: <stable@vger.kernel.org> # v6.18+
Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
---
Changes between v3 and v2:
 - correctly add CC: tag this time

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

