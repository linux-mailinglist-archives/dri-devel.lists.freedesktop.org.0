Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A42D6B2446
	for <lists+dri-devel@lfdr.de>; Thu,  9 Mar 2023 13:37:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DAE710E804;
	Thu,  9 Mar 2023 12:37:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2CA410E803;
 Thu,  9 Mar 2023 12:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678365432; x=1709901432;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qf4gGbBgEWYLHMsS08dUOswllQy4Bf3y4ma74KucVlM=;
 b=YyIxBvmF6i98rfclRaUcHWhSbMsWKA3mG/MyXB83MFDTSZEdmb6v5qdH
 H2mJjdRvAEtyyh3hVGzJhUIRx9rTPQvZOCeTzBS2S8uL4w8bJoN9TFcPq
 1nQ+rMfevHz0cFuIE5i2hVcmtub9b64o//Mg+hi5VBUu8HcTxz3ZXSgn7
 qYVhQVd5rY7kUoHCJounBeCzyfZBm4vDLTA0DnPN/VMcjVo+7rYlXFE+a
 2orm464VJchsBwsLSDtaB9uPTOqwfzRtg27Y4pvuNOJAA+qYtd1SFmefL
 Fqm93TmG3ptGUKUZqWzVSSgTB06VAS+cwOt1nxW7BwaxWdRZc6VYi1vzy Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="333904598"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; d="scan'208";a="333904598"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 04:37:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10643"; a="741549771"
X-IronPort-AV: E=Sophos;i="5.98,246,1673942400"; d="scan'208";a="741549771"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.145])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2023 04:37:09 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: let struct ttm_device_funcs be placed in rodata
Date: Thu,  9 Mar 2023 14:37:00 +0200
Message-Id: <20230309123700.528641-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make the struct ttm_device_funcs pointers const so the data can be placed in rodata.

Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/ttm/ttm_device.c | 2 +-
 include/drm/ttm/ttm_device.h     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
index ae2f19dc9f81..a71bb1362de4 100644
--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -190,7 +190,7 @@ EXPORT_SYMBOL(ttm_device_swapout);
  * Returns:
  * !0: Failure.
  */
-int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
+int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *funcs,
 		    struct device *dev, struct address_space *mapping,
 		    struct drm_vma_offset_manager *vma_manager,
 		    bool use_dma_alloc, bool use_dma32)
diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
index 56e82ba2d046..c22f30535c84 100644
--- a/include/drm/ttm/ttm_device.h
+++ b/include/drm/ttm/ttm_device.h
@@ -223,7 +223,7 @@ struct ttm_device {
 	 * @funcs: Function table for the device.
 	 * Constant after bo device init
 	 */
-	struct ttm_device_funcs *funcs;
+	const struct ttm_device_funcs *funcs;
 
 	/**
 	 * @sysman: Resource manager for the system domain.
@@ -287,7 +287,7 @@ static inline void ttm_set_driver_manager(struct ttm_device *bdev, int type,
 	bdev->man_drv[type] = manager;
 }
 
-int ttm_device_init(struct ttm_device *bdev, struct ttm_device_funcs *funcs,
+int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *funcs,
 		    struct device *dev, struct address_space *mapping,
 		    struct drm_vma_offset_manager *vma_manager,
 		    bool use_dma_alloc, bool use_dma32);
-- 
2.39.1

