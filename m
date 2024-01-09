Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FEA6828428
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 11:43:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3F010E3C8;
	Tue,  9 Jan 2024 10:43:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A307310E3C8
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 10:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704796989; x=1736332989;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cunvqZosYtlZDsjYVMrAh+nwU3Mm3Tb/yaII408psYU=;
 b=VZXoq9hNhFo50AYyB7jUEJWkMoyvH+Kq8e6Qrb0/Ml8ANDv/yereSEUJ
 SdVWaHU+VNn+F8JfiIFOJ5FS9cSxKswrfEDk7P4r2zry9Rm8yr6sLmu0g
 wFArJtZnwsHZ7DWmuYhSqHP0RLjLJiPJZuJ7yNHYg5DQwE3mZAlvG0Q7y
 myUywyLQ9DMSqmw0DTECPV77iQ4PSn3EUWWm8Rcus4ikQhfM2bnmdavkT
 f0cm1nQR67htQ1e/VM+El8/CjvHBuHzyS33vgYGKKiNQNl3E0/yyjh+uZ
 L3tamZqRpAxDUWYkj9O27ADIATzUTUyHRjiUyI1RcXGtWMnFGqIvwYzsw w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="462437272"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="462437272"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 02:43:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="852136413"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="852136413"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 02:43:07 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/shmem-helper: Fix comment describing dma-buf mappings
Date: Tue,  9 Jan 2024 11:43:05 +0100
Message-ID: <20240109104305.604549-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: tzimmermann@suse.de, mripard@kernel.org,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

`shmem->map_wc was` set to `false` but the comment suggested WC was
enabled for imported buffers.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index e435f986cd13..1532f1766170 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -75,7 +75,7 @@ __drm_gem_shmem_create(struct drm_device *dev, size_t size, bool private)
 
 	if (private) {
 		drm_gem_private_object_init(dev, obj, size);
-		shmem->map_wc = false; /* dma-buf mappings use always writecombine */
+		shmem->map_wc = false; /* dma-buf mappings are never write-combined */
 	} else {
 		ret = drm_gem_object_init(dev, obj, size);
 	}
-- 
2.43.0

